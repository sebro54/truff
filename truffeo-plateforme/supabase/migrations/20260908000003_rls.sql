-- Trufféo — plateforme communautaire
-- Migration 3/3 : Row Level Security
--
-- Modèle : la clé `anon` est exposée dans le navigateur, donc tout ce qui
-- n'est pas explicitement autorisé ici est interdit. Rien ne repose sur le
-- fait que le client « ne demandera pas ».

alter table public.profils     enable row level security;
alter table public.structures  enable row level security;
alter table public.annonces    enable row level security;
alter table public.lots        enable row level security;
alter table public.offres      enable row level security;
alter table public.adoptions   enable row level security;
alter table public.evenements  enable row level security;

create or replace function public.est_admin()
returns boolean language sql stable security definer set search_path = public
as $$ select coalesce((select est_admin from public.profils where id = auth.uid()), false) $$;

-- ---------------------------------------------------------------------------
-- Profils
-- ---------------------------------------------------------------------------

create policy "profil visible par son propriétaire"
  on public.profils for select using (id = auth.uid() or public.est_admin());

create policy "profil modifiable par son propriétaire"
  on public.profils for update using (id = auth.uid())
  with check (id = auth.uid() and est_admin = (select est_admin from public.profils where id = auth.uid()));

-- ---------------------------------------------------------------------------
-- Structures (annuaire)
-- ---------------------------------------------------------------------------

create policy "annuaire public"
  on public.structures for select
  using (statut = 'publie' or proprietaire_id = auth.uid() or public.est_admin());

create policy "inscription à l'annuaire"
  on public.structures for insert to authenticated
  with check (proprietaire_id = auth.uid() and statut = 'en_attente');

create policy "une structure est modifiable par son propriétaire"
  on public.structures for update to authenticated
  using (proprietaire_id = auth.uid() or public.est_admin())
  with check (proprietaire_id = auth.uid() or public.est_admin());

create policy "modération de l'annuaire"
  on public.structures for delete to authenticated using (public.est_admin());

-- ---------------------------------------------------------------------------
-- Annonces
-- ---------------------------------------------------------------------------

create policy "annonces publiées visibles"
  on public.annonces for select
  using ((statut = 'publie' and expire_le >= current_date)
         or auteur_id = auth.uid() or public.est_admin());

create policy "dépôt d'annonce"
  on public.annonces for insert to authenticated
  with check (auteur_id = auth.uid() and statut = 'en_attente');

create policy "annonce modifiable par son auteur"
  on public.annonces for update to authenticated
  using (auteur_id = auth.uid() or public.est_admin())
  with check (auteur_id = auth.uid() or public.est_admin());

create policy "annonce supprimable par son auteur"
  on public.annonces for delete to authenticated
  using (auteur_id = auth.uid() or public.est_admin());

-- ---------------------------------------------------------------------------
-- Lots
-- ---------------------------------------------------------------------------

create policy "lots ouverts visibles"
  on public.lots for select
  using (statut in ('en_cours','terminee','reserve_non_atteinte')
         or vendeur_id = auth.uid() or public.est_admin());

create policy "mise en vente"
  on public.lots for insert to authenticated
  with check (vendeur_id = auth.uid() and statut in ('brouillon','en_attente'));

-- Un vendeur ne peut plus toucher à son lot une fois les enchères ouvertes :
-- sinon il pourrait déplacer la date de fin ou le prix en cours de partie.
create policy "lot modifiable avant ouverture"
  on public.lots for update to authenticated
  using ((vendeur_id = auth.uid() and statut in ('brouillon','en_attente'))
         or public.est_admin())
  with check ((vendeur_id = auth.uid() and statut in ('brouillon','en_attente'))
         or public.est_admin());

create policy "lot supprimable avant ouverture"
  on public.lots for delete to authenticated
  using ((vendeur_id = auth.uid() and statut in ('brouillon','en_attente'))
         or public.est_admin());

-- ---------------------------------------------------------------------------
-- Offres — lecture seule côté client, écriture uniquement via placer_offre()
-- ---------------------------------------------------------------------------

create policy "historique des offres visible"
  on public.offres for select using (true);

-- Aucune policy INSERT / UPDATE / DELETE : l'écriture directe est impossible,
-- même authentifié. placer_offre() est SECURITY DEFINER et contourne la RLS
-- après avoir validé montant, horloge, statut et identité.

-- ---------------------------------------------------------------------------
-- Adoptions
-- ---------------------------------------------------------------------------

create policy "adoptions publiées visibles"
  on public.adoptions for select
  using (statut = 'publie' or auteur_id = auth.uid() or public.est_admin());

create policy "dépôt d'adoption"
  on public.adoptions for insert to authenticated
  with check (auteur_id = auth.uid() and statut = 'en_attente');

create policy "adoption modifiable par son auteur"
  on public.adoptions for update to authenticated
  using (auteur_id = auth.uid() or public.est_admin())
  with check (auteur_id = auth.uid() or public.est_admin());

-- ---------------------------------------------------------------------------
-- Événements — soumission ouverte, publication réservée à la modération
-- ---------------------------------------------------------------------------

create policy "événements publiés visibles"
  on public.evenements for select using (statut = 'publie' or public.est_admin());

create policy "proposition d'événement"
  on public.evenements for insert to authenticated
  with check (statut = 'en_attente');

create policy "événement modifiable par la modération"
  on public.evenements for update to authenticated using (public.est_admin());
