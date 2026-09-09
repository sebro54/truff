import { verifierAppProxy } from '@/lib/app-proxy';
import { supabasePublic } from '@/lib/supabase';
import { escapeHtml, reponseLiquid } from '@/lib/quiz-html';

export const dynamic = 'force-dynamic';

const STYLE_ANNUAIRE = `
<style>
.tf-annuaire { max-width: 640px; margin: 24px auto; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; color: #2b2420; }
.tf-annuaire h1 { font-size: 1.6rem; color: #234f3a; margin: 0 0 16px; }
.tf-annuaire .tf-vide { color: #6b6258; }
.tf-annuaire ul { list-style: none; margin: 0; padding: 0; display: grid; gap: 12px; }
.tf-annuaire li { background: #fff; border: 1px solid #e6e0d6; border-radius: 12px; padding: 14px 16px; }
.tf-annuaire li h2 { font-size: 1.05rem; margin: 0 0 4px; }
.tf-annuaire li p { margin: 4px 0; }
</style>
`;

/**
 * Annuaire professionnel, servi sous truffeo.shop/apps/communaute/annuaire.
 * Rendu en Liquid pour hériter du header/footer/menu du thème.
 */
export async function GET(request: Request) {
  const url = new URL(request.url);

  if (process.env.NODE_ENV === 'production' && !verifierAppProxy(url)) {
    return reponseLiquid('Cette page doit être consultée depuis truffeo.shop.');
  }

  const lat = url.searchParams.get('lat');
  const lng = url.searchParams.get('lng');
  const rayon = url.searchParams.get('rayon');
  const type = url.searchParams.get('type');

  const db = supabasePublic();
  const types = type ? [type] : null;

  const { data, error } = lat && lng
    ? await db.rpc('structures_proches', {
        p_lat: Number(lat),
        p_lng: Number(lng),
        p_rayon_km: Number(rayon ?? 30),
        p_types: types,
        p_limite: 100,
      })
    : await db
        .from('structures')
        .select('id, type, nom, ville, code_postal, telephone, site_web')
        .eq('statut', 'publie')
        .order('nom')
        .limit(50);

  if (error) {
    return reponseLiquid(`${STYLE_ANNUAIRE}<div class="tf-annuaire"><p class="tf-vide">L'annuaire est momentanément indisponible. Réessayez dans quelques minutes.</p></div>`);
  }

  const resultats = data ?? [];

  const contenu = resultats.length === 0
    ? '<p class="tf-vide">Aucune structure ne correspond à cette recherche. Élargissez le rayon ou changez de métier.</p>'
    : `<ul>${resultats.map((s: any) => `
        <li>
          <h2>${escapeHtml(s.nom)}</h2>
          <p>
            ${escapeHtml(s.type)} · ${escapeHtml(s.code_postal ?? '')} ${escapeHtml(s.ville ?? '')}
            ${'distance_km' in s && s.distance_km != null ? ` · à ${escapeHtml(String(s.distance_km))} km` : ''}
          </p>
          ${s.telephone
            ? `<p><a href="tel:${escapeHtml(s.telephone)}">${escapeHtml(s.telephone)}</a></p>`
            : `<p><a href="https://www.google.com/search?q=${encodeURIComponent(`${s.nom} ${s.ville} téléphone`)}" rel="nofollow">Trouver le numéro</a></p>`}
          ${s.site_web ? `<p><a href="${escapeHtml(s.site_web)}" rel="nofollow noopener">Site web</a></p>` : ''}
        </li>
      `).join('')}</ul>`;

  return reponseLiquid(`${STYLE_ANNUAIRE}<div class="tf-annuaire"><h1>Annuaire professionnel</h1>${contenu}</div>`);
}
