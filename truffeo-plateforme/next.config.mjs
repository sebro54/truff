/** @type {import('next').NextConfig} */
export default {
  // Servi via l'App Proxy Shopify sous truffeo.shop/apps/communaute/... :
  // le navigateur résout /_next/static/... depuis truffeo.shop, que Shopify
  // ne relaie pas (seul /apps/communaute/* l'est). assetPrefix force les
  // JS/CSS à être chargés directement depuis Vercel, quelle que soit l'URL
  // sous laquelle la page a été servie.
  assetPrefix: process.env.VERCEL_PROJECT_PRODUCTION_URL
    ? `https://${process.env.VERCEL_PROJECT_PRODUCTION_URL}`
    : undefined,

  // Shopify sert les pages du proxy dans une iframe-like context :
  // on interdit l'embedding par des tiers autres que la boutique.
  async headers() {
    return [{
      source: '/apps/:path*',
      headers: [
        { key: 'Content-Security-Policy', value: "frame-ancestors https://truffeo.shop https://*.myshopify.com" },
      ],
    }];
  },
};
