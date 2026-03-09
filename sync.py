import os
import requests
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
log = logging.getLogger(__name__)

# ── Config ───────────────────────────────────────────────────────────────────
HOFMAN_API_KEY = os.environ["HOFMAN_API_KEY"]
SHOPIFY_TOKEN  = os.environ["SHOPIFY_TOKEN"]
SHOPIFY_STORE  = os.environ["SHOPIFY_STORE"]

HOFMAN_BASE  = "https://api-prod.hofmananimalcare.nl/api"
SHOPIFY_BASE = f"https://{SHOPIFY_STORE}/admin/api/2024-01"

HOFMAN_HEADERS  = {"x-api-key": HOFMAN_API_KEY, "Content-Type": "application/json"}
SHOPIFY_HEADERS = {"X-Shopify-Access-Token": SHOPIFY_TOKEN, "Content-Type": "application/json"}


# ── 1. STOCKS ────────────────────────────────────────────────────────────────

def get_hofman_variants():
    """Récupère tous les produits Hofman avec leur stock (in_stock)."""
    r = requests.get(f"{HOFMAN_BASE}/variants", headers=HOFMAN_HEADERS)
    r.raise_for_status()
    return r.json()

def get_shopify_variants():
    variants = []
    url = f"{SHOPIFY_BASE}/variants.json?limit=250"
    while url:
        r = requests.get(url, headers=SHOPIFY_HEADERS)
        r.raise_for_status()
        variants += r.json().get("variants", [])
        link = r.headers.get("Link", "")
        url = None
        if 'rel="next"' in link:
            for part in link.split(","):
                if 'rel="next"' in part:
                    url = part.split(";")[0].strip().strip("<>")
    return variants

def get_location_id():
    r = requests.get(f"{SHOPIFY_BASE}/locations.json", headers=SHOPIFY_HEADERS)
    r.raise_for_status()
    return r.json()["locations"][0]["id"]

def sync_stock():
    log.info("=== Synchronisation des stocks ===")
    hofman_variants  = get_hofman_variants()
    shopify_variants = get_shopify_variants()
    location_id      = get_location_id()

    # Index Hofman par EAN et par article_number
    hofman_by_ean = {}
    hofman_by_ref = {}
    for item in hofman_variants:
        qty = 1 if str(item.get("in_stock", "0")) == "1" else 0
        if item.get("ean"):
            hofman_by_ean[item["ean"]] = qty
        if item.get("article_number"):
            hofman_by_ref[item["article_number"]] = qty

    updated = 0
    for variant in shopify_variants:
        sku = variant.get("sku") or ""
        barcode = variant.get("barcode") or ""

        # Cherche d'abord par EAN (barcode), puis par SKU (article_number)
        if barcode and barcode in hofman_by_ean:
            new_qty = hofman_by_ean[barcode]
        elif sku and sku in hofman_by_ref:
            new_qty = hofman_by_ref[sku]
        elif sku and sku in hofman_by_ean:
            new_qty = hofman_by_ean[sku]
        else:
            continue

        r = requests.post(
            f"{SHOPIFY_BASE}/inventory_levels/set.json",
            headers=SHOPIFY_HEADERS,
            json={
                "location_id":       location_id,
                "inventory_item_id": variant["inventory_item_id"],
                "available":         new_qty
            }
        )
        if r.status_code == 200:
            updated += 1
            log.info(f"  ✓ SKU {sku} → {'en stock' if new_qty else 'rupture'}")
        else:
            log.warning(f"  ✗ SKU {sku} erreur {r.status_code}: {r.text}")

    log.info(f"=== {updated} stocks mis à jour ===")


# ── 2. COMMANDES ─────────────────────────────────────────────────────────────

def get_new_shopify_orders():
    r = requests.get(
        f"{SHOPIFY_BASE}/orders.json?status=open&fulfillment_status=unfulfilled&limit=50",
        headers=SHOPIFY_HEADERS
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
    r = requests.post(f"{HOFMAN_BASE}/orders", headers=HOFMAN_HEADERS, json=hofman_order)
    return r.status_code in (200, 201), r

def tag_order_as_sent(order_id):
    r = requests.get(f"{SHOPIFY_BASE}/orders/{order_id}.json?fields=tags", headers=SHOPIFY_HEADERS)
    existing = r.json().get("order", {}).get("tags", "")
    new_tags = f"{existing}, hofman_sent".strip(", ")
    requests.put(
        f"{SHOPIFY_BASE}/orders/{order_id}.json",
        headers=SHOPIFY_HEADERS,
        json={"order": {"id": order_id, "tags": new_tags}}
    )

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
    log.info("=== Commandes traitées ===")


# ── MAIN ─────────────────────────────────────────────────────────────────────

if __name__ == "__main__":
    log.info("🐾 Truffeo Sync — démarrage")
    sync_stock()
    process_orders()
    log.info("🐾 Truffeo Sync — terminé")
