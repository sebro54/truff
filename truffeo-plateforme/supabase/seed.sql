-- Données de démonstration, appliquées uniquement par `supabase db reset`
-- en local (jamais poussées en production par `supabase db push`).
--
-- Contenu du quiz factice, à remplacer par du vrai contenu ACACED avant mise
-- en ligne — il ne s'agit pas de questions officielles.

with q1 as (
  insert into public.quiz_questions (theme, intitule, explication)
  values (
    'reglementation',
    'Qui doit détenir une ACACED pour vendre des chiens ou des chats ?',
    'L''ACACED est obligatoire pour toute personne qui, à titre non occasionnel, vend, garde, éduque, dresse, présente ou fait garder des animaux de compagnie d''espèces domestiques, sauf exemption (diplôme vétérinaire ou équivalent).'
  )
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q1, (values
  ('Uniquement les éleveurs professionnels', false, 1),
  ('Toute personne exerçant cette activité de façon non occasionnelle', true, 2),
  ('Uniquement au-delà de 10 portées par an', false, 3)
) as r(texte, correcte, ordre);

with q2 as (
  insert into public.quiz_questions (theme, intitule, explication)
  values (
    'biologie_besoins',
    'Quel comportement naturel doit impérativement pouvoir s''exprimer chez un chat en intérieur ?',
    'Le chat a un besoin biologique de griffades (marquage, entretien des griffes) et de zones en hauteur pour observer et se mettre en sécurité.'
  )
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q2, (values
  ('La griffade et l''accès à des zones en hauteur', true, 1),
  ('La vie en groupe avec au moins 3 autres chats', false, 2),
  ('Un accès quotidien à l''extérieur, sans exception', false, 3)
) as r(texte, correcte, ordre);

with q3 as (
  insert into public.quiz_questions (theme, intitule, explication)
  values (
    'alimentation',
    'Quel aliment est toxique pour le chien ?',
    'Le chocolat contient de la théobromine, toxique pour le chien même en petite quantité, avec un risque cardiaque et neurologique.'
  )
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q3, (values
  ('Le chocolat', true, 1),
  ('La carotte cuite', false, 2),
  ('Le riz blanc', false, 3)
) as r(texte, correcte, ordre);

insert into public.quiz_produits_suggeres (theme, produit_handle, produit_titre, produit_image_url, poids)
values
  ('reglementation', 'registre-entrees-sorties', 'Registre d''entrées-sorties conforme', null, 1),
  ('biologie_besoins', 'arbre-a-chat-xl', 'Arbre à chat XL avec griffoirs', null, 1),
  ('alimentation', 'croquettes-sans-cereales-chien', 'Croquettes sans céréales pour chien', null, 1),
  ('alimentation', 'gamelle-anti-glouton', 'Gamelle anti-glouton', null, 1);
