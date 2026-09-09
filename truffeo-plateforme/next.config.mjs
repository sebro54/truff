/** @type {import('next').NextConfig} */
export default {
  // Servi via l'App Proxy Shopify sous truffeo.shop/apps/communaute/... —
  // Shopify relaie en retirant ce préfixe avant de transmettre à Vercel, donc
  // l'app doit elle-même vivre sous /apps/communaute pour que la requête
  // relayée retombe sur la bonne route. basePath fait ça pour les pages, les
  // assets (_next/static/...) ET les <Link> automatiquement. Seuls les
  // fetch() manuels vers nos propres routes API doivent être préfixés à la
  // main avec lib/base-path.ts (BASE_PATH), Next ne le fait pas pour eux.
  basePath: '/apps/communaute',

  // Shopify sert les pages du proxy dans une iframe-like context :
  // on interdit l'embedding par des tiers autres que la boutique.
  async headers() {
    return [{
      source: '/:path*',
      headers: [
        { key: 'Content-Security-Policy', value: "frame-ancestors https://truffeo.shop https://*.myshopify.com" },
      ],
    }];
  },
};
