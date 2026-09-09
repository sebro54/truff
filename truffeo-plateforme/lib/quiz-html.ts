// Malgré le nom du fichier, escapeHtml/melanger/reponseLiquid sont des
// utilitaires Liquid génériques réutilisés par d'autres routes (annuaire).

export function escapeHtml(s: string): string {
  return s
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;');
}

export function melanger<T>(tableau: T[]): T[] {
  const copie = [...tableau];
  for (let i = copie.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [copie[i], copie[j]] = [copie[j], copie[i]];
  }
  return copie;
}

/**
 * Content-Type application/liquid : Shopify insère ce corps dans le layout
 * du thème (header, footer, menu) au lieu de le servir tel quel. C'est ça
 * qui donne l'apparence d'une vraie page de la boutique.
 */
export function reponseLiquid(corps: string): Response {
  return new Response(corps, {
    headers: { 'Content-Type': 'application/liquid; charset=utf-8' },
  });
}

const STYLE_QUIZ = `
<style>
.tq { max-width: 640px; margin: 24px auto; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; color: #2b2420; }
.tq h1 { font-size: 1.6rem; color: #234f3a; margin: 0 0 8px; }
.tq h2 { font-size: 1.1rem; margin: 0 0 4px; }
.tq-intro, .tq-progression, .tq-explication { color: #6b6258; }
.tq-grille { list-style: none; margin: 0; padding: 0; display: grid; gap: 12px; }
.tq-carte { display: block; background: #fff; border: 1px solid #e6e0d6; border-radius: 12px; padding: 14px 16px; text-decoration: none; color: inherit; }
.tq-carte p { margin: 0; font-size: .9rem; }
.tq-question { background: #fff; border: 1px solid #e6e0d6; border-radius: 12px; padding: 20px; margin-top: 8px; }
.tq-reponse { display: block; width: 100%; text-align: left; padding: 10px 14px; margin: 0 0 8px; border: 1px solid #e6e0d6; border-radius: 8px; background: #faf7f2; cursor: pointer; font-size: 1rem; }
.tq-reponse:hover { border-color: #2f6b4f; }
.tq-verdict { font-weight: 700; }
.tq-verdict.ok { color: #2f6b4f; }
.tq-verdict.ko { color: #a5432f; }
.tq-produit { display: flex; align-items: center; gap: 10px; border: 1px solid #e6e0d6; border-radius: 10px; padding: 8px 12px; margin: 16px 0; background: #faf7f2; text-decoration: none; color: inherit; }
.tq-produit img { width: 40px; height: 40px; border-radius: 6px; object-fit: cover; }
.tq-bouton { display: inline-block; font-weight: 600; padding: 10px 18px; border-radius: 8px; background: #2f6b4f; color: #fff !important; text-decoration: none; border: none; cursor: pointer; font-size: 1rem; }
</style>
`;

export function enveloppeQuiz(interieur: string): string {
  return `<div class="tq">${STYLE_QUIZ}${interieur}</div>`;
}
