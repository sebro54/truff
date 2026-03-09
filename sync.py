import os
import requests
import logging
import time
from datetime import datetime

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
log = logging.getLogger(__name__)

# ── Config depuis variables d'environnement ──────────────────────────────────
HOFMAN_API_KEY   = os.environ["HOFMAN_API_KEY"]
SHOPIFY_TOKEN    = os.environ["SHOPIFY_TOKEN"]
SHOPIFY_STORE    = os.environ["SHOPIFY_STORE"]   # ex: truffeo.myshopify.com

HOFMAN_BASE  = "https://api-prod.hofmananimalcare.nl/api"
SHOPIFY_BASE = f"https://{SHOPIFY_STORE}/admin/api/2024-01"

HOFMAN_HEADERS  = {"x-api-key": HOFMAN_API_KEY, "Content-Type": "application/json"}
SHOPIFY_HEADERS = {"X-Shopify-Access-Token": SHOPIFY_TOKEN, "Content-Type": "application/json"}


# ════════════════════════════════════════════════════════════════════════════════
# 1. SYNCHRONISATION DES STOCKS
# ════════════════════════════════════════════════════════════════════════════════

def get_hofman_stock():
    """Récupère tous les stocks Hofman."""
    r = requests.get(f"{HOFMAN_BASE}/stock", headers=HOFMAN_HEADERS)
    r.raise_for_status()
    return r.json()  # liste de {sku, quantity, ...}


def get_shopify_variants():
    """Récupère tous les variants Shopify avec leur SKU et inventory_item_id."""
    variants = []
    url = f"{SHOPIFY_BASE}/variants.json?limit=250"
    while url:
        r = requests.get(url, headers=SHOPIFY_HEADERS)
        r.raise_for_status()
        data = r.json()
        variants += data.get("variants", [])
        # Pagination
        link = r.headers.get("Link", "")
        url = None
        if 'rel="next"' in link:
            for part in link.split(","):
                if 'rel="next"' in part:
                    url = part.split(";")[0].strip().strip("<>")
    return variants


def get_location_id():
    """Récupère l'ID du premier entrepôt Shopify."""
    r = requests.get(f"{SHOPIFY_BASE}/locations.json", headers=SHOPIFY_HEADERS)
    r.raise_for_status()
    return r.json()["locations"][0]["id"]


def sync_stock():
    """Synchronise les stocks Hofman → Shopify."""
    log.info("=== Début synchronisation des stocks ===")
    
    hofman_stock = get_hofman_stock()
    shopify_variants = get_shopify_variants()
    location_id = get_location_id()

    # Index Hofman par SKU
    hofman_by_sku = {item["sku"]: item["quantity"] for item in hofman_stock if "sku" in item}

    updated = 0
    for variant in shopify_variants:
        sku = variant.get("sku")
        if not sku or sku not in hofman_by_sku:
            continue

        new_qty = hofman_by_sku[sku]
        inventory_item_id = variant["inventory_item_id"]

        payload = {
            "location_id": location_id,
            "inventory_item_id": inventory_item_id,
            "available": new_qty
        }
        r = requests.post(
            f"{SHOPIFY_BASE}/inventory_levels/set.json",
            headers=SHOPIFY_HEADERS,
            json=payload
        )
        if r.status_code == 200:
            updated += 1
            log.info(f"  ✓ SKU {sku} → {new_qty} unités")
        else:
            log.warning(f"  ✗ SKU {sku} erreur {r.status_code}: {r.text}")

    log.info(f"=== Stocks mis à jour : {updated} variants ===")


# ════════════════════════════════════════════════════════════════════════════════
# 2. ENVOI AUTOMATIQUE DES COMMANDES À HOFMAN
# ════════════════════════════════════════════════════════════════════════════════

def get_new_shopify_orders():
    """Récupère les commandes Shopify non encore envoyées à Hofman (tag manquant)."""
    r = requests.get(
        f"{SHOPIFY_BASE}/orders.json?status=open&limit=50&fulfillment_status=unfulfilled",
        headers=SHOPIFY_HEADERS
    )
    r.raise_for_status()
    orders = r.json().get("orders", [])
    # Filtre : on ne prend que celles sans le tag "hofman_sent"
    return [o for o in orders if "hofman_sent" not in (o.get("tags") or "")]


def send_order_to_hofman(order):
    """Envoie une commande Shopify à Hofman."""
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
            {
                "sku":      item.get("sku"),
                "quantity": item.get("quantity"),
            }
            for item in order.get("line_items", [])
            if item.get("sku")
        ]
    }

    r = requests.post(f"{HOFMAN_BASE}/orders", headers=HOFMAN_HEADERS, json=hofman_order)
    return r.status_code in (200, 201), r


def tag_order_as_sent(order_id):
    """Ajoute le tag 'hofman_sent' à la commande Shopify pour éviter le double envoi."""
    # D'abord on récupère les tags existants
    r = requests.get(f"{SHOPIFY_BASE}/orders/{order_id}.json?fields=tags", headers=SHOPIFY_HEADERS)
    existing_tags = r.json().get("order", {}).get("tags", "")
    new_tags = f"{existing_tags}, hofman_sent".strip(", ")
    
    requests.put(
        f"{SHOPIFY_BASE}/orders/{order_id}.json",
        headers=SHOPIFY_HEADERS,
        json={"order": {"id": order_id, "tags": new_tags}}
    )


def process_orders():
    """Traite toutes les nouvelles commandes."""
    log.info("=== Début traitement des commandes ===")
    
    orders = get_new_shopify_orders()
    log.info(f"  {len(orders)} nouvelle(s) commande(s) à traiter")

    for order in orders:
        order_id = order["id"]
        order_name = order.get("name", order_id)
        
        success, response = send_order_to_hofman(order)
        if success:
            tag_order_as_sent(order_id)
            log.info(f"  ✓ Commande {order_name} envoyée à Hofman")
        else:
            log.error(f"  ✗ Commande {order_name} erreur {response.status_code}: {response.text}")

    log.info("=== Commandes traitées ===")


# ════════════════════════════════════════════════════════════════════════════════
# 3. BOUCLE PRINCIPALE
# ════════════════════════════════════════════════════════════════════════════════

if __name__ == "__main__":
    log.info("🐾 Truffeo Sync démarré")
    
    STOCK_INTERVAL  = 3600   # toutes les heures
    ORDER_INTERVAL  = 300    # toutes les 5 minutes
    
    last_stock_sync = 0

    while True:
        now = time.time()

        # Synchro stock toutes les heures
        if now - last_stock_sync >= STOCK_INTERVAL:
            try:
                sync_stock()
                last_stock_sync = now
            except Exception as e:
                log.error(f"Erreur sync stock : {e}")

        # Traitement des commandes toutes les 5 min
        try:
            process_orders()
        except Exception as e:
            log.error(f"Erreur commandes : {e}")

        time.sleep(ORDER_INTERVAL)
