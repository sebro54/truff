# Trufféo — plateforme communautaire

Backend et pages de l'écosystème Trufféo (annuaire, petites annonces, bourse au
matériel avec enchères, SOS adoptions, événements), servi sous le domaine de la
boutique via l'App Proxy Shopify.

- **Base de données** : Supabase (Postgres + PostGIS + Auth)
- **Application** : Next.js sur Vercel
- **URL publique** : `truffeo.shop/apps/...` — le SEO reste sur le domaine principal
- **Shopify** : conserve la boutique, le thème, le panier et le checkout

## Mise en route

### 1. Base de données

```bash
npm i -g supabase
supabase link --project-ref <ref-du-projet>
supabase db push          # applique les 3 migrations
```

Les migrations sont dans l'ordre : schéma → logique d'enchères → RLS.
Elles sont rejouables sur une base vide (`supabase db reset` en local).

### 2. Application

```bash
cp .env.example .env.local   # puis remplir les valeurs
npm install
npm run dev
```

En développement, la vérification de signature de l'App Proxy est désactivée :
`http://localhost:3000/apps/annuaire` fonctionne directement.

### 3. App Proxy Shopify

Dans l'admin Shopify → Paramètres → Applications → Développer des applications →
créer une app personnalisée, puis Configuration → App proxy :

| Champ | Valeur |
|---|---|
| Sous-préfixe | `apps` |
| Préfixe | `annuaire` (un proxy par service, ou `communaute` pour tout regrouper) |
| URL du proxy | `https://<projet>.vercel.app/apps/annuaire` |

Le secret de l'app va dans `SHOPIFY_APP_SECRET`. Shopify signe chaque requête ;
`lib/app-proxy.ts` la vérifie et refuse les appels directs à l'URL Vercel.

### 4. Cron des enchères

`vercel.json` déclenche `/api/cron/encheres` toutes les minutes : ouverture des
enchères programmées, clôture de celles arrivées à échéance. Protégé par
`CRON_SECRET`.

## Import de l'annuaire existant

Le fichier `annuaire-data-fr.json` du thème (≈4 000 vétérinaires OpenStreetMap)
s'importe dans `structures` avec :

- `source = 'openstreetmap'`, `source_ref` = l'id OSM → la contrainte d'unicité
  rend les ré-imports idempotents
- `statut = 'publie'`
- `position = st_point(lng, lat)::geography`
- `departement` = deux premiers caractères du code postal (attention à la Corse)

## Comment fonctionnent les enchères

Toute la logique est dans Postgres, pas dans le navigateur. C'est le point
central de l'architecture : un client peut être modifié, la base non.

- `placer_offre(lot_id, montant_cents)` verrouille la ligne du lot (`for update`),
  ce qui sérialise les offres concurrentes, puis vérifie le mode, le statut,
  l'horloge serveur, l'identité du vendeur et le montant minimum.
- La table `offres` **n'a aucune policy d'écriture**. Même authentifié, personne
  ne peut y insérer directement. Le seul chemin est `placer_offre()`.
- Anti-sniping : une offre dans les 2 dernières minutes repousse la fin d'autant.
- Un lot passé en `en_cours` n'est plus modifiable par son vendeur (la policy
  RLS le bloque) — sinon il pourrait déplacer la date de fin en cours de partie.
- Prix de réserve non atteint → statut `reserve_non_atteinte`, pas de gagnant,
  pas de commission.

## Commission

`lots.commission_pct` (10 % par défaut) et la fonction `commission_cents(lot)`
calculent la marge Trufféo sur le prix final.

L'encaissement reste à brancher : **Stripe Connect**, `application_fee_amount`
égal à la commission et `transfer_data.destination` vers le compte connecté du
vendeur (`profils.stripe_account_id`). L'argent ne transite pas par le compte
Trufféo — c'est ce qui évite que le prix de vente entier remonte en chiffre
d'affaires.

Deux points à valider avec le comptable avant d'ouvrir les enchères au public :

1. **Statut d'opérateur de plateforme** : prélever une commission sur des ventes
   entre tiers déclenche les obligations de l'article 242 bis du CGI et la
   déclaration DAC7 des revenus des vendeurs à la DGFiP.
2. **Information des acheteurs** : obligation d'indiquer si le vendeur est un
   professionnel ou un particulier, la garantie applicable n'étant pas la même.

Le modèle alternatif — dépôt-vente, où Trufféo achète puis revend — évite le
statut de plateforme mais fait de toi le vendeur, avec la garantie de conformité
à ta charge. À arbitrer avant de coder le paiement.

## Reste à faire

- [ ] Import du JSON annuaire vers `structures`
- [ ] Carte Leaflet (composant client) sur la page annuaire
- [ ] Pages annonces, bourse au matériel, SOS adoptions, événements
- [ ] Auth Supabase (lien magique) + espace « mes annonces / mes enchères »
- [ ] Interface de modération
- [ ] Stripe Connect + webhooks
- [ ] Notifications (surenchère, gain, expiration d'annonce)
- [ ] Redirections 301 des anciennes pages `/pages/*` vers `/apps/*`
