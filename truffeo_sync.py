"""
Truffeo <-> Hofman Animalcare
Synchronisation des stocks + transmission des commandes.

CORRECTIONS APPORTEES (vs version precedente) :
 1. STOCK : on ecrit la QUANTITE REELLE. L'ancienne ligne
       qty = 1 if str(item.get("in_stock","0")) == "1" else 0
    mettait 0 des que le stock etait different de 1 (811 -> 0, 1033 -> 0).
 2. SUIVI DE STOCK : active automatiquement (tracked=true) au lieu d'etre ignore.
 3. RATTACHEMENT : les articles absents de l'emplacement Hofman sont actives.
 4. PERFORMANCE : GraphQL par lots (250) au lieu de REST 1 article/seconde.
 5. COMMANDES : payload conforme au schema officiel StoreDealerApiOrderRequest.
 6. SECURITE : ecriture limitee au seul emplacement Hofman.
"""

import os
import re
import csv
import sys
import time
import logging
import requests
from datetime import datetime

logging.basicConfig(level=logging.INFO,
                    format="%(asctime)s - %(levelname)s - %(message)s")
log = logging.getLogger(__name__)

# ── Config ───────────────────────────────────────────────────────────────────
HOFMAN_API_KEY = os.environ.get("HOFMAN_API_KEY", "")
SHOPIFY_TOKEN  = os.environ.get("SHOPIFY_TOKEN", "")
SHOPIFY_STORE  = os.environ.get("SHOPIFY_STORE", "ywkigs-tb.myshopify.com")
HOFMAN_LOCATION_NAME = os.environ.get("HOFMAN_LOCATION_NAME", "Hofman")
HOFMAN_LOCALE  = os.environ.get("HOFMAN_LOCALE", "nl")

# Mode simulation : n'ecrit rien, se contente de journaliser.
DRY_RUN = os.environ.get("DRY_RUN", "false").lower() in ("1", "true", "yes")

# Envoi automatique des commandes a Hofman (laisser false tant que non valide).
SEND_ORDERS = os.environ.get("SEND_ORDERS", "false").lower() in ("1", "true", "yes")

# Retrait automatique des produits Hofman disparus du flux.
DRAFT_DELISTED = os.environ.get("DRAFT_DELISTED", "true").lower() in ("1", "true", "yes")
# DRAFT (simple depublication, reversible) ou ARCHIVED (sort aussi de l'admin).
DELIST_STATUS = os.environ.get("DELIST_STATUS", "DRAFT").upper()
# Garde-fou : au-dela de ce nombre de disparitions, on ne retire RIEN.
# Protege contre un flux tronque ou une panne d'API cote Hofman.
MAX_DELIST = int(os.environ.get("MAX_DELIST", "400"))

# ── Rapport par e-mail ───────────────────────────────────────────────────────
MAIL_TO   = os.environ.get("MAIL_TO", "")
MAIL_FROM = os.environ.get("MAIL_FROM", "")
SMTP_HOST = os.environ.get("SMTP_HOST", "smtp.gmail.com")
SMTP_PORT = int(os.environ.get("SMTP_PORT", "587"))
SMTP_USER = os.environ.get("SMTP_USER", "")
SMTP_PASS = os.environ.get("SMTP_PASS", "")

HOFMAN_BASE = "https://api-prod.hofmananimalcare.nl"
GRAPHQL_URL = f"https://{SHOPIFY_STORE}/admin/api/2026-01/graphql.json"

if not SHOPIFY_TOKEN or not HOFMAN_API_KEY:
    log.error("SHOPIFY_TOKEN ou HOFMAN_API_KEY manquant. Verifie les GitHub Secrets.")
    sys.exit(1)

SHOP_HEADERS = {"X-Shopify-Access-Token": SHOPIFY_TOKEN,
                "Content-Type": "application/json"}
HOFMAN_HEADERS = {"Locale": HOFMAN_LOCALE, "Content-Type": "application/json"}


# ── Client GraphQL ───────────────────────────────────────────────────────────

