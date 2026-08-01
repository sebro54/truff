"""
Truffeo — Alignement des prix sur le tarif conseille Hofman (mode PLANCHER).
 
REGLE : on ne fait que REMONTER les prix trop bas.
        Un prix deja superieur au conseille n'est jamais touche.
 
Prix cible = price_ex_vat (conseille HT Hofman) x 1,20  (TVA francaise)
             et NON price_inc_vat, qui integre la TVA neerlandaise de 21 %.
 
Variables d'environnement :
  DRY_RUN=true        simulation, aucune ecriture (LANCER D'ABORD COMME CA)
  ACTIVE_ONLY=true    ne traite que les produits actifs (recommande)
  MAX_INCREASE_PCT=0  plafond de securite ; 200 = ignorer les hausses > +200 %
                      0 = pas de plafond
  ROUND_90=false      true = arrondit au ,90 superieur (19,42 -> 19,90)
"""
 
import os
import sys
import csv
import time
import json
import logging
import requests
from collections import defaultdict
 
logging.basicConfig(level=logging.INFO,
                    format="%(asctime)s - %(levelname)s - %(message)s")
log = logging.getLogger(__name__)
 
HOFMAN_API_KEY = os.environ.get("HOFMAN_API_KEY", "")
SHOPIFY_TOKEN  = os.environ.get("SHOPIFY_TOKEN", "")
SHOPIFY_STORE  = os.environ.get("SHOPIFY_STORE", "ywkigs-tb.myshopify.com")
 
DRY_RUN      = os.environ.get("DRY_RUN", "true").lower() in ("1", "true", "yes")
ACTIVE_ONLY  = os.environ.get("ACTIVE_ONLY", "true").lower() in ("1", "true", "yes")
ROUND_90     = os.environ.get("ROUND_90", "false").lower() in ("1", "true", "yes")
MAX_INC_PCT  = float(os.environ.get("MAX_INCREASE_PCT", "0") or 0)
 
VAT_FR = 1.20
GRAPHQL_URL = f"https://{SHOPIFY_STORE}/admin/api/2026-01/graphql.json"
HOFMAN_CSV = ("https://api-prod.hofmananimalcare.nl/feeds/variants/nl/csv"
              f"?api_key={HOFMAN_API_KEY}&separation=semicolon")
 
if not SHOPIFY_TOKEN or not HOFMAN_API_KEY:
    log.error("SHOPIFY_TOKEN ou HOFMAN_API_KEY manquant.")
    sys.exit(1)
 
HEADERS = {"X-Shopify-Access-Token": SHOPIFY_TOKEN, "Content-Type": "application/json"}
 
 
def gql(query, variables=None, tries=5):
    for a in range(tries):
        r = requests.post(GRAPHQL_URL, headers=HEADERS,
                          json={"query": query, "variables": variables or {}}, timeout=90)
        if r.status_code == 429:
            time.sleep(2 * (a + 1)); continue
        r.raise_for_status()
        d = r.json()
        if "errors" in d:
            if "THROTTLED" in str(d["errors"]).upper():
                time.sleep(2 * (a + 1)); continue
            raise RuntimeError(d["errors"])
        return d["data"]
    raise RuntimeError("throttling persistant")
 
 
def num(x):
    try:
        return float(str(x).replace(",", ".").strip())
    except (TypeError, ValueError):
        return None
 
 
# ── 1. Tarif Hofman ──────────────────────────────────────────────────────────
 
def load_hofman():
    log.info("Telechargement du tarif Hofman...")
    r = requests.get(HOFMAN_CSV, headers={"Locale": "nl"}, timeout=180)
    r.raise_for_status()
    txt = r.content.decode("utf-8-sig")
    csv.field_size_limit(10 ** 9)
    by_ean, by_ref = {}, {}
    n = 0
    for row in csv.DictReader(txt.splitlines(), delimiter=";"):
        d = {"ref": (row.get("article_number") or "").strip(),
             "achat": num(row.get("your_price_ex_vat")),
             "cons":  num(row.get("price_ex_vat")),
             "nom":   (row.get("product_name") or "")[:60]}
        if not d["cons"] or d["cons"] <= 0:
            continue
        n += 1
        ean = (row.get("ean") or "").strip()
        if ean:
            by_ean[ean] = d
        if d["ref"]:
            by_ref[d["ref"]] = d
    log.info(f"  {n} references avec prix conseille")
    return by_ean, by_ref
 
 
# ── 2. Variantes Shopify (export en masse) ───────────────────────────────────
 
BULK = """
mutation {
  bulkOperationRunQuery(
    query: "{ productVariants { edges { node { id sku barcode price product { id status } } } } }"
  ) { bulkOperation { id status } userErrors { message } }
}
"""
 
 
def load_shopify_variants():
    log.info("Export des variantes Shopify...")
    res = gql(BULK)["bulkOperationRunQuery"]
    if res["userErrors"]:
        raise RuntimeError(res["userErrors"])
 
    url = None
    for _ in range(120):
        time.sleep(5)
        cur = gql("{ currentBulkOperation { status url objectCount errorCode } }")["currentBulkOperation"]
        if cur["status"] == "COMPLETED":
            url = cur["url"]
            log.info(f"  Export termine : {cur['objectCount']} objets")
            break
        if cur["status"] in ("FAILED", "CANCELED"):
            raise RuntimeError(f"Export echoue : {cur['errorCode']}")
    if not url:
        raise RuntimeError("Export : delai depasse")
 
    out = []
    for line in requests.get(url, timeout=300).text.splitlines():
        if line.strip():
            out.append(json.loads(line))
    log.info(f"  {len(out)} variantes lues")
    return out
 
 
