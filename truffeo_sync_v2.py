import csv
import html
import json
import os
from datetime import datetime

import truffeo_sync as core

STATE_FILE = os.environ.get("HOFMAN_STATE_FILE", ".state/hofman_catalog.json")
ADDED_CSV = "ajouts_depuis_derniere_synchro.csv"


def load_previous_state():
    if not os.path.exists(STATE_FILE):
        core.log.info("  Aucun historique catalogue : initialisation de la comparaison.")
        return None
    try:
        with open(STATE_FILE, "r", encoding="utf-8") as fh:
            data = json.load(fh)
        refs = {str(ref).strip() for ref in data.get("refs", []) if str(ref).strip()}
        core.log.info(
            f"  Historique charge : {len(refs)} references "
            f"(synchro precedente : {data.get('synced_at', 'date inconnue')})"
        )
        return {"refs": refs, "synced_at": data.get("synced_at")}
    except Exception as exc:
        core.log.warning(f"  Historique catalogue illisible : {exc}. Nouvelle base creee.")
        return None


def save_current_state(by_ref):
    os.makedirs(os.path.dirname(STATE_FILE) or ".", exist_ok=True)
    payload = {
        "synced_at": datetime.now().astimezone().isoformat(timespec="seconds"),
        "refs": sorted(by_ref.keys()),
    }
    tmp = STATE_FILE + ".tmp"
    with open(tmp, "w", encoding="utf-8") as fh:
        json.dump(payload, fh, ensure_ascii=False, indent=2)
    os.replace(tmp, STATE_FILE)
    core.log.info(f"  Etat catalogue memorise : {len(payload['refs'])} references")


def detect_added_since_previous_sync(by_ref, previous_state):
    if previous_state is None:
        return []
    added_refs = set(by_ref) - previous_state["refs"]
    added = [by_ref[ref] for ref in added_refs if by_ref[ref]["vendable"]]
    added.sort(key=lambda r: (r["marque"], r["ref"]))
    core.log.info(f"  Ajouts depuis la derniere synchro : {len(added)} reference(s)")
    return added


def write_added_csv(added):
    if not added:
        if os.path.exists(ADDED_CSV):
            os.remove(ADDED_CSV)
        return
    with open(ADDED_CSV, "w", newline="", encoding="utf-8-sig") as fh:
        w = csv.writer(fh, delimiter=";")
        w.writerow(["reference", "ean", "marque", "produit", "stock", "achat_HT", "conseille_HT", "prix_cible_TTC_20"])
        for r in added:
            cible = ""
            try:
                cible = round(float(str(r["conseille"]).replace(",", ".")) * 1.20, 2)
            except (TypeError, ValueError):
                pass
            w.writerow([r["ref"], r["ean"], r["marque"], r["nom"], r["qty"], r["achat"], r["conseille"], cible])


def _price_target(r):
    try:
        return f"{float(str(r['conseille']).replace(',', '.')) * 1.20:.2f} EUR"
    except (TypeError, ValueError):
        return ""


def _row(r):
    return (
        f"<tr><td>{html.escape(str(r['ref']))}</td>"
        f"<td>{html.escape(str(r['marque']))}</td>"
        f"<td>{html.escape(str(r['nom']))}</td>"
        f"<td align='right'>{r['qty']}</td>"
        f"<td align='right'>{html.escape(_price_target(r))}</td></tr>"
    )


def _table(title, rows, limit=60):
    if not rows:
        return ""
    block = (
        f"<h3>{html.escape(title)}</h3>"
        "<table border='1' cellpadding='6' cellspacing='0' style='border-collapse:collapse;font-size:13px'>"
        "<tr style='background:#f0ebe4'><th>Ref</th><th>Marque</th><th>Produit</th><th>Stock</th><th>Prix cible TTC</th></tr>"
        + "".join(_row(r) for r in rows[:limit])
        + "</table>"
    )
    if len(rows) > limit:
        block += f"<p><i>... et {len(rows) - limit} autre(s). Voir le CSV joint.</i></p>"
    return block