def gql(query, variables=None, tries=5):
    """Appel GraphQL avec relance automatique sur throttling."""
    for attempt in range(tries):
        r = requests.post(GRAPHQL_URL, headers=SHOP_HEADERS,
                          json={"query": query, "variables": variables or {}},
                          timeout=90)
        if r.status_code == 429:
            time.sleep(2 * (attempt + 1))
            continue
        r.raise_for_status()
        data = r.json()
        if "errors" in data:
            msg = str(data["errors"])
            if "THROTTLED" in msg.upper():
                time.sleep(2 * (attempt + 1))
                continue
            raise RuntimeError(f"GraphQL: {msg}")
        return data["data"]
    raise RuntimeError("GraphQL: throttling persistant")


# ── 1. Flux Hofman ───────────────────────────────────────────────────────────

def get_hofman_variants():
    """Recupere le flux JSON pagine. in_stock est un ENTIER."""
    items, page = [], 1
    while True:
        r = requests.get(f"{HOFMAN_BASE}/feeds/variants/json",
                         headers=HOFMAN_HEADERS,
                         params={"api_key": HOFMAN_API_KEY,
                                 "page": page, "per_page": 100},
                         timeout=90)
        r.raise_for_status()
        data = r.json()
        batch = data if isinstance(data, list) else data.get("data", data.get("items", []))
        if not batch:
            break
        items += batch
        if len(batch) < 100:
            break
        page += 1
    log.info(f"  Hofman : {len(items)} references recuperees")
    return items


def build_hofman_maps(items):
    """Deux index : par EAN et par reference, pointant vers la fiche complete."""
    by_ean, by_ref = {}, {}
    for it in items:
        raw = it.get("in_stock", 0)
        try:
            qty = int(float(str(raw).strip() or 0))
        except (TypeError, ValueError):
            qty = 0
        rec = {
            "qty": max(qty, 0),
            "ref": str(it.get("article_number") or "").strip(),
            "ean": str(it.get("ean") or "").strip(),
            "nom": str(it.get("product_name") or "")[:70],
            "marque": str(it.get("brand") or ""),
            "achat": it.get("your_price_ex_vat"),
            "conseille": it.get("price_ex_vat"),
            "vendable": str(it.get("not_suitable_for_sales", "")).lower()
                        not in ("1", "true", "yes"),
        }
        if rec["ean"]:
            by_ean[rec["ean"]] = rec
        if rec["ref"]:
            by_ref[rec["ref"]] = rec
    total = sum(r["qty"] for r in by_ref.values())
    dispo = sum(1 for r in by_ref.values() if r["qty"] > 0)
    log.info(f"  Index : {len(by_ref)} refs / {len(by_ean)} EAN — "
             f"{dispo} en stock, {total} unites au total")
    return by_ean, by_ref


# ── 2. Etat Shopify ──────────────────────────────────────────────────────────

def get_location_gid():
    data = gql("""
    { locations(first: 50, includeInactive: true) {
        nodes { id name isActive } } }
    """)
    for loc in data["locations"]["nodes"]:
        if loc["name"].strip().lower() == HOFMAN_LOCATION_NAME.strip().lower():
            if not loc["isActive"]:
                raise RuntimeError(f"L'emplacement '{loc['name']}' est desactive dans Shopify.")
            log.info(f"  Emplacement cible : {loc['name']} ({loc['id']})")
            return loc["id"]
    raise RuntimeError(f"Emplacement '{HOFMAN_LOCATION_NAME}' introuvable.")


VARIANTS_QUERY = """
query($cursor: String) {
  productVariants(first: 100, after: $cursor) {
    pageInfo { hasNextPage endCursor }
    nodes {
      sku
      barcode
      product { id status title }
      inventoryItem {
        id
        tracked
        inventoryLevels(first: 10) { nodes { location { id } } }
      }
    }
  }
}
"""


def get_shopify_variants():
    """Toutes les variantes avec leur etat de suivi et leurs emplacements."""
    out, cursor = [], None
    while True:
        data = gql(VARIANTS_QUERY, {"cursor": cursor})
        block = data["productVariants"]
        out += block["nodes"]
        if not block["pageInfo"]["hasNextPage"]:
            break
        cursor = block["pageInfo"]["endCursor"]
    log.info(f"  Shopify : {len(out)} variantes lues")
    return out


# ── 3. Ecritures par lots ────────────────────────────────────────────────────

