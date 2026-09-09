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
supabase db push          # applique les 5 migrations
```

Les migrations sont dans l'ordre : schéma → logique d'enchères → RLS → quiz
(schéma + logique + RLS) → contenu du quiz. Elles sont rejouables sur une
base vide (`supabase db reset` en local).

### 2. Application

```bash
cp .env.example .env.local   # puis remplir les valeurs
npm install
npm run dev
```

En développement, la vérification de signature de l'App Proxy est désactivée :
`http://localhost:3000/apps/annuaire` fonctionne directement.

### 3. App Proxy Shopify

L'app entière vit sous `/apps/communaute` (voir `basePath` dans
`next.config.mjs`) — un seul App Proxy couvre l'annuaire et le quiz.

Dans l'admin Shopify → Paramètres → Applications → Développer des applications →
créer une app personnalisée, puis Configuration → App proxy :

| Champ | Valeur |
|---|---|
| Préfixe du sous-chemin | `apps` |
| Sous-chemin | `communaute` |
| URL du proxy | `https://<projet>.vercel.app/apps/communaute` |

**L'URL du proxy doit se terminer par `/apps/communaute`** — Shopify retire le
préfixe `/apps/communaute` avant de relayer la requête et l'ajoute à l'URL du
proxy ; comme l'app elle-même exige ce préfixe (`basePath`), il faut qu'il
soit présent des deux côtés. L'oublier casse tout : liens internes, appels
`fetch()` vers `/api/...`, et chargement de `_next/static/...` (CSS/JS).

Le secret de l'app va dans `SHOPIFY_APP_SECRET`. Shopify signe chaque requête ;
`lib/app-proxy.ts` la vérifie et refuse les appels directs à l'URL Vercel.

### 4. Cron des enchères

`vercel.json` déclenche `/apps/communaute/api/cron/encheres` (même `basePath`
que le reste de l'app) : ouverture des enchères programmées, clôture de
celles arrivées à échéance. Protégé par `CRON_SECRET`.

Le plan **Hobby** de Vercel n'autorise qu'un cron par jour — le déploiement
est refusé si le fichier déclare une fréquence plus élevée. En attendant un
passage au plan Pro, la fréquence est réglée sur une fois par jour
(`0 3 * * *`), ce qui veut dire qu'une enchère peut rester affichée
`en_cours` jusqu'à 24h après sa date de fin réelle avant d'être clôturée.
Sans impact sur le quiz. À repasser à `* * * * *` avec le plan Pro avant
d'ouvrir les enchères au public.

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

## Quiz type ACACED

`/quiz` liste les thèmes, `/quiz/<theme>` propose 10 questions tirées au
hasard parmi celles publiées pour ce thème.

Même logique que les enchères : la bonne réponse ne doit jamais être lisible
côté client avant d'avoir répondu.

- Le client lit les réponses via la vue `quiz_reponses_publiques`, qui
  n'expose pas la colonne `est_correcte` — la table `quiz_reponses` n'a
  d'ailleurs aucune policy RLS select pour anon/authenticated.
- La correction, l'explication et l'éventuelle suggestion produit ne sont
  renvoyées qu'en appelant `repondre_quiz(question_id, reponse_id)`
  (`app/api/quiz/repondre`), qui enregistre aussi la tentative dans
  `quiz_tentatives`.
- Suggestion produit : chaque question a un thème (`reglementation`,
  `biologie_besoins`, `alimentation`, `hebergement`, `comportement`,
  `sante_prophylaxie`, `transport`). À chaque réponse, avec une probabilité
  de 30 % (`p_probabilite_suggestion` dans `repondre_quiz`), un produit actif
  de `quiz_produits_suggeres` pour ce thème est tiré au sort — pondéré par la
  colonne `poids` — et renvoyé sous la forme d'un lien
  `truffeo.shop/products/<handle>`. Le catalogue reste entièrement dans
  Shopify : seul le handle est stocké côté Supabase.
- Gérer les questions et les produits suggérés se fait pour l'instant
  directement dans Supabase (table editor ou SQL) — pas d'interface
  d'administration dédiée.

### Contenu livré

`supabase/migrations/20260908000005_quiz_contenu.sql` charge :

- **1178 questions** de culture animale générale (espérance de vie, poids,
  gestation/incubation, régime alimentaire, sociabilité, rythme d'activité,
  besoins d'hébergement, signes d'alerte santé, réglementation, transport),
  générées à partir d'un jeu de faits vérifiés — ce n'est **pas** un examen
  ACACED officiel, à valider/enrichir avec du contenu certifié avant un usage
  en préparation réelle à l'examen.
- Les **suggestions produit** utilisent de vrais handles du catalogue
  Shopify Trufféo (récupérés via l'API au moment de la génération) — aucun
  produit fictif. Si un produit change de handle ou est dépublié côté
  Shopify, sa ligne dans `quiz_produits_suggeres` devient une impasse
  silencieuse (le tirage au sort l'ignore juste, sans erreur) : à surveiller
  si le catalogue bouge beaucoup.
- Aucun produit n'est proposé pour le thème `reglementation` : la boutique
  Trufféo vend de l'équipement animalier, pas de service de registre ou
  d'identification.

## Reste à faire

- [ ] Import du JSON annuaire vers `structures`
- [ ] Carte Leaflet (composant client) sur la page annuaire
- [ ] Pages annonces, bourse au matériel, SOS adoptions, événements
- [ ] Auth Supabase (lien magique) + espace « mes annonces / mes enchères »
- [ ] Interface de modération
- [ ] Stripe Connect + webhooks
- [ ] Notifications (surenchère, gain, expiration d'annonce)
- [ ] Redirections 301 des anciennes pages `/pages/*` vers `/apps/*`
- [ ] Contenu ACACED certifié pour le quiz (le contenu actuel est un jeu de
      culture animale générale, pas un examen officiel) + interface
      d'administration pour les questions et les produits suggérés
