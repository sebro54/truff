import crypto from 'node:crypto';

/**
 * Vérifie qu'une requête arrive bien via l'App Proxy Shopify.
 *
 * Shopify signe la query string : les paramètres (hors `signature`) sont triés
 * par nom, concaténés en `cle=valeur` sans séparateur, puis signés en
 * HMAC-SHA256 avec le secret de l'app.
 *
 * Sans cette vérification, n'importe qui peut appeler l'URL Vercel en direct
 * et se faire passer pour un client de la boutique.
 */
export function verifierAppProxy(url: URL): boolean {
  const secret = process.env.SHOPIFY_APP_SECRET;
  if (!secret) throw new Error('SHOPIFY_APP_SECRET manquant');

  const signature = url.searchParams.get('signature');
  if (!signature) return false;

  const message = [...url.searchParams.entries()]
    .filter(([cle]) => cle !== 'signature')
    .sort(([a], [b]) => a.localeCompare(b))
    .map(([cle, valeur]) => `${cle}=${valeur}`)
    .join('');

  const attendu = crypto.createHmac('sha256', secret).update(message).digest('hex');

  // Comparaison à temps constant : évite de fuiter la signature octet par octet.
  const a = Buffer.from(attendu, 'utf8');
  const b = Buffer.from(signature, 'utf8');
  return a.length === b.length && crypto.timingSafeEqual(a, b);
}

/** Identifiant du client Shopify connecté, transmis par le proxy. */
export function clientShopify(url: URL): string | null {
  return url.searchParams.get('logged_in_customer_id');
}