def enable_tracking(item_ids):
    """Active le suivi de stock, par lots d'alias GraphQL."""
    done = 0
    for i in range(0, len(item_ids), 25):
        chunk = item_ids[i:i + 25]
        parts = [
            f'm{n}: inventoryItemUpdate(id: "{iid}", input: {{tracked: true}}) '
            f'{{ userErrors {{ message }} }}'
            for n, iid in enumerate(chunk)
        ]
        gql("mutation { " + " ".join(parts) + " }")
        done += len(chunk)
        time.sleep(0.4)
    log.info(f"  Suivi de stock active sur {done} article(s)")


def activate_at_location(item_ids, location_gid):
    """Rattache a l'emplacement Hofman les articles qui n'y sont pas encore."""
    done = 0
    for i in range(0, len(item_ids), 25):
        chunk = item_ids[i:i + 25]
        parts = [
            f'a{n}: inventoryActivate(inventoryItemId: "{iid}", '
            f'locationId: "{location_gid}") {{ userErrors {{ message }} }}'
            for n, iid in enumerate(chunk)
        ]
        gql("mutation { " + " ".join(parts) + " }")
        done += len(chunk)
        time.sleep(0.4)
    log.info(f"  {done} article(s) rattache(s) a l'emplacement Hofman")


SET_QTY = """
mutation($input: InventorySetQuantitiesInput!) {
  inventorySetQuantities(input: $input) {
    userErrors { field message }
  }
}
"""


def write_quantities(pairs, location_gid):
    """pairs = [(inventory_item_gid, quantite)] — ecrit par lots de 200."""
    written = 0
    for i in range(0, len(pairs), 200):
        chunk = pairs[i:i + 200]
        payload = {
            "input": {
                "name": "available",
                "reason": "correction",
                "ignoreCompareQuantity": True,
                "quantities": [
                    {"inventoryItemId": iid,
                     "locationId": location_gid,
                     "quantity": qty}
                    for iid, qty in chunk
                ],
            }
        }
        data = gql(SET_QTY, payload)
        errs = data["inventorySetQuantities"]["userErrors"]
        if errs:
            log.warning(f"  Lot {i // 200 + 1} : {errs[:3]}")
        written += len(chunk)
        log.info(f"  {written}/{len(pairs)} quantites ecrites")
        time.sleep(0.6)


def draft_products(product_ids):
    """Depublie les produits deferences. DRAFT par defaut : la fiche reste
    modifiable et repassera en ACTIVE d'un clic si Hofman la reintroduit."""
    statut = DELIST_STATUS if DELIST_STATUS in ("DRAFT", "ARCHIVED") else "DRAFT"
    done = 0
    for i in range(0, len(product_ids), 20):
        chunk = product_ids[i:i + 20]
        parts = [
            f'd{n}: productUpdate(product: {{id: "{pid}", status: {statut}}}) '
            f'{{ userErrors {{ message }} }}'
            for n, pid in enumerate(chunk)
        ]
        gql("mutation { " + " ".join(parts) + " }")
        done += len(chunk)
        time.sleep(0.4)
    log.info(f"  {done} produit(s) passe(s) en {statut}")


def handle_delisted(variants, location_gid, matched_items):
    """Detecte les produits Hofman disparus du flux.

    Un produit est considere comme Hofman s'il possede un niveau de stock
    sur l'emplacement Hofman. Cela exclut d'office eBarf, YDOLO, Dibaq
    et les fiches maison, qui n'y sont pas rattaches.

    Un produit n'est mis en brouillon que si AUCUNE de ses variantes
    n'est encore presente dans le flux.
    """
    par_produit = {}
    for v in variants:
        prod = v.get("product") or {}
        pid = prod.get("id")
        if not pid:
            continue
        inv = v["inventoryItem"]
        chez_hofman = location_gid in [n["location"]["id"]
                                       for n in inv["inventoryLevels"]["nodes"]]
        e = par_produit.setdefault(pid, {"titre": prod.get("title", ""),
                                         "statut": prod.get("status"),
                                         "hofman": False, "appariee": False,
                                         "items": []})
        if chez_hofman:
            e["hofman"] = True
            e["items"].append(inv["id"])
        if inv["id"] in matched_items:
            e["appariee"] = True

    disparus = [(pid, e) for pid, e in par_produit.items()
                if e["hofman"] and not e["appariee"]]
    a_depublier = [(pid, e) for pid, e in disparus if e["statut"] == "ACTIVE"]

    log.info(f"  Disparus du flux Hofman : {len(disparus)} produit(s) "
             f"dont {len(a_depublier)} encore en ligne")
    for pid, e in a_depublier[:25]:
        log.info(f"    - {e['titre'][:60]}")
    if len(a_depublier) > 25:
        log.info(f"    ... et {len(a_depublier) - 25} autre(s)")

    if not a_depublier:
        return []

    if len(a_depublier) > MAX_DELIST:
        log.error(f"  ARRET DE SECURITE : {len(a_depublier)} disparitions "
                  f"(seuil MAX_DELIST={MAX_DELIST}). Flux peut-etre incomplet. "
                  f"Aucun produit depublie. Verifie puis relance en ajustant le seuil.")
        return []

    # Stock remis a zero : le produit ne doit plus etre vendable.
    remise_a_zero = [(iid, 0) for _, e in a_depublier for iid in e["items"]]

    if DRY_RUN:
        log.info("  DRY_RUN : aucune depublication effectuee.")
        return a_depublier

    if remise_a_zero:
        write_quantities(remise_a_zero, location_gid)
    draft_products([pid for pid, _ in a_depublier])
    return a_depublier