# ── 3. Calcul ────────────────────────────────────────────────────────────────
 
def target_price(cons_ht):
    p = cons_ht * VAT_FR
    if ROUND_90:
        base = int(p)
        p = base + 0.90 if p <= base + 0.90 else base + 1.90
    return round(p + 1e-9, 2)
 
 
def build_plan(variants, by_ean, by_ref):
    plan, skipped_cap, unchanged, inactive = [], 0, 0, 0
    for v in variants:
        prod = v.get("product") or {}
        if ACTIVE_ONLY and prod.get("status") != "ACTIVE":
            inactive += 1
            continue
 
        sku = (v.get("sku") or "").strip()
        bar = (v.get("barcode") or "").strip()
        h = by_ean.get(bar) or by_ref.get(sku) or by_ean.get(sku)
        if not h:
            continue
 
        cur = num(v.get("price"))
        if cur is None:
            continue
        tgt = target_price(h["cons"])
 
        if tgt <= cur + 0.005:      # deja au-dessus : on ne touche pas
            unchanged += 1
            continue
 
        if MAX_INC_PCT and cur > 0 and (tgt - cur) / cur * 100 > MAX_INC_PCT:
            skipped_cap += 1
            log.warning(f"  PLAFOND {h['ref']} : {cur:.2f} -> {tgt:.2f} "
                        f"(+{(tgt-cur)/cur*100:.0f}%) — non applique")
            continue
 
        perte = bool(h["achat"] and cur / VAT_FR < h["achat"])
        plan.append({"variant_id": v["id"], "product_id": prod.get("id"),
                     "ref": h["ref"], "nom": h["nom"], "achat": h["achat"],
                     "actuel": cur, "cible": tgt, "perte": perte})
 
    log.info(f"  A remonter : {len(plan)}  |  inchangees : {unchanged}  |  "
             f"hors plafond : {skipped_cap}  |  inactives ignorees : {inactive}")
    log.info(f"  Dont vendues a perte : {sum(1 for p in plan if p['perte'])}")
    return plan
 
 
# ── 4. Ecriture ──────────────────────────────────────────────────────────────
 
MUT = """
mutation($productId: ID!, $variants: [ProductVariantsBulkInput!]!) {
  productVariantsBulkUpdate(productId: $productId, variants: $variants) {
    userErrors { field message }
  }
}
"""
 
 
def apply_plan(plan):
    groups = defaultdict(list)
    for p in plan:
        groups[p["product_id"]].append(p)
 
    done, errs = 0, 0
    for i, (pid, items) in enumerate(groups.items(), 1):
        payload = {"productId": pid,
                   "variants": [{"id": it["variant_id"], "price": f"{it['cible']:.2f}"}
                                for it in items]}
        try:
            res = gql(MUT, payload)["productVariantsBulkUpdate"]
            if res["userErrors"]:
                errs += 1
                log.warning(f"  {items[0]['ref']} : {res['userErrors'][:2]}")
            else:
                done += len(items)
        except Exception as e:
            errs += 1
            log.error(f"  {items[0]['ref']} : {e}")
        if i % 25 == 0:
            log.info(f"  {i}/{len(groups)} produits traites — {done} variantes mises a jour")
        time.sleep(0.35)
 
    log.info(f"=== {done} variantes mises a jour, {errs} produit(s) en erreur ===")
 
 
# ── MAIN ─────────────────────────────────────────────────────────────────────
 
if __name__ == "__main__":
    log.info(f"Alignement prix — DRY_RUN={DRY_RUN} ACTIVE_ONLY={ACTIVE_ONLY} "
             f"ROUND_90={ROUND_90} MAX_INCREASE_PCT={MAX_INC_PCT or 'aucun'}")
 
    by_ean, by_ref = load_hofman()
    variants = load_shopify_variants()
    plan = build_plan(variants, by_ean, by_ref)
 
    if not plan:
        log.info("Rien a faire.")
        sys.exit(0)
 
    plan.sort(key=lambda x: x["cible"] - x["actuel"], reverse=True)
 
    log.info("--- 30 plus fortes hausses ---")
    for p in plan[:30]:
        flag = "PERTE" if p["perte"] else "     "
        log.info(f"  {flag} {p['ref']:<12} {p['actuel']:>9.2f} -> {p['cible']:>9.2f}  {p['nom'][:38]}")
 
    with open("plan_prix.csv", "w", newline="", encoding="utf-8-sig") as fh:
        w = csv.writer(fh, delimiter=";")
        w.writerow(["variant_id", "reference", "produit", "achat_HT",
                    "prix_actuel", "prix_cible", "vendu_a_perte"])
        for p in plan:
            w.writerow([p["variant_id"], p["ref"], p["nom"], p["achat"],
                        p["actuel"], p["cible"], "OUI" if p["perte"] else ""])
    log.info("Detail complet ecrit dans plan_prix.csv")
 
    if DRY_RUN:
        log.info("DRY_RUN actif — aucune modification effectuee.")
        sys.exit(0)
 
    apply_plan(plan)
 
