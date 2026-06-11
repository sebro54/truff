import os
import time
import requests
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
log = logging.getLogger(__name__)

# ── Config ───────────────────────────────────────────────────────────────────
HOFMAN_API_KEY = os.environ.get("HOFMAN_API_KEY", "")
SHOPIFY_TOKEN  = os.environ.get("SHOPIFY_TOKEN", "")
SHOPIFY_STORE  = os.environ.get("SHOPIFY_STORE", "ywkigs-tb.myshopify.com")

# Nom de l'emplacement Shopify dédié au stock Hofman (modifiable via variable d'env)
HOFMAN_LOCATION_NAME = os.environ.get("HOFMAN_LOCATION_NAME", "Hofman")

log.info(f"SHOPIFY_STORE: {SHOPIFY_STORE}")
log.info(f"SHOPIFY_TOKEN présent: {'oui' if SHOPIFY_TOKEN else 'NON (vide)'}")
log.info(f"HOFMAN_API_KEY présent: {'oui' if HOFMAN_API_KEY else 'NON (vide)'}")

HOFMAN_BASE  = "https://api-prod.hofmananimalcare.nl"
SHOPIFY_BASE = f"https://{SHOPIFY_STORE}/admin/api/2026-01"

def get_shopify_headers():
    return {"X-Shopify-Access-Token": SHOPIFY_TOKEN, "Content-Type": "application/json"}

HOFMAN_HEADERS = {"Locale": "en", "Content-Type": "application/json"}


# ── 1. STOCKS ────────────────────────────────────────────────────────────────

def get_hofman_variants():
    all_items = []
    page = 1
    while True:
        r = requests.get(
            f"{HOFMAN_BASE}/feeds/variants/json",
            headers=HOFMAN_HEADERS,
            params={"api_key": HOFMAN_API_KEY, "page": page, "per_page": 100}
        )
        r.raise_for_status()
        data = r.json()
        if isinstance(data, list):
            items = data
        else:
            items = data.get("data", data.get("items", []))
        if not items:
            break
        all_items += items
        log.info(f"  Page {page} : {len(items)} produits")
        if len(items) < 100:
            break
        page += 1
    log.info(f"  Total Hofman : {len(all_items)} produits")
    return all_items

def get_shopify_variants():
    variants = []
    url = f"{SHOPIFY_BASE}/variants.json?limit=250"
    while url:
        r = requests.get(url, headers=get_shopify_headers())
        r.raise_for_status()
        variants += r.json().get("variants", [])
        link = r.headers.get("Link", "")
        url = None
        if 'rel="next"' in link:
            for part in link.split(","):
                if 'rel="next"' in part:
                    url = part.split(";")[0].strip().strip("<>")
        time.sleep(1)
    return variants

def get_location_id():
    """Cible explicitement l'emplacement 'Hofman' — pour ne JAMAIS écraser
    le stock perso de l'emplacement 'Home'."""
    r = requests.get(f"{SHOPIFY_BASE}/locations.json", headers=get_shopify_headers())
    r.raise_for_status()
    locations = r.json()["locations"]

    for loc in locations:
        log.info(f"  Emplacement: {loc['id']} - {loc['name']}")

    for loc in locations:
        if loc["name"].strip().lower() == HOFMAN_LOCATION_NAME.strip().lower():
            log.info(f"  ✓ Emplacement sélectionné: {loc['name']} ({loc['id']})")
            return loc["id"]

    raise RuntimeError(
        f"Emplacement '{HOFMAN_LOCATION_NAME}' introuvable dans Shopify. "
        f"Vérifie le nom exact dans Paramètres → Emplacements."
    )

def set_inventory(location_id, inventory_item_id, qty):
    """Écrit la quantité ; si l'article n'est pas encore rattaché à l'emplacement
    Hofman (422), on le rattache puis on réessaie une fois."""
    payload = {
        "location_id":       location_id,
        "inventory_item_id": inventory_item_id,
        "available":         qty,
    }
    r = requests.post(f"{SHOPIFY_BASE}/inventory_levels/set.json",
                      headers=get_shopify_headers(), json=payload)

    if r.status_code == 422:
        # Tentative de rattachement de l'article à l'emplacement, puis nouvel essai
        requests.post(f"{SHOPIFY_BASE}/inventory_levels/connect.json",
                      headers=get_shopify_headers(),
                      json={"location_id": location_id,
                            "inventory_item_id": inventory_item_id})
        r = requests.post(f"{SHOPIFY_BASE}/inventory_levels/set.json",
                          headers=get_shopify_headers(), json=payload)
    return r

