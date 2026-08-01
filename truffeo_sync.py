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
import sys
import time
import logging
import requests

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
    """Deux index : par EAN et par reference. Valeurs = quantite reelle."""
    by_ean, by_ref = {}, {}
    for it in items:
        raw = it.get("in_stock", 0)
        try:
            qty = int(float(str(raw).strip() or 0))
        except (TypeError, ValueError):
            qty = 0
        qty = max(qty, 0)
        if it.get("ean"):
            by_ean[str(it["ean"]).strip()] = qty
        if it.get("article_number"):
            by_ref[str(it["article_number"]).strip()] = qty
    total = sum(by_ref.values())
    dispo = sum(1 for v in by_ref.values() if v > 0)
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


def sync_stock():
    log.info("=== Synchronisation des stocks ===")
    by_ean, by_ref = build_hofman_maps(get_hofman_variants())
    location_gid = get_location_gid()
    variants = get_shopify_variants()

    pairs, to_track, to_activate = [], [], []
    matched = 0

    for v in variants:
        sku = (v.get("sku") or "").strip()
        bar = (v.get("barcode") or "").strip()

        if bar and bar in by_ean:
            qty = by_ean[bar]
        elif sku and sku in by_ref:
            qty = by_ref[sku]
        elif sku and sku in by_ean:
            qty = by_ean[sku]
        else:
            continue

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
        return

    if to_activate:
        activate_at_location(to_activate, location_gid)
    if to_track:
        enable_tracking(to_track)
    if pairs:
        write_quantities(pairs, location_gid)

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
