import { verifierAppProxy } from '@/lib/app-proxy';
import { supabasePublic } from '@/lib/supabase';

export const dynamic = 'force-dynamic';

type Recherche = {
  lat?: string; lng?: string; rayon?: string; type?: string; q?: string;
  signature?: string; shop?: string; path_prefix?: string;
};

/**
 * Annuaire professionnel, servi sous truffeo.shop/apps/annuaire.
 *
 * Rendu côté serveur : chaque fiche est dans le HTML, donc indexable par
 * Google — c'est tout l'intérêt par rapport à la version Liquid actuelle qui
 * charge un JSON de 4 000 entrées dans le navigateur.
 */
export default async function Annuaire({ searchParams }: { searchParams: Recherche }) {
  // En production, Shopify signe chaque requête du proxy. En local, on saute
  // la vérification pour pouvoir développer sans passer par la boutique.
  if (process.env.NODE_ENV === 'production') {
    const url = new URL('https://truffeo.shop/apps/annuaire');
    for (const [cle, valeur] of Object.entries(searchParams)) {
      if (typeof valeur === 'string') url.searchParams.set(cle, valeur);
    }
    if (!verifierAppProxy(url)) {
      return <p>Cette page doit être consultée depuis truffeo.shop.</p>;
    }
  }

  const db = supabasePublic();
  const types = searchParams.type ? [searchParams.type] : null;

  const { data, error } = searchParams.lat && searchParams.lng
    ? await db.rpc('structures_proches', {
        p_lat: Number(searchParams.lat),
        p_lng: Number(searchParams.lng),
        p_rayon_km: Number(searchParams.rayon ?? 30),
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
    return <p>L&apos;annuaire est momentanément indisponible. Réessayez dans quelques minutes.</p>;
  }

  const resultats = data ?? [];

  return (
    <section>
      <h1>Annuaire professionnel</h1>

      {resultats.length === 0 ? (
        <p className="intro">Aucune structure ne correspond à cette recherche. Élargissez le rayon ou changez de métier.</p>
      ) : (
        <ul className="grille-themes">
          {resultats.map((s: any) => (
            <li key={s.id} className="carte-theme">
              <h2>{s.nom}</h2>
              <p>
                {s.type} · {s.code_postal} {s.ville}
                {'distance_km' in s && s.distance_km != null ? ` · à ${s.distance_km} km` : ''}
              </p>
              {s.telephone
                ? <p><a href={`tel:${s.telephone}`}>{s.telephone}</a></p>
                : <p><a href={`https://www.google.com/search?q=${encodeURIComponent(`${s.nom} ${s.ville} téléphone`)}`} rel="nofollow">Trouver le numéro</a></p>}
              {s.site_web && <p><a href={s.site_web} rel="nofollow noopener">Site web</a></p>}
            </li>
          ))}
        </ul>
      )}
    </section>
  );
}