def sync_stock():
    log.info("=== Synchronisation des stocks ===")
    hofman_variants  = get_hofman_variants()
    shopify_variants = get_shopify_variants()
    location_id      = get_location_id()

    hofman_by_ean = {}
    hofman_by_ref = {}
    for item in hofman_variants:
        qty = 1 if str(item.get("in_stock", "0")) == "1" else 0
        if item.get("ean"):
            hofman_by_ean[str(item["ean"])] = qty
        if item.get("article_number"):
            hofman_by_ref[str(item["article_number"])] = qty

    updated = 0
    skipped = 0
    for variant in shopify_variants:
        sku     = str(variant.get("sku") or "")
        barcode = str(variant.get("barcode") or "")

        if barcode and barcode in hofman_by_ean:
            new_qty = hofman_by_ean[barcode]
        elif sku and sku in hofman_by_ref:
            new_qty = hofman_by_ref[sku]
        elif sku and sku in hofman_by_ean:
            new_qty = hofman_by_ean[sku]
        else:
            continue

        r = set_inventory(location_id, variant["inventory_item_id"], new_qty)

        if r.status_code == 200:
            updated += 1
            log.info(f"  ✓ SKU {sku} → {'en stock' if new_qty else 'rupture'}")
        elif r.status_code == 422:
            skipped += 1
            log.info(f"  ⚠ SKU {sku} ignoré (suivi de stock désactivé sur la variante)")
        else:
            log.warning(f"  ✗ SKU {sku} erreur {r.status_code}: {r.text}")
        time.sleep(1)

    log.info(f"=== {updated} stocks mis à jour, {skipped} ignorés (suivi désactivé) ===")


# ── 2. COMMANDES ─────────────────────────────────────────────────────────────

def get_new_shopify_orders():
    r = requests.get(
        f"{SHOPIFY_BASE}/orders.json?status=open&fulfillment_status=unfulfilled&limit=50",
        headers=get_shopify_headers()
    )
    r.raise_for_status()
    orders = r.json().get("orders", [])
    return [o for o in orders if "hofman_sent" not in (o.get("tags") or "")]

def send_order_to_hofman(order):
    shipping = order.get("shipping_address", {})
    hofman_order = {
        "reference": str(order["id"]),
        "shipping_address": {
            "name":     shipping.get("name", ""),
            "address1": shipping.get("address1", ""),
            "address2": shipping.get("address2", ""),
            "city":     shipping.get("city", ""),
            "zip":      shipping.get("zip", ""),
            "country":  shipping.get("country_code", ""),
            "phone":    shipping.get("phone", ""),
        },
        "lines": [
            {"sku": item.get("sku"), "quantity": item.get("quantity")}
            for item in order.get("line_items", [])
            if item.get("sku")
        ]
    }
    r = requests.post(
        f"{HOFMAN_BASE}/orders",
        headers=HOFMAN_HEADERS,
        params={"api_key": HOFMAN_API_KEY},
        json=hofman_order
    )
    return r.status_code in (200, 201), r

def tag_order_as_sent(order_id):
    r = requests.get(f"{SHOPIFY_BASE}/orders/{order_id}.json?fields=tags", headers=get_shopify_headers())
    existing = r.json().get("order", {}).get("tags", "")
    new_tags = f"{existing}, hofman_sent".strip(", ")
    requests.put(
        f"{SHOPIFY_BASE}/orders/{order_id}.json",
        headers=get_shopify_headers(),
        json={"order": {"id": order_id, "tags": new_tags}}
    )
    time.sleep(1)

def process_orders():
    log.info("=== Traitement des commandes ===")
    orders = get_new_shopify_orders()
    log.info(f"  {len(orders)} nouvelle(s) commande(s)")
    for order in orders:
        success, response = send_order_to_hofman(order)
        if success:
            tag_order_as_sent(order["id"])
            log.info(f"  ✓ Commande {order.get('name')} envoyée à Hofman")
        else:
            log.error(f"  ✗ Commande {order.get('name')} erreur {response.status_code}: {response.text}")
        time.sleep(1)
    log.info("=== Commandes traitées ===")


# ── MAIN ─────────────────────────────────────────────────────────────────────

if __name__ == "__main__":
    log.info("🐾 Truffeo Sync — démarrage")
    sync_stock()
    process_orders()
    log.info("🐾 Truffeo Sync — terminé")
