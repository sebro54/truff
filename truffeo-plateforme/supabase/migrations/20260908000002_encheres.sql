-- Trufféo — plateforme communautaire
-- Migration 2/3 : logique d'enchères
--
-- Toute la validation vit ici, dans la base, et non dans le client.
-- Une offre ne peut être posée qu'en appelant placer_offre() : la table
-- `offres` est fermée en écriture directe (voir migration 3, RLS).

-- Fenêtre anti-sniping : une offre dans les N dernières secondes repousse
-- la fin d'autant. Évite les offres à la dernière seconde.
create or replace function public.fenetre_anti_sniping()
returns interval language sql immutable as $$ select interval '2 minutes' $$;

-- ---------------------------------------------------------------------------
-- Poser une offre
-- ---------------------------------------------------------------------------

create or replace function public.placer_offre(
  p_lot_id        uuid,
  p_montant_cents integer
)
returns public.offres
language plpgsql
security definer
set search_path = public
as $$
declare
  v_lot    public.lots;
  v_user   uuid := auth.uid();
  v_min    integer;
  v_offre  public.offres;
begin
  if v_user is null then
    raise exception 'Connectez-vous pour enchérir.' using errcode = '28000';
  end if;

  -- Verrou de ligne : sérialise les offres concurrentes sur un même lot.
  select * into v_lot from public.lots where id = p_lot_id for update;

  if not found then
    raise exception 'Ce lot n''existe pas.' using errcode = 'P0002';
  end if;

  if v_lot.mode <> 'enchere' then
    raise exception 'Ce lot n''est pas mis aux enchères.' using errcode = 'P0001';
  end if;

  if v_lot.statut <> 'en_cours' then
    raise exception 'Les enchères ne sont pas ouvertes sur ce lot.' using errcode = 'P0001';
  end if;

  -- L'horloge fait foi côté serveur, jamais celle du navigateur.
  if now() >= v_lot.date_fin then
    raise exception 'Cette enchère est terminée.' using errcode = 'P0001';
  end if;

  if v_lot.vendeur_id = v_user then
    raise exception 'Vous ne pouvez pas enchérir sur votre propre lot.' using errcode = 'P0001';
  end if;

  v_min := case
             when v_lot.prix_actuel_cents is null then v_lot.prix_depart_cents
             else v_lot.prix_actuel_cents + v_lot.increment_cents
           end;

  if p_montant_cents < v_min then
    raise exception 'Offre trop basse. Minimum : % €.',
      to_char(v_min / 100.0, 'FM999999990.00') using errcode = 'P0001';
  end if;

  insert into public.offres (lot_id, encherisseur_id, montant_cents)
  values (p_lot_id, v_user, p_montant_cents)
  returning * into v_offre;

  update public.lots
  set prix_actuel_cents        = p_montant_cents,
      meilleur_encherisseur_id = v_user,
      nb_offres                = nb_offres + 1,
      date_fin = case
                   when date_fin - now() < public.fenetre_anti_sniping()
                   then now() + public.fenetre_anti_sniping()
                   else date_fin
                 end
  where id = p_lot_id;

  return v_offre;
end $$;

revoke all on function public.placer_offre(uuid, integer) from public;
grant execute on function public.placer_offre(uuid, integer) to authenticated;

-- ---------------------------------------------------------------------------
-- Ouverture et clôture automatiques
-- ---------------------------------------------------------------------------

-- Passe en 'en_cours' les enchères validées dont la date de début est atteinte.
create or replace function public.ouvrir_encheres()
returns integer
language plpgsql security definer set search_path = public
as $$
declare v_n integer;
begin
  update public.lots
  set statut = 'en_cours'
  where mode = 'enchere'
    and statut = 'en_attente'
    and date_debut is not null
    and date_debut <= now()
    and date_fin > now();
  get diagnostics v_n = row_count;
  return v_n;
end $$;

-- Clôture les enchères échues. Distingue le cas « prix de réserve non atteint »,
-- où il n'y a pas de gagnant et donc pas de commission.
create or replace function public.cloturer_encheres()
returns table (lot_id uuid, resultat public.statut_lot, gagnant_id uuid, montant_cents integer)
language plpgsql security definer set search_path = public
as $$
begin
  return query
  update public.lots l
  set statut = case
                 when l.prix_actuel_cents is null then 'reserve_non_atteinte'
                 when l.prix_reserve_cents is not null
                      and l.prix_actuel_cents < l.prix_reserve_cents then 'reserve_non_atteinte'
                 else 'terminee'
               end,
      gagnant_id = case
                     when l.prix_actuel_cents is null then null
                     when l.prix_reserve_cents is not null
                          and l.prix_actuel_cents < l.prix_reserve_cents then null
                     else l.meilleur_encherisseur_id
                   end
  where l.mode = 'enchere'
    and l.statut = 'en_cours'
    and l.date_fin <= now()
  returning l.id, l.statut, l.gagnant_id, l.prix_actuel_cents;
end $$;

revoke all on function public.ouvrir_encheres()   from public;
revoke all on function public.cloturer_encheres() from public;
grant execute on function public.ouvrir_encheres()   to service_role;
grant execute on function public.cloturer_encheres() to service_role;

-- ---------------------------------------------------------------------------
-- Vue publique des offres : historique sans révéler l'identité des enchérisseurs
-- ---------------------------------------------------------------------------

create or replace view public.offres_publiques
with (security_invoker = true) as
select o.id,
       o.lot_id,
       o.montant_cents,
       o.created_at,
       -- pseudonymisation stable par lot : « Enchérisseur 3 »
       dense_rank() over (partition by o.lot_id order by o.encherisseur_id) as numero_encherisseur
from public.offres o;