def detect_new(by_ref, refs_vues):
    """References presentes chez Hofman mais absentes de la boutique.

    On NE cree rien automatiquement : une fiche produit demande une
    description francaise, des images, un rattachement aux collections
    et une decision de prix. Le script produit un rapport a exploiter.
    """
    nouvelles = [r for ref, r in by_ref.items()
                 if ref not in refs_vues and r["vendable"]]
    nouvelles.sort(key=lambda r: (r["marque"], r["ref"]))

    if not nouvelles:
        log.info("  Aucune nouvelle reference.")
        return []

    en_stock = [r for r in nouvelles if r["qty"] > 0]
    log.info(f"  Nouvelles references : {len(nouvelles)} "
             f"dont {len(en_stock)} deja en stock")

    par_marque = {}
    for r in nouvelles:
        par_marque[r["marque"]] = par_marque.get(r["marque"], 0) + 1
    top = sorted(par_marque.items(), key=lambda x: -x[1])[:10]
    log.info("  Repartition par marque : "
             + ", ".join(f"{m or 'sans marque'} ({n})" for m, n in top))

    for r in en_stock[:20]:
        log.info(f"    + {r['ref']:<12} {r['marque'][:14]:<15} "
                 f"stock {r['qty']:<5} {r['nom'][:40]}")
    if len(en_stock) > 20:
        log.info(f"    ... et {len(en_stock) - 20} autre(s) en stock")

    with open("nouveautes.csv", "w", newline="", encoding="utf-8-sig") as fh:
        w = csv.writer(fh, delimiter=";")
        w.writerow(["reference", "ean", "marque", "produit", "stock",
                    "achat_HT", "conseille_HT", "prix_cible_TTC_20"])
        for r in nouvelles:
            cible = ""
            try:
                cible = round(float(str(r["conseille"]).replace(",", ".")) * 1.20, 2)
            except (TypeError, ValueError):
                pass
            w.writerow([r["ref"], r["ean"], r["marque"], r["nom"],
                        r["qty"], r["achat"], r["conseille"], cible])
    log.info("  Detail complet ecrit dans nouveautes.csv")
    return nouvelles


