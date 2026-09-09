// Doit rester identique au `basePath` de next.config.mjs. Next.js préfixe
// automatiquement les <Link>/assets avec le basePath, mais pas les appels
// fetch() faits à la main vers nos propres routes API — d'où cette constante.
export const BASE_PATH = '/apps/communaute';
