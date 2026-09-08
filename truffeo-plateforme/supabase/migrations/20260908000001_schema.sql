-- Trufféo — plateforme communautaire
-- Migration 1/3 : schéma de base
--
-- Conventions :
--   * tous les montants sont en CENTIMES (integer), jamais en float
--   * toutes les tables ont created_at / updated_at
--   * le cycle de modération est porté par la colonne `statut`

create extension if not exists "postgis" with schema extensions;
create extension if not exists "pg_trgm" with schema extensions;

-- ---------------------------------------------------------------------------
-- Types
-- ---------------------------------------------------------------------------

create type public.statut_publication as enum (
  'brouillon',
  'en_attente',   -- soumis par un utilisateur, en attente de modération
  'publie',
  'rejete',
  'archive'
);

create type public.type_structure as enum (
  'veterinaire',
  'eleveur',
  'refuge',
  'association',
  'toiletteur',
  'comportementaliste',
  'pension',
  'osteopathe',
  'autre'
);

create type public.source_donnee as enum (
  'openstreetmap',  -- import de masse, non revendiqué
  'import_manuel',
  'inscription'     -- créé par la structure elle-même
);

create type public.type_annonce as enum (
  'emploi',
  'remplacement',
  'service',
  'recherche',
  'don'
);

create type public.mode_vente as enum (
  'prix_fixe',
  'enchere',
  'don'
);

create type public.statut_lot as enum (
  'brouillon',
  'en_attente',
  'en_cours',
  'terminee',
  'reserve_non_atteinte',
  'annulee'
);

-- ---------------------------------------------------------------------------
-- Profils (extension de auth.users)
-- ---------------------------------------------------------------------------

