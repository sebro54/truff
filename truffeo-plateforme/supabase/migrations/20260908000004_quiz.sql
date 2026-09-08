-- Trufféo — plateforme communautaire
-- Migration 4 : quiz type ACACED avec suggestions produit
--
-- Même principe que les enchères : la bonne réponse ne doit jamais être
-- lisible par le navigateur avant que l'utilisateur ait répondu. Le client
-- ne lit les réponses qu'à travers une vue sans la colonne `est_correcte`,
-- et ne découvre le résultat qu'en appelant repondre_quiz(), qui contourne
-- la RLS (SECURITY DEFINER) pour lire la vraie réponse et l'enregistrer.

create type public.theme_quiz as enum (
  'reglementation',
  'biologie_besoins',
  'alimentation',
  'hebergement',
  'comportement',
  'sante_prophylaxie',
  'transport'
);

create table public.quiz_questions (
  id          uuid primary key default gen_random_uuid(),
  theme       public.theme_quiz not null,
  intitule    text not null,
  explication text not null,
  statut      public.statut_publication not null default 'publie',
  created_at  timestamptz not null default now()
);

create index quiz_questions_filtre_idx on public.quiz_questions (theme, statut);

create table public.quiz_reponses (
  id          uuid primary key default gen_random_uuid(),
  question_id uuid not null references public.quiz_questions(id) on delete cascade,
  intitule    text not null,
  est_correcte boolean not null default false,
  ordre       smallint not null default 0
);

create index quiz_reponses_question_idx on public.quiz_reponses (question_id);

-- Produits Shopify pouvant être suggérés après une question d'un thème donné.
-- Le catalogue reste dans Shopify : on ne stocke ici que le handle du produit.
create table public.quiz_produits_suggeres (
  id              uuid primary key default gen_random_uuid(),
  theme           public.theme_quiz not null,
  produit_handle  text not null,
  produit_titre   text not null,
  produit_image_url text,
  poids           smallint not null default 1 check (poids > 0),
  actif           boolean not null default true,
  created_at      timestamptz not null default now()
);

create index quiz_produits_theme_idx on public.quiz_produits_suggeres (theme, actif);

create table public.quiz_tentatives (
  id             uuid primary key default gen_random_uuid(),
  utilisateur_id uuid references public.profils(id) on delete set null,
  theme          public.theme_quiz not null,
  question_id    uuid not null references public.quiz_questions(id) on delete cascade,
  reponse_id     uuid not null references public.quiz_reponses(id) on delete cascade,
  correcte       boolean not null,
  created_at     timestamptz not null default now()
);

create index quiz_tentatives_utilisateur_idx on public.quiz_tentatives (utilisateur_id, created_at desc);

-- ---------------------------------------------------------------------------
-- Vue publique des réponses, sans `est_correcte`
-- ---------------------------------------------------------------------------

-- Pas de `security_invoker` : la vue s'exécute avec les droits de son
-- propriétaire (le rôle des migrations), qui contourne la RLS. C'est ce qui
-- permet au client de lire l'intitulé des réponses alors que la table
-- `quiz_reponses` n'a aucune policy select pour anon/authenticated.
create view public.quiz_reponses_publiques as
select id, question_id, intitule, ordre
from public.quiz_reponses;

grant select on public.quiz_reponses_publiques to anon, authenticated;

-- ---------------------------------------------------------------------------
-- Répondre à une question
-- ---------------------------------------------------------------------------

create or replace function public.repondre_quiz(
  p_question_id uuid,
  p_reponse_id  uuid,
  p_probabilite_suggestion numeric default 0.30
)
returns table (
  correcte boolean,
  reponse_correcte_id uuid,
  explication text,
  suggestion jsonb
)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_correcte  boolean;
  v_theme     public.theme_quiz;
  v_explication text;
  v_correcte_id uuid;
  v_suggestion  jsonb;
begin
  select r.est_correcte into v_correcte
  from public.quiz_reponses r
  where r.id = p_reponse_id and r.question_id = p_question_id;

  if not found then
    raise exception 'Cette réponse ne correspond pas à la question.' using errcode = 'P0001';
  end if;

  select q.theme, q.explication into v_theme, v_explication
  from public.quiz_questions q
  where q.id = p_question_id;

  select r.id into v_correcte_id
  from public.quiz_reponses r
  where r.question_id = p_question_id and r.est_correcte
  limit 1;

  insert into public.quiz_tentatives (utilisateur_id, theme, question_id, reponse_id, correcte)
  values (auth.uid(), v_theme, p_question_id, p_reponse_id, v_correcte);

  if random() < p_probabilite_suggestion then
    -- Échantillonnage pondéré (Efraimidis-Spirakis) : plus `poids` est
    -- grand, plus la clé est petite en moyenne, plus le produit sort.
    select jsonb_build_object(
             'handle', produit_handle,
             'titre', produit_titre,
             'image_url', produit_image_url
           )
    into v_suggestion
    from public.quiz_produits_suggeres
    where theme = v_theme and actif
    order by -ln(random()) / poids asc
    limit 1;
  end if;

  return query select v_correcte, v_correcte_id, v_explication, v_suggestion;
end $$;

revoke all on function public.repondre_quiz(uuid, uuid, numeric) from public;
grant execute on function public.repondre_quiz(uuid, uuid, numeric) to anon, authenticated;

-- ---------------------------------------------------------------------------
-- RLS
-- ---------------------------------------------------------------------------

alter table public.quiz_questions         enable row level security;
alter table public.quiz_reponses          enable row level security;
alter table public.quiz_produits_suggeres enable row level security;
alter table public.quiz_tentatives        enable row level security;

create policy "questions publiées visibles"
  on public.quiz_questions for select
  using (statut = 'publie' or public.est_admin());

-- Aucune policy select pour anon/authenticated sur quiz_reponses : la
-- colonne est_correcte ne doit jamais atteindre le navigateur avant d'avoir
-- répondu. Le client passe par la vue quiz_reponses_publiques ci-dessus.
create policy "réponses visibles par la modération"
  on public.quiz_reponses for select using (public.est_admin());

create policy "produits suggérés gérés par la modération"
  on public.quiz_produits_suggeres for select using (public.est_admin());

create policy "tentatives visibles par leur auteur"
  on public.quiz_tentatives for select
  using (utilisateur_id = auth.uid() or public.est_admin());

-- Aucune policy insert sur quiz_tentatives : l'écriture ne passe que par
-- repondre_quiz(), SECURITY DEFINER, comme placer_offre() pour les enchères.