def send_report(missing_shopify, added_since_sync, removed, previous_state):
    if not (core.MAIL_TO and core.SMTP_USER and core.SMTP_PASS):
        core.log.info("  E-mail non configure - rapport non envoye.")
        return
    if not missing_shopify and not added_since_sync and not removed:
        core.log.info("  Aucun mouvement : pas d'e-mail.")
        return

    import smtplib
    from email.message import EmailMessage

    jour = datetime.now().strftime("%d/%m/%Y %H:%M")
    missing_in_stock = [r for r in missing_shopify if r["qty"] > 0]
    added_in_stock = [r for r in added_since_sync if r["qty"] > 0]

    previous_label = "premiere comparaison"
    if previous_state and previous_state.get("synced_at"):
        previous_label = html.escape(str(previous_state["synced_at"]))

    body = f"""<html><body style="font-family:Arial,sans-serif;font-size:14px;color:#222">
<h2 style="color:#5a3e2b">Truffeo - Catalogue Hofman du {jour}</h2>
<p><b>{len(added_since_sync)}</b> reference(s) ajoutee(s) chez Hofman depuis la derniere synchronisation, dont <b>{len(added_in_stock)}</b> en stock.<br>
<b>{len(missing_shopify)}</b> reference(s) Hofman absente(s) de Shopify, dont <b>{len(missing_in_stock)}</b> en stock.<br>
<b>{len(removed)}</b> produit(s) dereference(s) et retire(s) de la vente.</p>
<p style="color:#666;font-size:12px">Base de comparaison : {previous_label}</p>"""

    if previous_state is None:
        body += "<p style='background:#fff4d6;padding:10px'>Historique initialise. Les vrais ajouts seront identifies a partir de la prochaine synchronisation.</p>"

    body += _table("Ajoutes chez Hofman depuis la derniere synchronisation", added_since_sync)
    body += _table("Presents chez Hofman mais absents de Shopify", missing_in_stock)

    if removed:
        body += "<h3>Produits dereferences / retires de Shopify</h3><ul>"
        body += "".join(f"<li>{html.escape(str(t))}</li>" for t in removed[:40])
        body += "</ul>"

    body += "<p style='color:#777;font-size:12px'>Rapport automatique - aucune fiche produit n'est creee sans validation.</p></body></html>"

    msg = EmailMessage()
    msg["Subject"] = (
        f"Truffeo/Hofman - {len(added_since_sync)} ajout(s) depuis derniere synchro, "
        f"{len(missing_shopify)} absent(s) Shopify, {len(removed)} retrait(s)"
    )
    msg["From"] = core.MAIL_FROM or core.SMTP_USER
    msg["To"] = core.MAIL_TO
    msg.set_content("Rapport au format HTML - voir la version enrichie.")
    msg.add_alternative(body, subtype="html")

    for path, filename in [
        (ADDED_CSV, f"ajouts_hofman_{datetime.now():%Y-%m-%d_%H%M}.csv"),
        ("nouveautes.csv", f"absents_shopify_{datetime.now():%Y-%m-%d_%H%M}.csv"),
    ]:
        if os.path.exists(path):
            with open(path, "rb") as fh:
                msg.add_attachment(fh.read(), maintype="text", subtype="csv", filename=filename)

    try:
        with smtplib.SMTP(core.SMTP_HOST, core.SMTP_PORT, timeout=45) as server:
            server.starttls()
            server.login(core.SMTP_USER, core.SMTP_PASS)
            server.send_message(msg)
        core.log.info(f"  Rapport enrichi envoye a {core.MAIL_TO}")
    except Exception as exc:
        core.log.error(f"  Echec de l'envoi du rapport enrichi : {exc}")


def sync_stock():
    core.log.info("=== Synchronisation des stocks ===")
    by_ean, by_ref = core.build_hofman_maps(core.get_hofman_variants())
    previous_state = load_previous_state()
    added_since_sync = detect_added_since_previous_sync(by_ref, previous_state)
    write_added_csv(added_since_sync)

    location_gid = core.get_location_gid()
    variants = core.get_shopify_variants()
    pairs, to_track, to_activate = [], [], []
    refs_seen = set()

    for v in variants:
        sku = (v.get("sku") or "").strip()
        barcode = (v.get("barcode") or "").strip()
        rec = (by_ean.get(barcode) if barcode else None) or (by_ref.get(sku) if sku else None) or (by_ean.get(sku) if sku else None)
        if not rec:
            continue
        refs_seen.add(rec["ref"])
        inv = v["inventoryItem"]
        iid = inv["id"]
        if not inv["tracked"]:
            to_track.append(iid)
        locations = [n["location"]["id"] for n in inv["inventoryLevels"]["nodes"]]
        if location_gid not in locations:
            to_activate.append(iid)
        pairs.append((iid, rec["qty"]))

    if not core.DRY_RUN:
        if to_activate:
            core.activate_at_location(to_activate, location_gid)
        if to_track:
            core.enable_tracking(to_track)
        if pairs:
            core.write_quantities(pairs, location_gid)

    removed_entries = []
    if core.DRAFT_DELISTED:
        removed_entries = core.handle_delisted(variants, location_gid, {iid for iid, _ in pairs})

    missing_shopify = core.detect_new(by_ref, refs_seen)
    send_report(missing_shopify, added_since_sync, [entry["titre"] for _, entry in removed_entries], previous_state)

    if not core.DRY_RUN:
        save_current_state(by_ref)


if __name__ == "__main__":
    core.log.info("Truffeo Sync V2 - demarrage" + (" [DRY_RUN]" if core.DRY_RUN else ""))
    sync_stock()
    core.process_orders()
    core.log.info("Truffeo Sync V2 - termine")