def send_report(nouvelles, retires):
    """Envoie le recapitulatif par e-mail, avec le CSV des nouveautes en piece
    jointe. Silencieux si la configuration SMTP est absente."""
    if not (MAIL_TO and SMTP_USER and SMTP_PASS):
        log.info("  E-mail non configure (MAIL_TO / SMTP_USER / SMTP_PASS) — rapport non envoye.")
        return
    if not nouvelles and not retires:
        log.info("  Aucun mouvement : pas d'e-mail.")
        return

    import smtplib
    from email.message import EmailMessage

    jour = datetime.now().strftime("%d/%m/%Y")
    en_stock = [r for r in nouvelles if r["qty"] > 0]

    def ligne(r):
        cible = ""
        try:
            cible = f"{float(str(r['conseille']).replace(',', '.')) * 1.20:.2f} EUR"
        except (TypeError, ValueError):
            pass
        return (f"<tr><td>{r['ref']}</td><td>{r['marque']}</td>"
                f"<td>{r['nom']}</td><td align='right'>{r['qty']}</td>"
                f"<td align='right'>{cible}</td></tr>")

    html = f"""<html><body style="font-family:Arial,sans-serif;font-size:14px;color:#222">
<h2 style="color:#5a3e2b">Trufféo — Catalogue Hofman du {jour}</h2>
<p><b>{len(nouvelles)}</b> nouvelle(s) référence(s), dont <b>{len(en_stock)}</b> déjà en stock.<br>
<b>{len(retires)}</b> produit(s) déréférencé(s), retiré(s) de la vente.</p>
"""

    if en_stock:
        html += ("<h3>Nouveautés disponibles</h3>"
                 "<table border='1' cellpadding='6' cellspacing='0' "
                 "style='border-collapse:collapse;font-size:13px'>"
                 "<tr style='background:#f0ebe4'><th>Réf</th><th>Marque</th>"
                 "<th>Produit</th><th>Stock</th><th>Prix cible TTC</th></tr>"
                 + "".join(ligne(r) for r in en_stock[:60]) + "</table>")
        if len(en_stock) > 60:
            html += f"<p><i>… et {len(en_stock) - 60} autre(s). Voir le CSV joint.</i></p>"

    if retires:
        html += ("<h3>Produits déréférencés</h3><ul>"
                 + "".join(f"<li>{t}</li>" for t in retires[:40]) + "</ul>")
        if len(retires) > 40:
            html += f"<p><i>… et {len(retires) - 40} autre(s).</i></p>"

    html += ("<p style='color:#777;font-size:12px'>Rapport automatique — "
             "aucune fiche n'est créée sans validation.</p></body></html>")

    msg = EmailMessage()
    msg["Subject"] = (f"Trufféo/Hofman — {len(nouvelles)} nouveauté(s), "
                      f"{len(retires)} retrait(s)")
    msg["From"] = MAIL_FROM or SMTP_USER
    msg["To"] = MAIL_TO
    msg.set_content("Rapport au format HTML — voir la version enrichie.")
    msg.add_alternative(html, subtype="html")

    if os.path.exists("nouveautes.csv"):
        with open("nouveautes.csv", "rb") as fh:
            msg.add_attachment(fh.read(), maintype="text", subtype="csv",
                               filename=f"nouveautes_{datetime.now():%Y-%m-%d}.csv")

    try:
        with smtplib.SMTP(SMTP_HOST, SMTP_PORT, timeout=45) as s:
            s.starttls()
            s.login(SMTP_USER, SMTP_PASS)
            s.send_message(msg)
        log.info(f"  Rapport envoye a {MAIL_TO}")
    except Exception as e:
        log.error(f"  Echec de l'envoi du rapport : {e}")


def sync_stock():
    log.info("=== Synchronisation des stocks ===")
    by_ean, by_ref = build_hofman_maps(get_hofman_variants())
    location_gid = get_location_gid()
    variants = get_shopify_variants()

    pairs, to_track, to_activate = [], [], []
    refs_vues = set()
    matched = 0

    for v in variants:
        sku = (v.get("sku") or "").strip()
        bar = (v.get("barcode") or "").strip()

        rec = (by_ean.get(bar) if bar else None) \
            or (by_ref.get(sku) if sku else None) \
            or (by_ean.get(sku) if sku else None)
        if not rec:
            continue

        qty = rec["qty"]
        refs_vues.add(rec["ref"])
        matched += 1
        inv = v["inventoryItem"]
        iid = inv["id"]

        if not inv["tracked"]:
            to_track.append(iid)

        locs = [n["location"]["id"] for n in inv["inventoryLevels"]["nodes"]]
        if location_gid not in locs:
            to_activate.append(iid)

        pairs.append((iid, qty))

    en_stock = sum(1 for _, q in pairs if q > 0)
    log.info(f"  {matched} variantes appariees — {en_stock} avec du stock, "
             f"{len(to_track)} a passer en suivi, {len(to_activate)} a rattacher")

    if DRY_RUN:
        log.info("  DRY_RUN actif : aucune ecriture effectuee.")
        for iid, q in pairs[:15]:
            log.info(f"    {iid} -> {q}")

    if not DRY_RUN:
        if to_activate:
            activate_at_location(to_activate, location_gid)
        if to_track:
            enable_tracking(to_track)
        if pairs:
            write_quantities(pairs, location_gid)

    retires = []
    if DRAFT_DELISTED:
        log.info("--- Produits deferences ---")
        retires = handle_delisted(variants, location_gid,
                                  {iid for iid, _ in pairs})

    log.info("--- Nouvelles references Hofman ---")
    nouvelles = detect_new(by_ref, refs_vues)

    log.info("--- Rapport ---")
    send_report(nouvelles, [e["titre"] for _, e in retires])

    log.info("=== Stocks synchronises ===")