create table public.profils (
  id            uuid primary key references auth.users(id) on delete cascade,
  nom           text not null,
  telephone     text,
  est_admin     boolean not null default false,
  -- compte Stripe Connect du vendeur, alimenté à l'onboarding
  stripe_account_id text,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

comment on table public.profils is
  'Un profil par utilisateur authentifié. Créé automatiquement au premier login.';

create or replace function public.creer_profil()
returns trigger
language plpgsql security definer set search_path = public
as $$
begin
  insert into public.profils (id, nom)
  values (new.id, coalesce(new.raw_user_meta_data->>'nom', split_part(new.email, '@', 1)));
  return new;
end $$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.creer_profil();

-- ---------------------------------------------------------------------------
-- Annuaire : structures professionnelles
-- ---------------------------------------------------------------------------

create table public.structures (
  id            uuid primary key default gen_random_uuid(),
  type          public.type_structure not null,
  nom           text not null,
  siret         text,
  -- adresse
  adresse       text,
  code_postal   text,
  ville         text,
  departement   text,          -- '52', '2A'… dérivé du code postal à l'import
  position      extensions.geography(Point, 4326),
  -- contact
  telephone     text,
  email         text,
  site_web      text,
  description   text,
  -- gouvernance
  proprietaire_id uuid references public.profils(id) on delete set null,
  source        public.source_donnee not null default 'inscription',
  source_ref    text,          -- id OSM d'origine, pour les ré-imports idempotents
  statut        public.statut_publication not null default 'en_attente',
  recherche     tsvector generated always as (
                  to_tsvector('french',
                    coalesce(nom,'') || ' ' ||
                    coalesce(ville,'') || ' ' ||
                    coalesce(description,''))
                ) stored,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now(),
  unique (source, source_ref)
);

create index structures_position_idx    on public.structures using gist (position);
create index structures_recherche_idx   on public.structures using gin (recherche);
create index structures_filtre_idx      on public.structures (statut, type, departement);
create index structures_proprietaire_idx on public.structures (proprietaire_id);

-- Recherche géographique : structures dans un rayon donné, triées par distance.
create or replace function public.structures_proches(
  p_lat        double precision,
  p_lng        double precision,
  p_rayon_km   double precision default 30,
  p_types      public.type_structure[] default null,
  p_limite     integer default 100
)
returns table (
  id uuid, type public.type_structure, nom text, ville text, code_postal text,
  telephone text, site_web text, distance_km double precision,
  lat double precision, lng double precision
)
language sql stable set search_path = public, extensions
as $$
  select s.id, s.type, s.nom, s.ville, s.code_postal, s.telephone, s.site_web,
         round((st_distance(s.position, st_point(p_lng, p_lat)::geography) / 1000)::numeric, 1)::double precision,
         st_y(s.position::geometry), st_x(s.position::geometry)
  from public.structures s
  where s.statut = 'publie'
    and s.position is not null
    and st_dwithin(s.position, st_point(p_lng, p_lat)::geography, p_rayon_km * 1000)
    and (p_types is null or s.type = any(p_types))
  order by s.position <-> st_point(p_lng, p_lat)::geography
  limit p_limite;
$$;

-- ---------------------------------------------------------------------------
-- Petites annonces
-- ---------------------------------------------------------------------------

create table public.annonces (
  id            uuid primary key default gen_random_uuid(),
  type          public.type_annonce not null,
  titre         text not null,
  description   text not null,
  departement   text,
  ville         text,
  contact_email text,
  contact_tel   text,
  auteur_id     uuid references public.profils(id) on delete set null,
  structure_id  uuid references public.structures(id) on delete set null,
  statut        public.statut_publication not null default 'en_attente',
  expire_le     date not null default (current_date + interval '60 days'),
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

create index annonces_filtre_idx on public.annonces (statut, type, expire_le desc);

-- ---------------------------------------------------------------------------
-- Bourse au matériel : prix fixe, enchère ou don (même table, colonne `mode`)
-- ---------------------------------------------------------------------------

create table public.lots (
  id            uuid primary key default gen_random_uuid(),
  mode          public.mode_vente not null default 'prix_fixe',
  titre         text not null,
  description   text not null,
  categorie     text,           -- 'cages', 'toilettage', 'transport'…
  etat          text,           -- 'neuf', 'très bon état', 'à réparer'…
  photos        text[] not null default '{}',
  departement   text,
  ville         text,

  vendeur_id    uuid not null references public.profils(id) on delete cascade,

  -- Prix. Tous en centimes.
  prix_fixe_cents          integer check (prix_fixe_cents >= 0),
  prix_depart_cents        integer check (prix_depart_cents >= 0),
  prix_reserve_cents       integer check (prix_reserve_cents >= 0),
  increment_cents          integer not null default 100 check (increment_cents > 0),
  achat_immediat_cents     integer check (achat_immediat_cents >= 0),
  prix_actuel_cents        integer,   -- null tant qu'aucune offre
  nb_offres                integer not null default 0,

  -- Commission Trufféo, en points de pourcentage (10.0 = 10 %)
  commission_pct           numeric(5,2) not null default 10.00
                             check (commission_pct >= 0 and commission_pct <= 100),

  date_debut    timestamptz,
  date_fin      timestamptz,
  statut        public.statut_lot not null default 'brouillon',

  meilleur_encherisseur_id uuid references public.profils(id) on delete set null,
  gagnant_id               uuid references public.profils(id) on delete set null,

  -- Paiement (Stripe Connect, remplis à la clôture)
  stripe_payment_intent_id text,
  paye_le                  timestamptz,

  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now(),

  -- Cohérence selon le mode de vente
  constraint lot_prix_coherent check (
    case mode
      when 'prix_fixe' then prix_fixe_cents is not null
      when 'enchere'   then prix_depart_cents is not null and date_fin is not null
      when 'don'       then true
    end
  ),
  constraint lot_reserve_coherente check (
    prix_reserve_cents is null or prix_depart_cents is null
    or prix_reserve_cents >= prix_depart_cents
  )
);

create index lots_vitrine_idx on public.lots (statut, mode, date_fin);
create index lots_vendeur_idx on public.lots (vendeur_id);

-- Montant de commission sur le prix final, calculé à la volée.
create or replace function public.commission_cents(p_lot public.lots)
returns integer
language sql immutable
as $$
  select round(
    coalesce(p_lot.prix_actuel_cents, p_lot.prix_fixe_cents, 0) * p_lot.commission_pct / 100
  )::integer;
$$;

create table public.offres (
  id              bigserial primary key,
  lot_id          uuid not null references public.lots(id) on delete cascade,
  encherisseur_id uuid not null references public.profils(id) on delete cascade,
  montant_cents   integer not null check (montant_cents > 0),
  created_at      timestamptz not null default now()
);

create index offres_lot_idx on public.offres (lot_id, montant_cents desc);

-- ---------------------------------------------------------------------------
-- SOS adoptions
-- ---------------------------------------------------------------------------

create table public.adoptions (
  id            uuid primary key default gen_random_uuid(),
  nom_animal    text not null,
  espece        text not null,
  race          text,
  age           text,
  description   text not null,
  photos        text[] not null default '{}',
  structure_id  uuid references public.structures(id) on delete set null,
  auteur_id     uuid references public.profils(id) on delete set null,
  departement   text,
  echeance      timestamptz,     -- alimente le compte à rebours et le code couleur
  statut        public.statut_publication not null default 'en_attente',
  adopte_le     date,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

create index adoptions_filtre_idx on public.adoptions (statut, echeance);

-- ---------------------------------------------------------------------------
-- Événements
-- ---------------------------------------------------------------------------

create table public.evenements (
  id            uuid primary key default gen_random_uuid(),
  titre         text not null,
  description   text,
  lieu          text,
  ville         text,
  departement   text,
  date_debut    date not null,
  date_fin      date,
  site_web      text,
  statut        public.statut_publication not null default 'en_attente',
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

create index evenements_date_idx on public.evenements (statut, date_debut);

-- ---------------------------------------------------------------------------
-- updated_at automatique
-- ---------------------------------------------------------------------------

create or replace function public.touch_updated_at()
returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end $$;

do $$
declare t text;
begin
  foreach t in array array['profils','structures','annonces','lots','adoptions','evenements']
  loop
    execute format(
      'create trigger touch_%1$s before update on public.%1$s
       for each row execute function public.touch_updated_at()', t);
  end loop;
end $$;
