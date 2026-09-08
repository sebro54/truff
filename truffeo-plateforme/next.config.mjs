/** @type {import('next').NextConfig} */
export default {
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