# ── 4. Commandes ─────────────────────────────────────────────────────────────

ORDERS_QUERY = """
query {
  orders(first: 50, query: "fulfillment_status:unfulfilled AND status:open AND -tag:hofman_sent") {
    nodes {
      id
      name
      email
      tags
      shippingAddress {
        firstName lastName address1 address2
        city zip countryCodeV2 phone
      }
      lineItems(first: 100) {
        nodes { quantity sku variant { sku } }
      }
    }
  }
}
"""


def split_street(address1):
    """Hofman exige rue et numero separes. Gere '12 rue X' et 'Straat 12A'."""
    a = (address1 or "").strip()
    m = re.match(r"^(\d+)\s*([A-Za-z]?)\s+(.*)$", a)        # 12 rue des Lilas
    if m:
        return m.group(3).strip(), m.group(1), (m.group(2) or None)
    m = re.match(r"^(.*?)\s+(\d+)\s*([A-Za-z]?)$", a)        # Straat 12A
    if m:
        return m.group(1).strip(), m.group(2), (m.group(3) or None)
    return a, "0", None


def build_hofman_payload(order):
    addr = order.get("shippingAddress") or {}
    street, number, addition = split_street(addr.get("address1"))

    products = []
    for li in order["lineItems"]["nodes"]:
        ref = (li.get("sku") or (li.get("variant") or {}).get("sku") or "").strip()
        if ref and li.get("quantity"):
            products.append({"article_number": ref, "quantity": int(li["quantity"])})

    return {
        "customer": {
            "first_name": addr.get("firstName") or "Client",
            "last_name":  addr.get("lastName") or "Truffeo",
            "email":      order.get("email") or "",
            "order_number": order.get("name"),
        },
        "shipping_address": {
            "street": street,
            "street_number": number,
            "street_number_addition": addition or addr.get("address2") or None,
            "city": addr.get("city") or "",
            "country_code": addr.get("countryCodeV2") or "FR",
            "postal_code": addr.get("zip") or "",
        },
        "remarks": {"ordered_by": "Truffeo", "note": None},
        "products": products,
    }, products


def tag_order(order_gid):
    gql("""
    mutation($id: ID!) {
      tagsAdd(id: $id, tags: ["hofman_sent"]) { userErrors { message } }
    }
    """, {"id": order_gid})


def process_orders():
    log.info("=== Traitement des commandes ===")
    orders = gql(ORDERS_QUERY)["orders"]["nodes"]
    log.info(f"  {len(orders)} commande(s) a transmettre")

    for o in orders:
        payload, products = build_hofman_payload(o)

        if not products:
            log.warning(f"  {o['name']} ignoree : aucune ligne avec reference Hofman")
            continue
        if not payload["customer"]["email"]:
            log.warning(f"  {o['name']} ignoree : email client absent (obligatoire)")
            continue

        if DRY_RUN or not SEND_ORDERS:
            log.info(f"  [SIMULATION] {o['name']} -> {len(products)} ligne(s) : {products}")
            continue

        r = requests.post(f"{HOFMAN_BASE}/orders",
                          headers=HOFMAN_HEADERS,
                          params={"api_key": HOFMAN_API_KEY},
                          json=payload, timeout=60)

        if r.status_code in (200, 201):
            tag_order(o["id"])
            log.info(f"  OK {o['name']} transmise a Hofman")
        else:
            log.error(f"  ECHEC {o['name']} — {r.status_code} : {r.text[:400]}")
        time.sleep(1)

    log.info("=== Commandes traitees ===")


# ── MAIN ─────────────────────────────────────────────────────────────────────

if __name__ == "__main__":
    log.info("Truffeo Sync — demarrage"
             + ("  [DRY_RUN]" if DRY_RUN else ""))
    sync_stock()
    process_orders()
    log.info("Truffeo Sync — termine")
