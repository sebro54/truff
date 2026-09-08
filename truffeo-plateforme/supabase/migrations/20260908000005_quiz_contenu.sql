-- Trufféo — plateforme communautaire
-- Migration 5 : contenu du quiz (questions animalières + produits réels)
--
-- Généré automatiquement à partir d'un jeu de faits de culture animale
-- générale (pas des questions ACACED officielles) et du catalogue Shopify
-- Trufféo réel (handles vérifiés via l'API au moment de la génération).

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, cheval et souris domestique, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le chat est plutôt solitaire à l''état naturel, alors que le cheval et la souris domestique sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('chat', true, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), grenouille griffue (Xenopus) et poule, lequel est le plus lourd à l''âge adulte ?', 'Une poule adulte pèse en moyenne 1.5-3 kg, bien plus qu''un betta (combattant) (0.005-0.01 kg) ou une grenouille griffue (Xenopus) (0.06-0.15 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('poule', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perroquet gris du Gabon, pogona (dragon barbu) et tortue terrestre, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le perroquet gris du Gabon est un oiseau, alors que le pogona (dragon barbu) et la tortue terrestre sont tous les deux des reptiles.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', false, 1),
  ('pogona (dragon barbu)', false, 2),
  ('perroquet gris du Gabon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, cochon et mouton, lequel a la gestation la plus longue ?', 'La gestation dure environ 144-152 jours chez le mouton, contre 59-72 jours chez le cochon d''Inde et 112-115 jours chez le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('cochon d''Inde', false, 2),
  ('mouton', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cochon d''Inde, lapin et tortue aquatique (Trachemys), lequel est principalement actif le jour (diurne) ?', 'La tortue aquatique (Trachemys) est diurne, alors que le cochon d''Inde est plutôt crepusculaire et le lapin plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('tortue aquatique (Trachemys)', true, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi poisson rouge, axolotl et gecko léopard, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 35-89 jours chez le gecko léopard, contre 4-7 jours chez le poisson rouge et 14-21 jours chez l''axolotl.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('poisson rouge', false, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi serpent des blés (couleuvre), cochon d''Inde et cheval, lequel est le plus lourd à l''âge adulte ?', 'Un cheval adulte pèse en moyenne 400-600 kg, bien plus qu''un serpent des blés (couleuvre) (0.15-0.45 kg) ou un cochon d''Inde (0.7-1.2 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', true, 1),
  ('cochon d''Inde', false, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi âne, vache et rat domestique, lequel a en moyenne les portées les plus nombreuses ?', 'Le rat domestique a en moyenne 6-12 petits par portée, contre 1-1 pour l''âne et 1-1 pour la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('âne', false, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, axolotl et discus, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le discus vit environ 10-15 ans, contre 2-4 ans pour la gerbille et 10-15 ans pour l''axolotl.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', true, 1),
  ('axolotl', false, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un chien, laquelle de ces affirmations est exacte ? (variante 1)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi escargot petit-gris, pogona (dragon barbu) et serpent des blés (couleuvre), lequel est principalement actif le jour (diurne) ?', 'Le pogona (dragon barbu) est diurne, alors que l''escargot petit-gris est plutôt nocturne et le serpent des blés (couleuvre) plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', true, 1),
  ('escargot petit-gris', false, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chinchilla, cheval et âne, lequel a la gestation la plus longue ?', 'La gestation dure environ 365-375 jours chez l''âne, contre 105-115 jours chez le chinchilla et 330-345 jours chez le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', true, 1),
  ('cheval', false, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gecko léopard, gerbille et tortue aquatique (Trachemys), lequel est le plus léger à l''âge adulte ?', 'Un gecko léopard adulte pèse en moyenne 0.05-0.09 kg, nettement moins que la gerbille et la tortue aquatique (Trachemys).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('gecko léopard', true, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, chien et mouton, lequel a la gestation la plus longue ?', 'La gestation dure environ 144-152 jours chez le mouton, contre 21-23 jours chez le rat domestique et 58-68 jours chez le chien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('mouton', true, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi furet, souris domestique et vache, lequel a un régime alimentaire strictement carnivore ?', 'Le furet est carnivore, alors que la souris domestique est omnivore et la vache est herbivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('furet', true, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chien, cochon d''Inde et mouton, lequel a la gestation la plus longue ?', 'La gestation dure environ 144-152 jours chez le mouton, contre 58-68 jours chez le chien et 59-72 jours chez le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('chien', false, 2),
  ('mouton', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), canard et oie, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la mouche soldat noire (larves) vit environ 0.15-0.3 ans, nettement moins que le canard et l''oie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', true, 1),
  ('oie', false, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « un refus de se dérouler ou de bouger même après un temps d''adaptation » ?', 'Ce signe d''alerte concerne l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('dindon', false, 1),
  ('abeille domestique', false, 2),
  ('hérisson domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, lapin et mouton, lequel est le plus léger à l''âge adulte ?', 'Un discus adulte pèse en moyenne 0.1-0.3 kg, nettement moins que le lapin et le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('mouton', false, 2),
  ('discus', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez une abeille domestique ?', 'Chez l''abeille domestique, une chute massive et soudaine du nombre d''abeilles dans la ruche.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une chute massive et soudaine du nombre d''abeilles dans la ruche', true, 1),
  ('des tentatives répétées de se rouler par terre associées à des regards vers le flanc (signes de coliques, urgence)', false, 2),
  ('un cou maintenu tordu ou penché de façon permanente', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, gecko léopard et poule, lequel est le plus léger à l''âge adulte ?', 'Un canari adulte pèse en moyenne 0.015-0.02 kg, nettement moins que le gecko léopard et la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('canari', true, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi lapin, mouche soldat noire (larves) et pogona (dragon barbu), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le pogona (dragon barbu) est plutôt solitaire à l''état naturel, alors que le lapin et la mouche soldat noire (larves) sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('pogona (dragon barbu)', true, 2),
  ('mouche soldat noire (larves)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gerbille, hérisson domestique et serpent des blés (couleuvre), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'La gerbille est grégaire et a besoin de compagnie de son espèce, alors que l''hérisson domestique et le serpent des blés (couleuvre) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('gerbille', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), canari et pigeon, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 17-19 jours chez le pigeon, contre 4-5 jours chez la mouche soldat noire (larves) et 13-14 jours chez le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('mouche soldat noire (larves)', false, 2),
  ('pigeon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cheval, chinchilla et hamster syrien, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hamster syrien est plutôt solitaire à l''état naturel, alors que le cheval et le chinchilla sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('hamster syrien', true, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, pogona (dragon barbu) et tortue terrestre, lequel est le plus lourd à l''âge adulte ?', 'Une tortue terrestre adulte pèse en moyenne 1-5 kg, bien plus qu''une souris domestique (0.02-0.04 kg) ou un pogona (dragon barbu) (0.3-0.6 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('pogona (dragon barbu)', false, 2),
  ('tortue terrestre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un axolotl ?', 'Chez l''axolotl, une eau maintenue sous 22°C : au-delà, son métabolisme se dérègle et son immunité chute fortement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une humidité constante : sans elle, il s''enferme dans sa coquille derrière un opercule de mucus', false, 1),
  ('une eau maintenue sous 22°C : au-delà, son métabolisme se dérègle et son immunité chute fortement', true, 2),
  ('un substrat humide riche en matière organique en décomposition', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chien, cochon et pogona (dragon barbu), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le pogona (dragon barbu) est plutôt solitaire à l''état naturel, alors que le chien et le cochon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', true, 1),
  ('chien', false, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi lapin, canard et oie, lequel est le plus lourd à l''âge adulte ?', 'Une oie adulte pèse en moyenne 3-7 kg, bien plus qu''un lapin (1.2-2.5 kg) ou un canard (1-3.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', true, 1),
  ('lapin', false, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), grenouille griffue (Xenopus) et oie, lequel est le plus lourd à l''âge adulte ?', 'Une oie adulte pèse en moyenne 3-7 kg, bien plus qu''une mouche soldat noire (larves) (0.0001-0.0002 kg) ou une grenouille griffue (Xenopus) (0.06-0.15 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('mouche soldat noire (larves)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour un furet ?', 'Chez le furet, les croquettes et friandises riches en sucres et céréales (le furet est un carnivore strict) est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('le riz blanc', false, 1),
  ('la carotte cuite', false, 2),
  ('les croquettes et friandises riches en sucres et céréales (le furet est un carnivore strict)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cheval, hérisson domestique et perroquet gris du Gabon, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hérisson domestique est plutôt solitaire à l''état naturel, alors que le cheval et le perroquet gris du Gabon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('perroquet gris du Gabon', false, 2),
  ('hérisson domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, canari et grenouille griffue (Xenopus), lequel est principalement actif le jour (diurne) ?', 'Le canari est diurne, alors que l''axolotl est plutôt nocturne et la grenouille griffue (Xenopus) plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('canari', true, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi discus, hérisson domestique et tortue terrestre, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le discus est grégaire et a besoin de compagnie de son espèce, alors que l''hérisson domestique et la tortue terrestre vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('tortue terrestre', false, 2),
  ('discus', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi chinchilla, furet et gerbille, lequel a un régime alimentaire strictement carnivore ?', 'Le furet est carnivore, alors que le chinchilla est herbivore et la gerbille est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('gerbille', false, 2),
  ('furet', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hamster syrien, mouton et pogona (dragon barbu), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le mouton est grégaire et a besoin de compagnie de son espèce, alors que l''hamster syrien et le pogona (dragon barbu) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', true, 1),
  ('hamster syrien', false, 2),
  ('pogona (dragon barbu)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi tortue aquatique (Trachemys), canard et cochon, lequel est le plus lourd à l''âge adulte ?', 'Un cochon adulte pèse en moyenne 50-350 kg, bien plus qu''une tortue aquatique (Trachemys) (0.3-1 kg) ou un canard (1-3.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('cochon', true, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, lapin et souris domestique, lequel a en moyenne les portées les plus nombreuses ?', 'La souris domestique a en moyenne 4-8 petits par portée, contre 2-5 pour l''hérisson domestique et 4-8 pour le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('souris domestique', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « l''if (feuilles et écorce, extrêmement toxique) » ?', 'Cette toxicité est documentée chez le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('cheval', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, lapin et rat domestique, lequel est principalement actif la nuit (nocturne) ?', 'Le rat domestique est nocturne, alors que le canari est plutôt diurne et le lapin plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('rat domestique', true, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez une souris domestique ?', 'Chez la souris domestique, un pelage terne et hérissé associé à une perte de poids rapide.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un pelage terne et hérissé associé à une perte de poids rapide', true, 1),
  ('une position voûtée avec les dents grinçantes, signe fréquent de douleur abdominale', false, 2),
  ('des gencives très pâles associées à une grande faiblesse (souvent lié à l''insulinome, fréquent chez le furet)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « des gencives très pâles associées à une grande faiblesse (souvent lié à l''insulinome, fréquent chez le furet) » ?', 'Ce signe d''alerte concerne le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', true, 1),
  ('vache', false, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, canari et serpent des blés (couleuvre), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'L''abeille domestique est grégaire et a besoin de compagnie de son espèce, alors que le canari et le serpent des blés (couleuvre) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('abeille domestique', true, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chien, chinchilla et cochon, lequel a la gestation la plus longue ?', 'La gestation dure environ 112-115 jours chez le cochon, contre 58-68 jours chez le chien et 105-115 jours chez le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', true, 1),
  ('chien', false, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, pigeon et poule, lequel est le plus lourd à l''âge adulte ?', 'Une poule adulte pèse en moyenne 1.5-3 kg, bien plus qu''une gerbille (0.08-0.12 kg) ou un pigeon (0.3-0.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('poule', true, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, canard et chinchilla, lequel est principalement actif la nuit (nocturne) ?', 'L''axolotl est nocturne, alors que le canard est plutôt diurne et le chinchilla plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('canard', false, 2),
  ('axolotl', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi pogona (dragon barbu), serpent des blés (couleuvre) et tortue aquatique (Trachemys), lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que le pogona (dragon barbu) est plutôt diurne et la tortue aquatique (Trachemys) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('serpent des blés (couleuvre)', true, 2),
  ('pogona (dragon barbu)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, chat et chèvre, lequel est principalement actif le jour (diurne) ?', 'La chèvre est diurne, alors que l''axolotl est plutôt nocturne et le chat plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('axolotl', false, 2),
  ('chèvre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi dindon, chien et axolotl, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''axolotl vit environ 10-15 ans, contre 8-10 ans pour le dindon et 10-13 ans pour le chien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('dindon', false, 2),
  ('axolotl', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une gerbille, laquelle de ces affirmations est exacte ? (variante 2)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi axolotl, cheval et hérisson domestique, lequel a un régime alimentaire strictement herbivore ?', 'Le cheval est herbivore, alors que l''axolotl est carnivore et l''hérisson domestique est insectivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', true, 1),
  ('hérisson domestique', false, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une tortue aquatique (Trachemys), laquelle de ces affirmations est exacte ? (variante 2)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 2),
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une chèvre, laquelle de ces affirmations est exacte ? (variante 1)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 2),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, grenouille griffue (Xenopus) et lapin, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''axolotl est plutôt solitaire à l''état naturel, alors que la grenouille griffue (Xenopus) et le lapin sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), furet et canari, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le canari vit environ 8-12 ans, contre 2-4 ans pour le betta (combattant) et 7-10 ans pour le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('furet', false, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, pogona (dragon barbu) et poisson rouge, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''hérisson domestique vit environ 4-6 ans, nettement moins que le pogona (dragon barbu) et le poisson rouge.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', true, 1),
  ('poisson rouge', false, 2),
  ('pogona (dragon barbu)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, axolotl et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le cochon d''Inde vit environ 5-8 ans, nettement moins que l''axolotl et le perroquet gris du Gabon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', false, 1),
  ('cochon d''Inde', true, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi lapin, pogona (dragon barbu) et tortue terrestre, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le lapin est grégaire et a besoin de compagnie de son espèce, alors que le pogona (dragon barbu) et la tortue terrestre vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('tortue terrestre', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi canard, canari et escargot petit-gris, lequel a un régime alimentaire strictement herbivore ?', 'L''escargot petit-gris est herbivore, alors que le canard est omnivore et le canari est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', true, 1),
  ('canard', false, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « les pesticides néonicotinoïdes (hautement toxiques même à faible dose) » ?', 'Cette toxicité est documentée chez l''abeille domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', false, 1),
  ('canard', false, 2),
  ('abeille domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perruche ondulée, poule et escargot petit-gris, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 15-30 jours chez l''escargot petit-gris, contre 17-19 jours chez la perruche ondulée et 20-21 jours chez la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', true, 1),
  ('poule', false, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi dindon, gecko léopard et poisson rouge, lequel est principalement actif la nuit (nocturne) ?', 'Le gecko léopard est nocturne, alors que le dindon est plutôt diurne et le poisson rouge plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('dindon', false, 2),
  ('poisson rouge', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour une tortue aquatique (Trachemys) ?', 'Chez la tortue aquatique (Trachemys), une zone d''eau et une zone de bain de soleil hors de l''eau (berge ou plage flottante).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une stimulation mentale quotidienne (jeux, interactions) : l''ennui provoque souvent des troubles du comportement comme l''arrachage de plumes', false, 1),
  ('un substrat humide riche en matière organique en décomposition', false, 2),
  ('une zone d''eau et une zone de bain de soleil hors de l''eau (berge ou plage flottante)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), serpent des blés (couleuvre) et tortue aquatique (Trachemys), lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la mouche soldat noire (larves) vit environ 0.15-0.3 ans, nettement moins que le serpent des blés (couleuvre) et la tortue aquatique (Trachemys).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('mouche soldat noire (larves)', true, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, lapin et rat domestique, lequel est principalement actif le jour (diurne) ?', 'Le canari est diurne, alors que le lapin est plutôt crepusculaire et le rat domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('rat domestique', false, 2),
  ('canari', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi dindon, chien et axolotl, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le dindon vit environ 8-10 ans, nettement moins que le chien et l''axolotl.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('dindon', true, 1),
  ('chien', false, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, chien et chat, lequel a la gestation la plus longue ?', 'La gestation dure environ 63-67 jours chez le chat, contre 24-26 jours chez la gerbille et 58-68 jours chez le chien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('chien', false, 2),
  ('chat', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), cochon et mouton, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le betta (combattant) est plutôt solitaire à l''état naturel, alors que le cochon et le mouton sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('cochon', false, 2),
  ('betta (combattant)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, rat domestique et tortue aquatique (Trachemys), lequel est le plus lourd à l''âge adulte ?', 'Une tortue aquatique (Trachemys) adulte pèse en moyenne 0.3-1 kg, bien plus qu''un hamster syrien (0.1-0.15 kg) ou un rat domestique (0.2-0.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('hamster syrien', false, 2),
  ('tortue aquatique (Trachemys)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chien, hérisson domestique et serpent des blés (couleuvre), lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le serpent des blés (couleuvre) est un reptile, alors que le chien et l''hérisson domestique sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', true, 1),
  ('hérisson domestique', false, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, perroquet gris du Gabon et âne, lequel est le plus lourd à l''âge adulte ?', 'Un âne adulte pèse en moyenne 160-300 kg, bien plus qu''un canari (0.015-0.02 kg) ou un perroquet gris du Gabon (0.4-0.55 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('perroquet gris du Gabon', false, 2),
  ('âne', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est fausse ? (affirmation 10)', 'L''âge auquel un chiot ou un chaton peut être cédé n''est soumis à aucune limite basse.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('L''ACACED comporte un module théorique et une évaluation des connaissances, propres à chaque catégorie d''espèces concernée.', false, 1),
  ('Une structure de vente d''animaux doit pouvoir présenter l''origine et l''historique sanitaire des animaux proposés.', false, 2),
  ('L''âge auquel un chiot ou un chaton peut être cédé n''est soumis à aucune limite basse.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, poisson rouge et dindon, lequel est le plus léger à l''âge adulte ?', 'Un canari adulte pèse en moyenne 0.015-0.02 kg, nettement moins que le poisson rouge et le dindon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('poisson rouge', false, 2),
  ('dindon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perroquet gris du Gabon, pigeon et pogona (dragon barbu), lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le pogona (dragon barbu) est un reptile, alors que le perroquet gris du Gabon et le pigeon sont tous les deux des oiseaus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('pogona (dragon barbu)', true, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canard, hamster syrien et oie, lequel est principalement actif la nuit (nocturne) ?', 'L''hamster syrien est nocturne, alors que le canard est plutôt diurne et l''oie plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('oie', false, 2),
  ('hamster syrien', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi lapin, souris domestique et vache, lequel est principalement actif la nuit (nocturne) ?', 'La souris domestique est nocturne, alors que le lapin est plutôt crepusculaire et la vache plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('souris domestique', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, tortue aquatique (Trachemys) et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''escargot petit-gris vit environ 5-8 ans, nettement moins que la tortue aquatique (Trachemys) et le perroquet gris du Gabon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', true, 1),
  ('perroquet gris du Gabon', false, 2),
  ('tortue aquatique (Trachemys)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chinchilla, cochon d''Inde et serpent des blés (couleuvre), lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le serpent des blés (couleuvre) est un reptile, alors que le chinchilla et le cochon d''Inde sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('serpent des blés (couleuvre)', true, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi escargot petit-gris, furet et rat domestique, lequel a un régime alimentaire strictement carnivore ?', 'Le furet est carnivore, alors que l''escargot petit-gris est herbivore et le rat domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('furet', true, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi axolotl, cheval et rat domestique, lequel a un régime alimentaire strictement carnivore ?', 'L''axolotl est carnivore, alors que le cheval est herbivore et le rat domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('axolotl', true, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), axolotl et canard, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 26-28 jours chez le canard, contre 4-5 jours chez la mouche soldat noire (larves) et 14-21 jours chez l''axolotl.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', true, 1),
  ('axolotl', false, 2),
  ('mouche soldat noire (larves)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi pigeon, chinchilla et âne, lequel est le plus léger à l''âge adulte ?', 'Un pigeon adulte pèse en moyenne 0.3-0.5 kg, nettement moins que le chinchilla et l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('pigeon', true, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi serpent des blés (couleuvre), pogona (dragon barbu) et dindon, lequel est le plus lourd à l''âge adulte ?', 'Un dindon adulte pèse en moyenne 5-12 kg, bien plus qu''un serpent des blés (couleuvre) (0.15-0.45 kg) ou un pogona (dragon barbu) (0.3-0.6 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('dindon', true, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hamster syrien, mouton et serpent des blés (couleuvre), lequel est principalement actif le jour (diurne) ?', 'Le mouton est diurne, alors que l''hamster syrien est plutôt nocturne et le serpent des blés (couleuvre) plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('hamster syrien', false, 2),
  ('mouton', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi âne, dindon et pogona (dragon barbu), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le pogona (dragon barbu) est plutôt solitaire à l''état naturel, alors que l''âne et le dindon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', true, 1),
  ('dindon', false, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, chinchilla et vache, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la vache vit environ 18-22 ans, contre 1.5-2.5 ans pour la souris domestique et 10-15 ans pour le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('souris domestique', false, 2),
  ('vache', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, pigeon et pogona (dragon barbu), lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le pogona (dragon barbu) vit environ 8-12 ans, contre 5-8 ans pour le cochon d''Inde et 5-15 ans pour le pigeon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', true, 1),
  ('pigeon', false, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chien, furet et serpent des blés (couleuvre), lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que le chien est plutôt diurne et le furet plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('serpent des blés (couleuvre)', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour une poule ?', 'Chez la poule, l''avocat (persine, toxique pour les oiseaux) est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('le blanc de poulet cuit et non assaisonné', false, 1),
  ('l''avocat (persine, toxique pour les oiseaux)', true, 2),
  ('la carotte cuite', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, cochon et tortue aquatique (Trachemys), lequel est principalement actif la nuit (nocturne) ?', 'L''axolotl est nocturne, alors que le cochon est plutôt diurne et la tortue aquatique (Trachemys) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « une stimulation mentale quotidienne (jeux, interactions) : l''ennui provoque souvent des troubles du comportement comme l''arrachage de plumes » ?', 'Cette description correspond au perroquet gris du Gabon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('perroquet gris du Gabon', true, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi vache, cochon d''Inde et rat domestique, lequel a en moyenne les portées les plus nombreuses ?', 'Le rat domestique a en moyenne 6-12 petits par portée, contre 1-1 pour la vache et 1-4 pour le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('cochon d''Inde', false, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi betta (combattant), escargot petit-gris et perroquet gris du Gabon, lequel a un régime alimentaire strictement herbivore ?', 'L''escargot petit-gris est herbivore, alors que le betta (combattant) est carnivore et le perroquet gris du Gabon est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', true, 1),
  ('perroquet gris du Gabon', false, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi poisson rouge, lapin et vache, lequel est le plus lourd à l''âge adulte ?', 'Une vache adulte pèse en moyenne 500-800 kg, bien plus qu''un poisson rouge (0.1-0.5 kg) ou un lapin (1.2-2.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('vache', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi furet, chèvre et vache, lequel a la gestation la plus longue ?', 'La gestation dure environ 279-292 jours chez la vache, contre 41-43 jours chez le furet et 145-155 jours chez la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', true, 1),
  ('furet', false, 2),
  ('chèvre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi lapin, perruche ondulée et serpent des blés (couleuvre), lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que le lapin est plutôt crepusculaire et la perruche ondulée plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('lapin', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un substrat à fouiller (paille, terre) : le fouissage est un comportement naturel essentiel » ?', 'Cette description correspond au cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', true, 1),
  ('abeille domestique', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), cochon d''Inde et chinchilla, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le chinchilla vit environ 10-15 ans, contre 2-4 ans pour le betta (combattant) et 5-8 ans pour le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('chinchilla', true, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi axolotl, hamster syrien et perruche ondulée, lequel a un régime alimentaire strictement carnivore ?', 'L''axolotl est carnivore, alors que l''hamster syrien est omnivore et la perruche ondulée est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('perruche ondulée', false, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chèvre, discus et vache, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le discus est un poisson, alors que la chèvre et la vache sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', true, 1),
  ('vache', false, 2),
  ('chèvre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, perroquet gris du Gabon et oie, lequel est le plus lourd à l''âge adulte ?', 'Une oie adulte pèse en moyenne 3-7 kg, bien plus qu''une souris domestique (0.02-0.04 kg) ou un perroquet gris du Gabon (0.4-0.55 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', true, 1),
  ('souris domestique', false, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), dindon et hérisson domestique, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le dindon est grégaire et a besoin de compagnie de son espèce, alors que le betta (combattant) et l''hérisson domestique vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('betta (combattant)', false, 2),
  ('dindon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un cochon d''Inde ?', 'Chez le cochon d''Inde, un silence inhabituel et l''arrêt des petits cris habituels au moment du repas.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un silence inhabituel et l''arrêt des petits cris habituels au moment du repas', true, 1),
  ('une couleur qui s''assombrit fortement de façon durable (stress ou maladie)', false, 2),
  ('l''arrêt total du chant chez un mâle habituellement chanteur', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une immobilité prolongée et un refus de s''alimenter (l''âne masque très bien la douleur) » ?', 'Ce signe d''alerte concerne l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', false, 1),
  ('poule', false, 2),
  ('âne', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cheval, perroquet gris du Gabon et tortue terrestre, lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue terrestre est plutôt solitaire à l''état naturel, alors que le cheval et le perroquet gris du Gabon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('perroquet gris du Gabon', false, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi cheval, gerbille et serpent des blés (couleuvre), lequel a un régime alimentaire strictement carnivore ?', 'Le serpent des blés (couleuvre) est carnivore, alors que le cheval est herbivore et la gerbille est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', true, 1),
  ('cheval', false, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, pogona (dragon barbu) et âne, lequel est le plus lourd à l''âge adulte ?', 'Un âne adulte pèse en moyenne 160-300 kg, bien plus qu''une abeille domestique (0.0001-0.0001 kg) ou un pogona (dragon barbu) (0.3-0.6 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', false, 1),
  ('âne', true, 2),
  ('pogona (dragon barbu)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perruche ondulée, discus et lapin, lequel est le plus lourd à l''âge adulte ?', 'Un lapin adulte pèse en moyenne 1.2-2.5 kg, bien plus qu''une perruche ondulée (0.03-0.04 kg) ou un discus (0.1-0.3 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('perruche ondulée', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un escargot petit-gris ?', 'Chez l''escargot petit-gris, une coquille qui reste operculée en permanence même après réhydratation.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une coquille qui reste operculée en permanence même après réhydratation', true, 1),
  ('un pelage terne et hérissé associé à une perte de poids rapide', false, 2),
  ('une couleur qui s''assombrit fortement de façon durable (stress ou maladie)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un discus, laquelle de ces affirmations est exacte ? (variante 1)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, escargot petit-gris et grenouille griffue (Xenopus), lequel est principalement actif le jour (diurne) ?', 'Le canari est diurne, alors que l''escargot petit-gris est plutôt nocturne et la grenouille griffue (Xenopus) plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, discus et dindon, lequel est le plus léger à l''âge adulte ?', 'Une gerbille adulte pèse en moyenne 0.08-0.12 kg, nettement moins que le discus et le dindon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('gerbille', true, 2),
  ('dindon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, canard et poule, lequel est le plus lourd à l''âge adulte ?', 'Une poule adulte pèse en moyenne 1.5-3 kg, bien plus qu''une abeille domestique (0.0001-0.0001 kg) ou un canard (1-3.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', true, 1),
  ('canard', false, 2),
  ('abeille domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, mouche soldat noire (larves) et poule, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''abeille domestique vit environ 0.08-0.16 ans, nettement moins que la mouche soldat noire (larves) et la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', true, 1),
  ('mouche soldat noire (larves)', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, chat et vache, lequel a la gestation la plus longue ?', 'La gestation dure environ 279-292 jours chez la vache, contre 33-37 jours chez l''hérisson domestique et 63-67 jours chez le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('vache', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour une tortue terrestre ?', 'Chez la tortue terrestre, un point chaud (lampe chauffante) et un point froid dans son enclos pour réguler elle-même sa température corporelle.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une eau douce, chaude (28-30°C) et légèrement acide, reproduisant les conditions du bassin amazonien', false, 1),
  ('une eau maintenue sous 22°C : au-delà, son métabolisme se dérègle et son immunité chute fortement', false, 2),
  ('un point chaud (lampe chauffante) et un point froid dans son enclos pour réguler elle-même sa température corporelle', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cheval, chèvre et hamster syrien, lequel a en moyenne les portées les plus nombreuses ?', 'L''hamster syrien a en moyenne 4-10 petits par portée, contre 1-1 pour le cheval et 1-3 pour la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('chèvre', false, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, chat et cheval, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'L''axolotl est un amphibien, alors que le chat et le cheval sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('axolotl', true, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi pigeon, chinchilla et âne, lequel est le plus lourd à l''âge adulte ?', 'Un âne adulte pèse en moyenne 160-300 kg, bien plus qu''un pigeon (0.3-0.5 kg) ou un chinchilla (0.4-0.6 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('pigeon', false, 2),
  ('âne', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gecko léopard, grenouille griffue (Xenopus) et perroquet gris du Gabon, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le gecko léopard est plutôt solitaire à l''état naturel, alors que la grenouille griffue (Xenopus) et le perroquet gris du Gabon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('perroquet gris du Gabon', false, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un serpent des blés (couleuvre), laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 2),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), perruche ondulée et cochon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le betta (combattant) vit environ 2-4 ans, nettement moins que la perruche ondulée et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('betta (combattant)', true, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), canari et pigeon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le pigeon vit environ 5-15 ans, contre 2-4 ans pour le betta (combattant) et 8-12 ans pour le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('pigeon', true, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi abeille domestique, axolotl et perroquet gris du Gabon, lequel a un régime alimentaire strictement herbivore ?', 'L''abeille domestique est herbivore, alors que l''axolotl est carnivore et le perroquet gris du Gabon est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', false, 1),
  ('perroquet gris du Gabon', false, 2),
  ('abeille domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi escargot petit-gris, hamster syrien et pigeon, lequel a un régime alimentaire strictement herbivore ?', 'L''escargot petit-gris est herbivore, alors que l''hamster syrien est omnivore et le pigeon est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('hamster syrien', false, 2),
  ('escargot petit-gris', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une vache, laquelle de ces affirmations est exacte ? (variante 2)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « l''avocat (persine, toxique pour les oiseaux) » ?', 'Cette toxicité est documentée chez la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', true, 1),
  ('cheval', false, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, chien et gecko léopard, lequel est principalement actif le jour (diurne) ?', 'Le chien est diurne, alors que le chat est plutôt crepusculaire et le gecko léopard plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('chien', true, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), perruche ondulée et gecko léopard, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 35-89 jours chez le gecko léopard, contre 2-3 jours chez le betta (combattant) et 17-19 jours chez la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('gecko léopard', true, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un betta (combattant) ?', 'Chez le betta (combattant), des nageoires repliées en permanence contre le corps.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('l''arrêt complet de la rumination (mâchouillement régulier), signe précoce de trouble digestif', false, 1),
  ('des nageoires repliées en permanence contre le corps', true, 2),
  ('des branchies qui se recroquevillent ou pâlissent (souvent lié à une eau trop chaude ou de mauvaise qualité)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gecko léopard, lapin et tortue aquatique (Trachemys), lequel est principalement actif la nuit (nocturne) ?', 'Le gecko léopard est nocturne, alors que le lapin est plutôt crepusculaire et la tortue aquatique (Trachemys) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('gecko léopard', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi furet, chien et mouton, lequel a la gestation la plus longue ?', 'La gestation dure environ 144-152 jours chez le mouton, contre 41-43 jours chez le furet et 58-68 jours chez le chien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('mouton', true, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, poisson rouge et vache, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''escargot petit-gris vit environ 5-8 ans, nettement moins que le poisson rouge et la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('poisson rouge', false, 2),
  ('escargot petit-gris', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une gerbille, laquelle de ces affirmations est exacte ? (variante 1)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), cochon d''Inde et cochon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le betta (combattant) vit environ 2-4 ans, nettement moins que le cochon d''Inde et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('betta (combattant)', true, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « des plumes gonflées en permanence associées à une position prostrée au fond de la cage » ?', 'Ce signe d''alerte concerne la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('gerbille', false, 2),
  ('perruche ondulée', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour une perruche ondulée ?', 'Chez la perruche ondulée, l''avocat (persine, toxique pour les oiseaux) est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('le blanc de poulet cuit et non assaisonné', false, 1),
  ('l''avocat (persine, toxique pour les oiseaux)', true, 2),
  ('la courgette cuite sans assaisonnement', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, axolotl et discus, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la gerbille vit environ 2-4 ans, nettement moins que l''axolotl et le discus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('axolotl', false, 2),
  ('gerbille', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gerbille, perruche ondulée et tortue aquatique (Trachemys), lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue aquatique (Trachemys) est plutôt solitaire à l''état naturel, alors que la gerbille et la perruche ondulée sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('perruche ondulée', false, 2),
  ('tortue aquatique (Trachemys)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, serpent des blés (couleuvre) et cheval, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le cheval vit environ 25-30 ans, contre 8-12 ans pour le canari et 15-20 ans pour le serpent des blés (couleuvre).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', true, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), poule et perruche ondulée, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le betta (combattant) vit environ 2-4 ans, nettement moins que la poule et la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', true, 1),
  ('perruche ondulée', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), serpent des blés (couleuvre) et tortue aquatique (Trachemys), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue aquatique (Trachemys), contre 2-3 jours chez le betta (combattant) et 55-65 jours chez le serpent des blés (couleuvre).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', true, 1),
  ('betta (combattant)', false, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), hérisson domestique et gecko léopard, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la mouche soldat noire (larves) vit environ 0.15-0.3 ans, nettement moins que l''hérisson domestique et le gecko léopard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('hérisson domestique', false, 2),
  ('mouche soldat noire (larves)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « des branchies qui se recroquevillent ou pâlissent (souvent lié à une eau trop chaude ou de mauvaise qualité) » ?', 'Ce signe d''alerte concerne l''axolotl.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('canari', false, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, pogona (dragon barbu) et âne, lequel est le plus léger à l''âge adulte ?', 'Une abeille domestique adulte pèse en moyenne 0.0001-0.0001 kg, nettement moins que le pogona (dragon barbu) et l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('pogona (dragon barbu)', false, 2),
  ('abeille domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), poisson rouge et serpent des blés (couleuvre), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 55-65 jours chez le serpent des blés (couleuvre), contre 4-5 jours chez la mouche soldat noire (larves) et 4-7 jours chez le poisson rouge.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('poisson rouge', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hamster syrien, mouche soldat noire (larves) et tortue aquatique (Trachemys), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'La mouche soldat noire (larves) est grégaire et a besoin de compagnie de son espèce, alors que l''hamster syrien et la tortue aquatique (Trachemys) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('mouche soldat noire (larves)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 15)', 'L''âge minimal de cession d''un chiot ou d''un chaton est encadré, pour éviter un sevrage trop précoce.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('L''âge auquel un chiot ou un chaton peut être cédé n''est soumis à aucune limite basse.', false, 1),
  ('L''âge minimal de cession d''un chiot ou d''un chaton est encadré, pour éviter un sevrage trop précoce.', true, 2),
  ('L''ACACED est un simple document administratif sans aucune évaluation des connaissances.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), discus et oie, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 28-33 jours chez l''oie, contre 2-3 jours chez le betta (combattant) et 2-3 jours chez le discus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('oie', true, 2),
  ('discus', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un cochon, laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.', true, 1),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 2),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), gecko léopard et poule, lequel est le plus lourd à l''âge adulte ?', 'Une poule adulte pèse en moyenne 1.5-3 kg, bien plus qu''un betta (combattant) (0.005-0.01 kg) ou un gecko léopard (0.05-0.09 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('poule', true, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi discus, hérisson domestique et souris domestique, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hérisson domestique est plutôt solitaire à l''état naturel, alors que le discus et la souris domestique sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('hérisson domestique', true, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chat, cheval et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le chat vit environ 13-17 ans, nettement moins que le cheval et le perroquet gris du Gabon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('perroquet gris du Gabon', false, 2),
  ('chat', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouton, hérisson domestique et hamster syrien, lequel a en moyenne les portées les plus nombreuses ?', 'L''hamster syrien a en moyenne 4-10 petits par portée, contre 1-3 pour le mouton et 2-5 pour l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('mouton', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, rat domestique et grenouille griffue (Xenopus), lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la grenouille griffue (Xenopus) vit environ 10-15 ans, contre 1.5-2.5 ans pour la souris domestique et 2-3 ans pour le rat domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', true, 1),
  ('rat domestique', false, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « le pain en grande quantité (carences, sans valeur nutritive adaptée) » ?', 'Cette toxicité est documentée chez le canard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', true, 1),
  ('lapin', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, cochon d''Inde et discus, lequel est principalement actif le jour (diurne) ?', 'Le discus est diurne, alors que le chat est plutôt crepusculaire et le cochon d''Inde plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('cochon d''Inde', false, 2),
  ('discus', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hamster syrien, lapin et oie, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hamster syrien est plutôt solitaire à l''état naturel, alors que le lapin et l''oie sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('hamster syrien', true, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, betta (combattant) et tortue aquatique (Trachemys), lequel est principalement actif la nuit (nocturne) ?', 'L''axolotl est nocturne, alors que le betta (combattant) est plutôt diurne et la tortue aquatique (Trachemys) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('betta (combattant)', false, 2),
  ('tortue aquatique (Trachemys)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), mouche soldat noire (larves) et abeille domestique, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 20-24 jours chez l''abeille domestique, contre 2-3 jours chez le betta (combattant) et 4-5 jours chez la mouche soldat noire (larves).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('abeille domestique', true, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi escargot petit-gris, gerbille et mouche soldat noire (larves), lequel est principalement actif la nuit (nocturne) ?', 'L''escargot petit-gris est nocturne, alors que la gerbille est plutôt diurne et la mouche soldat noire (larves) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('escargot petit-gris', true, 2),
  ('mouche soldat noire (larves)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un accès à des fleurs mellifères variées sur plusieurs kilomètres autour du rucher » ?', 'Cette description correspond au abeille domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', true, 1),
  ('cochon', false, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, hamster syrien et chèvre, lequel est le plus lourd à l''âge adulte ?', 'Une chèvre adulte pèse en moyenne 30-65 kg, bien plus qu''un escargot petit-gris (0.005-0.015 kg) ou un hamster syrien (0.1-0.15 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', false, 1),
  ('chèvre', true, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un âne ?', 'Chez l''âne, un abri sec permanent : contrairement au cheval, son pelage n''est pas imperméable à la pluie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un substrat profond pour creuser des galeries, son comportement naturel principal', false, 1),
  ('un abri sec permanent : contrairement au cheval, son pelage n''est pas imperméable à la pluie', true, 2),
  ('plusieurs heures de sortie de cage par jour : il ne supporte pas d''y rester enfermé en continu', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une plume légèrement en berne du côté d''une aile, souvent après un choc » ?', 'Ce signe d''alerte concerne le pigeon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', true, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi âne, gecko léopard et souris domestique, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le gecko léopard est plutôt solitaire à l''état naturel, alors que l''âne et la souris domestique sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('âne', false, 2),
  ('gecko léopard', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi dindon, canari et axolotl, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''axolotl vit environ 10-15 ans, contre 8-10 ans pour le dindon et 8-12 ans pour le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('dindon', false, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi grenouille griffue (Xenopus), serpent des blés (couleuvre) et âne, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la grenouille griffue (Xenopus) vit environ 10-15 ans, nettement moins que le serpent des blés (couleuvre) et l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('grenouille griffue (Xenopus)', true, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cochon, gerbille et pogona (dragon barbu), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le pogona (dragon barbu) est plutôt solitaire à l''état naturel, alors que le cochon et la gerbille sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', true, 1),
  ('gerbille', false, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, mouton et tortue terrestre, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le mouton est grégaire et a besoin de compagnie de son espèce, alors que l''axolotl et la tortue terrestre vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', false, 1),
  ('tortue terrestre', false, 2),
  ('mouton', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, lapin et pigeon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le pigeon vit environ 5-15 ans, contre 5-8 ans pour l''escargot petit-gris et 8-12 ans pour le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('escargot petit-gris', false, 2),
  ('pigeon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gecko léopard, perruche ondulée et tortue aquatique (Trachemys), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'La perruche ondulée est grégaire et a besoin de compagnie de son espèce, alors que le gecko léopard et la tortue aquatique (Trachemys) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('gecko léopard', false, 2),
  ('perruche ondulée', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, poule et cochon, lequel est le plus lourd à l''âge adulte ?', 'Un cochon adulte pèse en moyenne 50-350 kg, bien plus qu''un rat domestique (0.2-0.5 kg) ou une poule (1.5-3 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('cochon', true, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « la compagnie d''au moins une autre perruche : l''isolement prolongé cause un stress important chez cette espèce grégaire » ?', 'Cette description correspond au perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('axolotl', false, 2),
  ('perruche ondulée', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi âne, furet et tortue aquatique (Trachemys), lequel n''appartient pas à la même classe biologique que les deux autres ?', 'La tortue aquatique (Trachemys) est un reptile, alors que l''âne et le furet sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('furet', false, 2),
  ('tortue aquatique (Trachemys)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), escargot petit-gris et perroquet gris du Gabon, lequel est principalement actif la nuit (nocturne) ?', 'L''escargot petit-gris est nocturne, alors que le betta (combattant) est plutôt diurne et le perroquet gris du Gabon plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', true, 1),
  ('betta (combattant)', false, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, canard et dindon, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 27-28 jours chez le dindon, contre 20-24 jours chez l''abeille domestique et 26-28 jours chez le canard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', false, 1),
  ('canard', false, 2),
  ('dindon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perruche ondulée, poule et chèvre, lequel est le plus léger à l''âge adulte ?', 'Une perruche ondulée adulte pèse en moyenne 0.03-0.04 kg, nettement moins que la poule et la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('perruche ondulée', true, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hamster syrien, mouton et pigeon, lequel est principalement actif la nuit (nocturne) ?', 'L''hamster syrien est nocturne, alors que le mouton est plutôt diurne et le pigeon plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('hamster syrien', true, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chien, furet et serpent des blés (couleuvre), lequel est principalement actif le jour (diurne) ?', 'Le chien est diurne, alors que le furet est plutôt crepusculaire et le serpent des blés (couleuvre) plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('chien', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, betta (combattant) et escargot petit-gris, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le rat domestique vit environ 2-3 ans, nettement moins que le betta (combattant) et l''escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', false, 1),
  ('rat domestique', true, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, escargot petit-gris et mouton, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''hérisson domestique vit environ 4-6 ans, nettement moins que l''escargot petit-gris et le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', true, 1),
  ('mouton', false, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une bosse ou un renflement dans les bajoues qui ne se résorbe pas (abcès buccal possible) » ?', 'Ce signe d''alerte concerne l''hamster syrien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('hamster syrien', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), canari et pigeon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le betta (combattant) vit environ 2-4 ans, nettement moins que le canari et le pigeon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('betta (combattant)', true, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, poisson rouge et hérisson domestique, lequel est le plus léger à l''âge adulte ?', 'Un discus adulte pèse en moyenne 0.1-0.3 kg, nettement moins que le poisson rouge et l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('poisson rouge', false, 2),
  ('discus', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est fausse ? (affirmation 6)', 'Le furet n''est soumis à aucune obligation d''identification, à la différence du chien et du chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un professionnel du secteur animalier peut voir son ACACED retirée en cas de manquement grave aux règles de bien-être animal.', false, 1),
  ('Le furet n''est soumis à aucune obligation d''identification, à la différence du chien et du chat.', true, 2),
  ('Un élevage de chiens ou de chats dépassant certains seuils doit être déclaré auprès des autorités compétentes.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, serpent des blés (couleuvre) et vache, lequel est principalement actif le jour (diurne) ?', 'La vache est diurne, alors que l''axolotl est plutôt nocturne et le serpent des blés (couleuvre) plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('vache', true, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon, mouton et perroquet gris du Gabon, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le perroquet gris du Gabon est un oiseau, alors que le cochon et le mouton sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('cochon', false, 2),
  ('perroquet gris du Gabon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi poisson rouge, canari et axolotl, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 14-21 jours chez l''axolotl, contre 4-7 jours chez le poisson rouge et 13-14 jours chez le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('poisson rouge', false, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, lapin et poisson rouge, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''axolotl est plutôt solitaire à l''état naturel, alors que le lapin et le poisson rouge sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('axolotl', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi âne, discus et souris domestique, lequel est principalement actif la nuit (nocturne) ?', 'La souris domestique est nocturne, alors que l''âne est plutôt diurne et le discus plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('discus', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, tortue terrestre et cheval, lequel est le plus léger à l''âge adulte ?', 'Une gerbille adulte pèse en moyenne 0.08-0.12 kg, nettement moins que la tortue terrestre et le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', false, 1),
  ('gerbille', true, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour un cheval ?', 'Chez le cheval, l''if (feuilles et écorce, extrêmement toxique) est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('la carotte cuite', false, 1),
  ('le riz blanc', false, 2),
  ('l''if (feuilles et écorce, extrêmement toxique)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), furet et hérisson domestique, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le betta (combattant) est un poisson, alors que le furet et l''hérisson domestique sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', true, 1),
  ('furet', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cheval, discus et gecko léopard, lequel est principalement actif la nuit (nocturne) ?', 'Le gecko léopard est nocturne, alors que le cheval est plutôt diurne et le discus plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('gecko léopard', true, 2),
  ('discus', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, hérisson domestique et vache, lequel a la gestation la plus longue ?', 'La gestation dure environ 279-292 jours chez la vache, contre 24-26 jours chez la gerbille et 33-37 jours chez l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('hérisson domestique', false, 2),
  ('vache', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi mouton, serpent des blés (couleuvre) et tortue aquatique (Trachemys), lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que le mouton est plutôt diurne et la tortue aquatique (Trachemys) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canard, grenouille griffue (Xenopus) et perroquet gris du Gabon, lequel est principalement actif la nuit (nocturne) ?', 'La grenouille griffue (Xenopus) est nocturne, alors que le canard est plutôt diurne et le perroquet gris du Gabon plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('perroquet gris du Gabon', false, 2),
  ('grenouille griffue (Xenopus)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « le chocolat et l''avocat » ?', 'Cette toxicité est documentée chez le perroquet gris du Gabon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', true, 1),
  ('abeille domestique', false, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi rat domestique, tortue aquatique (Trachemys) et vache, lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue aquatique (Trachemys) est plutôt solitaire à l''état naturel, alors que le rat domestique et la vache sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('tortue aquatique (Trachemys)', true, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi lapin, rat domestique et tortue aquatique (Trachemys), lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue aquatique (Trachemys) est plutôt solitaire à l''état naturel, alors que le lapin et le rat domestique sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', true, 1),
  ('lapin', false, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « le sel (déshydratation mortelle par osmose) » ?', 'Cette toxicité est documentée chez l''escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', true, 1),
  ('furet', false, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un hérisson domestique ?', 'Chez l''hérisson domestique, un refus de se dérouler ou de bouger même après un temps d''adaptation.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un refus de se dérouler ou de bouger même après un temps d''adaptation', true, 1),
  ('des gencives très pâles associées à une grande faiblesse (souvent lié à l''insulinome, fréquent chez le furet)', false, 2),
  ('un silence inhabituel et l''arrêt des petits cris habituels au moment du repas', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un point chaud (lampe chauffante) et un point froid dans son enclos pour réguler elle-même sa température corporelle » ?', 'Cette description correspond au tortue terrestre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('tortue terrestre', true, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, canari et mouton, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le cochon d''Inde vit environ 5-8 ans, nettement moins que le canari et le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('mouton', false, 2),
  ('cochon d''Inde', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, rat domestique et furet, lequel est le plus lourd à l''âge adulte ?', 'Un furet adulte pèse en moyenne 0.7-2 kg, bien plus qu''un axolotl (0.06-0.15 kg) ou un rat domestique (0.2-0.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('axolotl', false, 2),
  ('furet', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chien, hérisson domestique et lapin, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hérisson domestique est plutôt solitaire à l''état naturel, alors que le chien et le lapin sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('hérisson domestique', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi poule, perruche ondulée et discus, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le discus vit environ 10-15 ans, contre 5-10 ans pour la poule et 7-10 ans pour la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('poule', false, 2),
  ('discus', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi grenouille griffue (Xenopus), lapin et poule, lequel a un régime alimentaire strictement carnivore ?', 'La grenouille griffue (Xenopus) est carnivore, alors que le lapin est herbivore et la poule est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', false, 1),
  ('grenouille griffue (Xenopus)', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un perroquet gris du Gabon, laquelle de ces affirmations est exacte ? (variante 2)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 1),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 2),
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, cochon d''Inde et souris domestique, lequel est principalement actif la nuit (nocturne) ?', 'La souris domestique est nocturne, alors que la chèvre est plutôt diurne et le cochon d''Inde plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('souris domestique', true, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi poisson rouge, canari et gecko léopard, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 35-89 jours chez le gecko léopard, contre 4-7 jours chez le poisson rouge et 13-14 jours chez le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('poisson rouge', false, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), discus et escargot petit-gris, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 15-30 jours chez l''escargot petit-gris, contre 2-3 jours chez le betta (combattant) et 2-3 jours chez le discus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('discus', false, 2),
  ('escargot petit-gris', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, oie et souris domestique, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''axolotl est plutôt solitaire à l''état naturel, alors que l''oie et la souris domestique sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('souris domestique', false, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi axolotl, pigeon et tortue terrestre, lequel a un régime alimentaire strictement carnivore ?', 'L''axolotl est carnivore, alors que le pigeon est granivore et la tortue terrestre est herbivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('axolotl', true, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi discus, gecko léopard et mouton, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le gecko léopard est plutôt solitaire à l''état naturel, alors que le discus et le mouton sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('discus', false, 2),
  ('gecko léopard', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perruche ondulée, abeille domestique et dindon, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 27-28 jours chez le dindon, contre 17-19 jours chez la perruche ondulée et 20-24 jours chez l''abeille domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', false, 1),
  ('dindon', true, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi pigeon, dindon et serpent des blés (couleuvre), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 55-65 jours chez le serpent des blés (couleuvre), contre 17-19 jours chez le pigeon et 27-28 jours chez le dindon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('dindon', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi grenouille griffue (Xenopus), lapin et poule, lequel a un régime alimentaire strictement herbivore ?', 'Le lapin est herbivore, alors que la grenouille griffue (Xenopus) est carnivore et la poule est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('lapin', true, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi lapin, perruche ondulée et serpent des blés (couleuvre), lequel est principalement actif le jour (diurne) ?', 'La perruche ondulée est diurne, alors que le lapin est plutôt crepusculaire et le serpent des blés (couleuvre) plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', true, 1),
  ('lapin', false, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un dindon ?', 'Chez le dindon, un gonflement visible autour des yeux ou des sinus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une flottaison anormale sur le flanc ou le dos', false, 1),
  ('un gonflement visible autour des yeux ou des sinus', true, 2),
  ('une nage constamment en surface avec la bouche qui happe l''air (manque d''oxygène dissous)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un logement individuel : deux hamsters syriens adultes se battent s''ils sont mis ensemble » ?', 'Cette description correspond au hamster syrien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('gecko léopard', false, 2),
  ('hamster syrien', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gecko léopard, lapin et tortue aquatique (Trachemys), lequel est principalement actif le jour (diurne) ?', 'La tortue aquatique (Trachemys) est diurne, alors que le gecko léopard est plutôt nocturne et le lapin plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', true, 1),
  ('gecko léopard', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi furet, discus et tortue terrestre, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la tortue terrestre vit environ 50-80 ans, contre 7-10 ans pour le furet et 10-15 ans pour le discus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('discus', false, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, serpent des blés (couleuvre) et perroquet gris du Gabon, lequel est le plus léger à l''âge adulte ?', 'Une souris domestique adulte pèse en moyenne 0.02-0.04 kg, nettement moins que le serpent des blés (couleuvre) et le perroquet gris du Gabon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', true, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « de l''herbe fraîche à volonté : c''est l''essentiel de son alimentation naturelle » ?', 'Cette description correspond au oie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', true, 1),
  ('chien', false, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi escargot petit-gris, furet et oie, lequel est principalement actif la nuit (nocturne) ?', 'L''escargot petit-gris est nocturne, alors que le furet est plutôt crepusculaire et l''oie plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', false, 1),
  ('escargot petit-gris', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cheval, souris domestique et hamster syrien, lequel a en moyenne les portées les plus nombreuses ?', 'L''hamster syrien a en moyenne 4-10 petits par portée, contre 1-1 pour le cheval et 4-8 pour la souris domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('hamster syrien', true, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, souris domestique et lapin, lequel a la gestation la plus longue ?', 'La gestation dure environ 28-33 jours chez le lapin, contre 16-18 jours chez l''hamster syrien et 19-21 jours chez la souris domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('souris domestique', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), hamster syrien et rat domestique, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la mouche soldat noire (larves) vit environ 0.15-0.3 ans, nettement moins que l''hamster syrien et le rat domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('mouche soldat noire (larves)', true, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, escargot petit-gris et poisson rouge, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le chat est plutôt solitaire à l''état naturel, alors que l''escargot petit-gris et le poisson rouge sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', true, 1),
  ('escargot petit-gris', false, 2),
  ('poisson rouge', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), hérisson domestique et chinchilla, lequel est le plus léger à l''âge adulte ?', 'Une mouche soldat noire (larves) adulte pèse en moyenne 0.0001-0.0002 kg, nettement moins que l''hérisson domestique et le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('mouche soldat noire (larves)', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, discus et hérisson domestique, lequel est principalement actif le jour (diurne) ?', 'Le discus est diurne, alors que le chat est plutôt crepusculaire et l''hérisson domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('discus', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un rat domestique, laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi pigeon, souris domestique et tortue aquatique (Trachemys), lequel est principalement actif la nuit (nocturne) ?', 'La souris domestique est nocturne, alors que le pigeon est plutôt diurne et la tortue aquatique (Trachemys) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('souris domestique', true, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi dindon, perroquet gris du Gabon et poisson rouge, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le poisson rouge est un poisson, alors que le dindon et le perroquet gris du Gabon sont tous les deux des oiseaus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('dindon', false, 2),
  ('poisson rouge', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi dindon, discus et tortue terrestre, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le dindon vit environ 8-10 ans, nettement moins que le discus et la tortue terrestre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('dindon', true, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour une grenouille griffue (Xenopus) ?', 'Chez la grenouille griffue (Xenopus), un aquarium bien couvert : elle est capable de sauter hors de l''eau si le couvercle n''est pas hermétique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un abri sec permanent : contrairement au cheval, son pelage n''est pas imperméable à la pluie', false, 1),
  ('un point chaud (lampe chauffante) et un point froid dans son enclos pour réguler elle-même sa température corporelle', false, 2),
  ('un aquarium bien couvert : elle est capable de sauter hors de l''eau si le couvercle n''est pas hermétique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un cheval, laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 2),
  ('Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un canard ?', 'Chez le canard, un accès à de l''eau assez profonde pour immerger toute la tête, indispensable pour nettoyer ses narines et ses yeux.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('des surfaces à grimper et à explorer : c''est un animal naturellement escaladeur', false, 1),
  ('un accès à de l''eau assez profonde pour immerger toute la tête, indispensable pour nettoyer ses narines et ses yeux', true, 2),
  ('un bain de sable spécial régulier pour entretenir son pelage très dense, sans jamais le mouiller', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), perroquet gris du Gabon et mouton, lequel est le plus lourd à l''âge adulte ?', 'Un mouton adulte pèse en moyenne 45-100 kg, bien plus qu''un betta (combattant) (0.005-0.01 kg) ou un perroquet gris du Gabon (0.4-0.55 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('perroquet gris du Gabon', false, 2),
  ('mouton', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi betta (combattant), hérisson domestique et tortue terrestre, lequel a un régime alimentaire strictement herbivore ?', 'La tortue terrestre est herbivore, alors que le betta (combattant) est carnivore et l''hérisson domestique est insectivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('tortue terrestre', true, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, gerbille et cochon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le cochon vit environ 10-15 ans, contre 1.5-2.5 ans pour la souris domestique et 2-4 ans pour la gerbille.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('cochon', true, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gecko léopard, perroquet gris du Gabon et chèvre, lequel est le plus lourd à l''âge adulte ?', 'Une chèvre adulte pèse en moyenne 30-65 kg, bien plus qu''un gecko léopard (0.05-0.09 kg) ou un perroquet gris du Gabon (0.4-0.55 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', true, 1),
  ('perroquet gris du Gabon', false, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chien, chat et âne, lequel a la gestation la plus longue ?', 'La gestation dure environ 365-375 jours chez l''âne, contre 58-68 jours chez le chien et 63-67 jours chez le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('âne', true, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, pogona (dragon barbu) et vache, lequel est le plus lourd à l''âge adulte ?', 'Une vache adulte pèse en moyenne 500-800 kg, bien plus qu''un canari (0.015-0.02 kg) ou un pogona (dragon barbu) (0.3-0.6 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('canari', false, 2),
  ('vache', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, chèvre et souris domestique, lequel est principalement actif le jour (diurne) ?', 'La chèvre est diurne, alors que l''axolotl est plutôt nocturne et la souris domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', true, 1),
  ('axolotl', false, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une boiterie soudaine associée à un isolement du reste du troupeau » ?', 'Ce signe d''alerte concerne le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('mouton', true, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un axolotl, laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 1),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 2),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chèvre, gecko léopard et tortue aquatique (Trachemys), lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la tortue aquatique (Trachemys) vit environ 20-30 ans, contre 10-15 ans pour la chèvre et 15-20 ans pour le gecko léopard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('tortue aquatique (Trachemys)', true, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, chat et perruche ondulée, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'La perruche ondulée est grégaire et a besoin de compagnie de son espèce, alors que l''axolotl et le chat vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('perruche ondulée', true, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, lapin et serpent des blés (couleuvre), lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que la chèvre est plutôt diurne et le lapin plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', true, 1),
  ('chèvre', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cheval, hérisson domestique et mouton, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hérisson domestique est plutôt solitaire à l''état naturel, alors que le cheval et le mouton sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('cheval', false, 2),
  ('hérisson domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cochon, mouton et souris domestique, lequel est principalement actif la nuit (nocturne) ?', 'La souris domestique est nocturne, alors que le cochon est plutôt diurne et le mouton plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', true, 1),
  ('cochon', false, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un cochon, laquelle de ces affirmations est exacte ? (variante 1)', 'Un animal transporté doit pouvoir accéder à de l''eau lors des trajets longs, notamment par forte chaleur.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal transporté doit pouvoir accéder à de l''eau lors des trajets longs, notamment par forte chaleur.', true, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi betta (combattant), lapin et mouche soldat noire (larves), lequel a un régime alimentaire strictement herbivore ?', 'Le lapin est herbivore, alors que le betta (combattant) est carnivore et la mouche soldat noire (larves) est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('betta (combattant)', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi lapin, pigeon et souris domestique, lequel est principalement actif le jour (diurne) ?', 'Le pigeon est diurne, alors que le lapin est plutôt crepusculaire et la souris domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('lapin', false, 2),
  ('pigeon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un éclairage UVB adapté, indispensable pour synthétiser la vitamine D3 et fixer le calcium » ?', 'Cette description correspond au pogona (dragon barbu).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('betta (combattant)', false, 2),
  ('pogona (dragon barbu)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, gecko léopard et pogona (dragon barbu), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 55-75 jours chez le pogona (dragon barbu), contre 15-30 jours chez l''escargot petit-gris et 35-89 jours chez le gecko léopard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('pogona (dragon barbu)', true, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, dindon et tortue terrestre, lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue terrestre est plutôt solitaire à l''état naturel, alors que la chèvre et le dindon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('dindon', false, 2),
  ('chèvre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, serpent des blés (couleuvre) et perroquet gris du Gabon, lequel est le plus lourd à l''âge adulte ?', 'Un perroquet gris du Gabon adulte pèse en moyenne 0.4-0.55 kg, bien plus qu''une souris domestique (0.02-0.04 kg) ou un serpent des blés (couleuvre) (0.15-0.45 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', true, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chien, furet et gecko léopard, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le gecko léopard est plutôt solitaire à l''état naturel, alors que le chien et le furet sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('gecko léopard', true, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi grenouille griffue (Xenopus), hamster syrien et tortue terrestre, lequel a un régime alimentaire strictement carnivore ?', 'La grenouille griffue (Xenopus) est carnivore, alors que l''hamster syrien est omnivore et la tortue terrestre est herbivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('grenouille griffue (Xenopus)', true, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, perruche ondulée et canari, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''hamster syrien vit environ 2-3 ans, nettement moins que la perruche ondulée et le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('perruche ondulée', false, 2),
  ('hamster syrien', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, cochon d''Inde et mouton, lequel est principalement actif le jour (diurne) ?', 'Le mouton est diurne, alors que le chat est plutôt crepusculaire et le cochon d''Inde plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', true, 1),
  ('cochon d''Inde', false, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), cochon d''Inde et chinchilla, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le betta (combattant) vit environ 2-4 ans, nettement moins que le cochon d''Inde et le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', true, 1),
  ('cochon d''Inde', false, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, chat et chèvre, lequel est principalement actif la nuit (nocturne) ?', 'L''axolotl est nocturne, alors que le chat est plutôt crepusculaire et la chèvre plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('chat', false, 2),
  ('axolotl', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi lapin, pigeon et souris domestique, lequel est principalement actif la nuit (nocturne) ?', 'La souris domestique est nocturne, alors que le lapin est plutôt crepusculaire et le pigeon plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('pigeon', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), cochon d''Inde et cochon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le cochon vit environ 10-15 ans, contre 2-4 ans pour le betta (combattant) et 5-8 ans pour le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('betta (combattant)', false, 2),
  ('cochon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), poule et perruche ondulée, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la perruche ondulée vit environ 7-10 ans, contre 2-4 ans pour le betta (combattant) et 5-10 ans pour la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', true, 1),
  ('poule', false, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un mouton, laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 2),
  ('Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un serpent des blés (couleuvre) ?', 'Chez le serpent des blés (couleuvre), un refus de s''alimenter pendant plusieurs repas consécutifs hors période de mue ou d''hivernage.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un refus de s''alimenter pendant plusieurs repas consécutifs hors période de mue ou d''hivernage', true, 1),
  ('un silence inhabituel et l''arrêt des petits cris habituels au moment du repas', false, 2),
  ('une chute massive et soudaine du nombre d''abeilles dans la ruche', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, cheval et perroquet gris du Gabon, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le chat est plutôt solitaire à l''état naturel, alors que le cheval et le perroquet gris du Gabon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('perroquet gris du Gabon', false, 2),
  ('chat', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est fausse ? (affirmation 7)', 'Une annonce de vente d''animal n''a jamais besoin de mentionner le moindre numéro d''identification.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Une annonce de vente d''animal n''a jamais besoin de mentionner le moindre numéro d''identification.', true, 1),
  ('La détention de certaines espèces non domestiques est soumise à un régime d''autorisation ou de déclaration selon leur dangerosité.', false, 2),
  ('Une structure de vente d''animaux doit pouvoir présenter l''origine et l''historique sanitaire des animaux proposés.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « une eau douce, chaude (28-30°C) et légèrement acide, reproduisant les conditions du bassin amazonien » ?', 'Cette description correspond au discus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', false, 1),
  ('pogona (dragon barbu)', false, 2),
  ('discus', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cochon, lapin et serpent des blés (couleuvre), lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que le cochon est plutôt diurne et le lapin plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('serpent des blés (couleuvre)', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une flottaison anormale sur le flanc ou le dos » ?', 'Ce signe d''alerte concerne la grenouille griffue (Xenopus).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', true, 1),
  ('cheval', false, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gecko léopard, serpent des blés (couleuvre) et cochon, lequel est le plus léger à l''âge adulte ?', 'Un gecko léopard adulte pèse en moyenne 0.05-0.09 kg, nettement moins que le serpent des blés (couleuvre) et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('gecko léopard', true, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 12)', 'Un élevage de chiens ou de chats dépassant certains seuils doit être déclaré auprès des autorités compétentes.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un élevage de chiens ou de chats dépassant certains seuils doit être déclaré auprès des autorités compétentes.', true, 1),
  ('Une annonce de vente d''animal n''a jamais besoin de mentionner le moindre numéro d''identification.', false, 2),
  ('L''âge auquel un chiot ou un chaton peut être cédé n''est soumis à aucune limite basse.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), mouton et grenouille griffue (Xenopus), lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le betta (combattant) vit environ 2-4 ans, nettement moins que le mouton et la grenouille griffue (Xenopus).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi poule, rat domestique et tortue aquatique (Trachemys), lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue aquatique (Trachemys) est plutôt solitaire à l''état naturel, alors que la poule et le rat domestique sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', true, 1),
  ('rat domestique', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, pigeon et poule, lequel est le plus léger à l''âge adulte ?', 'Une gerbille adulte pèse en moyenne 0.08-0.12 kg, nettement moins que le pigeon et la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', false, 1),
  ('pigeon', false, 2),
  ('gerbille', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « une boîte à humidité (moss box) pour faciliter ses mues, en plus d''une zone chaude et d''une zone froide » ?', 'Cette description correspond au gecko léopard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', false, 1),
  ('gecko léopard', true, 2),
  ('mouche soldat noire (larves)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, cochon d''Inde et cheval, lequel a la gestation la plus longue ?', 'La gestation dure environ 330-345 jours chez le cheval, contre 24-26 jours chez la gerbille et 59-72 jours chez le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('cheval', true, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, gecko léopard et hérisson domestique, lequel est le plus léger à l''âge adulte ?', 'Un canari adulte pèse en moyenne 0.015-0.02 kg, nettement moins que le gecko léopard et l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('hérisson domestique', false, 2),
  ('canari', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, chien et chinchilla, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le canari est un oiseau, alors que le chien et le chinchilla sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('canari', true, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon, mouton et vache, lequel a la gestation la plus longue ?', 'La gestation dure environ 279-292 jours chez la vache, contre 112-115 jours chez le cochon et 144-152 jours chez le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('cochon', false, 2),
  ('vache', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi canard, chinchilla et furet, lequel a un régime alimentaire strictement herbivore ?', 'Le chinchilla est herbivore, alors que le canard est omnivore et le furet est carnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', true, 1),
  ('furet', false, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chinchilla, hérisson domestique et pogona (dragon barbu), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le chinchilla est grégaire et a besoin de compagnie de son espèce, alors que l''hérisson domestique et le pogona (dragon barbu) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('hérisson domestique', false, 2),
  ('chinchilla', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 10)', 'Un local professionnel qui accueille du public avec des animaux (pension, refuge) est soumis à des règles sanitaires spécifiques.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Le furet n''est soumis à aucune obligation d''identification, à la différence du chien et du chat.', false, 1),
  ('Les pensions et refuges qui accueillent des animaux ne sont soumis à aucune règle sanitaire particulière.', false, 2),
  ('Un local professionnel qui accueille du public avec des animaux (pension, refuge) est soumis à des règles sanitaires spécifiques.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une souris domestique, laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.', true, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « la compagnie d''au moins un autre rat : l''isolement social lui cause un vrai mal-être » ?', 'Cette description correspond au rat domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('dindon', false, 1),
  ('escargot petit-gris', false, 2),
  ('rat domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, lapin et serpent des blés (couleuvre), lequel est principalement actif le jour (diurne) ?', 'La chèvre est diurne, alors que le lapin est plutôt crepusculaire et le serpent des blés (couleuvre) plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', true, 1),
  ('lapin', false, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi dindon, serpent des blés (couleuvre) et vache, lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que le dindon est plutôt diurne et la vache plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', true, 1),
  ('vache', false, 2),
  ('dindon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est fausse ? (affirmation 8)', 'L''ACACED est un simple document administratif sans aucune évaluation des connaissances.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('L''ACACED est un simple document administratif sans aucune évaluation des connaissances.', true, 1),
  ('Un certificat vétérinaire est obligatoire avant la cession d''un chiot ou d''un chaton.', false, 2),
  ('Toute structure qui héberge des animaux de compagnie contre rémunération (pension, chatterie) est soumise à une obligation de déclaration.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, perroquet gris du Gabon et lapin, lequel est le plus léger à l''âge adulte ?', 'Un discus adulte pèse en moyenne 0.1-0.3 kg, nettement moins que le perroquet gris du Gabon et le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('discus', true, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), escargot petit-gris et âne, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le betta (combattant) vit environ 2-4 ans, nettement moins que l''escargot petit-gris et l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', true, 1),
  ('escargot petit-gris', false, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un serpent des blés (couleuvre) ?', 'Chez le serpent des blés (couleuvre), une cachette bien fermée de chaque côté du terrarium (zone chaude et zone froide) où il se sent totalement à l''abri.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une cachette bien fermée de chaque côté du terrarium (zone chaude et zone froide) où il se sent totalement à l''abri', true, 1),
  ('un substrat profond pour creuser des galeries, son comportement naturel principal', false, 2),
  ('un accès à un pâturage ou à une aire de couchage sèche et suffisamment spacieuse pour se relever sans entrave', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, rat domestique et furet, lequel est le plus léger à l''âge adulte ?', 'Un axolotl adulte pèse en moyenne 0.06-0.15 kg, nettement moins que le rat domestique et le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('rat domestique', false, 2),
  ('axolotl', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, furet et gecko léopard, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le furet est grégaire et a besoin de compagnie de son espèce, alors que l''axolotl et le gecko léopard vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', false, 1),
  ('gecko léopard', false, 2),
  ('furet', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une oie, laquelle de ces affirmations est exacte ? (variante 1)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 1),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 2),
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, chat et mouton, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le mouton est grégaire et a besoin de compagnie de son espèce, alors que le canari et le chat vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('canari', false, 2),
  ('mouton', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, hérisson domestique et âne, lequel est le plus lourd à l''âge adulte ?', 'Un âne adulte pèse en moyenne 160-300 kg, bien plus qu''un rat domestique (0.2-0.5 kg) ou un hérisson domestique (0.3-0.6 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('âne', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canard, lapin et souris domestique, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le canard est un oiseau, alors que le lapin et la souris domestique sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', true, 1),
  ('souris domestique', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cochon, serpent des blés (couleuvre) et souris domestique, lequel est principalement actif le jour (diurne) ?', 'Le cochon est diurne, alors que le serpent des blés (couleuvre) est plutôt nocturne et la souris domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('souris domestique', false, 2),
  ('cochon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, mouton et cochon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le cochon vit environ 10-15 ans, contre 5-8 ans pour l''escargot petit-gris et 10-12 ans pour le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', false, 1),
  ('mouton', false, 2),
  ('cochon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, escargot petit-gris et gecko léopard, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le gecko léopard vit environ 15-20 ans, contre 2-3 ans pour l''hamster syrien et 5-8 ans pour l''escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('hamster syrien', false, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un canari ?', 'Chez le canari, une cage assez longue pour voler horizontalement : contrairement à la perruche, il vit bien seul mais a besoin d''espace pour voler.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une eau maintenue sous 22°C : au-delà, son métabolisme se dérègle et son immunité chute fortement', false, 1),
  ('des zones en hauteur pour observer et un accès à un griffoir pour marquer et entretenir ses griffes', false, 2),
  ('une cage assez longue pour voler horizontalement : contrairement à la perruche, il vit bien seul mais a besoin d''espace pour voler', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), gecko léopard et poule, lequel est le plus léger à l''âge adulte ?', 'Un betta (combattant) adulte pèse en moyenne 0.005-0.01 kg, nettement moins que le gecko léopard et la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', true, 1),
  ('poule', false, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour une poule ?', 'Chez la poule, un perchoir surélevé pour la nuit : dormir en hauteur est un besoin de sécurité instinctif.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une boîte à humidité (moss box) pour faciliter ses mues, en plus d''une zone chaude et d''une zone froide', false, 1),
  ('un perchoir surélevé pour la nuit : dormir en hauteur est un besoin de sécurité instinctif', true, 2),
  ('un bain de sable spécial régulier pour entretenir son pelage très dense, sans jamais le mouiller', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi grenouille griffue (Xenopus), hamster syrien et oie, lequel est principalement actif le jour (diurne) ?', 'L''oie est diurne, alors que la grenouille griffue (Xenopus) est plutôt nocturne et l''hamster syrien plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('oie', true, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un accès régulier à l''extérieur pour se dépenser et un couchage à l''écart des courants d''air » ?', 'Cette description correspond au chien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('canari', false, 2),
  ('chien', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi tortue aquatique (Trachemys), canard et cochon, lequel est le plus léger à l''âge adulte ?', 'Une tortue aquatique (Trachemys) adulte pèse en moyenne 0.3-1 kg, nettement moins que le canard et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('cochon', false, 2),
  ('tortue aquatique (Trachemys)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi betta (combattant), lapin et perruche ondulée, lequel a un régime alimentaire strictement herbivore ?', 'Le lapin est herbivore, alors que le betta (combattant) est carnivore et la perruche ondulée est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('perruche ondulée', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, canard et poule, lequel est le plus léger à l''âge adulte ?', 'Une abeille domestique adulte pèse en moyenne 0.0001-0.0001 kg, nettement moins que le canard et la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', true, 1),
  ('poule', false, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est fausse ? (affirmation 9)', 'Les pensions et refuges qui accueillent des animaux ne sont soumis à aucune règle sanitaire particulière.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Les pensions et refuges qui accueillent des animaux ne sont soumis à aucune règle sanitaire particulière.', true, 1),
  ('La cession d''un chat doit s''accompagner d''un document d''information sur les caractéristiques et les besoins de l''espèce.', false, 2),
  ('La vente de chiens ou de chats entre particuliers est encadrée : un numéro d''identification (puce ou tatouage) doit être communiqué à l''acheteur.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, cochon d''Inde et mouche soldat noire (larves), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le canari est plutôt solitaire à l''état naturel, alors que le cochon d''Inde et la mouche soldat noire (larves) sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('cochon d''Inde', false, 2),
  ('mouche soldat noire (larves)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi chinchilla, perroquet gris du Gabon et serpent des blés (couleuvre), lequel a un régime alimentaire strictement herbivore ?', 'Le chinchilla est herbivore, alors que le perroquet gris du Gabon est omnivore et le serpent des blés (couleuvre) est carnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('perroquet gris du Gabon', false, 2),
  ('chinchilla', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un pogona (dragon barbu) ?', 'Chez le pogona (dragon barbu), des membres qui se déforment ou une mâchoire qui devient molle (carence en calcium, maladie osseuse métabolique).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une position voûtée avec les dents grinçantes, signe fréquent de douleur abdominale', false, 1),
  ('des zones de pelage arraché ou clairsemé (souvent lié au stress ou à un environnement trop humide)', false, 2),
  ('des membres qui se déforment ou une mâchoire qui devient molle (carence en calcium, maladie osseuse métabolique)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), tortue aquatique (Trachemys) et vache, lequel est le plus léger à l''âge adulte ?', 'Une mouche soldat noire (larves) adulte pèse en moyenne 0.0001-0.0002 kg, nettement moins que la tortue aquatique (Trachemys) et la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('mouche soldat noire (larves)', true, 2),
  ('tortue aquatique (Trachemys)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, hérisson domestique et oie, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''oie vit environ 15-20 ans, contre 2-3 ans pour le rat domestique et 4-6 ans pour l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', true, 1),
  ('hérisson domestique', false, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chien, chinchilla et hérisson domestique, lequel est principalement actif le jour (diurne) ?', 'Le chien est diurne, alors que le chinchilla est plutôt crepusculaire et l''hérisson domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('chien', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi poisson rouge, canard et tortue terrestre, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue terrestre, contre 4-7 jours chez le poisson rouge et 26-28 jours chez le canard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('tortue terrestre', true, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un poisson rouge ?', 'Chez le poisson rouge, un volume d''eau bien plus grand qu''un simple bocal : contrairement à une idée reçue, il peut atteindre une taille importante.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un point chaud (lampe chauffante) et un point froid dans son enclos pour réguler elle-même sa température corporelle', false, 1),
  ('une eau douce, chaude (28-30°C) et légèrement acide, reproduisant les conditions du bassin amazonien', false, 2),
  ('un volume d''eau bien plus grand qu''un simple bocal : contrairement à une idée reçue, il peut atteindre une taille importante', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un perroquet gris du Gabon ?', 'Chez le perroquet gris du Gabon, un arrachage répété de ses propres plumes.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un arrachage répété de ses propres plumes', true, 1),
  ('un pelage humide autour du nez et des yeux (souvent lié à une allergie à la poussière de son substrat)', false, 2),
  ('un refus de se dérouler ou de bouger même après un temps d''adaptation', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, dindon et cochon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la gerbille vit environ 2-4 ans, nettement moins que le dindon et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', true, 1),
  ('cochon', false, 2),
  ('dindon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), mouche soldat noire (larves) et pogona (dragon barbu), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'La mouche soldat noire (larves) est grégaire et a besoin de compagnie de son espèce, alors que le betta (combattant) et le pogona (dragon barbu) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('mouche soldat noire (larves)', true, 2),
  ('pogona (dragon barbu)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi grenouille griffue (Xenopus), escargot petit-gris et dindon, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 27-28 jours chez le dindon, contre 4-6 jours chez la grenouille griffue (Xenopus) et 15-30 jours chez l''escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('dindon', true, 1),
  ('escargot petit-gris', false, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perruche ondulée, dindon et pigeon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le pigeon vit environ 5-15 ans, contre 7-10 ans pour la perruche ondulée et 8-10 ans pour le dindon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('pigeon', true, 2),
  ('dindon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, betta (combattant) et chat, lequel est principalement actif le jour (diurne) ?', 'Le betta (combattant) est diurne, alors que l''axolotl est plutôt nocturne et le chat plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', false, 1),
  ('chat', false, 2),
  ('betta (combattant)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), tortue aquatique (Trachemys) et cochon, lequel est le plus lourd à l''âge adulte ?', 'Un cochon adulte pèse en moyenne 50-350 kg, bien plus qu''un betta (combattant) (0.005-0.01 kg) ou une tortue aquatique (Trachemys) (0.3-1 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('cochon', true, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, mouche soldat noire (larves) et serpent des blés (couleuvre), lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que la chèvre est plutôt diurne et la mouche soldat noire (larves) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('mouche soldat noire (larves)', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « une zone d''eau et une zone de bain de soleil hors de l''eau (berge ou plage flottante) » ?', 'Cette description correspond au tortue aquatique (Trachemys).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('dindon', false, 1),
  ('canari', false, 2),
  ('tortue aquatique (Trachemys)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, gecko léopard et poule, lequel est le plus lourd à l''âge adulte ?', 'Une poule adulte pèse en moyenne 1.5-3 kg, bien plus qu''un canari (0.015-0.02 kg) ou un gecko léopard (0.05-0.09 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('gecko léopard', false, 2),
  ('poule', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, serpent des blés (couleuvre) et chinchilla, lequel est le plus léger à l''âge adulte ?', 'Un discus adulte pèse en moyenne 0.1-0.3 kg, nettement moins que le serpent des blés (couleuvre) et le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('discus', true, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, hérisson domestique et oie, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le rat domestique vit environ 2-3 ans, nettement moins que l''hérisson domestique et l''oie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('hérisson domestique', false, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), chèvre et cochon d''Inde, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le betta (combattant) est plutôt solitaire à l''état naturel, alors que la chèvre et le cochon d''Inde sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('betta (combattant)', true, 2),
  ('chèvre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « plusieurs heures de sortie de cage par jour : il ne supporte pas d''y rester enfermé en continu » ?', 'Cette description correspond au furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('hamster syrien', false, 2),
  ('furet', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, gecko léopard et serpent des blés (couleuvre), lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''abeille domestique vit environ 0.08-0.16 ans, nettement moins que le gecko léopard et le serpent des blés (couleuvre).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('gecko léopard', false, 2),
  ('abeille domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, poisson rouge et vache, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la vache vit environ 18-22 ans, contre 5-8 ans pour l''escargot petit-gris et 10-15 ans pour le poisson rouge.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', true, 1),
  ('poisson rouge', false, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi abeille domestique, chien et hérisson domestique, lequel a un régime alimentaire strictement herbivore ?', 'L''abeille domestique est herbivore, alors que le chien est omnivore et l''hérisson domestique est insectivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('hérisson domestique', false, 2),
  ('abeille domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi dindon, souris domestique et vache, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le dindon est un oiseau, alors que la souris domestique et la vache sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('dindon', true, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, furet et mouton, lequel est le plus léger à l''âge adulte ?', 'Un rat domestique adulte pèse en moyenne 0.2-0.5 kg, nettement moins que le furet et le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('rat domestique', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, chèvre et oie, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''oie vit environ 15-20 ans, contre 10-15 ans pour l''axolotl et 10-15 ans pour la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', false, 1),
  ('oie', true, 2),
  ('chèvre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chat, hamster syrien et mouche soldat noire (larves), lequel n''appartient pas à la même classe biologique que les deux autres ?', 'La mouche soldat noire (larves) est un insecte, alors que le chat et l''hamster syrien sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('hamster syrien', false, 2),
  ('mouche soldat noire (larves)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, pogona (dragon barbu) et discus, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le cochon d''Inde vit environ 5-8 ans, nettement moins que le pogona (dragon barbu) et le discus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('discus', false, 2),
  ('cochon d''Inde', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, gecko léopard et tortue aquatique (Trachemys), lequel est principalement actif le jour (diurne) ?', 'La tortue aquatique (Trachemys) est diurne, alors que l''axolotl est plutôt nocturne et le gecko léopard plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', true, 1),
  ('axolotl', false, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, poule et vache, lequel est le plus léger à l''âge adulte ?', 'Un cochon d''Inde adulte pèse en moyenne 0.7-1.2 kg, nettement moins que la poule et la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('cochon d''Inde', true, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chinchilla, cochon d''Inde et cochon, lequel a en moyenne les portées les plus nombreuses ?', 'Le cochon a en moyenne 6-12 petits par portée, contre 1-3 pour le chinchilla et 1-4 pour le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('cochon', true, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canard, furet et gecko léopard, lequel est principalement actif la nuit (nocturne) ?', 'Le gecko léopard est nocturne, alors que le canard est plutôt diurne et le furet plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('gecko léopard', true, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, tortue terrestre et cochon, lequel est le plus lourd à l''âge adulte ?', 'Un cochon adulte pèse en moyenne 50-350 kg, bien plus qu''un axolotl (0.06-0.15 kg) ou une tortue terrestre (1-5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', false, 1),
  ('axolotl', false, 2),
  ('cochon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi lapin, serpent des blés (couleuvre) et âne, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''âne vit environ 25-35 ans, contre 8-12 ans pour le lapin et 15-20 ans pour le serpent des blés (couleuvre).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('âne', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez une grenouille griffue (Xenopus) ?', 'Chez la grenouille griffue (Xenopus), une flottaison anormale sur le flanc ou le dos.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une flottaison anormale sur le flanc ou le dos', true, 1),
  ('un morceau de mue qui reste collé sur les doigts ou la queue plusieurs jours après la mue', false, 2),
  ('un arrêt total de l''alimentation depuis plus de 12 h (risque de stase digestive, urgence vitale)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, cochon et rat domestique, lequel a en moyenne les portées les plus nombreuses ?', 'Le rat domestique a en moyenne 6-12 petits par portée, contre 3-6 pour la gerbille et 6-12 pour le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('rat domestique', true, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), grenouille griffue (Xenopus) et perruche ondulée, lequel est principalement actif la nuit (nocturne) ?', 'La grenouille griffue (Xenopus) est nocturne, alors que le betta (combattant) est plutôt diurne et la perruche ondulée plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('betta (combattant)', false, 2),
  ('grenouille griffue (Xenopus)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi âne, cochon et grenouille griffue (Xenopus), lequel est principalement actif la nuit (nocturne) ?', 'La grenouille griffue (Xenopus) est nocturne, alors que l''âne est plutôt diurne et le cochon plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', true, 1),
  ('âne', false, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perruche ondulée, chat et tortue terrestre, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la tortue terrestre vit environ 50-80 ans, contre 7-10 ans pour la perruche ondulée et 13-17 ans pour le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('perruche ondulée', false, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, poule et cochon, lequel est le plus léger à l''âge adulte ?', 'Un rat domestique adulte pèse en moyenne 0.2-0.5 kg, nettement moins que la poule et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('cochon', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi furet, discus et tortue terrestre, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le furet vit environ 7-10 ans, nettement moins que le discus et la tortue terrestre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', true, 1),
  ('discus', false, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez une gerbille ?', 'Chez la gerbille, un pelage humide autour du nez et des yeux (souvent lié à une allergie à la poussière de son substrat).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un pelage humide autour du nez et des yeux (souvent lié à une allergie à la poussière de son substrat)', true, 1),
  ('un gonflement visible autour des yeux ou des sinus', false, 2),
  ('une flottaison anormale sur le flanc ou le dos', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une chute massive et soudaine du nombre d''abeilles dans la ruche » ?', 'Ce signe d''alerte concerne l''abeille domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', true, 1),
  ('poule', false, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gecko léopard, gerbille et grenouille griffue (Xenopus), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le gecko léopard est plutôt solitaire à l''état naturel, alors que la gerbille et la grenouille griffue (Xenopus) sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('gerbille', false, 2),
  ('gecko léopard', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « un silence inhabituel et l''arrêt des petits cris habituels au moment du repas » ?', 'Ce signe d''alerte concerne le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('chien', false, 2),
  ('cochon d''Inde', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi vache, souris domestique et rat domestique, lequel a en moyenne les portées les plus nombreuses ?', 'Le rat domestique a en moyenne 6-12 petits par portée, contre 1-1 pour la vache et 4-8 pour la souris domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('vache', false, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « l''oignon et l''ail (destruction des globules rouges) » ?', 'Cette toxicité est documentée chez le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('perruche ondulée', false, 2),
  ('chat', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 8)', 'Une annonce de vente d''animal doit mentionner le numéro d''identification de l''animal lorsque l''espèce l''impose.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Le furet n''est soumis à aucune obligation d''identification, à la différence du chien et du chat.', false, 1),
  ('L''identification des chiens et chats par puce électronique est facultative en toutes circonstances.', false, 2),
  ('Une annonce de vente d''animal doit mentionner le numéro d''identification de l''animal lorsque l''espèce l''impose.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi hérisson domestique, poisson rouge et tortue terrestre, lequel a un régime alimentaire strictement herbivore ?', 'La tortue terrestre est herbivore, alors que l''hérisson domestique est insectivore et le poisson rouge est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('poisson rouge', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, cochon d''Inde et cheval, lequel est le plus lourd à l''âge adulte ?', 'Un cheval adulte pèse en moyenne 400-600 kg, bien plus qu''un hérisson domestique (0.3-0.6 kg) ou un cochon d''Inde (0.7-1.2 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('cochon d''Inde', false, 2),
  ('cheval', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hamster syrien, lapin et mouche soldat noire (larves), lequel est principalement actif le jour (diurne) ?', 'La mouche soldat noire (larves) est diurne, alors que l''hamster syrien est plutôt nocturne et le lapin plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', true, 1),
  ('hamster syrien', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi chat, oie et rat domestique, lequel a un régime alimentaire strictement carnivore ?', 'Le chat est carnivore, alors que l''oie est herbivore et le rat domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', true, 1),
  ('oie', false, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi escargot petit-gris, hérisson domestique et pigeon, lequel a un régime alimentaire strictement herbivore ?', 'L''escargot petit-gris est herbivore, alors que l''hérisson domestique est insectivore et le pigeon est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('escargot petit-gris', true, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, chien et vache, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''hérisson domestique vit environ 4-6 ans, nettement moins que le chien et la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', true, 1),
  ('vache', false, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, discus et poisson rouge, lequel est le plus léger à l''âge adulte ?', 'Une abeille domestique adulte pèse en moyenne 0.0001-0.0001 kg, nettement moins que le discus et le poisson rouge.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', true, 1),
  ('poisson rouge', false, 2),
  ('discus', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, furet et cochon, lequel est le plus léger à l''âge adulte ?', 'Un escargot petit-gris adulte pèse en moyenne 0.005-0.015 kg, nettement moins que le furet et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('cochon', false, 2),
  ('escargot petit-gris', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, pogona (dragon barbu) et tortue terrestre, lequel est le plus léger à l''âge adulte ?', 'Une souris domestique adulte pèse en moyenne 0.02-0.04 kg, nettement moins que le pogona (dragon barbu) et la tortue terrestre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', true, 1),
  ('tortue terrestre', false, 2),
  ('pogona (dragon barbu)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, hérisson domestique et âne, lequel est le plus léger à l''âge adulte ?', 'Un rat domestique adulte pèse en moyenne 0.2-0.5 kg, nettement moins que l''hérisson domestique et l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('rat domestique', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi pogona (dragon barbu), souris domestique et tortue aquatique (Trachemys), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'La souris domestique est grégaire et a besoin de compagnie de son espèce, alors que le pogona (dragon barbu) et la tortue aquatique (Trachemys) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), perroquet gris du Gabon et pogona (dragon barbu), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 55-75 jours chez le pogona (dragon barbu), contre 2-3 jours chez le betta (combattant) et 28-30 jours chez le perroquet gris du Gabon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('pogona (dragon barbu)', true, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chien, chat et cheval, lequel a la gestation la plus longue ?', 'La gestation dure environ 330-345 jours chez le cheval, contre 58-68 jours chez le chien et 63-67 jours chez le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', true, 1),
  ('chien', false, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi hamster syrien, lapin et perruche ondulée, lequel a un régime alimentaire strictement herbivore ?', 'Le lapin est herbivore, alors que l''hamster syrien est omnivore et la perruche ondulée est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('lapin', true, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un rat domestique ?', 'Chez le rat domestique, une respiration bruyante ou sifflante (les rats sont très sensibles aux infections respiratoires).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('des zones de pelage arraché ou clairsemé (souvent lié au stress ou à un environnement trop humide)', false, 1),
  ('une respiration bruyante ou sifflante (les rats sont très sensibles aux infections respiratoires)', true, 2),
  ('l''arrêt complet de la rumination (mâchouillement régulier), signe précoce de trouble digestif', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un canard, laquelle de ces affirmations est exacte ? (variante 2)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 1),
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 2),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, hérisson domestique et vache, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le canari est un oiseau, alors que l''hérisson domestique et la vache sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('hérisson domestique', false, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour une perruche ondulée ?', 'Chez la perruche ondulée, la compagnie d''au moins une autre perruche : l''isolement prolongé cause un stress important chez cette espèce grégaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('la compagnie d''au moins une autre perruche : l''isolement prolongé cause un stress important chez cette espèce grégaire', true, 1),
  ('de nombreuses cachettes : c''est une espèce proie qui a besoin de se sentir protégée', false, 2),
  ('la présence d''autres moutons : l''isolement social est une source de stress majeure pour cette espèce grégaire', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi grenouille griffue (Xenopus), canari et oie, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 28-33 jours chez l''oie, contre 4-6 jours chez la grenouille griffue (Xenopus) et 13-14 jours chez le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), poule et âne, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la mouche soldat noire (larves) vit environ 0.15-0.3 ans, nettement moins que la poule et l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('mouche soldat noire (larves)', true, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), poisson rouge et canard, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 26-28 jours chez le canard, contre 2-3 jours chez le betta (combattant) et 4-7 jours chez le poisson rouge.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('poisson rouge', false, 2),
  ('canard', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une respiration bruyante ou sifflante (les rats sont très sensibles aux infections respiratoires) » ?', 'Ce signe d''alerte concerne le rat domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('rat domestique', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi âne, dindon et furet, lequel a un régime alimentaire strictement carnivore ?', 'Le furet est carnivore, alors que l''âne est herbivore et le dindon est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('dindon', false, 2),
  ('furet', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, grenouille griffue (Xenopus) et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le perroquet gris du Gabon vit environ 40-60 ans, contre 5-8 ans pour l''escargot petit-gris et 10-15 ans pour la grenouille griffue (Xenopus).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', false, 1),
  ('perroquet gris du Gabon', true, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, perruche ondulée et tortue aquatique (Trachemys), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue aquatique (Trachemys), contre 13-14 jours chez le canari et 17-19 jours chez la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('perruche ondulée', false, 2),
  ('tortue aquatique (Trachemys)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canard, oie et serpent des blés (couleuvre), lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que le canard est plutôt diurne et l''oie plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', false, 1),
  ('canard', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, chien et gecko léopard, lequel est principalement actif la nuit (nocturne) ?', 'Le gecko léopard est nocturne, alors que le chat est plutôt crepusculaire et le chien plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('chien', false, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), escargot petit-gris et cochon d''Inde, lequel est le plus lourd à l''âge adulte ?', 'Un cochon d''Inde adulte pèse en moyenne 0.7-1.2 kg, bien plus qu''un betta (combattant) (0.005-0.01 kg) ou un escargot petit-gris (0.005-0.015 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', false, 1),
  ('betta (combattant)', false, 2),
  ('cochon d''Inde', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, poule et canard, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la souris domestique vit environ 1.5-2.5 ans, nettement moins que la poule et le canard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('souris domestique', true, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi pigeon, vache et âne, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le pigeon vit environ 5-15 ans, nettement moins que la vache et l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', true, 1),
  ('vache', false, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi âne, gecko léopard et mouton, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le gecko léopard est plutôt solitaire à l''état naturel, alors que l''âne et le mouton sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('âne', false, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un canari, laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 1),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 2),
  ('Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi axolotl, canard et lapin, lequel a un régime alimentaire strictement herbivore ?', 'Le lapin est herbivore, alors que l''axolotl est carnivore et le canard est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('lapin', true, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouton, furet et hamster syrien, lequel a en moyenne les portées les plus nombreuses ?', 'L''hamster syrien a en moyenne 4-10 petits par portée, contre 1-3 pour le mouton et 3-7 pour le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('mouton', false, 2),
  ('hamster syrien', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi grenouille griffue (Xenopus), hérisson domestique et perruche ondulée, lequel a un régime alimentaire strictement carnivore ?', 'La grenouille griffue (Xenopus) est carnivore, alors que l''hérisson domestique est insectivore et la perruche ondulée est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', true, 1),
  ('hérisson domestique', false, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour un chien ?', 'Chez le chien, le chocolat (théobromine) est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('le riz blanc', false, 1),
  ('le chocolat (théobromine)', true, 2),
  ('la carotte cuite', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, betta (combattant) et grenouille griffue (Xenopus), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'La grenouille griffue (Xenopus) est grégaire et a besoin de compagnie de son espèce, alors que l''axolotl et le betta (combattant) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('grenouille griffue (Xenopus)', true, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), souris domestique et canari, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la mouche soldat noire (larves) vit environ 0.15-0.3 ans, nettement moins que la souris domestique et le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('mouche soldat noire (larves)', true, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi âne, chèvre et serpent des blés (couleuvre), lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que l''âne est plutôt diurne et la chèvre plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('serpent des blés (couleuvre)', true, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, chat et chinchilla, lequel a la gestation la plus longue ?', 'La gestation dure environ 105-115 jours chez le chinchilla, contre 16-18 jours chez l''hamster syrien et 63-67 jours chez le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('chat', false, 2),
  ('chinchilla', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, canard et chinchilla, lequel est principalement actif le jour (diurne) ?', 'Le canard est diurne, alors que l''axolotl est plutôt nocturne et le chinchilla plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', true, 1),
  ('chinchilla', false, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, hérisson domestique et âne, lequel a la gestation la plus longue ?', 'La gestation dure environ 365-375 jours chez l''âne, contre 16-18 jours chez l''hamster syrien et 33-37 jours chez l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('âne', true, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi vache, âne et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le perroquet gris du Gabon vit environ 40-60 ans, contre 18-22 ans pour la vache et 25-35 ans pour l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('vache', false, 2),
  ('perroquet gris du Gabon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), mouton et grenouille griffue (Xenopus), lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la grenouille griffue (Xenopus) vit environ 10-15 ans, contre 2-4 ans pour le betta (combattant) et 10-12 ans pour le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', true, 1),
  ('betta (combattant)', false, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, pigeon et souris domestique, lequel est principalement actif la nuit (nocturne) ?', 'La souris domestique est nocturne, alors que l''abeille domestique est plutôt diurne et le pigeon plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', false, 1),
  ('pigeon', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi lapin, pigeon et rat domestique, lequel a un régime alimentaire strictement herbivore ?', 'Le lapin est herbivore, alors que le pigeon est granivore et le rat domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('rat domestique', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), canari et pogona (dragon barbu), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 55-75 jours chez le pogona (dragon barbu), contre 2-3 jours chez le betta (combattant) et 13-14 jours chez le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', true, 1),
  ('betta (combattant)', false, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est fausse ? (affirmation 1)', 'Aucune formation n''est jamais nécessaire pour exercer une activité professionnelle liée aux animaux de compagnie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('La vente de chiens ou de chats entre particuliers est encadrée : un numéro d''identification (puce ou tatouage) doit être communiqué à l''acheteur.', false, 1),
  ('Aucune formation n''est jamais nécessaire pour exercer une activité professionnelle liée aux animaux de compagnie.', true, 2),
  ('Une annonce de vente d''animal doit mentionner le numéro d''identification de l''animal lorsque l''espèce l''impose.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « le chocolat (théobromine) » ?', 'Cette toxicité est documentée chez le chien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('chien', true, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, perroquet gris du Gabon et poisson rouge, lequel est principalement actif la nuit (nocturne) ?', 'L''axolotl est nocturne, alors que le perroquet gris du Gabon est plutôt diurne et le poisson rouge plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('axolotl', true, 2),
  ('poisson rouge', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, furet et chat, lequel a la gestation la plus longue ?', 'La gestation dure environ 63-67 jours chez le chat, contre 33-37 jours chez l''hérisson domestique et 41-43 jours chez le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', true, 1),
  ('hérisson domestique', false, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chinchilla, gerbille et hérisson domestique, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hérisson domestique est plutôt solitaire à l''état naturel, alors que le chinchilla et la gerbille sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', true, 1),
  ('gerbille', false, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un canari ?', 'Chez le canari, l''arrêt total du chant chez un mâle habituellement chanteur.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une bosse ou un renflement dans les bajoues qui ne se résorbe pas (abcès buccal possible)', false, 1),
  ('des zones de pelage arraché ou clairsemé (souvent lié au stress ou à un environnement trop humide)', false, 2),
  ('l''arrêt total du chant chez un mâle habituellement chanteur', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, tortue aquatique (Trachemys) et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le perroquet gris du Gabon vit environ 40-60 ans, contre 5-8 ans pour l''escargot petit-gris et 20-30 ans pour la tortue aquatique (Trachemys).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('escargot petit-gris', false, 2),
  ('perroquet gris du Gabon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, escargot petit-gris et serpent des blés (couleuvre), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 55-65 jours chez le serpent des blés (couleuvre), contre 2-3 jours chez le discus et 15-30 jours chez l''escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', false, 1),
  ('discus', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, mouton et cochon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la souris domestique vit environ 1.5-2.5 ans, nettement moins que le mouton et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('mouton', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un gecko léopard ?', 'Chez le gecko léopard, un morceau de mue qui reste collé sur les doigts ou la queue plusieurs jours après la mue.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un ventre gonflé et dur associé à des tentatives de vomir sans y arriver (suspicion de torsion d''estomac, urgence vitale)', false, 1),
  ('des branchies qui se recroquevillent ou pâlissent (souvent lié à une eau trop chaude ou de mauvaise qualité)', false, 2),
  ('un morceau de mue qui reste collé sur les doigts ou la queue plusieurs jours après la mue', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cochon, lapin et serpent des blés (couleuvre), lequel est principalement actif le jour (diurne) ?', 'Le cochon est diurne, alors que le lapin est plutôt crepusculaire et le serpent des blés (couleuvre) plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('lapin', false, 2),
  ('cochon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un chinchilla, laquelle de ces affirmations est exacte ? (variante 1)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un canard ?', 'Chez le canard, des plumes ternes qui ne repoussent plus imperméables (perte d''étanchéité du plumage).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('des plumes ternes qui ne repoussent plus imperméables (perte d''étanchéité du plumage)', true, 1),
  ('un arrêt total de l''alimentation depuis plus de 12 h (risque de stase digestive, urgence vitale)', false, 2),
  ('une bosse ou un renflement dans les bajoues qui ne se résorbe pas (abcès buccal possible)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), perruche ondulée et tortue terrestre, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue terrestre, contre 2-3 jours chez le betta (combattant) et 17-19 jours chez la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('perruche ondulée', false, 2),
  ('tortue terrestre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chien, discus et gecko léopard, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le gecko léopard vit environ 15-20 ans, contre 10-13 ans pour le chien et 10-15 ans pour le discus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('discus', false, 2),
  ('gecko léopard', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 11)', 'La cession d''un chat doit s''accompagner d''un document d''information sur les caractéristiques et les besoins de l''espèce.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('La cession d''un chat doit s''accompagner d''un document d''information sur les caractéristiques et les besoins de l''espèce.', true, 1),
  ('Les pensions et refuges qui accueillent des animaux ne sont soumis à aucune règle sanitaire particulière.', false, 2),
  ('L''âge auquel un chiot ou un chaton peut être cédé n''est soumis à aucune limite basse.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi canari, grenouille griffue (Xenopus) et tortue terrestre, lequel a un régime alimentaire strictement herbivore ?', 'La tortue terrestre est herbivore, alors que le canari est granivore et la grenouille griffue (Xenopus) est carnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('tortue terrestre', true, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « les croquettes et friandises riches en sucres et céréales (le furet est un carnivore strict) » ?', 'Cette toxicité est documentée chez le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', true, 1),
  ('canard', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un chat, laquelle de ces affirmations est exacte ? (variante 2)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi cochon d''Inde, serpent des blés (couleuvre) et souris domestique, lequel a un régime alimentaire strictement carnivore ?', 'Le serpent des blés (couleuvre) est carnivore, alors que le cochon d''Inde est herbivore et la souris domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('souris domestique', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), canard et perroquet gris du Gabon, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 28-30 jours chez le perroquet gris du Gabon, contre 2-3 jours chez le betta (combattant) et 26-28 jours chez le canard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('betta (combattant)', false, 2),
  ('perroquet gris du Gabon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, tortue terrestre et cheval, lequel est le plus lourd à l''âge adulte ?', 'Un cheval adulte pèse en moyenne 400-600 kg, bien plus qu''une gerbille (0.08-0.12 kg) ou une tortue terrestre (1-5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('cheval', true, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, chèvre et serpent des blés (couleuvre), lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le serpent des blés (couleuvre) vit environ 15-20 ans, contre 0.08-0.16 ans pour l''abeille domestique et 10-15 ans pour la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('serpent des blés (couleuvre)', true, 2),
  ('abeille domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, chinchilla et cheval, lequel a la gestation la plus longue ?', 'La gestation dure environ 330-345 jours chez le cheval, contre 33-37 jours chez l''hérisson domestique et 105-115 jours chez le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('chinchilla', false, 2),
  ('cheval', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une carapace qui se ramollit ou présente des zones pâles (suspicion de maladie osseuse métabolique) » ?', 'Ce signe d''alerte concerne la tortue aquatique (Trachemys).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('tortue aquatique (Trachemys)', true, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, poisson rouge et vache, lequel est le plus lourd à l''âge adulte ?', 'Une vache adulte pèse en moyenne 500-800 kg, bien plus qu''une souris domestique (0.02-0.04 kg) ou un poisson rouge (0.1-0.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('poisson rouge', false, 2),
  ('vache', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour une souris domestique ?', 'Chez la souris domestique, de nombreuses cachettes : c''est une espèce proie qui a besoin de se sentir protégée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un abri sec permanent : contrairement au cheval, son pelage n''est pas imperméable à la pluie', false, 1),
  ('un éclairage UVB adapté, indispensable pour synthétiser la vitamine D3 et fixer le calcium', false, 2),
  ('de nombreuses cachettes : c''est une espèce proie qui a besoin de se sentir protégée', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi grenouille griffue (Xenopus), mouton et tortue terrestre, lequel est principalement actif la nuit (nocturne) ?', 'La grenouille griffue (Xenopus) est nocturne, alors que le mouton est plutôt diurne et la tortue terrestre plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', false, 1),
  ('mouton', false, 2),
  ('grenouille griffue (Xenopus)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour une oie ?', 'Chez l''oie, de l''herbe fraîche à volonté : c''est l''essentiel de son alimentation naturelle.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un point chaud (lampe chauffante) et un point froid dans son enclos pour réguler elle-même sa température corporelle', false, 1),
  ('de l''herbe fraîche à volonté : c''est l''essentiel de son alimentation naturelle', true, 2),
  ('un substrat à fouiller (paille, terre) : le fouissage est un comportement naturel essentiel', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, pigeon et tortue aquatique (Trachemys), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le pigeon est grégaire et a besoin de compagnie de son espèce, alors que le canari et la tortue aquatique (Trachemys) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('pigeon', true, 2),
  ('tortue aquatique (Trachemys)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, axolotl et poisson rouge, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la gerbille vit environ 2-4 ans, nettement moins que l''axolotl et le poisson rouge.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', false, 1),
  ('poisson rouge', false, 2),
  ('gerbille', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gerbille, souris domestique et tortue aquatique (Trachemys), lequel est principalement actif la nuit (nocturne) ?', 'La souris domestique est nocturne, alors que la gerbille est plutôt diurne et la tortue aquatique (Trachemys) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', true, 1),
  ('gerbille', false, 2),
  ('tortue aquatique (Trachemys)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, axolotl et tortue aquatique (Trachemys), lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la gerbille vit environ 2-4 ans, nettement moins que l''axolotl et la tortue aquatique (Trachemys).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', true, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, furet et vache, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la vache vit environ 18-22 ans, contre 5-8 ans pour le cochon d''Inde et 7-10 ans pour le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('vache', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi chinchilla, furet et gerbille, lequel a un régime alimentaire strictement herbivore ?', 'Le chinchilla est herbivore, alors que le furet est carnivore et la gerbille est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', true, 1),
  ('furet', false, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hérisson domestique, poule et tortue aquatique (Trachemys), lequel est principalement actif la nuit (nocturne) ?', 'L''hérisson domestique est nocturne, alors que la poule est plutôt diurne et la tortue aquatique (Trachemys) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', false, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('hérisson domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gerbille, hamster syrien et pigeon, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hamster syrien est plutôt solitaire à l''état naturel, alors que la gerbille et le pigeon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('hamster syrien', true, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, cochon d''Inde et poule, lequel est le plus lourd à l''âge adulte ?', 'Une poule adulte pèse en moyenne 1.5-3 kg, bien plus qu''un rat domestique (0.2-0.5 kg) ou un cochon d''Inde (0.7-1.2 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('rat domestique', false, 2),
  ('poule', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, lapin et mouche soldat noire (larves), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le canari est plutôt solitaire à l''état naturel, alors que le lapin et la mouche soldat noire (larves) sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('canari', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un pigeon, laquelle de ces affirmations est exacte ? (variante 1)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 2),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gecko léopard, gerbille et tortue aquatique (Trachemys), lequel est le plus lourd à l''âge adulte ?', 'Une tortue aquatique (Trachemys) adulte pèse en moyenne 0.3-1 kg, bien plus qu''un gecko léopard (0.05-0.09 kg) ou une gerbille (0.08-0.12 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('tortue aquatique (Trachemys)', true, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), perroquet gris du Gabon et mouton, lequel est le plus léger à l''âge adulte ?', 'Un betta (combattant) adulte pèse en moyenne 0.005-0.01 kg, nettement moins que le perroquet gris du Gabon et le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('perroquet gris du Gabon', false, 2),
  ('betta (combattant)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi grenouille griffue (Xenopus), poule et oie, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 28-33 jours chez l''oie, contre 4-6 jours chez la grenouille griffue (Xenopus) et 20-21 jours chez la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', true, 1),
  ('poule', false, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi tortue aquatique (Trachemys), canard et âne, lequel est le plus léger à l''âge adulte ?', 'Une tortue aquatique (Trachemys) adulte pèse en moyenne 0.3-1 kg, nettement moins que le canard et l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', true, 1),
  ('canard', false, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi lapin, serpent des blés (couleuvre) et âne, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le lapin vit environ 8-12 ans, nettement moins que le serpent des blés (couleuvre) et l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un espace suffisant pour parader : le comportement de parade fait partie de ses besoins sociaux » ?', 'Cette description correspond au dindon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('dindon', true, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « un cou maintenu tordu ou penché de façon permanente » ?', 'Ce signe d''alerte concerne l''oie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('oie', true, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, canard et oie, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la gerbille vit environ 2-4 ans, nettement moins que le canard et l''oie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('oie', false, 2),
  ('gerbille', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hamster syrien, lapin et mouton, lequel est principalement actif le jour (diurne) ?', 'Le mouton est diurne, alors que l''hamster syrien est plutôt nocturne et le lapin plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', true, 1),
  ('hamster syrien', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi axolotl, cheval et hérisson domestique, lequel a un régime alimentaire strictement carnivore ?', 'L''axolotl est carnivore, alors que le cheval est herbivore et l''hérisson domestique est insectivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('cheval', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une perruche ondulée, laquelle de ces affirmations est exacte ? (variante 2)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 1),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 2),
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « un arrachage répété de ses propres plumes » ?', 'Ce signe d''alerte concerne le perroquet gris du Gabon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('cochon d''Inde', false, 2),
  ('perroquet gris du Gabon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une vache, laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.', true, 1),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 2),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, discus et poisson rouge, lequel est le plus lourd à l''âge adulte ?', 'Un poisson rouge adulte pèse en moyenne 0.1-0.5 kg, bien plus qu''une abeille domestique (0.0001-0.0001 kg) ou un discus (0.1-0.3 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('abeille domestique', false, 2),
  ('poisson rouge', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, cochon d''Inde et poule, lequel est le plus léger à l''âge adulte ?', 'Un rat domestique adulte pèse en moyenne 0.2-0.5 kg, nettement moins que le cochon d''Inde et la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', false, 1),
  ('rat domestique', true, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chinchilla, hérisson domestique et perruche ondulée, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'La perruche ondulée est un oiseau, alors que le chinchilla et l''hérisson domestique sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', true, 1),
  ('chinchilla', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, furet et grenouille griffue (Xenopus), lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''escargot petit-gris vit environ 5-8 ans, nettement moins que le furet et la grenouille griffue (Xenopus).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', true, 1),
  ('furet', false, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canard, mouche soldat noire (larves) et pigeon, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'La mouche soldat noire (larves) est un insecte, alors que le canard et le pigeon sont tous les deux des oiseaus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', true, 1),
  ('pigeon', false, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cheval, vache et souris domestique, lequel a en moyenne les portées les plus nombreuses ?', 'La souris domestique a en moyenne 4-8 petits par portée, contre 1-1 pour le cheval et 1-1 pour la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('vache', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi grenouille griffue (Xenopus), pigeon et perroquet gris du Gabon, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 28-30 jours chez le perroquet gris du Gabon, contre 4-6 jours chez la grenouille griffue (Xenopus) et 17-19 jours chez le pigeon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chèvre, gecko léopard et tortue aquatique (Trachemys), lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la chèvre vit environ 10-15 ans, nettement moins que le gecko léopard et la tortue aquatique (Trachemys).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('chèvre', true, 2),
  ('tortue aquatique (Trachemys)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, serpent des blés (couleuvre) et furet, lequel est le plus lourd à l''âge adulte ?', 'Un furet adulte pèse en moyenne 0.7-2 kg, bien plus qu''un canari (0.015-0.02 kg) ou un serpent des blés (couleuvre) (0.15-0.45 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('furet', true, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hérisson domestique, mouton et perroquet gris du Gabon, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hérisson domestique est plutôt solitaire à l''état naturel, alors que le mouton et le perroquet gris du Gabon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('hérisson domestique', true, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, tortue aquatique (Trachemys) et âne, lequel est le plus léger à l''âge adulte ?', 'Un hamster syrien adulte pèse en moyenne 0.1-0.15 kg, nettement moins que la tortue aquatique (Trachemys) et l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('hamster syrien', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi cochon d''Inde, serpent des blés (couleuvre) et souris domestique, lequel a un régime alimentaire strictement herbivore ?', 'Le cochon d''Inde est herbivore, alors que le serpent des blés (couleuvre) est carnivore et la souris domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('cochon d''Inde', true, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, hérisson domestique et chien, lequel a la gestation la plus longue ?', 'La gestation dure environ 58-68 jours chez le chien, contre 21-23 jours chez le rat domestique et 33-37 jours chez l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', true, 1),
  ('rat domestique', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un bac individuel : deux mâles ensemble se battent, d''où son nom de poisson combattant » ?', 'Cette description correspond au betta (combattant).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', false, 1),
  ('furet', false, 2),
  ('betta (combattant)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un poisson rouge, laquelle de ces affirmations est exacte ? (variante 2)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, mouton et chèvre, lequel a la gestation la plus longue ?', 'La gestation dure environ 145-155 jours chez la chèvre, contre 19-21 jours chez la souris domestique et 144-152 jours chez le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', true, 1),
  ('mouton', false, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour une vache ?', 'Chez la vache, un accès à un pâturage ou à une aire de couchage sèche et suffisamment spacieuse pour se relever sans entrave.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('des surfaces à grimper et à explorer : c''est un animal naturellement escaladeur', false, 1),
  ('un accès à un pâturage ou à une aire de couchage sèche et suffisamment spacieuse pour se relever sans entrave', true, 2),
  ('un accès à un point d''eau pour boire par aspiration continue, une particularité rare chez les oiseaux', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un chat, laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 1),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 2),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un lapin, laquelle de ces affirmations est exacte ? (variante 1)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi pigeon, oie et cheval, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le cheval vit environ 25-30 ans, contre 5-15 ans pour le pigeon et 15-20 ans pour l''oie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('cheval', true, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, poule et canard, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le canard vit environ 8-12 ans, contre 1.5-2.5 ans pour la souris domestique et 5-10 ans pour la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', true, 1),
  ('souris domestique', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi chinchilla, furet et rat domestique, lequel a un régime alimentaire strictement carnivore ?', 'Le furet est carnivore, alors que le chinchilla est herbivore et le rat domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('rat domestique', false, 2),
  ('furet', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, lapin et vache, lequel est le plus léger à l''âge adulte ?', 'Une gerbille adulte pèse en moyenne 0.08-0.12 kg, nettement moins que le lapin et la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('gerbille', true, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour une mouche soldat noire (larves) ?', 'Chez la mouche soldat noire (larves), un substrat humide riche en matière organique en décomposition.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un substrat humide riche en matière organique en décomposition', true, 1),
  ('une stimulation mentale quotidienne (jeux, interactions) : l''ennui provoque souvent des troubles du comportement comme l''arrachage de plumes', false, 2),
  ('un accès à de l''eau assez profonde pour immerger toute la tête, indispensable pour nettoyer ses narines et ses yeux', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), grenouille griffue (Xenopus) et cochon d''Inde, lequel est le plus lourd à l''âge adulte ?', 'Un cochon d''Inde adulte pèse en moyenne 0.7-1.2 kg, bien plus qu''une mouche soldat noire (larves) (0.0001-0.0002 kg) ou une grenouille griffue (Xenopus) (0.06-0.15 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('mouche soldat noire (larves)', false, 2),
  ('cochon d''Inde', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, rat domestique et grenouille griffue (Xenopus), lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la souris domestique vit environ 1.5-2.5 ans, nettement moins que le rat domestique et la grenouille griffue (Xenopus).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('souris domestique', true, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez une vache ?', 'Chez la vache, l''arrêt complet de la rumination (mâchouillement régulier), signe précoce de trouble digestif.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un pelage humide autour du nez et des yeux (souvent lié à une allergie à la poussière de son substrat)', false, 1),
  ('l''arrêt complet de la rumination (mâchouillement régulier), signe précoce de trouble digestif', true, 2),
  ('des branchies qui se recroquevillent ou pâlissent (souvent lié à une eau trop chaude ou de mauvaise qualité)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, furet et cheval, lequel est le plus lourd à l''âge adulte ?', 'Un cheval adulte pèse en moyenne 400-600 kg, bien plus qu''un discus (0.1-0.3 kg) ou un furet (0.7-2 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('discus', false, 2),
  ('cheval', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, escargot petit-gris et mouton, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le mouton vit environ 10-12 ans, contre 4-6 ans pour l''hérisson domestique et 5-8 ans pour l''escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', true, 1),
  ('escargot petit-gris', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cochon d''Inde, hamster syrien et poule, lequel est principalement actif la nuit (nocturne) ?', 'L''hamster syrien est nocturne, alors que le cochon d''Inde est plutôt crepusculaire et la poule plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('hamster syrien', true, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, hérisson domestique et chat, lequel a la gestation la plus longue ?', 'La gestation dure environ 63-67 jours chez le chat, contre 16-18 jours chez l''hamster syrien et 33-37 jours chez l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', true, 1),
  ('hérisson domestique', false, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perruche ondulée, poule et dindon, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 27-28 jours chez le dindon, contre 17-19 jours chez la perruche ondulée et 20-21 jours chez la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('poule', false, 2),
  ('dindon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « des zones de pelage arraché ou clairsemé (souvent lié au stress ou à un environnement trop humide) » ?', 'Ce signe d''alerte concerne le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', true, 1),
  ('hamster syrien', false, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), grenouille griffue (Xenopus) et oie, lequel est le plus léger à l''âge adulte ?', 'Une mouche soldat noire (larves) adulte pèse en moyenne 0.0001-0.0002 kg, nettement moins que la grenouille griffue (Xenopus) et l''oie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('oie', false, 2),
  ('mouche soldat noire (larves)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi vache, chèvre et mouton, lequel a en moyenne les portées les plus nombreuses ?', 'Le mouton a en moyenne 1-3 petits par portée, contre 1-1 pour la vache et 1-3 pour la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('mouton', true, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un poisson rouge, laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, escargot petit-gris et perroquet gris du Gabon, lequel est principalement actif le jour (diurne) ?', 'Le perroquet gris du Gabon est diurne, alors que l''axolotl est plutôt nocturne et l''escargot petit-gris plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', false, 1),
  ('perroquet gris du Gabon', true, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi grenouille griffue (Xenopus), hamster syrien et tortue terrestre, lequel a un régime alimentaire strictement herbivore ?', 'La tortue terrestre est herbivore, alors que la grenouille griffue (Xenopus) est carnivore et l''hamster syrien est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, furet et cochon, lequel est le plus lourd à l''âge adulte ?', 'Un cochon adulte pèse en moyenne 50-350 kg, bien plus qu''un escargot petit-gris (0.005-0.015 kg) ou un furet (0.7-2 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('cochon', true, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), abeille domestique et escargot petit-gris, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 15-30 jours chez l''escargot petit-gris, contre 2-3 jours chez le betta (combattant) et 20-24 jours chez l''abeille domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('abeille domestique', false, 2),
  ('escargot petit-gris', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un dindon ?', 'Chez le dindon, un espace suffisant pour parader : le comportement de parade fait partie de ses besoins sociaux.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un espace suffisant pour parader : le comportement de parade fait partie de ses besoins sociaux', true, 1),
  ('un volume d''eau bien plus grand qu''un simple bocal : contrairement à une idée reçue, il peut atteindre une taille importante', false, 2),
  ('des zones en hauteur pour observer et un accès à un griffoir pour marquer et entretenir ses griffes', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gecko léopard, mouton et perroquet gris du Gabon, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le gecko léopard est plutôt solitaire à l''état naturel, alors que le mouton et le perroquet gris du Gabon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('gecko léopard', true, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un discus ?', 'Chez le discus, une eau douce, chaude (28-30°C) et légèrement acide, reproduisant les conditions du bassin amazonien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une eau douce, chaude (28-30°C) et légèrement acide, reproduisant les conditions du bassin amazonien', true, 1),
  ('une température ambiante stable au-dessus de 22°C : le froid peut déclencher une tentative d''hibernation dangereuse', false, 2),
  ('une cage assez longue pour voler horizontalement : contrairement à la perruche, il vit bien seul mais a besoin d''espace pour voler', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, escargot petit-gris et furet, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le furet vit environ 7-10 ans, contre 5-8 ans pour le cochon d''Inde et 5-8 ans pour l''escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('furet', true, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi cochon d''Inde, furet et pogona (dragon barbu), lequel a un régime alimentaire strictement herbivore ?', 'Le cochon d''Inde est herbivore, alors que le furet est carnivore et le pogona (dragon barbu) est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('furet', false, 2),
  ('cochon d''Inde', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, lapin et âne, lequel a la gestation la plus longue ?', 'La gestation dure environ 365-375 jours chez l''âne, contre 16-18 jours chez l''hamster syrien et 28-33 jours chez le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('lapin', false, 2),
  ('âne', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, souris domestique et poule, lequel est le plus lourd à l''âge adulte ?', 'Une poule adulte pèse en moyenne 1.5-3 kg, bien plus qu''un canari (0.015-0.02 kg) ou une souris domestique (0.02-0.04 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', true, 1),
  ('souris domestique', false, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), tortue aquatique (Trachemys) et cochon, lequel est le plus léger à l''âge adulte ?', 'Un betta (combattant) adulte pèse en moyenne 0.005-0.01 kg, nettement moins que la tortue aquatique (Trachemys) et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('betta (combattant)', true, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cheval, gecko léopard et tortue aquatique (Trachemys), lequel est principalement actif la nuit (nocturne) ?', 'Le gecko léopard est nocturne, alors que le cheval est plutôt diurne et la tortue aquatique (Trachemys) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour une abeille domestique ?', 'Chez l''abeille domestique, un accès à des fleurs mellifères variées sur plusieurs kilomètres autour du rucher.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('la compagnie d''au moins un autre rat : l''isolement social lui cause un vrai mal-être', false, 1),
  ('une humidité constante : sans elle, il s''enferme dans sa coquille derrière un opercule de mucus', false, 2),
  ('un accès à des fleurs mellifères variées sur plusieurs kilomètres autour du rucher', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 9)', 'L''ACACED comporte un module théorique et une évaluation des connaissances, propres à chaque catégorie d''espèces concernée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Les obligations réglementaires sur les animaux de compagnie ne concernent que les éleveurs de plus de 50 portées par an.', false, 1),
  ('L''ACACED comporte un module théorique et une évaluation des connaissances, propres à chaque catégorie d''espèces concernée.', true, 2),
  ('Aucune formation n''est jamais nécessaire pour exercer une activité professionnelle liée aux animaux de compagnie.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un substrat profond pour creuser des galeries, son comportement naturel principal » ?', 'Cette description correspond au gerbille.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('gerbille', true, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, dindon et serpent des blés (couleuvre), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 55-65 jours chez le serpent des blés (couleuvre), contre 15-30 jours chez l''escargot petit-gris et 27-28 jours chez le dindon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', false, 1),
  ('serpent des blés (couleuvre)', true, 2),
  ('dindon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), escargot petit-gris et tortue terrestre, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le betta (combattant) vit environ 2-4 ans, nettement moins que l''escargot petit-gris et la tortue terrestre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', false, 1),
  ('betta (combattant)', true, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), hamster syrien et poisson rouge, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le poisson rouge est grégaire et a besoin de compagnie de son espèce, alors que le betta (combattant) et l''hamster syrien vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', true, 1),
  ('betta (combattant)', false, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, tortue terrestre et cochon, lequel est le plus léger à l''âge adulte ?', 'Un axolotl adulte pèse en moyenne 0.06-0.15 kg, nettement moins que la tortue terrestre et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('axolotl', true, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi escargot petit-gris, furet et pogona (dragon barbu), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le pogona (dragon barbu) est plutôt solitaire à l''état naturel, alors que l''escargot petit-gris et le furet sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', false, 1),
  ('pogona (dragon barbu)', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « des tentatives répétées de se rouler par terre associées à des regards vers le flanc (signes de coliques, urgence) » ?', 'Ce signe d''alerte concerne le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', true, 1),
  ('escargot petit-gris', false, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi pogona (dragon barbu), canard et vache, lequel est le plus léger à l''âge adulte ?', 'Un pogona (dragon barbu) adulte pèse en moyenne 0.3-0.6 kg, nettement moins que le canard et la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('canard', false, 2),
  ('pogona (dragon barbu)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouton, pigeon et poule, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le mouton est un mammifère, alors que le pigeon et la poule sont tous les deux des oiseaus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', false, 1),
  ('pigeon', false, 2),
  ('mouton', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une perruche ondulée, laquelle de ces affirmations est exacte ? (variante 1)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 2),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi escargot petit-gris, gecko léopard et pogona (dragon barbu), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'L''escargot petit-gris est grégaire et a besoin de compagnie de son espèce, alors que le gecko léopard et le pogona (dragon barbu) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('gecko léopard', false, 2),
  ('escargot petit-gris', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canard, serpent des blés (couleuvre) et tortue aquatique (Trachemys), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue aquatique (Trachemys), contre 26-28 jours chez le canard et 55-65 jours chez le serpent des blés (couleuvre).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('tortue aquatique (Trachemys)', true, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hamster syrien, lapin et mouton, lequel est principalement actif la nuit (nocturne) ?', 'L''hamster syrien est nocturne, alors que le lapin est plutôt crepusculaire et le mouton plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('hamster syrien', true, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un furet ?', 'Chez le furet, plusieurs heures de sortie de cage par jour : il ne supporte pas d''y rester enfermé en continu.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un perchoir surélevé pour la nuit : dormir en hauteur est un besoin de sécurité instinctif', false, 1),
  ('plusieurs heures de sortie de cage par jour : il ne supporte pas d''y rester enfermé en continu', true, 2),
  ('un éclairage UVB adapté, indispensable pour synthétiser la vitamine D3 et fixer le calcium', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cheval, mouton et cochon, lequel a en moyenne les portées les plus nombreuses ?', 'Le cochon a en moyenne 6-12 petits par portée, contre 1-1 pour le cheval et 1-3 pour le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', true, 1),
  ('mouton', false, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), gecko léopard et discus, lequel est le plus léger à l''âge adulte ?', 'Une mouche soldat noire (larves) adulte pèse en moyenne 0.0001-0.0002 kg, nettement moins que le gecko léopard et le discus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('discus', false, 2),
  ('mouche soldat noire (larves)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi perroquet gris du Gabon, perruche ondulée et souris domestique, lequel est principalement actif la nuit (nocturne) ?', 'La souris domestique est nocturne, alors que le perroquet gris du Gabon est plutôt diurne et la perruche ondulée plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('souris domestique', true, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), axolotl et pigeon, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 17-19 jours chez le pigeon, contre 2-3 jours chez le betta (combattant) et 14-21 jours chez l''axolotl.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', true, 1),
  ('axolotl', false, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), hamster syrien et rat domestique, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le rat domestique vit environ 2-3 ans, contre 0.15-0.3 ans pour la mouche soldat noire (larves) et 2-3 ans pour l''hamster syrien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('hamster syrien', false, 2),
  ('rat domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hérisson domestique, lapin et tortue aquatique (Trachemys), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le lapin est grégaire et a besoin de compagnie de son espèce, alors que l''hérisson domestique et la tortue aquatique (Trachemys) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('lapin', true, 2),
  ('tortue aquatique (Trachemys)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, axolotl et tortue aquatique (Trachemys), lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la tortue aquatique (Trachemys) vit environ 20-30 ans, contre 2-4 ans pour la gerbille et 10-15 ans pour l''axolotl.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', true, 1),
  ('axolotl', false, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hérisson domestique, mouche soldat noire (larves) et pogona (dragon barbu), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'La mouche soldat noire (larves) est grégaire et a besoin de compagnie de son espèce, alors que l''hérisson domestique et le pogona (dragon barbu) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('mouche soldat noire (larves)', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, gecko léopard et hérisson domestique, lequel est le plus lourd à l''âge adulte ?', 'Un hérisson domestique adulte pèse en moyenne 0.3-0.6 kg, bien plus qu''un canari (0.015-0.02 kg) ou un gecko léopard (0.05-0.09 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('canari', false, 2),
  ('hérisson domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, discus et pigeon, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le canari est plutôt solitaire à l''état naturel, alors que le discus et le pigeon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('pigeon', false, 2),
  ('canari', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, cochon d''Inde et cheval, lequel est le plus léger à l''âge adulte ?', 'Un hérisson domestique adulte pèse en moyenne 0.3-0.6 kg, nettement moins que le cochon d''Inde et le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', true, 1),
  ('cheval', false, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), canari et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le perroquet gris du Gabon vit environ 40-60 ans, contre 2-4 ans pour le betta (combattant) et 8-12 ans pour le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('perroquet gris du Gabon', true, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, chinchilla et escargot petit-gris, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le canari est plutôt solitaire à l''état naturel, alors que le chinchilla et l''escargot petit-gris sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('canari', true, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi canari, grenouille griffue (Xenopus) et poule, lequel a un régime alimentaire strictement carnivore ?', 'La grenouille griffue (Xenopus) est carnivore, alors que le canari est granivore et la poule est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', true, 1),
  ('poule', false, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, furet et vache, lequel a la gestation la plus longue ?', 'La gestation dure environ 279-292 jours chez la vache, contre 33-37 jours chez l''hérisson domestique et 41-43 jours chez le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', true, 1),
  ('furet', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi escargot petit-gris, mouton et tortue terrestre, lequel est principalement actif la nuit (nocturne) ?', 'L''escargot petit-gris est nocturne, alors que le mouton est plutôt diurne et la tortue terrestre plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('tortue terrestre', false, 2),
  ('escargot petit-gris', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un cochon ?', 'Chez le cochon, un groin sec et chaud associé à un refus de se lever.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un cou maintenu tordu ou penché de façon permanente', false, 1),
  ('un arrachage répété de ses propres plumes', false, 2),
  ('un groin sec et chaud associé à un refus de se lever', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un aquarium bien couvert : elle est capable de sauter hors de l''eau si le couvercle n''est pas hermétique » ?', 'Cette description correspond au grenouille griffue (Xenopus).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('grenouille griffue (Xenopus)', true, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi axolotl, pigeon et tortue terrestre, lequel a un régime alimentaire strictement herbivore ?', 'La tortue terrestre est herbivore, alors que l''axolotl est carnivore et le pigeon est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('tortue terrestre', true, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, lapin et mouton, lequel est le plus lourd à l''âge adulte ?', 'Un mouton adulte pèse en moyenne 45-100 kg, bien plus qu''un discus (0.1-0.3 kg) ou un lapin (1.2-2.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('discus', false, 2),
  ('mouton', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), dindon et hamster syrien, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le dindon est grégaire et a besoin de compagnie de son espèce, alors que le betta (combattant) et l''hamster syrien vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('hamster syrien', false, 2),
  ('dindon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chat, chinchilla et cheval, lequel a la gestation la plus longue ?', 'La gestation dure environ 330-345 jours chez le cheval, contre 63-67 jours chez le chat et 105-115 jours chez le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', true, 1),
  ('chinchilla', false, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, souris domestique et vache, lequel est principalement actif la nuit (nocturne) ?', 'La souris domestique est nocturne, alors que l''abeille domestique est plutôt diurne et la vache plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('abeille domestique', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi cheval, gecko léopard et poisson rouge, lequel a un régime alimentaire strictement herbivore ?', 'Le cheval est herbivore, alors que le gecko léopard est insectivore et le poisson rouge est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('gecko léopard', false, 2),
  ('cheval', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), rat domestique et vache, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'La mouche soldat noire (larves) est un insecte, alors que le rat domestique et la vache sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', true, 1),
  ('vache', false, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), furet et canari, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le betta (combattant) vit environ 2-4 ans, nettement moins que le furet et le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', true, 1),
  ('canari', false, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « des plumes ternes qui ne repoussent plus imperméables (perte d''étanchéité du plumage) » ?', 'Ce signe d''alerte concerne le canard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('canard', true, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), perruche ondulée et tortue aquatique (Trachemys), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue aquatique (Trachemys), contre 2-3 jours chez le betta (combattant) et 17-19 jours chez la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('betta (combattant)', false, 2),
  ('tortue aquatique (Trachemys)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi grenouille griffue (Xenopus), tortue aquatique (Trachemys) et cheval, lequel est le plus léger à l''âge adulte ?', 'Une grenouille griffue (Xenopus) adulte pèse en moyenne 0.06-0.15 kg, nettement moins que la tortue aquatique (Trachemys) et le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', true, 1),
  ('cheval', false, 2),
  ('tortue aquatique (Trachemys)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, chien et chat, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le chat vit environ 13-17 ans, contre 2-4 ans pour la gerbille et 10-13 ans pour le chien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', true, 1),
  ('gerbille', false, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouton, furet et souris domestique, lequel a en moyenne les portées les plus nombreuses ?', 'La souris domestique a en moyenne 4-8 petits par portée, contre 1-3 pour le mouton et 3-7 pour le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('mouton', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « des nageoires repliées en permanence contre le corps » ?', 'Ce signe d''alerte concerne le betta (combattant).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('perruche ondulée', false, 2),
  ('betta (combattant)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi gecko léopard, lapin et perruche ondulée, lequel a un régime alimentaire strictement herbivore ?', 'Le lapin est herbivore, alors que le gecko léopard est insectivore et la perruche ondulée est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('gecko léopard', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, discus et dindon, lequel est le plus lourd à l''âge adulte ?', 'Un dindon adulte pèse en moyenne 5-12 kg, bien plus qu''une gerbille (0.08-0.12 kg) ou un discus (0.1-0.3 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('dindon', true, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chien, chinchilla et âne, lequel a la gestation la plus longue ?', 'La gestation dure environ 365-375 jours chez l''âne, contre 58-68 jours chez le chien et 105-115 jours chez le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('âne', true, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un chinchilla ?', 'Chez le chinchilla, un bain de sable spécial régulier pour entretenir son pelage très dense, sans jamais le mouiller.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un bain de sable spécial régulier pour entretenir son pelage très dense, sans jamais le mouiller', true, 1),
  ('un espace suffisant pour parader : le comportement de parade fait partie de ses besoins sociaux', false, 2),
  ('un éclairage UVB adapté, indispensable pour synthétiser la vitamine D3 et fixer le calcium', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour une gerbille ?', 'Chez la gerbille, un substrat profond pour creuser des galeries, son comportement naturel principal.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un substrat profond pour creuser des galeries, son comportement naturel principal', true, 1),
  ('une eau maintenue sous 22°C : au-delà, son métabolisme se dérègle et son immunité chute fortement', false, 2),
  ('du foin à volonté et un espace assez grand pour faire au moins trois bonds à la suite', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), canari et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le betta (combattant) vit environ 2-4 ans, nettement moins que le canari et le perroquet gris du Gabon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('canari', false, 2),
  ('betta (combattant)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, chien et serpent des blés (couleuvre), lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que le canari est plutôt diurne et le chien plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('canari', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perroquet gris du Gabon, furet et vache, lequel est le plus lourd à l''âge adulte ?', 'Une vache adulte pèse en moyenne 500-800 kg, bien plus qu''un perroquet gris du Gabon (0.4-0.55 kg) ou un furet (0.7-2 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', true, 1),
  ('perroquet gris du Gabon', false, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi âne, gerbille et serpent des blés (couleuvre), lequel a un régime alimentaire strictement herbivore ?', 'L''âne est herbivore, alors que la gerbille est omnivore et le serpent des blés (couleuvre) est carnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', true, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hamster syrien, perroquet gris du Gabon et vache, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hamster syrien est plutôt solitaire à l''état naturel, alors que le perroquet gris du Gabon et la vache sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('perroquet gris du Gabon', false, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, gecko léopard et pogona (dragon barbu), lequel est le plus léger à l''âge adulte ?', 'Une abeille domestique adulte pèse en moyenne 0.0001-0.0001 kg, nettement moins que le gecko léopard et le pogona (dragon barbu).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', true, 1),
  ('gecko léopard', false, 2),
  ('pogona (dragon barbu)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi pigeon, tortue aquatique (Trachemys) et tortue terrestre, lequel a un régime alimentaire strictement herbivore ?', 'La tortue terrestre est herbivore, alors que le pigeon est granivore et la tortue aquatique (Trachemys) est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('tortue terrestre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « l''avocat et les épluchures de pomme de terre crue » ?', 'Cette toxicité est documentée chez la tortue terrestre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('lapin', false, 2),
  ('chèvre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, furet et tortue terrestre, lequel est principalement actif le jour (diurne) ?', 'La tortue terrestre est diurne, alors que le chat est plutôt crepusculaire et le furet plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('chat', false, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouton, oie et serpent des blés (couleuvre), lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le serpent des blés (couleuvre) vit environ 15-20 ans, contre 10-12 ans pour le mouton et 15-20 ans pour l''oie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', true, 1),
  ('oie', false, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hamster syrien, perroquet gris du Gabon et rat domestique, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hamster syrien est plutôt solitaire à l''état naturel, alors que le perroquet gris du Gabon et le rat domestique sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('perroquet gris du Gabon', false, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un hamster syrien, laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 1),
  ('Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.', true, 2),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), serpent des blés (couleuvre) et cochon d''Inde, lequel est le plus lourd à l''âge adulte ?', 'Un cochon d''Inde adulte pèse en moyenne 0.7-1.2 kg, bien plus qu''une mouche soldat noire (larves) (0.0001-0.0002 kg) ou un serpent des blés (couleuvre) (0.15-0.45 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', true, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('mouche soldat noire (larves)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez une perruche ondulée ?', 'Chez la perruche ondulée, des plumes gonflées en permanence associées à une position prostrée au fond de la cage.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('des plumes gonflées en permanence associées à une position prostrée au fond de la cage', true, 1),
  ('un cou maintenu tordu ou penché de façon permanente', false, 2),
  ('une immobilité prolongée et un refus de s''alimenter (l''âne masque très bien la douleur)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cochon d''Inde, cochon et serpent des blés (couleuvre), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le serpent des blés (couleuvre) est plutôt solitaire à l''état naturel, alors que le cochon d''Inde et le cochon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('cochon d''Inde', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), poule et lapin, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le betta (combattant) vit environ 2-4 ans, nettement moins que la poule et le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', true, 1),
  ('lapin', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, poisson rouge et perruche ondulée, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 17-19 jours chez la perruche ondulée, contre 2-3 jours chez le discus et 4-7 jours chez le poisson rouge.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('discus', false, 2),
  ('perruche ondulée', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi lapin, souris domestique et vache, lequel est principalement actif le jour (diurne) ?', 'La vache est diurne, alors que le lapin est plutôt crepusculaire et la souris domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', true, 1),
  ('souris domestique', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, axolotl et perruche ondulée, lequel est principalement actif la nuit (nocturne) ?', 'L''axolotl est nocturne, alors que l''abeille domestique est plutôt diurne et la perruche ondulée plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('axolotl', true, 2),
  ('abeille domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi furet, lapin et mouton, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le furet vit environ 7-10 ans, nettement moins que le lapin et le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('furet', true, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une tortue terrestre, laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 1),
  ('Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.', true, 2),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, chèvre et serpent des blés (couleuvre), lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''abeille domestique vit environ 0.08-0.16 ans, nettement moins que la chèvre et le serpent des blés (couleuvre).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', true, 1),
  ('chèvre', false, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi dindon, grenouille griffue (Xenopus) et rat domestique, lequel est principalement actif le jour (diurne) ?', 'Le dindon est diurne, alors que la grenouille griffue (Xenopus) est plutôt nocturne et le rat domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('dindon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, oie et vache, lequel est principalement actif la nuit (nocturne) ?', 'L''axolotl est nocturne, alors que l''oie est plutôt diurne et la vache plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('axolotl', true, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, mouton et cochon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le cochon vit environ 10-15 ans, contre 1.5-2.5 ans pour la souris domestique et 10-12 ans pour le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('souris domestique', false, 2),
  ('cochon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour une abeille domestique ?', 'Chez l''abeille domestique, les pesticides néonicotinoïdes (hautement toxiques même à faible dose) est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('la pomme sans les pépins', false, 1),
  ('le blanc de poulet cuit et non assaisonné', false, 2),
  ('les pesticides néonicotinoïdes (hautement toxiques même à faible dose)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi âne, cheval et rat domestique, lequel est principalement actif la nuit (nocturne) ?', 'Le rat domestique est nocturne, alors que l''âne est plutôt diurne et le cheval plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('âne', false, 2),
  ('rat domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, grenouille griffue (Xenopus) et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''escargot petit-gris vit environ 5-8 ans, nettement moins que la grenouille griffue (Xenopus) et le perroquet gris du Gabon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), chinchilla et tortue terrestre, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la tortue terrestre vit environ 50-80 ans, contre 0.15-0.3 ans pour la mouche soldat noire (larves) et 10-15 ans pour le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('mouche soldat noire (larves)', false, 2),
  ('tortue terrestre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, canard et tortue terrestre, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue terrestre, contre 13-14 jours chez le canari et 26-28 jours chez le canard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('canari', false, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « l''avocat (persine, toxique pour les oiseaux) » ?', 'Cette toxicité est documentée chez la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', true, 1),
  ('abeille domestique', false, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gecko léopard, hamster syrien et lapin, lequel est le plus léger à l''âge adulte ?', 'Un gecko léopard adulte pèse en moyenne 0.05-0.09 kg, nettement moins que l''hamster syrien et le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('hamster syrien', false, 2),
  ('gecko léopard', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, chat et cochon, lequel a la gestation la plus longue ?', 'La gestation dure environ 112-115 jours chez le cochon, contre 21-23 jours chez le rat domestique et 63-67 jours chez le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('cochon', true, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « un refus de sortir de son abri même sous la lampe chauffante depuis plusieurs jours » ?', 'Ce signe d''alerte concerne la tortue terrestre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', false, 1),
  ('abeille domestique', false, 2),
  ('tortue terrestre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, grenouille griffue (Xenopus) et oie, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 28-33 jours chez l''oie, contre 2-3 jours chez le discus et 4-6 jours chez la grenouille griffue (Xenopus).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('oie', true, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi perruche ondulée, poisson rouge et vache, lequel a un régime alimentaire strictement herbivore ?', 'La vache est herbivore, alors que la perruche ondulée est granivore et le poisson rouge est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('perruche ondulée', false, 2),
  ('vache', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, perroquet gris du Gabon et lapin, lequel est le plus léger à l''âge adulte ?', 'Un axolotl adulte pèse en moyenne 0.06-0.15 kg, nettement moins que le perroquet gris du Gabon et le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('lapin', false, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un âne ?', 'Chez l''âne, une immobilité prolongée et un refus de s''alimenter (l''âne masque très bien la douleur).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une immobilité prolongée et un refus de s''alimenter (l''âne masque très bien la douleur)', true, 1),
  ('une nage constamment en surface avec la bouche qui happe l''air (manque d''oxygène dissous)', false, 2),
  ('des tentatives répétées de se rouler par terre associées à des regards vers le flanc (signes de coliques, urgence)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, furet et pigeon, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''axolotl est plutôt solitaire à l''état naturel, alors que le furet et le pigeon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('pigeon', false, 2),
  ('axolotl', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi lapin, cochon d''Inde et âne, lequel a la gestation la plus longue ?', 'La gestation dure environ 365-375 jours chez l''âne, contre 28-33 jours chez le lapin et 59-72 jours chez le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('cochon d''Inde', false, 2),
  ('âne', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, canari et souris domestique, lequel est principalement actif la nuit (nocturne) ?', 'La souris domestique est nocturne, alors que l''abeille domestique est plutôt diurne et le canari plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', true, 1),
  ('canari', false, 2),
  ('abeille domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, tortue aquatique (Trachemys) et furet, lequel est le plus lourd à l''âge adulte ?', 'Un furet adulte pèse en moyenne 0.7-2 kg, bien plus qu''un hamster syrien (0.1-0.15 kg) ou une tortue aquatique (Trachemys) (0.3-1 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', true, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un accès à un point d''eau pour boire par aspiration continue, une particularité rare chez les oiseaux » ?', 'Cette description correspond au pigeon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('mouton', false, 2),
  ('pigeon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une coquille qui reste operculée en permanence même après réhydratation » ?', 'Ce signe d''alerte concerne l''escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('tortue terrestre', false, 2),
  ('escargot petit-gris', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, rat domestique et tortue terrestre, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la tortue terrestre vit environ 50-80 ans, contre 2-3 ans pour l''hamster syrien et 2-3 ans pour le rat domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('rat domestique', false, 2),
  ('tortue terrestre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 13)', 'La détention de certaines espèces non domestiques est soumise à un régime d''autorisation ou de déclaration selon leur dangerosité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Aucune formation n''est jamais nécessaire pour exercer une activité professionnelle liée aux animaux de compagnie.', false, 1),
  ('La détention de certaines espèces non domestiques est soumise à un régime d''autorisation ou de déclaration selon leur dangerosité.', true, 2),
  ('Les pensions et refuges qui accueillent des animaux ne sont soumis à aucune règle sanitaire particulière.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi âne, axolotl et poisson rouge, lequel est principalement actif la nuit (nocturne) ?', 'L''axolotl est nocturne, alors que l''âne est plutôt diurne et le poisson rouge plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('poisson rouge', false, 2),
  ('axolotl', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, gerbille et lapin, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le discus est un poisson, alors que la gerbille et le lapin sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', true, 1),
  ('gerbille', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), serpent des blés (couleuvre) et cochon d''Inde, lequel est le plus léger à l''âge adulte ?', 'Une mouche soldat noire (larves) adulte pèse en moyenne 0.0001-0.0002 kg, nettement moins que le serpent des blés (couleuvre) et le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('cochon d''Inde', false, 2),
  ('mouche soldat noire (larves)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, rat domestique et lapin, lequel a la gestation la plus longue ?', 'La gestation dure environ 28-33 jours chez le lapin, contre 19-21 jours chez la souris domestique et 21-23 jours chez le rat domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('lapin', true, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi grenouille griffue (Xenopus), hérisson domestique et tortue terrestre, lequel a un régime alimentaire strictement herbivore ?', 'La tortue terrestre est herbivore, alors que la grenouille griffue (Xenopus) est carnivore et l''hérisson domestique est insectivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('hérisson domestique', false, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi grenouille griffue (Xenopus), poisson rouge et perruche ondulée, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 17-19 jours chez la perruche ondulée, contre 4-6 jours chez la grenouille griffue (Xenopus) et 4-7 jours chez le poisson rouge.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('poisson rouge', false, 2),
  ('perruche ondulée', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, hérisson domestique et rat domestique, lequel a en moyenne les portées les plus nombreuses ?', 'Le rat domestique a en moyenne 6-12 petits par portée, contre 1-4 pour le cochon d''Inde et 2-5 pour l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('hérisson domestique', false, 2),
  ('rat domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi canari, chat et hérisson domestique, lequel a un régime alimentaire strictement carnivore ?', 'Le chat est carnivore, alors que le canari est granivore et l''hérisson domestique est insectivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('canari', false, 2),
  ('chat', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez une tortue terrestre ?', 'Chez la tortue terrestre, un refus de sortir de son abri même sous la lampe chauffante depuis plusieurs jours.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('des branchies qui se recroquevillent ou pâlissent (souvent lié à une eau trop chaude ou de mauvaise qualité)', false, 1),
  ('des zones de pelage arraché ou clairsemé (souvent lié au stress ou à un environnement trop humide)', false, 2),
  ('un refus de sortir de son abri même sous la lampe chauffante depuis plusieurs jours', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi âne, furet et hamster syrien, lequel a un régime alimentaire strictement herbivore ?', 'L''âne est herbivore, alors que le furet est carnivore et l''hamster syrien est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('furet', false, 2),
  ('âne', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi vache, chèvre et hérisson domestique, lequel a en moyenne les portées les plus nombreuses ?', 'L''hérisson domestique a en moyenne 2-5 petits par portée, contre 1-1 pour la vache et 1-3 pour la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('chèvre', false, 2),
  ('hérisson domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, chinchilla et rat domestique, lequel est principalement actif le jour (diurne) ?', 'Le canari est diurne, alors que le chinchilla est plutôt crepusculaire et le rat domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('rat domestique', false, 2),
  ('canari', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi perroquet gris du Gabon, perruche ondulée et serpent des blés (couleuvre), lequel a un régime alimentaire strictement carnivore ?', 'Le serpent des blés (couleuvre) est carnivore, alors que le perroquet gris du Gabon est omnivore et la perruche ondulée est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', true, 1),
  ('perroquet gris du Gabon', false, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canard, chien et gecko léopard, lequel est principalement actif la nuit (nocturne) ?', 'Le gecko léopard est nocturne, alors que le canard est plutôt diurne et le chien plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('canard', false, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chat, cochon et vache, lequel a la gestation la plus longue ?', 'La gestation dure environ 279-292 jours chez la vache, contre 63-67 jours chez le chat et 112-115 jours chez le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', true, 1),
  ('cochon', false, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, cochon d''Inde et souris domestique, lequel est principalement actif le jour (diurne) ?', 'La chèvre est diurne, alors que le cochon d''Inde est plutôt crepusculaire et la souris domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', true, 1),
  ('cochon d''Inde', false, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, chinchilla et discus, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''axolotl est plutôt solitaire à l''état naturel, alors que le chinchilla et le discus sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('chinchilla', false, 2),
  ('discus', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est fausse ? (affirmation 2)', 'L''identification des chiens et chats par puce électronique est facultative en toutes circonstances.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un professionnel qui vend des chiens ou des chats doit tenir un registre d''entrées et de sorties des animaux.', false, 1),
  ('L''identification des chiens et chats par puce électronique est facultative en toutes circonstances.', true, 2),
  ('Un professionnel du secteur animalier peut voir son ACACED retirée en cas de manquement grave aux règles de bien-être animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canard, furet et gecko léopard, lequel est principalement actif le jour (diurne) ?', 'Le canard est diurne, alors que le furet est plutôt crepusculaire et le gecko léopard plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('canard', true, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi chat, escargot petit-gris et tortue aquatique (Trachemys), lequel a un régime alimentaire strictement herbivore ?', 'L''escargot petit-gris est herbivore, alors que le chat est carnivore et la tortue aquatique (Trachemys) est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('chat', false, 2),
  ('escargot petit-gris', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, perroquet gris du Gabon et tortue terrestre, lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue terrestre est plutôt solitaire à l''état naturel, alors que l''abeille domestique et le perroquet gris du Gabon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('tortue terrestre', true, 2),
  ('abeille domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une tortue aquatique (Trachemys), laquelle de ces affirmations est exacte ? (variante 1)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 2),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi discus, lapin et tortue terrestre, lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue terrestre est plutôt solitaire à l''état naturel, alors que le discus et le lapin sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('discus', false, 2),
  ('tortue terrestre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un cochon d''Inde, laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 2),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), gecko léopard et chèvre, lequel est le plus lourd à l''âge adulte ?', 'Une chèvre adulte pèse en moyenne 30-65 kg, bien plus qu''un betta (combattant) (0.005-0.01 kg) ou un gecko léopard (0.05-0.09 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', true, 1),
  ('betta (combattant)', false, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « un morceau de mue qui reste collé sur les doigts ou la queue plusieurs jours après la mue » ?', 'Ce signe d''alerte concerne le gecko léopard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('discus', false, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « de nombreuses cachettes : c''est une espèce proie qui a besoin de se sentir protégée » ?', 'Cette description correspond au souris domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('souris domestique', true, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouton, hérisson domestique et rat domestique, lequel a en moyenne les portées les plus nombreuses ?', 'Le rat domestique a en moyenne 6-12 petits par portée, contre 1-3 pour le mouton et 2-5 pour l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('rat domestique', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), perruche ondulée et rat domestique, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le betta (combattant) est plutôt solitaire à l''état naturel, alors que la perruche ondulée et le rat domestique sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', true, 1),
  ('perruche ondulée', false, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi escargot petit-gris, grenouille griffue (Xenopus) et tortue terrestre, lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue terrestre est plutôt solitaire à l''état naturel, alors que l''escargot petit-gris et la grenouille griffue (Xenopus) sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('tortue terrestre', true, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi poisson rouge, perruche ondulée et tortue terrestre, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue terrestre, contre 4-7 jours chez le poisson rouge et 17-19 jours chez la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('tortue terrestre', true, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, axolotl et mouche soldat noire (larves), lequel n''appartient pas à la même classe biologique que les deux autres ?', 'L''axolotl est un amphibien, alors que l''abeille domestique et la mouche soldat noire (larves) sont tous les deux des insectes.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('abeille domestique', false, 2),
  ('mouche soldat noire (larves)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, axolotl et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le perroquet gris du Gabon vit environ 40-60 ans, contre 5-8 ans pour le cochon d''Inde et 10-15 ans pour l''axolotl.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', true, 1),
  ('axolotl', false, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, escargot petit-gris et rat domestique, lequel est principalement actif le jour (diurne) ?', 'Le canari est diurne, alors que l''escargot petit-gris est plutôt nocturne et le rat domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('escargot petit-gris', false, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi âne, chinchilla et hamster syrien, lequel a en moyenne les portées les plus nombreuses ?', 'L''hamster syrien a en moyenne 4-10 petits par portée, contre 1-1 pour l''âne et 1-3 pour le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('chinchilla', false, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un discus ?', 'Chez le discus, une couleur qui s''assombrit fortement de façon durable (stress ou maladie).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un pelage humide autour du nez et des yeux (souvent lié à une allergie à la poussière de son substrat)', false, 1),
  ('une couleur qui s''assombrit fortement de façon durable (stress ou maladie)', true, 2),
  ('une absence totale d''émission d''urine pendant plus de 24 h (suspicion d''obstruction urinaire, urgence vitale)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « la présence d''autres moutons : l''isolement social est une source de stress majeure pour cette espèce grégaire » ?', 'Cette description correspond au mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('chèvre', false, 2),
  ('mouton', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, dindon et chat, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''hamster syrien vit environ 2-3 ans, nettement moins que le dindon et le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('dindon', false, 1),
  ('chat', false, 2),
  ('hamster syrien', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, cochon d''Inde et rat domestique, lequel est principalement actif le jour (diurne) ?', 'Le canari est diurne, alors que le cochon d''Inde est plutôt crepusculaire et le rat domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('canari', true, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, perruche ondulée et abeille domestique, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 20-24 jours chez l''abeille domestique, contre 13-14 jours chez le canari et 17-19 jours chez la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', true, 1),
  ('canari', false, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), serpent des blés (couleuvre) et tortue aquatique (Trachemys), lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la tortue aquatique (Trachemys) vit environ 20-30 ans, contre 0.15-0.3 ans pour la mouche soldat noire (larves) et 15-20 ans pour le serpent des blés (couleuvre).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('mouche soldat noire (larves)', false, 2),
  ('tortue aquatique (Trachemys)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, lapin et âne, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''âne vit environ 25-35 ans, contre 4-6 ans pour l''hérisson domestique et 8-12 ans pour le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', true, 1),
  ('hérisson domestique', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chèvre, discus et chat, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le chat vit environ 13-17 ans, contre 10-15 ans pour la chèvre et 10-15 ans pour le discus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', true, 1),
  ('discus', false, 2),
  ('chèvre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, canard et perroquet gris du Gabon, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'L''axolotl est un amphibien, alors que le canard et le perroquet gris du Gabon sont tous les deux des oiseaus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('axolotl', true, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, discus et hérisson domestique, lequel est principalement actif la nuit (nocturne) ?', 'L''hérisson domestique est nocturne, alors que le chat est plutôt crepusculaire et le discus plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('hérisson domestique', true, 2),
  ('discus', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, poisson rouge et hérisson domestique, lequel est le plus lourd à l''âge adulte ?', 'Un hérisson domestique adulte pèse en moyenne 0.3-0.6 kg, bien plus qu''un discus (0.1-0.3 kg) ou un poisson rouge (0.1-0.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('hérisson domestique', true, 2),
  ('poisson rouge', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), canari et cochon d''Inde, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le cochon d''Inde est grégaire et a besoin de compagnie de son espèce, alors que le betta (combattant) et le canari vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('canari', false, 2),
  ('cochon d''Inde', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi âne, betta (combattant) et hérisson domestique, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le betta (combattant) est un poisson, alors que l''âne et l''hérisson domestique sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('âne', false, 2),
  ('betta (combattant)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un dindon, laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, canard et oie, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 28-33 jours chez l''oie, contre 13-14 jours chez le canari et 26-28 jours chez le canard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', true, 1),
  ('canari', false, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chinchilla, chat et hamster syrien, lequel a en moyenne les portées les plus nombreuses ?', 'L''hamster syrien a en moyenne 4-10 petits par portée, contre 1-3 pour le chinchilla et 1-6 pour le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('hamster syrien', true, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, pigeon et cochon, lequel est le plus lourd à l''âge adulte ?', 'Un cochon adulte pèse en moyenne 50-350 kg, bien plus qu''un hamster syrien (0.1-0.15 kg) ou un pigeon (0.3-0.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', true, 1),
  ('pigeon', false, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, poisson rouge et dindon, lequel est le plus lourd à l''âge adulte ?', 'Un dindon adulte pèse en moyenne 5-12 kg, bien plus qu''un canari (0.015-0.02 kg) ou un poisson rouge (0.1-0.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('dindon', true, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi âne, chèvre et hérisson domestique, lequel est principalement actif la nuit (nocturne) ?', 'L''hérisson domestique est nocturne, alors que l''âne est plutôt diurne et la chèvre plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('chèvre', false, 2),
  ('hérisson domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, gecko léopard et serpent des blés (couleuvre), lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le serpent des blés (couleuvre) vit environ 15-20 ans, contre 0.08-0.16 ans pour l''abeille domestique et 15-20 ans pour le gecko léopard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', false, 1),
  ('gecko léopard', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, furet et chèvre, lequel a la gestation la plus longue ?', 'La gestation dure environ 145-155 jours chez la chèvre, contre 16-18 jours chez l''hamster syrien et 41-43 jours chez le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('chèvre', true, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), grenouille griffue (Xenopus) et axolotl, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 14-21 jours chez l''axolotl, contre 2-3 jours chez le betta (combattant) et 4-6 jours chez la grenouille griffue (Xenopus).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('axolotl', true, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une position voûtée avec les dents grinçantes, signe fréquent de douleur abdominale » ?', 'Ce signe d''alerte concerne la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('chèvre', true, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gecko léopard, hérisson domestique et souris domestique, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'La souris domestique est grégaire et a besoin de compagnie de son espèce, alors que le gecko léopard et l''hérisson domestique vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('gecko léopard', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gecko léopard, rat domestique et vache, lequel est principalement actif le jour (diurne) ?', 'La vache est diurne, alors que le gecko léopard est plutôt nocturne et le rat domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('rat domestique', false, 2),
  ('vache', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, furet et chat, lequel a la gestation la plus longue ?', 'La gestation dure environ 63-67 jours chez le chat, contre 21-23 jours chez le rat domestique et 41-43 jours chez le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('chat', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chinchilla, chat et rat domestique, lequel a en moyenne les portées les plus nombreuses ?', 'Le rat domestique a en moyenne 6-12 petits par portée, contre 1-3 pour le chinchilla et 1-6 pour le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('chat', false, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi pogona (dragon barbu), cochon et gecko léopard, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le gecko léopard vit environ 15-20 ans, contre 8-12 ans pour le pogona (dragon barbu) et 10-15 ans pour le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('gecko léopard', true, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, axolotl et poisson rouge, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le poisson rouge vit environ 10-15 ans, contre 2-4 ans pour la gerbille et 10-15 ans pour l''axolotl.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('axolotl', false, 2),
  ('poisson rouge', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi chat, discus et pigeon, lequel a un régime alimentaire strictement carnivore ?', 'Le chat est carnivore, alors que le discus est omnivore et le pigeon est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('discus', false, 2),
  ('chat', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un chinchilla, laquelle de ces affirmations est exacte ? (variante 2)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi cheval, chien et grenouille griffue (Xenopus), lequel a un régime alimentaire strictement carnivore ?', 'La grenouille griffue (Xenopus) est carnivore, alors que le cheval est herbivore et le chien est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', true, 1),
  ('chien', false, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gecko léopard, hamster syrien et lapin, lequel est le plus lourd à l''âge adulte ?', 'Un lapin adulte pèse en moyenne 1.2-2.5 kg, bien plus qu''un gecko léopard (0.05-0.09 kg) ou un hamster syrien (0.1-0.15 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('hamster syrien', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un hérisson domestique, laquelle de ces affirmations est exacte ? (variante 2)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi lapin, cochon d''Inde et mouton, lequel a la gestation la plus longue ?', 'La gestation dure environ 144-152 jours chez le mouton, contre 28-33 jours chez le lapin et 59-72 jours chez le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('mouton', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, lapin et pigeon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''escargot petit-gris vit environ 5-8 ans, nettement moins que le lapin et le pigeon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('escargot petit-gris', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canard, chat et pigeon, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le chat est un mammifère, alors que le canard et le pigeon sont tous les deux des oiseaus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', true, 1),
  ('canard', false, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi vache, chinchilla et hamster syrien, lequel a en moyenne les portées les plus nombreuses ?', 'L''hamster syrien a en moyenne 4-10 petits par portée, contre 1-1 pour la vache et 1-3 pour le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('chinchilla', false, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi dindon, furet et rat domestique, lequel est principalement actif la nuit (nocturne) ?', 'Le rat domestique est nocturne, alors que le dindon est plutôt diurne et le furet plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('dindon', false, 2),
  ('rat domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi escargot petit-gris, furet et perroquet gris du Gabon, lequel est principalement actif le jour (diurne) ?', 'Le perroquet gris du Gabon est diurne, alors que l''escargot petit-gris est plutôt nocturne et le furet plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('perroquet gris du Gabon', true, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi perruche ondulée, rat domestique et tortue terrestre, lequel est principalement actif la nuit (nocturne) ?', 'Le rat domestique est nocturne, alors que la perruche ondulée est plutôt diurne et la tortue terrestre plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('tortue terrestre', false, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, poule et escargot petit-gris, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 15-30 jours chez l''escargot petit-gris, contre 2-3 jours chez le discus et 20-21 jours chez la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', false, 1),
  ('discus', false, 2),
  ('escargot petit-gris', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, mouche soldat noire (larves) et poule, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la poule vit environ 5-10 ans, contre 0.08-0.16 ans pour l''abeille domestique et 0.15-0.3 ans pour la mouche soldat noire (larves).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', false, 1),
  ('poule', true, 2),
  ('mouche soldat noire (larves)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un hamster syrien ?', 'Chez l''hamster syrien, une bosse ou un renflement dans les bajoues qui ne se résorbe pas (abcès buccal possible).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une bosse ou un renflement dans les bajoues qui ne se résorbe pas (abcès buccal possible)', true, 1),
  ('une boiterie soudaine associée à un isolement du reste du troupeau', false, 2),
  ('des tentatives répétées de se rouler par terre associées à des regards vers le flanc (signes de coliques, urgence)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 16)', 'Une structure de vente d''animaux doit pouvoir présenter l''origine et l''historique sanitaire des animaux proposés.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Les obligations réglementaires sur les animaux de compagnie ne concernent que les éleveurs de plus de 50 portées par an.', false, 1),
  ('Les pensions et refuges qui accueillent des animaux ne sont soumis à aucune règle sanitaire particulière.', false, 2),
  ('Une structure de vente d''animaux doit pouvoir présenter l''origine et l''historique sanitaire des animaux proposés.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, oie et cheval, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le cheval vit environ 25-30 ans, contre 10-15 ans pour l''axolotl et 15-20 ans pour l''oie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', true, 1),
  ('axolotl', false, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un hamster syrien ?', 'Chez l''hamster syrien, un logement individuel : deux hamsters syriens adultes se battent s''ils sont mis ensemble.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une cage assez longue pour voler horizontalement : contrairement à la perruche, il vit bien seul mais a besoin d''espace pour voler', false, 1),
  ('des zones en hauteur pour observer et un accès à un griffoir pour marquer et entretenir ses griffes', false, 2),
  ('un logement individuel : deux hamsters syriens adultes se battent s''ils sont mis ensemble', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), gecko léopard et discus, lequel est le plus lourd à l''âge adulte ?', 'Un discus adulte pèse en moyenne 0.1-0.3 kg, bien plus qu''une mouche soldat noire (larves) (0.0001-0.0002 kg) ou un gecko léopard (0.05-0.09 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('discus', true, 2),
  ('mouche soldat noire (larves)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi chat, gecko léopard et rat domestique, lequel a un régime alimentaire strictement carnivore ?', 'Le chat est carnivore, alors que le gecko léopard est insectivore et le rat domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('chat', true, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cheval, pogona (dragon barbu) et vache, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le pogona (dragon barbu) est un reptile, alors que le cheval et la vache sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('pogona (dragon barbu)', true, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez une oie ?', 'Chez l''oie, un cou maintenu tordu ou penché de façon permanente.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une coquille qui reste operculée en permanence même après réhydratation', false, 1),
  ('une absence totale d''émission d''urine pendant plus de 24 h (suspicion d''obstruction urinaire, urgence vitale)', false, 2),
  ('un cou maintenu tordu ou penché de façon permanente', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hamster syrien, hérisson domestique et mouche soldat noire (larves), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'La mouche soldat noire (larves) est grégaire et a besoin de compagnie de son espèce, alors que l''hamster syrien et l''hérisson domestique vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('mouche soldat noire (larves)', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, chien et souris domestique, lequel a en moyenne les portées les plus nombreuses ?', 'La souris domestique a en moyenne 4-8 petits par portée, contre 1-4 pour le cochon d''Inde et 1-8 pour le chien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('souris domestique', true, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, rat domestique et tortue aquatique (Trachemys), lequel est le plus léger à l''âge adulte ?', 'Un hamster syrien adulte pèse en moyenne 0.1-0.15 kg, nettement moins que le rat domestique et la tortue aquatique (Trachemys).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('rat domestique', false, 2),
  ('hamster syrien', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi escargot petit-gris, hérisson domestique et pogona (dragon barbu), lequel a un régime alimentaire strictement herbivore ?', 'L''escargot petit-gris est herbivore, alors que l''hérisson domestique est insectivore et le pogona (dragon barbu) est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('escargot petit-gris', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour une chèvre ?', 'Chez la chèvre, des surfaces à grimper et à explorer : c''est un animal naturellement escaladeur.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('de nombreuses cachettes : c''est une espèce proie qui a besoin de se sentir protégée', false, 1),
  ('des surfaces à grimper et à explorer : c''est un animal naturellement escaladeur', true, 2),
  ('une boîte à humidité (moss box) pour faciliter ses mues, en plus d''une zone chaude et d''une zone froide', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi mouche soldat noire (larves), perroquet gris du Gabon et serpent des blés (couleuvre), lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que la mouche soldat noire (larves) est plutôt diurne et le perroquet gris du Gabon plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', true, 1),
  ('mouche soldat noire (larves)', false, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gerbille, hamster syrien et serpent des blés (couleuvre), lequel est principalement actif le jour (diurne) ?', 'La gerbille est diurne, alors que l''hamster syrien est plutôt nocturne et le serpent des blés (couleuvre) plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('gerbille', true, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, poule et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le perroquet gris du Gabon vit environ 40-60 ans, contre 1.5-2.5 ans pour la souris domestique et 5-10 ans pour la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', true, 1),
  ('poule', false, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un cochon d''Inde, laquelle de ces affirmations est exacte ? (variante 1)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 1),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 2),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un mouton ?', 'Chez le mouton, la présence d''autres moutons : l''isolement social est une source de stress majeure pour cette espèce grégaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un espace suffisant pour parader : le comportement de parade fait partie de ses besoins sociaux', false, 1),
  ('une zone d''eau et une zone de bain de soleil hors de l''eau (berge ou plage flottante)', false, 2),
  ('la présence d''autres moutons : l''isolement social est une source de stress majeure pour cette espèce grégaire', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canard, chinchilla et gecko léopard, lequel est principalement actif la nuit (nocturne) ?', 'Le gecko léopard est nocturne, alors que le canard est plutôt diurne et le chinchilla plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('chinchilla', false, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi canari, cochon d''Inde et souris domestique, lequel a un régime alimentaire strictement herbivore ?', 'Le cochon d''Inde est herbivore, alors que le canari est granivore et la souris domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('souris domestique', false, 2),
  ('cochon d''Inde', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un mouton, laquelle de ces affirmations est exacte ? (variante 1)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 2),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi serpent des blés (couleuvre), pigeon et hérisson domestique, lequel est le plus léger à l''âge adulte ?', 'Un serpent des blés (couleuvre) adulte pèse en moyenne 0.15-0.45 kg, nettement moins que le pigeon et l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('hérisson domestique', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chèvre, cochon et discus, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le discus est un poisson, alors que la chèvre et le cochon sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('discus', true, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi âne, chèvre et tortue terrestre, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'La tortue terrestre est un reptile, alors que l''âne et la chèvre sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('âne', false, 2),
  ('tortue terrestre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, perroquet gris du Gabon et âne, lequel est le plus léger à l''âge adulte ?', 'Un canari adulte pèse en moyenne 0.015-0.02 kg, nettement moins que le perroquet gris du Gabon et l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('perroquet gris du Gabon', false, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi furet, hérisson domestique et oie, lequel est principalement actif la nuit (nocturne) ?', 'L''hérisson domestique est nocturne, alors que le furet est plutôt crepusculaire et l''oie plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('oie', false, 2),
  ('hérisson domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, escargot petit-gris et perroquet gris du Gabon, lequel est principalement actif la nuit (nocturne) ?', 'L''escargot petit-gris est nocturne, alors que l''abeille domestique est plutôt diurne et le perroquet gris du Gabon plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', true, 1),
  ('perroquet gris du Gabon', false, 2),
  ('abeille domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chinchilla, mouton et gerbille, lequel a en moyenne les portées les plus nombreuses ?', 'La gerbille a en moyenne 3-6 petits par portée, contre 1-3 pour le chinchilla et 1-3 pour le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('mouton', false, 2),
  ('gerbille', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), gerbille et cochon, lequel est le plus léger à l''âge adulte ?', 'Une mouche soldat noire (larves) adulte pèse en moyenne 0.0001-0.0002 kg, nettement moins que la gerbille et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('cochon', false, 2),
  ('mouche soldat noire (larves)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi discus, grenouille griffue (Xenopus) et hamster syrien, lequel est principalement actif le jour (diurne) ?', 'Le discus est diurne, alors que la grenouille griffue (Xenopus) est plutôt nocturne et l''hamster syrien plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('discus', true, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gecko léopard, gerbille et vache, lequel est principalement actif la nuit (nocturne) ?', 'Le gecko léopard est nocturne, alors que la gerbille est plutôt diurne et la vache plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('vache', false, 2),
  ('gecko léopard', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un serpent des blés (couleuvre), laquelle de ces affirmations est exacte ? (variante 2)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, serpent des blés (couleuvre) et cheval, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le canari vit environ 8-12 ans, nettement moins que le serpent des blés (couleuvre) et le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('canari', true, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un axolotl, laquelle de ces affirmations est exacte ? (variante 1)', 'Un animal transporté doit pouvoir accéder à de l''eau lors des trajets longs, notamment par forte chaleur.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal transporté doit pouvoir accéder à de l''eau lors des trajets longs, notamment par forte chaleur.', true, 1),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 2),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, dindon et poule, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le cochon d''Inde est un mammifère, alors que le dindon et la poule sont tous les deux des oiseaus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('dindon', false, 1),
  ('cochon d''Inde', true, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chien, grenouille griffue (Xenopus) et tortue terrestre, lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue terrestre est plutôt solitaire à l''état naturel, alors que le chien et la grenouille griffue (Xenopus) sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('chien', false, 2),
  ('tortue terrestre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une couleur qui s''assombrit fortement de façon durable (stress ou maladie) » ?', 'Ce signe d''alerte concerne le discus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', true, 1),
  ('canard', false, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, serpent des blés (couleuvre) et tortue terrestre, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue terrestre, contre 14-21 jours chez l''axolotl et 55-65 jours chez le serpent des blés (couleuvre).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('tortue terrestre', true, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chinchilla, gerbille et souris domestique, lequel a en moyenne les portées les plus nombreuses ?', 'La souris domestique a en moyenne 4-8 petits par portée, contre 1-3 pour le chinchilla et 3-6 pour la gerbille.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('souris domestique', true, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi poule, perruche ondulée et pigeon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le pigeon vit environ 5-15 ans, contre 5-10 ans pour la poule et 7-10 ans pour la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('poule', false, 2),
  ('pigeon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est fausse ? (affirmation 5)', 'Les obligations réglementaires sur les animaux de compagnie ne concernent que les éleveurs de plus de 50 portées par an.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('La vente de chiens ou de chats entre particuliers est encadrée : un numéro d''identification (puce ou tatouage) doit être communiqué à l''acheteur.', false, 1),
  ('Une structure de vente d''animaux doit pouvoir présenter l''origine et l''historique sanitaire des animaux proposés.', false, 2),
  ('Les obligations réglementaires sur les animaux de compagnie ne concernent que les éleveurs de plus de 50 portées par an.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi chat, escargot petit-gris et tortue aquatique (Trachemys), lequel a un régime alimentaire strictement carnivore ?', 'Le chat est carnivore, alors que l''escargot petit-gris est herbivore et la tortue aquatique (Trachemys) est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('escargot petit-gris', false, 2),
  ('chat', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi oie, perruche ondulée et pogona (dragon barbu), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le pogona (dragon barbu) est plutôt solitaire à l''état naturel, alors que l''oie et la perruche ondulée sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('pogona (dragon barbu)', true, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chat, hérisson domestique et hamster syrien, lequel a en moyenne les portées les plus nombreuses ?', 'L''hamster syrien a en moyenne 4-10 petits par portée, contre 1-6 pour le chat et 2-5 pour l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('hérisson domestique', false, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, souris domestique et poule, lequel est le plus léger à l''âge adulte ?', 'Un canari adulte pèse en moyenne 0.015-0.02 kg, nettement moins que la souris domestique et la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', false, 1),
  ('canari', true, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « des zones en hauteur pour observer et un accès à un griffoir pour marquer et entretenir ses griffes » ?', 'Cette description correspond au chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('chat', true, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), hérisson domestique et chinchilla, lequel est le plus lourd à l''âge adulte ?', 'Un chinchilla adulte pèse en moyenne 0.4-0.6 kg, bien plus qu''une mouche soldat noire (larves) (0.0001-0.0002 kg) ou un hérisson domestique (0.3-0.6 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('chinchilla', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, hérisson domestique et tortue aquatique (Trachemys), lequel est principalement actif le jour (diurne) ?', 'La tortue aquatique (Trachemys) est diurne, alors que le chat est plutôt crepusculaire et l''hérisson domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', true, 1),
  ('chat', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gecko léopard, poule et serpent des blés (couleuvre), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'La poule est grégaire et a besoin de compagnie de son espèce, alors que le gecko léopard et le serpent des blés (couleuvre) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('poule', true, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gecko léopard, serpent des blés (couleuvre) et cochon, lequel est le plus lourd à l''âge adulte ?', 'Un cochon adulte pèse en moyenne 50-350 kg, bien plus qu''un gecko léopard (0.05-0.09 kg) ou un serpent des blés (couleuvre) (0.15-0.45 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('cochon', true, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cheval, perroquet gris du Gabon et rat domestique, lequel est principalement actif la nuit (nocturne) ?', 'Le rat domestique est nocturne, alors que le cheval est plutôt diurne et le perroquet gris du Gabon plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('rat domestique', true, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gerbille, perruche ondulée et serpent des blés (couleuvre), lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que la gerbille est plutôt diurne et la perruche ondulée plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('gerbille', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, pogona (dragon barbu) et poule, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le pogona (dragon barbu) est plutôt solitaire à l''état naturel, alors que l''abeille domestique et la poule sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', false, 1),
  ('pogona (dragon barbu)', true, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), hamster syrien et serpent des blés (couleuvre), lequel est principalement actif le jour (diurne) ?', 'Le betta (combattant) est diurne, alors que l''hamster syrien est plutôt nocturne et le serpent des blés (couleuvre) plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('betta (combattant)', true, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un chien, laquelle de ces affirmations est exacte ? (variante 2)', 'Un animal transporté doit pouvoir accéder à de l''eau lors des trajets longs, notamment par forte chaleur.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal transporté doit pouvoir accéder à de l''eau lors des trajets longs, notamment par forte chaleur.', true, 1),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 2),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « un groin sec et chaud associé à un refus de se lever » ?', 'Ce signe d''alerte concerne le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('discus', false, 2),
  ('cochon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi âne, pogona (dragon barbu) et rat domestique, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le pogona (dragon barbu) est plutôt solitaire à l''état naturel, alors que l''âne et le rat domestique sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('âne', false, 2),
  ('pogona (dragon barbu)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, discus et furet, lequel est le plus lourd à l''âge adulte ?', 'Un furet adulte pèse en moyenne 0.7-2 kg, bien plus qu''un axolotl (0.06-0.15 kg) ou un discus (0.1-0.3 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', true, 1),
  ('discus', false, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, cochon et grenouille griffue (Xenopus), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le chat est plutôt solitaire à l''état naturel, alors que le cochon et la grenouille griffue (Xenopus) sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un cochon d''Inde ?', 'Chez le cochon d''Inde, un apport quotidien de vitamine C (fruits et légumes), qu''il ne synthétise pas lui-même.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('de l''herbe fraîche à volonté : c''est l''essentiel de son alimentation naturelle', false, 1),
  ('un accès à un point d''eau pour boire par aspiration continue, une particularité rare chez les oiseaux', false, 2),
  ('un apport quotidien de vitamine C (fruits et légumes), qu''il ne synthétise pas lui-même', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, serpent des blés (couleuvre) et souris domestique, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le serpent des blés (couleuvre) est un reptile, alors que l''hérisson domestique et la souris domestique sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('serpent des blés (couleuvre)', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, lapin et furet, lequel a la gestation la plus longue ?', 'La gestation dure environ 41-43 jours chez le furet, contre 19-21 jours chez la souris domestique et 28-33 jours chez le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('furet', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chinchilla, lapin et perroquet gris du Gabon, lequel est principalement actif le jour (diurne) ?', 'Le perroquet gris du Gabon est diurne, alors que le chinchilla est plutôt crepusculaire et le lapin plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('perroquet gris du Gabon', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), chèvre et escargot petit-gris, lequel est principalement actif la nuit (nocturne) ?', 'L''escargot petit-gris est nocturne, alors que le betta (combattant) est plutôt diurne et la chèvre plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('escargot petit-gris', true, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, gerbille et cheval, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le cheval vit environ 25-30 ans, contre 1.5-2.5 ans pour la souris domestique et 2-4 ans pour la gerbille.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('souris domestique', false, 2),
  ('cheval', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi dindon, discus et tortue terrestre, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la tortue terrestre vit environ 50-80 ans, contre 8-10 ans pour le dindon et 10-15 ans pour le discus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('dindon', false, 2),
  ('tortue terrestre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, escargot petit-gris et gecko léopard, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le gecko léopard est plutôt solitaire à l''état naturel, alors que la chèvre et l''escargot petit-gris sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('gecko léopard', true, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi furet, gecko léopard et pigeon, lequel est principalement actif le jour (diurne) ?', 'Le pigeon est diurne, alors que le furet est plutôt crepusculaire et le gecko léopard plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('pigeon', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « une eau maintenue sous 22°C : au-delà, son métabolisme se dérègle et son immunité chute fortement » ?', 'Cette description correspond au axolotl.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('pigeon', false, 2),
  ('axolotl', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, cochon et grenouille griffue (Xenopus), lequel est principalement actif le jour (diurne) ?', 'Le cochon est diurne, alors que l''axolotl est plutôt nocturne et la grenouille griffue (Xenopus) plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('cochon', true, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, gecko léopard et pogona (dragon barbu), lequel est le plus lourd à l''âge adulte ?', 'Un pogona (dragon barbu) adulte pèse en moyenne 0.3-0.6 kg, bien plus qu''une abeille domestique (0.0001-0.0001 kg) ou un gecko léopard (0.05-0.09 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', true, 1),
  ('gecko léopard', false, 2),
  ('abeille domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi grenouille griffue (Xenopus), hérisson domestique et pigeon, lequel a un régime alimentaire strictement carnivore ?', 'La grenouille griffue (Xenopus) est carnivore, alors que l''hérisson domestique est insectivore et le pigeon est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('grenouille griffue (Xenopus)', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une chèvre, laquelle de ces affirmations est exacte ? (variante 2)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 1),
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 2),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un hamster syrien, laquelle de ces affirmations est exacte ? (variante 2)', 'Un animal transporté doit pouvoir accéder à de l''eau lors des trajets longs, notamment par forte chaleur.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal transporté doit pouvoir accéder à de l''eau lors des trajets longs, notamment par forte chaleur.', true, 1),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 2),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, furet et rat domestique, lequel a en moyenne les portées les plus nombreuses ?', 'Le rat domestique a en moyenne 6-12 petits par portée, contre 1-4 pour le cochon d''Inde et 3-7 pour le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('furet', false, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, discus et furet, lequel est le plus léger à l''âge adulte ?', 'Un axolotl adulte pèse en moyenne 0.06-0.15 kg, nettement moins que le discus et le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('furet', false, 2),
  ('discus', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, pigeon et cochon, lequel est le plus léger à l''âge adulte ?', 'Un hamster syrien adulte pèse en moyenne 0.1-0.15 kg, nettement moins que le pigeon et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('hamster syrien', true, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi serpent des blés (couleuvre), cochon d''Inde et cheval, lequel est le plus léger à l''âge adulte ?', 'Un serpent des blés (couleuvre) adulte pèse en moyenne 0.15-0.45 kg, nettement moins que le cochon d''Inde et le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', true, 1),
  ('cochon d''Inde', false, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, cheval et mouton, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''axolotl est plutôt solitaire à l''état naturel, alors que le cheval et le mouton sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('axolotl', true, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, oie et cheval, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''axolotl vit environ 10-15 ans, nettement moins que l''oie et le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', false, 1),
  ('cheval', false, 2),
  ('axolotl', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), escargot petit-gris et cochon d''Inde, lequel est le plus léger à l''âge adulte ?', 'Un betta (combattant) adulte pèse en moyenne 0.005-0.01 kg, nettement moins que l''escargot petit-gris et le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('escargot petit-gris', false, 2),
  ('betta (combattant)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, escargot petit-gris et gecko léopard, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''hamster syrien vit environ 2-3 ans, nettement moins que l''escargot petit-gris et le gecko léopard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('escargot petit-gris', false, 2),
  ('hamster syrien', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, hérisson domestique et cochon d''Inde, lequel a la gestation la plus longue ?', 'La gestation dure environ 59-72 jours chez le cochon d''Inde, contre 21-23 jours chez le rat domestique et 33-37 jours chez l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', true, 1),
  ('rat domestique', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi betta (combattant), hérisson domestique et tortue terrestre, lequel a un régime alimentaire strictement carnivore ?', 'Le betta (combattant) est carnivore, alors que l''hérisson domestique est insectivore et la tortue terrestre est herbivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('tortue terrestre', false, 2),
  ('betta (combattant)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 14)', 'Un professionnel du secteur animalier peut voir son ACACED retirée en cas de manquement grave aux règles de bien-être animal.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Une annonce de vente d''animal n''a jamais besoin de mentionner le moindre numéro d''identification.', false, 1),
  ('Un professionnel du secteur animalier peut voir son ACACED retirée en cas de manquement grave aux règles de bien-être animal.', true, 2),
  ('Le furet n''est soumis à aucune obligation d''identification, à la différence du chien et du chat.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « la laitue iceberg et les féculents cuits en excès (troubles digestifs graves) » ?', 'Cette toxicité est documentée chez le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('lapin', true, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, grenouille griffue (Xenopus) et tortue aquatique (Trachemys), lequel est principalement actif la nuit (nocturne) ?', 'La grenouille griffue (Xenopus) est nocturne, alors que l''abeille domestique est plutôt diurne et la tortue aquatique (Trachemys) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('abeille domestique', false, 2),
  ('grenouille griffue (Xenopus)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chien, souris domestique et rat domestique, lequel a en moyenne les portées les plus nombreuses ?', 'Le rat domestique a en moyenne 6-12 petits par portée, contre 1-8 pour le chien et 4-8 pour la souris domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('rat domestique', true, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, tortue aquatique (Trachemys) et vache, lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue aquatique (Trachemys) est plutôt solitaire à l''état naturel, alors que la chèvre et la vache sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('tortue aquatique (Trachemys)', true, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chinchilla, tortue aquatique (Trachemys) et tortue terrestre, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le chinchilla est grégaire et a besoin de compagnie de son espèce, alors que la tortue aquatique (Trachemys) et la tortue terrestre vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('chinchilla', true, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi axolotl, canard et pigeon, lequel a un régime alimentaire strictement carnivore ?', 'L''axolotl est carnivore, alors que le canard est omnivore et le pigeon est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('canard', false, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, canari et cochon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la souris domestique vit environ 1.5-2.5 ans, nettement moins que le canari et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('souris domestique', true, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi axolotl, canard et lapin, lequel a un régime alimentaire strictement carnivore ?', 'L''axolotl est carnivore, alors que le canard est omnivore et le lapin est herbivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('lapin', false, 2),
  ('axolotl', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cheval, dindon et serpent des blés (couleuvre), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le serpent des blés (couleuvre) est plutôt solitaire à l''état naturel, alors que le cheval et le dindon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', true, 1),
  ('dindon', false, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouton, perruche ondulée et pigeon, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le mouton est un mammifère, alors que la perruche ondulée et le pigeon sont tous les deux des oiseaus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', true, 1),
  ('perruche ondulée', false, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, furet et vache, lequel a la gestation la plus longue ?', 'La gestation dure environ 279-292 jours chez la vache, contre 19-21 jours chez la souris domestique et 41-43 jours chez le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('vache', true, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, cochon et poule, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le cochon est un mammifère, alors que le canari et la poule sont tous les deux des oiseaus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', true, 1),
  ('poule', false, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi grenouille griffue (Xenopus), mouton et oie, lequel est principalement actif la nuit (nocturne) ?', 'La grenouille griffue (Xenopus) est nocturne, alors que le mouton est plutôt diurne et l''oie plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('grenouille griffue (Xenopus)', true, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une crête qui devient pâle ou violacée au lieu de rouge vif » ?', 'Ce signe d''alerte concerne la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', false, 1),
  ('poule', true, 2),
  ('dindon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « un pelage terne et hérissé associé à une perte de poids rapide » ?', 'Ce signe d''alerte concerne la souris domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', true, 1),
  ('cochon', false, 2),
  ('abeille domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un rat domestique ?', 'Chez le rat domestique, la compagnie d''au moins un autre rat : l''isolement social lui cause un vrai mal-être.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('la compagnie d''au moins un autre rat : l''isolement social lui cause un vrai mal-être', true, 1),
  ('une humidité constante : sans elle, il s''enferme dans sa coquille derrière un opercule de mucus', false, 2),
  ('un substrat humide riche en matière organique en décomposition', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hérisson domestique, oie et poisson rouge, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hérisson domestique est plutôt solitaire à l''état naturel, alors que l''oie et le poisson rouge sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('hérisson domestique', true, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi cochon d''Inde, furet et pogona (dragon barbu), lequel a un régime alimentaire strictement carnivore ?', 'Le furet est carnivore, alors que le cochon d''Inde est herbivore et le pogona (dragon barbu) est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('cochon d''Inde', false, 2),
  ('furet', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, poule et tortue terrestre, lequel est le plus léger à l''âge adulte ?', 'Un canari adulte pèse en moyenne 0.015-0.02 kg, nettement moins que la poule et la tortue terrestre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('tortue terrestre', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un bain de sable spécial régulier pour entretenir son pelage très dense, sans jamais le mouiller » ?', 'Cette description correspond au chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('chinchilla', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, chinchilla et rat domestique, lequel est principalement actif la nuit (nocturne) ?', 'Le rat domestique est nocturne, alors que le canari est plutôt diurne et le chinchilla plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('canari', false, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi âne, gecko léopard et souris domestique, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le gecko léopard est un reptile, alors que l''âne et la souris domestique sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('souris domestique', false, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, furet et cheval, lequel a la gestation la plus longue ?', 'La gestation dure environ 330-345 jours chez le cheval, contre 19-21 jours chez la souris domestique et 41-43 jours chez le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('souris domestique', false, 2),
  ('cheval', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « des surfaces à grimper et à explorer : c''est un animal naturellement escaladeur » ?', 'Cette description correspond au chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('escargot petit-gris', false, 2),
  ('chèvre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « un arrêt total de l''alimentation depuis plus de 12 h (risque de stase digestive, urgence vitale) » ?', 'Ce signe d''alerte concerne le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('lapin', true, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un furet, laquelle de ces affirmations est exacte ? (variante 1)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 1),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 2),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, perruche ondulée et canari, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le canari vit environ 8-12 ans, contre 2-3 ans pour l''hamster syrien et 7-10 ans pour la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('hamster syrien', false, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « un gonflement visible autour des yeux ou des sinus » ?', 'Ce signe d''alerte concerne le dindon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('dindon', true, 1),
  ('chèvre', false, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, furet et vache, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le cochon d''Inde vit environ 5-8 ans, nettement moins que le furet et la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('vache', false, 2),
  ('cochon d''Inde', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, canari et cochon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le cochon vit environ 10-15 ans, contre 1.5-2.5 ans pour la souris domestique et 8-12 ans pour le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('cochon', true, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, chat et gerbille, lequel a en moyenne les portées les plus nombreuses ?', 'La gerbille a en moyenne 3-6 petits par portée, contre 1-4 pour le cochon d''Inde et 1-6 pour le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('gerbille', true, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, gecko léopard et mouton, lequel est le plus lourd à l''âge adulte ?', 'Un mouton adulte pèse en moyenne 45-100 kg, bien plus qu''une souris domestique (0.02-0.04 kg) ou un gecko léopard (0.05-0.09 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('gecko léopard', false, 2),
  ('mouton', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi âne, vache et chien, lequel a en moyenne les portées les plus nombreuses ?', 'Le chien a en moyenne 1-8 petits par portée, contre 1-1 pour l''âne et 1-1 pour la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('chien', true, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 5)', 'Un certificat vétérinaire est obligatoire avant la cession d''un chiot ou d''un chaton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Aucune formation n''est jamais nécessaire pour exercer une activité professionnelle liée aux animaux de compagnie.', false, 1),
  ('Un certificat vétérinaire est obligatoire avant la cession d''un chiot ou d''un chaton.', true, 2),
  ('L''âge auquel un chiot ou un chaton peut être cédé n''est soumis à aucune limite basse.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi discus, furet et tortue terrestre, lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue terrestre est plutôt solitaire à l''état naturel, alors que le discus et le furet sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('furet', false, 2),
  ('tortue terrestre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cheval, chat et souris domestique, lequel a en moyenne les portées les plus nombreuses ?', 'La souris domestique a en moyenne 4-8 petits par portée, contre 1-1 pour le cheval et 1-6 pour le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', true, 1),
  ('chat', false, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), chinchilla et serpent des blés (couleuvre), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le chinchilla est grégaire et a besoin de compagnie de son espèce, alors que le betta (combattant) et le serpent des blés (couleuvre) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', false, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('chinchilla', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une poule, laquelle de ces affirmations est exacte ? (variante 2)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 1),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 2),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un cochon ?', 'Chez le cochon, un substrat à fouiller (paille, terre) : le fouissage est un comportement naturel essentiel.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('la compagnie d''au moins une autre perruche : l''isolement prolongé cause un stress important chez cette espèce grégaire', false, 1),
  ('un substrat à fouiller (paille, terre) : le fouissage est un comportement naturel essentiel', true, 2),
  ('une zone d''eau et une zone de bain de soleil hors de l''eau (berge ou plage flottante)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un gecko léopard, laquelle de ces affirmations est exacte ? (variante 2)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), grenouille griffue (Xenopus) et canari, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 13-14 jours chez le canari, contre 4-5 jours chez la mouche soldat noire (larves) et 4-6 jours chez la grenouille griffue (Xenopus).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('canari', true, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), oie et tortue aquatique (Trachemys), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue aquatique (Trachemys), contre 4-5 jours chez la mouche soldat noire (larves) et 28-33 jours chez l''oie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', true, 1),
  ('oie', false, 2),
  ('mouche soldat noire (larves)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chèvre, poisson rouge et serpent des blés (couleuvre), lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le serpent des blés (couleuvre) vit environ 15-20 ans, contre 10-15 ans pour la chèvre et 10-15 ans pour le poisson rouge.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('poisson rouge', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un cheval ?', 'Chez le cheval, un accès quasi permanent au fourrage : son système digestif est conçu pour manger de petites quantités en continu.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un accès quasi permanent au fourrage : son système digestif est conçu pour manger de petites quantités en continu', true, 1),
  ('une boîte à humidité (moss box) pour faciliter ses mues, en plus d''une zone chaude et d''une zone froide', false, 2),
  ('une cachette bien fermée de chaque côté du terrarium (zone chaude et zone froide) où il se sent totalement à l''abri', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, gerbille et cheval, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''hamster syrien vit environ 2-3 ans, nettement moins que la gerbille et le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('hamster syrien', true, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « un pelage humide autour du nez et des yeux (souvent lié à une allergie à la poussière de son substrat) » ?', 'Ce signe d''alerte concerne la gerbille.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('perroquet gris du Gabon', false, 2),
  ('gerbille', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un chat ?', 'Chez le chat, des zones en hauteur pour observer et un accès à un griffoir pour marquer et entretenir ses griffes.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('des zones en hauteur pour observer et un accès à un griffoir pour marquer et entretenir ses griffes', true, 1),
  ('des surfaces à grimper et à explorer : c''est un animal naturellement escaladeur', false, 2),
  ('un bac individuel : deux mâles ensemble se battent, d''où son nom de poisson combattant', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 2)', 'Un professionnel qui vend des chiens ou des chats doit tenir un registre d''entrées et de sorties des animaux.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Le furet n''est soumis à aucune obligation d''identification, à la différence du chien et du chat.', false, 1),
  ('Un professionnel qui vend des chiens ou des chats doit tenir un registre d''entrées et de sorties des animaux.', true, 2),
  ('Un professionnel n''a aucune obligation de tenir un quelconque registre concernant les animaux qu''il vend.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « l''arrêt total du chant chez un mâle habituellement chanteur » ?', 'Ce signe d''alerte concerne le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('discus', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, cochon d''Inde et escargot petit-gris, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''hamster syrien vit environ 2-3 ans, nettement moins que le cochon d''Inde et l''escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('cochon d''Inde', false, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, betta (combattant) et gerbille, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le betta (combattant) est plutôt solitaire à l''état naturel, alors que l''abeille domestique et la gerbille sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('betta (combattant)', true, 2),
  ('abeille domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perruche ondulée, serpent des blés (couleuvre) et gecko léopard, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 35-89 jours chez le gecko léopard, contre 17-19 jours chez la perruche ondulée et 55-65 jours chez le serpent des blés (couleuvre).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('gecko léopard', true, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cheval, dindon et pigeon, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le cheval est un mammifère, alors que le dindon et le pigeon sont tous les deux des oiseaus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('dindon', false, 1),
  ('cheval', true, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi lapin, chèvre et âne, lequel a la gestation la plus longue ?', 'La gestation dure environ 365-375 jours chez l''âne, contre 28-33 jours chez le lapin et 145-155 jours chez la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('lapin', false, 2),
  ('âne', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour un lapin ?', 'Chez le lapin, la laitue iceberg et les féculents cuits en excès (troubles digestifs graves) est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('la pomme sans les pépins', false, 1),
  ('la carotte cuite', false, 2),
  ('la laitue iceberg et les féculents cuits en excès (troubles digestifs graves)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi lapin, chien et mouton, lequel a la gestation la plus longue ?', 'La gestation dure environ 144-152 jours chez le mouton, contre 28-33 jours chez le lapin et 58-68 jours chez le chien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('lapin', false, 2),
  ('mouton', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi vache, âne et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la vache vit environ 18-22 ans, nettement moins que l''âne et le perroquet gris du Gabon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('vache', true, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, furet et cheval, lequel est le plus léger à l''âge adulte ?', 'Un discus adulte pèse en moyenne 0.1-0.3 kg, nettement moins que le furet et le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('discus', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canard, chinchilla et gecko léopard, lequel est principalement actif le jour (diurne) ?', 'Le canard est diurne, alors que le chinchilla est plutôt crepusculaire et le gecko léopard plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('canard', true, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, canard et mouton, lequel est principalement actif la nuit (nocturne) ?', 'L''axolotl est nocturne, alors que le canard est plutôt diurne et le mouton plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('canard', false, 2),
  ('axolotl', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, discus et gecko léopard, lequel est principalement actif le jour (diurne) ?', 'Le discus est diurne, alors que l''axolotl est plutôt nocturne et le gecko léopard plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('discus', true, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, perroquet gris du Gabon et oie, lequel est le plus léger à l''âge adulte ?', 'Une souris domestique adulte pèse en moyenne 0.02-0.04 kg, nettement moins que le perroquet gris du Gabon et l''oie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('souris domestique', true, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cheval, gerbille et rat domestique, lequel est principalement actif la nuit (nocturne) ?', 'Le rat domestique est nocturne, alors que le cheval est plutôt diurne et la gerbille plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('rat domestique', true, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, discus et chinchilla, lequel est le plus léger à l''âge adulte ?', 'Une gerbille adulte pèse en moyenne 0.08-0.12 kg, nettement moins que le discus et le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', true, 1),
  ('chinchilla', false, 2),
  ('discus', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour un escargot petit-gris ?', 'Chez l''escargot petit-gris, le sel (déshydratation mortelle par osmose) est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('la courgette cuite sans assaisonnement', false, 1),
  ('la carotte cuite', false, 2),
  ('le sel (déshydratation mortelle par osmose)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, cochon d''Inde et cheval, lequel a la gestation la plus longue ?', 'La gestation dure environ 330-345 jours chez le cheval, contre 19-21 jours chez la souris domestique et 59-72 jours chez le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', true, 1),
  ('souris domestique', false, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chien, rat domestique et vache, lequel est principalement actif la nuit (nocturne) ?', 'Le rat domestique est nocturne, alors que le chien est plutôt diurne et la vache plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('vache', false, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, lapin et mouton, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le canari est plutôt solitaire à l''état naturel, alors que le lapin et le mouton sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('canari', true, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un cheval ?', 'Chez le cheval, des tentatives répétées de se rouler par terre associées à des regards vers le flanc (signes de coliques, urgence).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une immobilité prolongée et un refus de s''alimenter (l''âne masque très bien la douleur)', false, 1),
  ('des membres qui se déforment ou une mâchoire qui devient molle (carence en calcium, maladie osseuse métabolique)', false, 2),
  ('des tentatives répétées de se rouler par terre associées à des regards vers le flanc (signes de coliques, urgence)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi vache, chèvre et lapin, lequel a en moyenne les portées les plus nombreuses ?', 'Le lapin a en moyenne 4-8 petits par portée, contre 1-1 pour la vache et 1-3 pour la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('chèvre', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, hérisson domestique et tortue aquatique (Trachemys), lequel est principalement actif la nuit (nocturne) ?', 'L''hérisson domestique est nocturne, alors que le chat est plutôt crepusculaire et la tortue aquatique (Trachemys) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('hérisson domestique', true, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, grenouille griffue (Xenopus) et poule, lequel est principalement actif la nuit (nocturne) ?', 'La grenouille griffue (Xenopus) est nocturne, alors que la chèvre est plutôt diurne et la poule plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('poule', false, 2),
  ('grenouille griffue (Xenopus)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi âne, hérisson domestique et hamster syrien, lequel a en moyenne les portées les plus nombreuses ?', 'L''hamster syrien a en moyenne 4-10 petits par portée, contre 1-1 pour l''âne et 2-5 pour l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('hamster syrien', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un pogona (dragon barbu) ?', 'Chez le pogona (dragon barbu), un éclairage UVB adapté, indispensable pour synthétiser la vitamine D3 et fixer le calcium.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un éclairage UVB adapté, indispensable pour synthétiser la vitamine D3 et fixer le calcium', true, 1),
  ('une cachette bien fermée de chaque côté du terrarium (zone chaude et zone froide) où il se sent totalement à l''abri', false, 2),
  ('la présence d''autres moutons : l''isolement social est une source de stress majeure pour cette espèce grégaire', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, perruche ondulée et pigeon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''abeille domestique vit environ 0.08-0.16 ans, nettement moins que la perruche ondulée et le pigeon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', true, 1),
  ('perruche ondulée', false, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, cochon d''Inde et escargot petit-gris, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''escargot petit-gris vit environ 5-8 ans, contre 2-3 ans pour l''hamster syrien et 5-8 ans pour le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', true, 1),
  ('cochon d''Inde', false, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon, vache et cheval, lequel a la gestation la plus longue ?', 'La gestation dure environ 330-345 jours chez le cheval, contre 112-115 jours chez le cochon et 279-292 jours chez la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('cochon', false, 2),
  ('cheval', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), mouton et serpent des blés (couleuvre), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le mouton est grégaire et a besoin de compagnie de son espèce, alors que le betta (combattant) et le serpent des blés (couleuvre) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', true, 1),
  ('betta (combattant)', false, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi furet, lapin et mouton, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le mouton vit environ 10-12 ans, contre 7-10 ans pour le furet et 8-12 ans pour le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('furet', false, 2),
  ('mouton', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi chinchilla, perroquet gris du Gabon et serpent des blés (couleuvre), lequel a un régime alimentaire strictement carnivore ?', 'Le serpent des blés (couleuvre) est carnivore, alors que le chinchilla est herbivore et le perroquet gris du Gabon est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('serpent des blés (couleuvre)', true, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, chinchilla et cheval, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''hamster syrien vit environ 2-3 ans, nettement moins que le chinchilla et le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('chinchilla', false, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, gerbille et cheval, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le cheval vit environ 25-30 ans, contre 2-3 ans pour l''hamster syrien et 2-4 ans pour la gerbille.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', true, 1),
  ('gerbille', false, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez une poule ?', 'Chez la poule, une crête qui devient pâle ou violacée au lieu de rouge vif.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une plume légèrement en berne du côté d''une aile, souvent après un choc', false, 1),
  ('une couleur qui s''assombrit fortement de façon durable (stress ou maladie)', false, 2),
  ('une crête qui devient pâle ou violacée au lieu de rouge vif', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, pogona (dragon barbu) et vache, lequel est le plus léger à l''âge adulte ?', 'Un canari adulte pèse en moyenne 0.015-0.02 kg, nettement moins que le pogona (dragon barbu) et la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('pogona (dragon barbu)', false, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une grenouille griffue (Xenopus), laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi mouton, perroquet gris du Gabon et rat domestique, lequel est principalement actif la nuit (nocturne) ?', 'Le rat domestique est nocturne, alors que le mouton est plutôt diurne et le perroquet gris du Gabon plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('rat domestique', true, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, hamster syrien et mouton, lequel est principalement actif la nuit (nocturne) ?', 'L''hamster syrien est nocturne, alors que la chèvre est plutôt diurne et le mouton plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('hamster syrien', true, 2),
  ('chèvre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 4)', 'Un chien ou un chat cédé, même à titre gratuit, doit être identifié (puce électronique ou tatouage) avant la cession.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('L''identification des chiens et chats par puce électronique est facultative en toutes circonstances.', false, 1),
  ('L''âge auquel un chiot ou un chaton peut être cédé n''est soumis à aucune limite basse.', false, 2),
  ('Un chien ou un chat cédé, même à titre gratuit, doit être identifié (puce électronique ou tatouage) avant la cession.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, mouton et chèvre, lequel a la gestation la plus longue ?', 'La gestation dure environ 145-155 jours chez la chèvre, contre 24-26 jours chez la gerbille et 144-152 jours chez le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('chèvre', true, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chien, discus et serpent des blés (couleuvre), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le serpent des blés (couleuvre) est plutôt solitaire à l''état naturel, alors que le chien et le discus sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('discus', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi furet, souris domestique et vache, lequel a un régime alimentaire strictement herbivore ?', 'La vache est herbivore, alors que le furet est carnivore et la souris domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('souris domestique', false, 2),
  ('vache', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi axolotl, cheval et rat domestique, lequel a un régime alimentaire strictement herbivore ?', 'Le cheval est herbivore, alors que l''axolotl est carnivore et le rat domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', false, 1),
  ('cheval', true, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un betta (combattant) ?', 'Chez le betta (combattant), un bac individuel : deux mâles ensemble se battent, d''où son nom de poisson combattant.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un bac individuel : deux mâles ensemble se battent, d''où son nom de poisson combattant', true, 1),
  ('des zones en hauteur pour observer et un accès à un griffoir pour marquer et entretenir ses griffes', false, 2),
  ('une stimulation mentale quotidienne (jeux, interactions) : l''ennui provoque souvent des troubles du comportement comme l''arrachage de plumes', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi discus, hamster syrien et poisson rouge, lequel est principalement actif la nuit (nocturne) ?', 'L''hamster syrien est nocturne, alors que le discus est plutôt diurne et le poisson rouge plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('discus', false, 2),
  ('poisson rouge', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hamster syrien, hérisson domestique et lapin, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le lapin est grégaire et a besoin de compagnie de son espèce, alors que l''hamster syrien et l''hérisson domestique vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('lapin', true, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 3)', 'La vente de chiens ou de chats entre particuliers est encadrée : un numéro d''identification (puce ou tatouage) doit être communiqué à l''acheteur.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('La vente de chiens ou de chats entre particuliers est encadrée : un numéro d''identification (puce ou tatouage) doit être communiqué à l''acheteur.', true, 1),
  ('Un particulier peut céder un chiot sans aucun document ni identification, quelle que soit la situation.', false, 2),
  ('Une annonce de vente d''animal n''a jamais besoin de mentionner le moindre numéro d''identification.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gecko léopard, perruche ondulée et serpent des blés (couleuvre), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'La perruche ondulée est grégaire et a besoin de compagnie de son espèce, alors que le gecko léopard et le serpent des blés (couleuvre) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', true, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, perroquet gris du Gabon et lapin, lequel est le plus lourd à l''âge adulte ?', 'Un lapin adulte pèse en moyenne 1.2-2.5 kg, bien plus qu''un discus (0.1-0.3 kg) ou un perroquet gris du Gabon (0.4-0.55 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('lapin', true, 2),
  ('discus', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), chien et oie, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le betta (combattant) est plutôt solitaire à l''état naturel, alors que le chien et l''oie sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', true, 1),
  ('chien', false, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un pogona (dragon barbu), laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.', true, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi pigeon, oie et cheval, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le pigeon vit environ 5-15 ans, nettement moins que l''oie et le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('pigeon', true, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, lapin et vache, lequel est le plus lourd à l''âge adulte ?', 'Une vache adulte pèse en moyenne 500-800 kg, bien plus qu''une gerbille (0.08-0.12 kg) ou un lapin (1.2-2.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', true, 1),
  ('gerbille', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un pigeon ?', 'Chez le pigeon, une plume légèrement en berne du côté d''une aile, souvent après un choc.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un silence inhabituel et l''arrêt des petits cris habituels au moment du repas', false, 1),
  ('une coquille qui reste operculée en permanence même après réhydratation', false, 2),
  ('une plume légèrement en berne du côté d''une aile, souvent après un choc', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, cochon d''Inde et cochon, lequel est le plus léger à l''âge adulte ?', 'Un escargot petit-gris adulte pèse en moyenne 0.005-0.015 kg, nettement moins que le cochon d''Inde et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('escargot petit-gris', true, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, gerbille et pogona (dragon barbu), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le pogona (dragon barbu) est plutôt solitaire à l''état naturel, alors que la chèvre et la gerbille sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('pogona (dragon barbu)', true, 2),
  ('chèvre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une souris domestique, laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi betta (combattant), cochon d''Inde et poisson rouge, lequel a un régime alimentaire strictement herbivore ?', 'Le cochon d''Inde est herbivore, alors que le betta (combattant) est carnivore et le poisson rouge est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('betta (combattant)', false, 2),
  ('cochon d''Inde', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cheval, oie et tortue aquatique (Trachemys), lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue aquatique (Trachemys) est plutôt solitaire à l''état naturel, alors que le cheval et l''oie sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', true, 1),
  ('oie', false, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un accès quasi permanent au fourrage : son système digestif est conçu pour manger de petites quantités en continu » ?', 'Cette description correspond au cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', false, 1),
  ('canard', false, 2),
  ('cheval', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), poule et tortue terrestre, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue terrestre, contre 2-3 jours chez le betta (combattant) et 20-21 jours chez la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('poule', false, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un axolotl ?', 'Chez l''axolotl, des branchies qui se recroquevillent ou pâlissent (souvent lié à une eau trop chaude ou de mauvaise qualité).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une crête qui devient pâle ou violacée au lieu de rouge vif', false, 1),
  ('des branchies qui se recroquevillent ou pâlissent (souvent lié à une eau trop chaude ou de mauvaise qualité)', true, 2),
  ('des plumes ternes qui ne repoussent plus imperméables (perte d''étanchéité du plumage)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, cochon d''Inde et cochon, lequel a la gestation la plus longue ?', 'La gestation dure environ 112-115 jours chez le cochon, contre 33-37 jours chez l''hérisson domestique et 59-72 jours chez le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('cochon', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gecko léopard, serpent des blés (couleuvre) et vache, lequel est principalement actif le jour (diurne) ?', 'La vache est diurne, alors que le gecko léopard est plutôt nocturne et le serpent des blés (couleuvre) plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', true, 1),
  ('gecko léopard', false, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), poule et âne, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''âne vit environ 25-35 ans, contre 0.15-0.3 ans pour la mouche soldat noire (larves) et 5-10 ans pour la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('âne', true, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi betta (combattant), cochon d''Inde et poisson rouge, lequel a un régime alimentaire strictement carnivore ?', 'Le betta (combattant) est carnivore, alors que le cochon d''Inde est herbivore et le poisson rouge est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('betta (combattant)', true, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi poule, furet et vache, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la vache vit environ 18-22 ans, contre 5-10 ans pour la poule et 7-10 ans pour le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', true, 1),
  ('furet', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), lapin et pigeon, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le betta (combattant) est plutôt solitaire à l''état naturel, alors que le lapin et le pigeon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('betta (combattant)', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi grenouille griffue (Xenopus), hérisson domestique et tortue terrestre, lequel a un régime alimentaire strictement carnivore ?', 'La grenouille griffue (Xenopus) est carnivore, alors que l''hérisson domestique est insectivore et la tortue terrestre est herbivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('grenouille griffue (Xenopus)', true, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi chinchilla, furet et rat domestique, lequel a un régime alimentaire strictement herbivore ?', 'Le chinchilla est herbivore, alors que le furet est carnivore et le rat domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('chinchilla', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, mouton et cochon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''escargot petit-gris vit environ 5-8 ans, nettement moins que le mouton et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('cochon', false, 2),
  ('escargot petit-gris', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), serpent des blés (couleuvre) et vache, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'La vache est grégaire et a besoin de compagnie de son espèce, alors que le betta (combattant) et le serpent des blés (couleuvre) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('betta (combattant)', false, 2),
  ('vache', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi tortue aquatique (Trachemys), canard et âne, lequel est le plus lourd à l''âge adulte ?', 'Un âne adulte pèse en moyenne 160-300 kg, bien plus qu''une tortue aquatique (Trachemys) (0.3-1 kg) ou un canard (1-3.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('âne', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 6)', 'Toute structure qui héberge des animaux de compagnie contre rémunération (pension, chatterie) est soumise à une obligation de déclaration.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un professionnel n''a aucune obligation de tenir un quelconque registre concernant les animaux qu''il vend.', false, 1),
  ('L''identification des chiens et chats par puce électronique est facultative en toutes circonstances.', false, 2),
  ('Toute structure qui héberge des animaux de compagnie contre rémunération (pension, chatterie) est soumise à une obligation de déclaration.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), grenouille griffue (Xenopus) et cochon d''Inde, lequel est le plus léger à l''âge adulte ?', 'Une mouche soldat noire (larves) adulte pèse en moyenne 0.0001-0.0002 kg, nettement moins que la grenouille griffue (Xenopus) et le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('mouche soldat noire (larves)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), gecko léopard et chèvre, lequel est le plus léger à l''âge adulte ?', 'Un betta (combattant) adulte pèse en moyenne 0.005-0.01 kg, nettement moins que le gecko léopard et la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('betta (combattant)', true, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi discus, gecko léopard et pogona (dragon barbu), lequel est principalement actif la nuit (nocturne) ?', 'Le gecko léopard est nocturne, alors que le discus est plutôt diurne et le pogona (dragon barbu) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('discus', false, 2),
  ('pogona (dragon barbu)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi betta (combattant), escargot petit-gris et perroquet gris du Gabon, lequel a un régime alimentaire strictement carnivore ?', 'Le betta (combattant) est carnivore, alors que l''escargot petit-gris est herbivore et le perroquet gris du Gabon est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('escargot petit-gris', false, 2),
  ('betta (combattant)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un furet ?', 'Chez le furet, des gencives très pâles associées à une grande faiblesse (souvent lié à l''insulinome, fréquent chez le furet).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('des zones de pelage arraché ou clairsemé (souvent lié au stress ou à un environnement trop humide)', false, 1),
  ('des gencives très pâles associées à une grande faiblesse (souvent lié à l''insulinome, fréquent chez le furet)', true, 2),
  ('un gonflement visible autour des yeux ou des sinus', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un betta (combattant), laquelle de ces affirmations est exacte ? (variante 1)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cochon, hérisson domestique et poisson rouge, lequel est principalement actif la nuit (nocturne) ?', 'L''hérisson domestique est nocturne, alors que le cochon est plutôt diurne et le poisson rouge plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('hérisson domestique', true, 2),
  ('poisson rouge', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, pigeon et rat domestique, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''axolotl est plutôt solitaire à l''état naturel, alors que le pigeon et le rat domestique sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('axolotl', true, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi poisson rouge, lapin et vache, lequel est le plus léger à l''âge adulte ?', 'Un poisson rouge adulte pèse en moyenne 0.1-0.5 kg, nettement moins que le lapin et la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('poisson rouge', true, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un âne, laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, cochon d''Inde et tortue aquatique (Trachemys), lequel est principalement actif la nuit (nocturne) ?', 'L''axolotl est nocturne, alors que le cochon d''Inde est plutôt crepusculaire et la tortue aquatique (Trachemys) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('cochon d''Inde', false, 2),
  ('axolotl', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, furet et mouton, lequel est le plus lourd à l''âge adulte ?', 'Un mouton adulte pèse en moyenne 45-100 kg, bien plus qu''un rat domestique (0.2-0.5 kg) ou un furet (0.7-2 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('furet', false, 2),
  ('mouton', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi poisson rouge, gecko léopard et vache, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le poisson rouge vit environ 10-15 ans, nettement moins que le gecko léopard et la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('vache', false, 2),
  ('poisson rouge', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, chinchilla et vache, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la souris domestique vit environ 1.5-2.5 ans, nettement moins que le chinchilla et la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('souris domestique', true, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi grenouille griffue (Xenopus), poisson rouge et serpent des blés (couleuvre), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 55-65 jours chez le serpent des blés (couleuvre), contre 4-6 jours chez la grenouille griffue (Xenopus) et 4-7 jours chez le poisson rouge.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('serpent des blés (couleuvre)', true, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un rat domestique, laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.', true, 2),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), gerbille et cochon, lequel est le plus lourd à l''âge adulte ?', 'Un cochon adulte pèse en moyenne 50-350 kg, bien plus qu''une mouche soldat noire (larves) (0.0001-0.0002 kg) ou une gerbille (0.08-0.12 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', true, 1),
  ('mouche soldat noire (larves)', false, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi lapin, poisson rouge et tortue terrestre, lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue terrestre est plutôt solitaire à l''état naturel, alors que le lapin et le poisson rouge sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('tortue terrestre', true, 2),
  ('poisson rouge', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, rat domestique et chat, lequel a la gestation la plus longue ?', 'La gestation dure environ 63-67 jours chez le chat, contre 19-21 jours chez la souris domestique et 21-23 jours chez le rat domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('souris domestique', false, 2),
  ('chat', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, tortue aquatique (Trachemys) et âne, lequel est le plus lourd à l''âge adulte ?', 'Un âne adulte pèse en moyenne 160-300 kg, bien plus qu''un hamster syrien (0.1-0.15 kg) ou une tortue aquatique (Trachemys) (0.3-1 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('âne', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chien, chinchilla et hérisson domestique, lequel est principalement actif la nuit (nocturne) ?', 'L''hérisson domestique est nocturne, alors que le chien est plutôt diurne et le chinchilla plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('hérisson domestique', true, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, discus et chinchilla, lequel est le plus lourd à l''âge adulte ?', 'Un chinchilla adulte pèse en moyenne 0.4-0.6 kg, bien plus qu''une gerbille (0.08-0.12 kg) ou un discus (0.1-0.3 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('gerbille', false, 2),
  ('chinchilla', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un gecko léopard, laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi vache, gerbille et furet, lequel a en moyenne les portées les plus nombreuses ?', 'Le furet a en moyenne 3-7 petits par portée, contre 1-1 pour la vache et 3-6 pour la gerbille.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('furet', true, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, lapin et âne, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, l''hérisson domestique vit environ 4-6 ans, nettement moins que le lapin et l''âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('hérisson domestique', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un volume d''eau bien plus grand qu''un simple bocal : contrairement à une idée reçue, il peut atteindre une taille importante » ?', 'Cette description correspond au poisson rouge.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', true, 1),
  ('hamster syrien', false, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi abeille domestique, canari et furet, lequel a un régime alimentaire strictement herbivore ?', 'L''abeille domestique est herbivore, alors que le canari est granivore et le furet est carnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('furet', false, 2),
  ('abeille domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, hamster syrien et cochon d''Inde, lequel est le plus lourd à l''âge adulte ?', 'Un cochon d''Inde adulte pèse en moyenne 0.7-1.2 kg, bien plus qu''une abeille domestique (0.0001-0.0001 kg) ou un hamster syrien (0.1-0.15 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', false, 1),
  ('cochon d''Inde', true, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, gerbille et cochon, lequel est le plus léger à l''âge adulte ?', 'Une souris domestique adulte pèse en moyenne 0.02-0.04 kg, nettement moins que la gerbille et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('cochon', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi pogona (dragon barbu), canard et vache, lequel est le plus lourd à l''âge adulte ?', 'Une vache adulte pèse en moyenne 500-800 kg, bien plus qu''un pogona (dragon barbu) (0.3-0.6 kg) ou un canard (1-3.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('pogona (dragon barbu)', false, 2),
  ('vache', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, axolotl et chèvre, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''axolotl est plutôt solitaire à l''état naturel, alors que l''abeille domestique et la chèvre sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('axolotl', true, 2),
  ('abeille domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, gerbille et cochon, lequel est le plus lourd à l''âge adulte ?', 'Un cochon adulte pèse en moyenne 50-350 kg, bien plus qu''une souris domestique (0.02-0.04 kg) ou une gerbille (0.08-0.12 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('cochon', true, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi chinchilla, pigeon et poisson rouge, lequel a un régime alimentaire strictement herbivore ?', 'Le chinchilla est herbivore, alors que le pigeon est granivore et le poisson rouge est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', true, 1),
  ('poisson rouge', false, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canard, cheval et rat domestique, lequel est principalement actif la nuit (nocturne) ?', 'Le rat domestique est nocturne, alors que le canard est plutôt diurne et le cheval plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('cheval', false, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi abeille domestique, gerbille et grenouille griffue (Xenopus), lequel a un régime alimentaire strictement carnivore ?', 'La grenouille griffue (Xenopus) est carnivore, alors que l''abeille domestique est herbivore et la gerbille est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', true, 1),
  ('abeille domestique', false, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), poule et lapin, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le lapin vit environ 8-12 ans, contre 2-4 ans pour le betta (combattant) et 5-10 ans pour la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', false, 1),
  ('betta (combattant)', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi grenouille griffue (Xenopus), tortue aquatique (Trachemys) et cheval, lequel est le plus lourd à l''âge adulte ?', 'Un cheval adulte pèse en moyenne 400-600 kg, bien plus qu''une grenouille griffue (Xenopus) (0.06-0.15 kg) ou une tortue aquatique (Trachemys) (0.3-1 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('tortue aquatique (Trachemys)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi canard, chinchilla et furet, lequel a un régime alimentaire strictement carnivore ?', 'Le furet est carnivore, alors que le canard est omnivore et le chinchilla est herbivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', true, 1),
  ('canard', false, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perruche ondulée, discus et lapin, lequel est le plus léger à l''âge adulte ?', 'Une perruche ondulée adulte pèse en moyenne 0.03-0.04 kg, nettement moins que le discus et le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('perruche ondulée', true, 2),
  ('discus', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un chat ?', 'Chez le chat, une absence totale d''émission d''urine pendant plus de 24 h (suspicion d''obstruction urinaire, urgence vitale).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une absence totale d''émission d''urine pendant plus de 24 h (suspicion d''obstruction urinaire, urgence vitale)', true, 1),
  ('une boiterie soudaine associée à un isolement du reste du troupeau', false, 2),
  ('l''arrêt complet de la rumination (mâchouillement régulier), signe précoce de trouble digestif', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, escargot petit-gris et tortue terrestre, lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue terrestre est plutôt solitaire à l''état naturel, alors que la chèvre et l''escargot petit-gris sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('chèvre', false, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, poisson rouge et souris domestique, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'La souris domestique est un mammifère, alors que le discus et le poisson rouge sont tous les deux des poissons.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', true, 1),
  ('discus', false, 2),
  ('poisson rouge', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour une tortue terrestre ?', 'Chez la tortue terrestre, l''avocat et les épluchures de pomme de terre crue est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('le blanc de poulet cuit et non assaisonné', false, 1),
  ('l''avocat et les épluchures de pomme de terre crue', true, 2),
  ('le riz blanc', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, cochon d''Inde et rat domestique, lequel est principalement actif la nuit (nocturne) ?', 'Le rat domestique est nocturne, alors que le canari est plutôt diurne et le cochon d''Inde plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('cochon d''Inde', false, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cheval, escargot petit-gris et tortue terrestre, lequel est principalement actif la nuit (nocturne) ?', 'L''escargot petit-gris est nocturne, alors que le cheval est plutôt diurne et la tortue terrestre plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', false, 1),
  ('cheval', false, 2),
  ('escargot petit-gris', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, chinchilla et hamster syrien, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hamster syrien est plutôt solitaire à l''état naturel, alors que l''abeille domestique et le chinchilla sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', false, 1),
  ('hamster syrien', true, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, canard et pigeon, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'L''axolotl est un amphibien, alors que le canard et le pigeon sont tous les deux des oiseaus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('axolotl', true, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un dindon, laquelle de ces affirmations est exacte ? (variante 2)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 1),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 2),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, furet et rat domestique, lequel a en moyenne les portées les plus nombreuses ?', 'Le rat domestique a en moyenne 6-12 petits par portée, contre 3-6 pour la gerbille et 3-7 pour le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('furet', false, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, chinchilla et tortue terrestre, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le rat domestique vit environ 2-3 ans, nettement moins que le chinchilla et la tortue terrestre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('tortue terrestre', false, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi hamster syrien, lapin et mouche soldat noire (larves), lequel est principalement actif la nuit (nocturne) ?', 'L''hamster syrien est nocturne, alors que le lapin est plutôt crepusculaire et la mouche soldat noire (larves) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('mouche soldat noire (larves)', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouton, gerbille et hamster syrien, lequel a en moyenne les portées les plus nombreuses ?', 'L''hamster syrien a en moyenne 4-10 petits par portée, contre 1-3 pour le mouton et 3-6 pour la gerbille.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('gerbille', false, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, hérisson domestique et poisson rouge, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hérisson domestique est plutôt solitaire à l''état naturel, alors que l''abeille domestique et le poisson rouge sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', false, 1),
  ('hérisson domestique', true, 2),
  ('poisson rouge', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un pigeon, laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 2),
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi âne, dindon et furet, lequel a un régime alimentaire strictement herbivore ?', 'L''âne est herbivore, alors que le dindon est omnivore et le furet est carnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('dindon', false, 2),
  ('âne', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), tortue aquatique (Trachemys) et vache, lequel est le plus lourd à l''âge adulte ?', 'Une vache adulte pèse en moyenne 500-800 kg, bien plus qu''une mouche soldat noire (larves) (0.0001-0.0002 kg) ou une tortue aquatique (Trachemys) (0.3-1 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('mouche soldat noire (larves)', false, 2),
  ('vache', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un accès à un pâturage ou à une aire de couchage sèche et suffisamment spacieuse pour se relever sans entrave » ?', 'Cette description correspond au vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('vache', true, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un lapin ?', 'Chez le lapin, un arrêt total de l''alimentation depuis plus de 12 h (risque de stase digestive, urgence vitale).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('des nageoires repliées en permanence contre le corps', false, 1),
  ('un arrêt total de l''alimentation depuis plus de 12 h (risque de stase digestive, urgence vitale)', true, 2),
  ('une immobilité prolongée et un refus de s''alimenter (l''âne masque très bien la douleur)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, chat et chien, lequel a en moyenne les portées les plus nombreuses ?', 'Le chien a en moyenne 1-8 petits par portée, contre 1-4 pour le cochon d''Inde et 1-6 pour le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('chien', true, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un pogona (dragon barbu), laquelle de ces affirmations est exacte ? (variante 2)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi discus, pogona (dragon barbu) et tortue aquatique (Trachemys), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le discus est grégaire et a besoin de compagnie de son espèce, alors que le pogona (dragon barbu) et la tortue aquatique (Trachemys) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', true, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('pogona (dragon barbu)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cheval, chèvre et tortue aquatique (Trachemys), lequel n''appartient pas à la même classe biologique que les deux autres ?', 'La tortue aquatique (Trachemys) est un reptile, alors que le cheval et la chèvre sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('cheval', false, 2),
  ('tortue aquatique (Trachemys)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, poule et vache, lequel est le plus lourd à l''âge adulte ?', 'Une vache adulte pèse en moyenne 500-800 kg, bien plus qu''un cochon d''Inde (0.7-1.2 kg) ou une poule (1.5-3 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', true, 1),
  ('cochon d''Inde', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi chat, oie et rat domestique, lequel a un régime alimentaire strictement herbivore ?', 'L''oie est herbivore, alors que le chat est carnivore et le rat domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('oie', true, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi pigeon, canard et serpent des blés (couleuvre), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 55-65 jours chez le serpent des blés (couleuvre), contre 17-19 jours chez le pigeon et 26-28 jours chez le canard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('serpent des blés (couleuvre)', true, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi âne, chien et dindon, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le dindon est un oiseau, alors que l''âne et le chien sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('dindon', true, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un apport quotidien de vitamine C (fruits et légumes), qu''il ne synthétise pas lui-même » ?', 'Cette description correspond au cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', true, 1),
  ('hérisson domestique', false, 2),
  ('discus', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une nage constamment en surface avec la bouche qui happe l''air (manque d''oxygène dissous) » ?', 'Ce signe d''alerte concerne le poisson rouge.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un chien ?', 'Chez le chien, un accès régulier à l''extérieur pour se dépenser et un couchage à l''écart des courants d''air.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un accès à un pâturage ou à une aire de couchage sèche et suffisamment spacieuse pour se relever sans entrave', false, 1),
  ('un accès régulier à l''extérieur pour se dépenser et un couchage à l''écart des courants d''air', true, 2),
  ('un substrat à fouiller (paille, terre) : le fouissage est un comportement naturel essentiel', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), canari et tortue terrestre, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue terrestre, contre 4-5 jours chez la mouche soldat noire (larves) et 13-14 jours chez le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('tortue terrestre', true, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, gerbille et cochon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la souris domestique vit environ 1.5-2.5 ans, nettement moins que la gerbille et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('cochon', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cheval, chien et lapin, lequel a en moyenne les portées les plus nombreuses ?', 'Le lapin a en moyenne 4-8 petits par portée, contre 1-1 pour le cheval et 1-8 pour le chien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('chien', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi pogona (dragon barbu), cochon et gecko léopard, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le pogona (dragon barbu) vit environ 8-12 ans, nettement moins que le cochon et le gecko léopard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', true, 1),
  ('cochon', false, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi escargot petit-gris, furet et oie, lequel est principalement actif le jour (diurne) ?', 'L''oie est diurne, alors que l''escargot petit-gris est plutôt nocturne et le furet plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', true, 1),
  ('escargot petit-gris', false, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « un refus de s''alimenter pendant plusieurs repas consécutifs hors période de mue ou d''hivernage » ?', 'Ce signe d''alerte concerne le serpent des blés (couleuvre).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('mouton', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), chinchilla et tortue terrestre, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la mouche soldat noire (larves) vit environ 0.15-0.3 ans, nettement moins que le chinchilla et la tortue terrestre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('mouche soldat noire (larves)', true, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi furet, gecko léopard et pigeon, lequel est principalement actif la nuit (nocturne) ?', 'Le gecko léopard est nocturne, alors que le furet est plutôt crepusculaire et le pigeon plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('gecko léopard', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chat, chèvre et vache, lequel a la gestation la plus longue ?', 'La gestation dure environ 279-292 jours chez la vache, contre 63-67 jours chez le chat et 145-155 jours chez la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('vache', true, 2),
  ('chat', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi pigeon, vache et âne, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''âne vit environ 25-35 ans, contre 5-15 ans pour le pigeon et 18-22 ans pour la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', true, 1),
  ('vache', false, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un âne, laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un lapin ?', 'Chez le lapin, du foin à volonté et un espace assez grand pour faire au moins trois bonds à la suite.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('du foin à volonté et un espace assez grand pour faire au moins trois bonds à la suite', true, 1),
  ('un substrat profond pour creuser des galeries, son comportement naturel principal', false, 2),
  ('une boîte à humidité (moss box) pour faciliter ses mues, en plus d''une zone chaude et d''une zone froide', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, perroquet gris du Gabon et tortue aquatique (Trachemys), lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue aquatique (Trachemys), contre 14-21 jours chez l''axolotl et 28-30 jours chez le perroquet gris du Gabon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('tortue aquatique (Trachemys)', true, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi cheval, chien et grenouille griffue (Xenopus), lequel a un régime alimentaire strictement herbivore ?', 'Le cheval est herbivore, alors que le chien est omnivore et la grenouille griffue (Xenopus) est carnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi lapin, canard et oie, lequel est le plus léger à l''âge adulte ?', 'Un lapin adulte pèse en moyenne 1.2-2.5 kg, nettement moins que le canard et l''oie.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('oie', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi mouche soldat noire (larves), perruche ondulée et serpent des blés (couleuvre), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le serpent des blés (couleuvre) est plutôt solitaire à l''état naturel, alors que la mouche soldat noire (larves) et la perruche ondulée sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', true, 1),
  ('mouche soldat noire (larves)', false, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, cheval et hamster syrien, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le cheval est grégaire et a besoin de compagnie de son espèce, alors que l''axolotl et l''hamster syrien vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', true, 1),
  ('hamster syrien', false, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, canard et chèvre, lequel est le plus léger à l''âge adulte ?', 'Un hérisson domestique adulte pèse en moyenne 0.3-0.6 kg, nettement moins que le canard et la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('canard', false, 2),
  ('hérisson domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi escargot petit-gris, oie et tortue aquatique (Trachemys), lequel est principalement actif la nuit (nocturne) ?', 'L''escargot petit-gris est nocturne, alors que l''oie est plutôt diurne et la tortue aquatique (Trachemys) plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', true, 1),
  ('oie', false, 2),
  ('tortue aquatique (Trachemys)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, poule et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la souris domestique vit environ 1.5-2.5 ans, nettement moins que la poule et le perroquet gris du Gabon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', true, 1),
  ('poule', false, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouton, oie et serpent des blés (couleuvre), lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le mouton vit environ 10-12 ans, nettement moins que l''oie et le serpent des blés (couleuvre).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('mouton', true, 2),
  ('oie', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « une cage assez longue pour voler horizontalement : contrairement à la perruche, il vit bien seul mais a besoin d''espace pour voler » ?', 'Cette description correspond au canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('dindon', false, 2),
  ('souris domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi oie, perroquet gris du Gabon et tortue aquatique (Trachemys), lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue aquatique (Trachemys) est plutôt solitaire à l''état naturel, alors que l''oie et le perroquet gris du Gabon sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', true, 1),
  ('oie', false, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, chien et chat, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la gerbille vit environ 2-4 ans, nettement moins que le chien et le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('chat', false, 2),
  ('gerbille', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, betta (combattant) et escargot petit-gris, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''escargot petit-gris vit environ 5-8 ans, contre 2-3 ans pour le rat domestique et 2-4 ans pour le betta (combattant).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', true, 1),
  ('rat domestique', false, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un poisson rouge ?', 'Chez le poisson rouge, une nage constamment en surface avec la bouche qui happe l''air (manque d''oxygène dissous).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un pelage humide autour du nez et des yeux (souvent lié à une allergie à la poussière de son substrat)', false, 1),
  ('une nage constamment en surface avec la bouche qui happe l''air (manque d''oxygène dissous)', true, 2),
  ('des membres qui se déforment ou une mâchoire qui devient molle (carence en calcium, maladie osseuse métabolique)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un hérisson domestique ?', 'Chez l''hérisson domestique, une température ambiante stable au-dessus de 22°C : le froid peut déclencher une tentative d''hibernation dangereuse.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un accès à un point d''eau pour boire par aspiration continue, une particularité rare chez les oiseaux', false, 1),
  ('une température ambiante stable au-dessus de 22°C : le froid peut déclencher une tentative d''hibernation dangereuse', true, 2),
  ('la compagnie d''au moins un autre rat : l''isolement social lui cause un vrai mal-être', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, gecko léopard et mouton, lequel est le plus léger à l''âge adulte ?', 'Une souris domestique adulte pèse en moyenne 0.02-0.04 kg, nettement moins que le gecko léopard et le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('souris domestique', true, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, hamster syrien et tortue aquatique (Trachemys), lequel est le plus lourd à l''âge adulte ?', 'Une tortue aquatique (Trachemys) adulte pèse en moyenne 0.3-1 kg, bien plus qu''une abeille domestique (0.0001-0.0001 kg) ou un hamster syrien (0.1-0.15 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', true, 1),
  ('hamster syrien', false, 2),
  ('abeille domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, cheval et hérisson domestique, lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le cheval est grégaire et a besoin de compagnie de son espèce, alors que le canari et l''hérisson domestique vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('hérisson domestique', false, 2),
  ('cheval', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, axolotl et canard, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 26-28 jours chez le canard, contre 2-3 jours chez le discus et 14-21 jours chez l''axolotl.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', false, 1),
  ('discus', false, 2),
  ('canard', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi âne, mouton et tortue terrestre, lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue terrestre est plutôt solitaire à l''état naturel, alors que l''âne et le mouton sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('tortue terrestre', true, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour un chat ?', 'Chez le chat, l''oignon et l''ail (destruction des globules rouges) est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('la courgette cuite sans assaisonnement', false, 1),
  ('le blanc de poulet cuit et non assaisonné', false, 2),
  ('l''oignon et l''ail (destruction des globules rouges)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, gerbille et âne, lequel a la gestation la plus longue ?', 'La gestation dure environ 365-375 jours chez l''âne, contre 21-23 jours chez le rat domestique et 24-26 jours chez la gerbille.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('âne', true, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, perroquet gris du Gabon et lapin, lequel est le plus lourd à l''âge adulte ?', 'Un lapin adulte pèse en moyenne 1.2-2.5 kg, bien plus qu''un axolotl (0.06-0.15 kg) ou un perroquet gris du Gabon (0.4-0.55 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('axolotl', false, 2),
  ('lapin', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, serpent des blés (couleuvre) et furet, lequel est le plus léger à l''âge adulte ?', 'Un canari adulte pèse en moyenne 0.015-0.02 kg, nettement moins que le serpent des blés (couleuvre) et le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez une chèvre ?', 'Chez la chèvre, une position voûtée avec les dents grinçantes, signe fréquent de douleur abdominale.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une flottaison anormale sur le flanc ou le dos', false, 1),
  ('une position voûtée avec les dents grinçantes, signe fréquent de douleur abdominale', true, 2),
  ('une respiration bruyante ou sifflante (les rats sont très sensibles aux infections respiratoires)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gerbille, hamster syrien et perroquet gris du Gabon, lequel est principalement actif la nuit (nocturne) ?', 'L''hamster syrien est nocturne, alors que la gerbille est plutôt diurne et le perroquet gris du Gabon plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('gerbille', false, 2),
  ('hamster syrien', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi grenouille griffue (Xenopus), perruche ondulée et tortue terrestre, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue terrestre, contre 4-6 jours chez la grenouille griffue (Xenopus) et 17-19 jours chez la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('tortue terrestre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi lapin, chien et chat, lequel a la gestation la plus longue ?', 'La gestation dure environ 63-67 jours chez le chat, contre 28-33 jours chez le lapin et 58-68 jours chez le chien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('chien', false, 2),
  ('chat', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, chinchilla et vache, lequel a la gestation la plus longue ?', 'La gestation dure environ 279-292 jours chez la vache, contre 16-18 jours chez l''hamster syrien et 105-115 jours chez le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('vache', true, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouton, chèvre et âne, lequel a la gestation la plus longue ?', 'La gestation dure environ 365-375 jours chez l''âne, contre 144-152 jours chez le mouton et 145-155 jours chez la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('âne', true, 2),
  ('chèvre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cheval, gerbille et pogona (dragon barbu), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le pogona (dragon barbu) est plutôt solitaire à l''état naturel, alors que le cheval et la gerbille sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('pogona (dragon barbu)', true, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « une cachette bien fermée de chaque côté du terrarium (zone chaude et zone froide) où il se sent totalement à l''abri » ?', 'Cette description correspond au serpent des blés (couleuvre).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', true, 1),
  ('hamster syrien', false, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi dindon, gecko léopard et souris domestique, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le gecko léopard est plutôt solitaire à l''état naturel, alors que le dindon et la souris domestique sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('souris domestique', false, 1),
  ('gecko léopard', true, 2),
  ('dindon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canard, cheval et cochon d''Inde, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le canard est un oiseau, alors que le cheval et le cochon d''Inde sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('cochon d''Inde', false, 2),
  ('canard', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi abeille domestique, gerbille et grenouille griffue (Xenopus), lequel a un régime alimentaire strictement herbivore ?', 'L''abeille domestique est herbivore, alors que la gerbille est omnivore et la grenouille griffue (Xenopus) est carnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', false, 1),
  ('gerbille', false, 2),
  ('abeille domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un accès à de l''eau assez profonde pour immerger toute la tête, indispensable pour nettoyer ses narines et ses yeux » ?', 'Cette description correspond au canard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('canard', true, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, canard et chèvre, lequel est le plus lourd à l''âge adulte ?', 'Une chèvre adulte pèse en moyenne 30-65 kg, bien plus qu''un hérisson domestique (0.3-0.6 kg) ou un canard (1-3.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', true, 1),
  ('hérisson domestique', false, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une tortue terrestre, laquelle de ces affirmations est exacte ? (variante 1)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour un perroquet gris du Gabon ?', 'Chez le perroquet gris du Gabon, le chocolat et l''avocat est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('le riz blanc', false, 1),
  ('la pomme sans les pépins', false, 2),
  ('le chocolat et l''avocat', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi betta (combattant), lapin et mouche soldat noire (larves), lequel a un régime alimentaire strictement carnivore ?', 'Le betta (combattant) est carnivore, alors que le lapin est herbivore et la mouche soldat noire (larves) est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('lapin', false, 2),
  ('betta (combattant)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, hamster syrien et chèvre, lequel est le plus léger à l''âge adulte ?', 'Un escargot petit-gris adulte pèse en moyenne 0.005-0.015 kg, nettement moins que l''hamster syrien et la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('escargot petit-gris', true, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, cochon et cheval, lequel a la gestation la plus longue ?', 'La gestation dure environ 330-345 jours chez le cheval, contre 16-18 jours chez l''hamster syrien et 112-115 jours chez le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', true, 1),
  ('hamster syrien', false, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un pigeon ?', 'Chez le pigeon, un accès à un point d''eau pour boire par aspiration continue, une particularité rare chez les oiseaux.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('plusieurs heures de sortie de cage par jour : il ne supporte pas d''y rester enfermé en continu', false, 1),
  ('une humidité constante : sans elle, il s''enferme dans sa coquille derrière un opercule de mucus', false, 2),
  ('un accès à un point d''eau pour boire par aspiration continue, une particularité rare chez les oiseaux', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « une température ambiante stable au-dessus de 22°C : le froid peut déclencher une tentative d''hibernation dangereuse » ?', 'Cette description correspond au hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', true, 1),
  ('souris domestique', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chat, cheval et perroquet gris du Gabon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le perroquet gris du Gabon vit environ 40-60 ans, contre 13-17 ans pour le chat et 25-30 ans pour le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', true, 1),
  ('chat', false, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi dindon, grenouille griffue (Xenopus) et hérisson domestique, lequel a un régime alimentaire strictement carnivore ?', 'La grenouille griffue (Xenopus) est carnivore, alors que le dindon est omnivore et l''hérisson domestique est insectivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', true, 1),
  ('dindon', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, canard et dindon, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 27-28 jours chez le dindon, contre 2-3 jours chez le discus et 26-28 jours chez le canard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('dindon', true, 2),
  ('discus', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi âne, perruche ondulée et rat domestique, lequel a un régime alimentaire strictement herbivore ?', 'L''âne est herbivore, alors que la perruche ondulée est granivore et le rat domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('perruche ondulée', false, 2),
  ('âne', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), hérisson domestique et gecko léopard, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le gecko léopard vit environ 15-20 ans, contre 0.15-0.3 ans pour la mouche soldat noire (larves) et 4-6 ans pour l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('gecko léopard', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, discus et mouche soldat noire (larves), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le chat est plutôt solitaire à l''état naturel, alors que le discus et la mouche soldat noire (larves) sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', true, 1),
  ('discus', false, 2),
  ('mouche soldat noire (larves)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un mouton ?', 'Chez le mouton, une boiterie soudaine associée à un isolement du reste du troupeau.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('des plumes ternes qui ne repoussent plus imperméables (perte d''étanchéité du plumage)', false, 1),
  ('un silence inhabituel et l''arrêt des petits cris habituels au moment du repas', false, 2),
  ('une boiterie soudaine associée à un isolement du reste du troupeau', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour un canard ?', 'Chez le canard, le pain en grande quantité (carences, sans valeur nutritive adaptée) est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('la pomme sans les pépins', false, 1),
  ('le pain en grande quantité (carences, sans valeur nutritive adaptée)', true, 2),
  ('la carotte cuite', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, dindon et mouche soldat noire (larves), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le canari est plutôt solitaire à l''état naturel, alors que le dindon et la mouche soldat noire (larves) sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('dindon', false, 2),
  ('canari', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), perruche ondulée et cochon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le cochon vit environ 10-15 ans, contre 2-4 ans pour le betta (combattant) et 7-10 ans pour la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', true, 1),
  ('perruche ondulée', false, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi canari, grenouille griffue (Xenopus) et tortue terrestre, lequel a un régime alimentaire strictement carnivore ?', 'La grenouille griffue (Xenopus) est carnivore, alors que le canari est granivore et la tortue terrestre est herbivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', true, 1),
  ('canari', false, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un abri sec permanent : contrairement au cheval, son pelage n''est pas imperméable à la pluie » ?', 'Cette description correspond au âne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('âne', true, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un chinchilla ?', 'Chez le chinchilla, des zones de pelage arraché ou clairsemé (souvent lié au stress ou à un environnement trop humide).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une respiration bruyante ou sifflante (les rats sont très sensibles aux infections respiratoires)', false, 1),
  ('des zones de pelage arraché ou clairsemé (souvent lié au stress ou à un environnement trop humide)', true, 2),
  ('une absence totale d''émission d''urine pendant plus de 24 h (suspicion d''obstruction urinaire, urgence vitale)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, hamster syrien et cochon d''Inde, lequel est le plus léger à l''âge adulte ?', 'Une abeille domestique adulte pèse en moyenne 0.0001-0.0001 kg, nettement moins que l''hamster syrien et le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('abeille domestique', true, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, pigeon et pogona (dragon barbu), lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le cochon d''Inde vit environ 5-8 ans, nettement moins que le pigeon et le pogona (dragon barbu).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('pigeon', false, 2),
  ('cochon d''Inde', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un cheval, laquelle de ces affirmations est exacte ? (variante 2)', 'Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal malade ou blessé ne doit pas être transporté si le trajet risque d''aggraver son état, sauf avis vétérinaire contraire.', true, 1),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 2),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cochon d''Inde, hamster syrien et poule, lequel est principalement actif le jour (diurne) ?', 'La poule est diurne, alors que le cochon d''Inde est plutôt crepusculaire et l''hamster syrien plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('hamster syrien', false, 2),
  ('poule', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une oie, laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 1),
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 2),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un lapin, laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 1),
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 2),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi lapin, chinchilla et vache, lequel a la gestation la plus longue ?', 'La gestation dure environ 279-292 jours chez la vache, contre 28-33 jours chez le lapin et 105-115 jours chez le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('vache', true, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), escargot petit-gris et âne, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''âne vit environ 25-35 ans, contre 2-4 ans pour le betta (combattant) et 5-8 ans pour l''escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', true, 1),
  ('escargot petit-gris', false, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi vache, chèvre et chat, lequel a en moyenne les portées les plus nombreuses ?', 'Le chat a en moyenne 1-6 petits par portée, contre 1-1 pour la vache et 1-3 pour la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('vache', false, 2),
  ('chat', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, canari et canard, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 26-28 jours chez le canard, contre 2-3 jours chez le discus et 13-14 jours chez le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('canari', false, 2),
  ('canard', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, tortue aquatique (Trachemys) et furet, lequel est le plus léger à l''âge adulte ?', 'Un hamster syrien adulte pèse en moyenne 0.1-0.15 kg, nettement moins que la tortue aquatique (Trachemys) et le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('furet', false, 2),
  ('tortue aquatique (Trachemys)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perruche ondulée, gerbille et poule, lequel est le plus lourd à l''âge adulte ?', 'Une poule adulte pèse en moyenne 1.5-3 kg, bien plus qu''une perruche ondulée (0.03-0.04 kg) ou une gerbille (0.08-0.12 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('poule', true, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canard, grenouille griffue (Xenopus) et tortue aquatique (Trachemys), lequel vit naturellement seul plutôt qu''en groupe ?', 'La tortue aquatique (Trachemys) est plutôt solitaire à l''état naturel, alors que le canard et la grenouille griffue (Xenopus) sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canard', false, 1),
  ('tortue aquatique (Trachemys)', true, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, dindon et escargot petit-gris, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''axolotl est plutôt solitaire à l''état naturel, alors que le dindon et l''escargot petit-gris sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('dindon', false, 1),
  ('escargot petit-gris', false, 2),
  ('axolotl', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez une tortue aquatique (Trachemys) ?', 'Chez la tortue aquatique (Trachemys), une carapace qui se ramollit ou présente des zones pâles (suspicion de maladie osseuse métabolique).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une bosse ou un renflement dans les bajoues qui ne se résorbe pas (abcès buccal possible)', false, 1),
  ('une carapace qui se ramollit ou présente des zones pâles (suspicion de maladie osseuse métabolique)', true, 2),
  ('une chute massive et soudaine du nombre d''abeilles dans la ruche', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un substrat humide riche en matière organique en décomposition » ?', 'Cette description correspond au mouche soldat noire (larves).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('gerbille', false, 2),
  ('mouche soldat noire (larves)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi furet, hérisson domestique et oie, lequel est principalement actif le jour (diurne) ?', 'L''oie est diurne, alors que le furet est plutôt crepusculaire et l''hérisson domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('furet', false, 2),
  ('oie', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « un ventre gonflé et dur associé à des tentatives de vomir sans y arriver (suspicion de torsion d''estomac, urgence vitale) » ?', 'Ce signe d''alerte concerne le chien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', true, 1),
  ('cochon d''Inde', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, poisson rouge et vache, lequel est le plus léger à l''âge adulte ?', 'Une souris domestique adulte pèse en moyenne 0.02-0.04 kg, nettement moins que le poisson rouge et la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('vache', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cochon, escargot petit-gris et perruche ondulée, lequel est principalement actif la nuit (nocturne) ?', 'L''escargot petit-gris est nocturne, alors que le cochon est plutôt diurne et la perruche ondulée plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('escargot petit-gris', true, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi betta (combattant), lapin et perruche ondulée, lequel a un régime alimentaire strictement carnivore ?', 'Le betta (combattant) est carnivore, alors que le lapin est herbivore et la perruche ondulée est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', false, 1),
  ('perruche ondulée', false, 2),
  ('betta (combattant)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « l''arrêt complet de la rumination (mâchouillement régulier), signe précoce de trouble digestif » ?', 'Ce signe d''alerte concerne la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', true, 1),
  ('betta (combattant)', false, 2),
  ('tortue terrestre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un gecko léopard ?', 'Chez le gecko léopard, une boîte à humidité (moss box) pour faciliter ses mues, en plus d''une zone chaude et d''une zone froide.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un accès à un point d''eau pour boire par aspiration continue, une particularité rare chez les oiseaux', false, 1),
  ('une eau maintenue sous 22°C : au-delà, son métabolisme se dérègle et son immunité chute fortement', false, 2),
  ('une boîte à humidité (moss box) pour faciliter ses mues, en plus d''une zone chaude et d''une zone froide', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « des membres qui se déforment ou une mâchoire qui devient molle (carence en calcium, maladie osseuse métabolique) » ?', 'Ce signe d''alerte concerne le pogona (dragon barbu).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', true, 1),
  ('dindon', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi âne, furet et hamster syrien, lequel a un régime alimentaire strictement carnivore ?', 'Le furet est carnivore, alors que l''âne est herbivore et l''hamster syrien est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('furet', true, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi rat domestique, chinchilla et tortue terrestre, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la tortue terrestre vit environ 50-80 ans, contre 2-3 ans pour le rat domestique et 10-15 ans pour le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', false, 1),
  ('chinchilla', false, 2),
  ('tortue terrestre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi furet, cochon d''Inde et vache, lequel a la gestation la plus longue ?', 'La gestation dure environ 279-292 jours chez la vache, contre 41-43 jours chez le furet et 59-72 jours chez le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('furet', false, 2),
  ('vache', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi âne, grenouille griffue (Xenopus) et hamster syrien, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hamster syrien est plutôt solitaire à l''état naturel, alors que l''âne et la grenouille griffue (Xenopus) sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('âne', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chat, rat domestique et vache, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le chat est plutôt solitaire à l''état naturel, alors que le rat domestique et la vache sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', true, 1),
  ('rat domestique', false, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi abeille domestique, perruche ondulée et rat domestique, lequel a un régime alimentaire strictement herbivore ?', 'L''abeille domestique est herbivore, alors que la perruche ondulée est granivore et le rat domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', true, 1),
  ('perruche ondulée', false, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, cochon et lapin, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le canari est plutôt solitaire à l''état naturel, alors que le cochon et le lapin sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('lapin', false, 2),
  ('canari', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), cochon et furet, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le betta (combattant) est plutôt solitaire à l''état naturel, alors que le cochon et le furet sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('betta (combattant)', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), souris domestique et canari, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le canari vit environ 8-12 ans, contre 0.15-0.3 ans pour la mouche soldat noire (larves) et 1.5-2.5 ans pour la souris domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('souris domestique', false, 2),
  ('canari', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), escargot petit-gris et tortue terrestre, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la tortue terrestre vit environ 50-80 ans, contre 2-4 ans pour le betta (combattant) et 5-8 ans pour l''escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('betta (combattant)', false, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un betta (combattant), laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 2),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chien, escargot petit-gris et hérisson domestique, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hérisson domestique est plutôt solitaire à l''état naturel, alors que le chien et l''escargot petit-gris sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('hérisson domestique', true, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), escargot petit-gris et perroquet gris du Gabon, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 28-30 jours chez le perroquet gris du Gabon, contre 4-5 jours chez la mouche soldat noire (larves) et 15-30 jours chez l''escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('escargot petit-gris', false, 2),
  ('perroquet gris du Gabon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 7)', 'Un furet, comme le chien et le chat, doit être identifié par puce électronique ou tatouage en France.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Une annonce de vente d''animal n''a jamais besoin de mentionner le moindre numéro d''identification.', false, 1),
  ('L''identification des chiens et chats par puce électronique est facultative en toutes circonstances.', false, 2),
  ('Un furet, comme le chien et le chat, doit être identifié par puce électronique ou tatouage en France.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un canard, laquelle de ces affirmations est exacte ? (variante 1)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Chez quel animal ce signe est-il un motif d''alerte : « une absence totale d''émission d''urine pendant plus de 24 h (suspicion d''obstruction urinaire, urgence vitale) » ?', 'Ce signe d''alerte concerne le chat.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('oie', false, 2),
  ('chat', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cheval, hérisson domestique et gerbille, lequel a en moyenne les portées les plus nombreuses ?', 'La gerbille a en moyenne 3-6 petits par portée, contre 1-1 pour le cheval et 2-5 pour l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', false, 1),
  ('gerbille', true, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), grenouille griffue (Xenopus) et poule, lequel est le plus léger à l''âge adulte ?', 'Un betta (combattant) adulte pèse en moyenne 0.005-0.01 kg, nettement moins que la grenouille griffue (Xenopus) et la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', true, 1),
  ('poule', false, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, furet et chat, lequel a la gestation la plus longue ?', 'La gestation dure environ 63-67 jours chez le chat, contre 16-18 jours chez l''hamster syrien et 41-43 jours chez le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', true, 1),
  ('hamster syrien', false, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, rat domestique et chat, lequel a la gestation la plus longue ?', 'La gestation dure environ 63-67 jours chez le chat, contre 16-18 jours chez l''hamster syrien et 21-23 jours chez le rat domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', true, 1),
  ('rat domestique', false, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi discus, mouche soldat noire (larves) et serpent des blés (couleuvre), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le serpent des blés (couleuvre) est plutôt solitaire à l''état naturel, alors que le discus et la mouche soldat noire (larves) sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouche soldat noire (larves)', false, 1),
  ('serpent des blés (couleuvre)', true, 2),
  ('discus', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('sante_prophylaxie', 'Quel signe doit alerter chez un chien ?', 'Chez le chien, un ventre gonflé et dur associé à des tentatives de vomir sans y arriver (suspicion de torsion d''estomac, urgence vitale).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('un ventre gonflé et dur associé à des tentatives de vomir sans y arriver (suspicion de torsion d''estomac, urgence vitale)', true, 1),
  ('des branchies qui se recroquevillent ou pâlissent (souvent lié à une eau trop chaude ou de mauvaise qualité)', false, 2),
  ('l''arrêt complet de la rumination (mâchouillement régulier), signe précoce de trouble digestif', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un canari, laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 2),
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, chien et vache, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la vache vit environ 18-22 ans, contre 4-6 ans pour l''hérisson domestique et 10-13 ans pour le chien.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('vache', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouton, hérisson domestique et cochon, lequel a en moyenne les portées les plus nombreuses ?', 'Le cochon a en moyenne 6-12 petits par portée, contre 1-3 pour le mouton et 2-5 pour l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', true, 1),
  ('hérisson domestique', false, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perroquet gris du Gabon, furet et vache, lequel est le plus léger à l''âge adulte ?', 'Un perroquet gris du Gabon adulte pèse en moyenne 0.4-0.55 kg, nettement moins que le furet et la vache.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('vache', false, 1),
  ('furet', false, 2),
  ('perroquet gris du Gabon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, pigeon et poule, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le canari est plutôt solitaire à l''état naturel, alors que le pigeon et la poule sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', false, 1),
  ('canari', true, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi escargot petit-gris, furet et perroquet gris du Gabon, lequel est principalement actif la nuit (nocturne) ?', 'L''escargot petit-gris est nocturne, alors que le furet est plutôt crepusculaire et le perroquet gris du Gabon plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perroquet gris du Gabon', false, 1),
  ('escargot petit-gris', true, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « la laitue iceberg en grande quantité (quasi aucun apport nutritif) » ?', 'Cette toxicité est documentée chez le pogona (dragon barbu).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', false, 1),
  ('escargot petit-gris', false, 2),
  ('pogona (dragon barbu)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, perruche ondulée et pigeon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le pigeon vit environ 5-15 ans, contre 0.08-0.16 ans pour l''abeille domestique et 7-10 ans pour la perruche ondulée.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('abeille domestique', false, 2),
  ('pigeon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi mouton, perruche ondulée et poule, lequel a un régime alimentaire strictement herbivore ?', 'Le mouton est herbivore, alors que la perruche ondulée est granivore et la poule est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', false, 1),
  ('mouton', true, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi axolotl, pigeon et tortue terrestre, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue terrestre, contre 14-21 jours chez l''axolotl et 17-19 jours chez le pigeon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('tortue terrestre', true, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gecko léopard, perroquet gris du Gabon et chèvre, lequel est le plus léger à l''âge adulte ?', 'Un gecko léopard adulte pèse en moyenne 0.05-0.09 kg, nettement moins que le perroquet gris du Gabon et la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', true, 1),
  ('chèvre', false, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi grenouille griffue (Xenopus), serpent des blés (couleuvre) et âne, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''âne vit environ 25-35 ans, contre 10-15 ans pour la grenouille griffue (Xenopus) et 15-20 ans pour le serpent des blés (couleuvre).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', true, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('grenouille griffue (Xenopus)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi dindon, furet et serpent des blés (couleuvre), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le serpent des blés (couleuvre) est plutôt solitaire à l''état naturel, alors que le dindon et le furet sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', false, 1),
  ('dindon', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi âne, chinchilla et hamster syrien, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hamster syrien est plutôt solitaire à l''état naturel, alors que l''âne et le chinchilla sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('hamster syrien', true, 2),
  ('chinchilla', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « un perchoir surélevé pour la nuit : dormir en hauteur est un besoin de sécurité instinctif » ?', 'Cette description correspond au poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pigeon', false, 1),
  ('poule', true, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, poule et tortue terrestre, lequel est le plus lourd à l''âge adulte ?', 'Une tortue terrestre adulte pèse en moyenne 1-5 kg, bien plus qu''un canari (0.015-0.02 kg) ou une poule (1.5-3 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('poule', false, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, chien et mouton, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le canari est plutôt solitaire à l''état naturel, alors que le chien et le mouton sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('canari', true, 2),
  ('chien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chien, poule et serpent des blés (couleuvre), lequel est principalement actif la nuit (nocturne) ?', 'Le serpent des blés (couleuvre) est nocturne, alors que le chien est plutôt diurne et la poule plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chien', false, 1),
  ('serpent des blés (couleuvre)', true, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, poule et cochon, lequel est le plus lourd à l''âge adulte ?', 'Un cochon adulte pèse en moyenne 50-350 kg, bien plus qu''une abeille domestique (0.0001-0.0001 kg) ou une poule (1.5-3 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', true, 1),
  ('abeille domestique', false, 2),
  ('poule', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, canard et oie, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''oie vit environ 15-20 ans, contre 2-4 ans pour la gerbille et 8-12 ans pour le canard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', true, 1),
  ('gerbille', false, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un escargot petit-gris ?', 'Chez l''escargot petit-gris, une humidité constante : sans elle, il s''enferme dans sa coquille derrière un opercule de mucus.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une humidité constante : sans elle, il s''enferme dans sa coquille derrière un opercule de mucus', true, 1),
  ('de l''herbe fraîche à volonté : c''est l''essentiel de son alimentation naturelle', false, 2),
  ('un volume d''eau bien plus grand qu''un simple bocal : contrairement à une idée reçue, il peut atteindre une taille importante', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est exacte ? (affirmation 1)', 'L''ACACED (attestation de connaissances) est en principe exigée pour vendre, garder ou présenter des animaux de compagnie à titre non occasionnel.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Les pensions et refuges qui accueillent des animaux ne sont soumis à aucune règle sanitaire particulière.', false, 1),
  ('L''ACACED (attestation de connaissances) est en principe exigée pour vendre, garder ou présenter des animaux de compagnie à titre non occasionnel.', true, 2),
  ('L''identification des chiens et chats par puce électronique est facultative en toutes circonstances.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi betta (combattant), perruche ondulée et poule, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le betta (combattant) est plutôt solitaire à l''état naturel, alors que la perruche ondulée et la poule sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', false, 1),
  ('betta (combattant)', true, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « une humidité constante : sans elle, il s''enferme dans sa coquille derrière un opercule de mucus » ?', 'Cette description correspond au escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue aquatique (Trachemys)', false, 1),
  ('gecko léopard', false, 2),
  ('escargot petit-gris', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi poisson rouge, gecko léopard et vache, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la vache vit environ 18-22 ans, contre 10-15 ans pour le poisson rouge et 15-20 ans pour le gecko léopard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', false, 1),
  ('vache', true, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour une chèvre ?', 'Chez la chèvre, le laurier-rose (toutes parties, hautement toxique) est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('le riz blanc', false, 1),
  ('la pomme sans les pépins', false, 2),
  ('le laurier-rose (toutes parties, hautement toxique)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, poule et cochon, lequel est le plus léger à l''âge adulte ?', 'Une abeille domestique adulte pèse en moyenne 0.0001-0.0001 kg, nettement moins que la poule et le cochon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poule', false, 1),
  ('abeille domestique', true, 2),
  ('cochon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est fausse ? (affirmation 3)', 'Un professionnel n''a aucune obligation de tenir un quelconque registre concernant les animaux qu''il vend.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un local professionnel qui accueille du public avec des animaux (pension, refuge) est soumis à des règles sanitaires spécifiques.', false, 1),
  ('Une structure de vente d''animaux doit pouvoir présenter l''origine et l''historique sanitaire des animaux proposés.', false, 2),
  ('Un professionnel n''a aucune obligation de tenir un quelconque registre concernant les animaux qu''il vend.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi abeille domestique, canari et furet, lequel a un régime alimentaire strictement carnivore ?', 'Le furet est carnivore, alors que l''abeille domestique est herbivore et le canari est granivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('furet', true, 2),
  ('abeille domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gerbille, grenouille griffue (Xenopus) et hérisson domestique, lequel est principalement actif le jour (diurne) ?', 'La gerbille est diurne, alors que la grenouille griffue (Xenopus) est plutôt nocturne et l''hérisson domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', true, 1),
  ('grenouille griffue (Xenopus)', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouton, hérisson domestique et furet, lequel a en moyenne les portées les plus nombreuses ?', 'Le furet a en moyenne 3-7 petits par portée, contre 1-3 pour le mouton et 2-5 pour l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('furet', true, 1),
  ('mouton', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une grenouille griffue (Xenopus), laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 1),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 2),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, canari et mouton, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le mouton vit environ 10-12 ans, contre 5-8 ans pour le cochon d''Inde et 8-12 ans pour le canari.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('mouton', true, 2),
  ('canari', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, pogona (dragon barbu) et poisson rouge, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le poisson rouge vit environ 10-15 ans, contre 4-6 ans pour l''hérisson domestique et 8-12 ans pour le pogona (dragon barbu).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('poisson rouge', true, 1),
  ('pogona (dragon barbu)', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, cochon d''Inde et cochon, lequel est le plus lourd à l''âge adulte ?', 'Un cochon adulte pèse en moyenne 50-350 kg, bien plus qu''un escargot petit-gris (0.005-0.015 kg) ou un cochon d''Inde (0.7-1.2 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', false, 1),
  ('cochon d''Inde', false, 2),
  ('cochon', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Pour quel animal ce besoin est-il particulièrement important : « du foin à volonté et un espace assez grand pour faire au moins trois bonds à la suite » ?', 'Cette description correspond au lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('lapin', true, 1),
  ('cochon', false, 2),
  ('cochon d''Inde', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi dindon, mouche soldat noire (larves) et pogona (dragon barbu), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le pogona (dragon barbu) est plutôt solitaire à l''état naturel, alors que le dindon et la mouche soldat noire (larves) sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', true, 1),
  ('mouche soldat noire (larves)', false, 2),
  ('dindon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, dindon et chat, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le chat vit environ 13-17 ans, contre 2-3 ans pour l''hamster syrien et 8-10 ans pour le dindon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('chat', true, 2),
  ('dindon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi escargot petit-gris, furet et rat domestique, lequel a un régime alimentaire strictement herbivore ?', 'L''escargot petit-gris est herbivore, alors que le furet est carnivore et le rat domestique est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', true, 1),
  ('furet', false, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, cochon d''Inde et chèvre, lequel a la gestation la plus longue ?', 'La gestation dure environ 145-155 jours chez la chèvre, contre 24-26 jours chez la gerbille et 59-72 jours chez le cochon d''Inde.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('cochon d''Inde', false, 2),
  ('chèvre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, cochon d''Inde et tortue aquatique (Trachemys), lequel est principalement actif le jour (diurne) ?', 'La tortue aquatique (Trachemys) est diurne, alors que l''axolotl est plutôt nocturne et le cochon d''Inde plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', false, 1),
  ('axolotl', false, 2),
  ('tortue aquatique (Trachemys)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi gecko léopard, gerbille et oie, lequel a un régime alimentaire strictement herbivore ?', 'L''oie est herbivore, alors que le gecko léopard est insectivore et la gerbille est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('oie', true, 2),
  ('gecko léopard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), axolotl et escargot petit-gris, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 15-30 jours chez l''escargot petit-gris, contre 2-3 jours chez le betta (combattant) et 14-21 jours chez l''axolotl.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', false, 1),
  ('escargot petit-gris', true, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi âne, gecko léopard et pogona (dragon barbu), lequel a un régime alimentaire strictement herbivore ?', 'L''âne est herbivore, alors que le gecko léopard est insectivore et le pogona (dragon barbu) est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', false, 1),
  ('gecko léopard', false, 2),
  ('âne', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi cochon, poisson rouge et souris domestique, lequel est principalement actif la nuit (nocturne) ?', 'La souris domestique est nocturne, alors que le cochon est plutôt diurne et le poisson rouge plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', false, 1),
  ('poisson rouge', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi canari, escargot petit-gris et mouche soldat noire (larves), lequel a un régime alimentaire strictement herbivore ?', 'L''escargot petit-gris est herbivore, alors que le canari est granivore et la mouche soldat noire (larves) est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', false, 1),
  ('escargot petit-gris', true, 2),
  ('mouche soldat noire (larves)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un furet, laquelle de ces affirmations est exacte ? (variante 2)', 'Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 1),
  ('Le contenant de transport doit être assez grand pour que l''animal puisse se tenir debout, se retourner et s''allonger normalement.', true, 2),
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon d''Inde, pogona (dragon barbu) et discus, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le discus vit environ 10-15 ans, contre 5-8 ans pour le cochon d''Inde et 8-12 ans pour le pogona (dragon barbu).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', true, 1),
  ('cochon d''Inde', false, 2),
  ('pogona (dragon barbu)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), escargot petit-gris et axolotl, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, le betta (combattant) vit environ 2-4 ans, nettement moins que l''escargot petit-gris et l''axolotl.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', false, 1),
  ('betta (combattant)', true, 2),
  ('axolotl', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi abeille domestique, hamster syrien et tortue aquatique (Trachemys), lequel est le plus léger à l''âge adulte ?', 'Une abeille domestique adulte pèse en moyenne 0.0001-0.0001 kg, nettement moins que l''hamster syrien et la tortue aquatique (Trachemys).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', true, 1),
  ('tortue aquatique (Trachemys)', false, 2),
  ('hamster syrien', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Pour quel animal l''aliment suivant est-il documenté comme dangereux : « le laurier-rose (toutes parties, hautement toxique) » ?', 'Cette toxicité est documentée chez la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', true, 1),
  ('canard', false, 2),
  ('cheval', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hamster syrien, chinchilla et cheval, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le cheval vit environ 25-30 ans, contre 2-3 ans pour l''hamster syrien et 10-15 ans pour le chinchilla.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hamster syrien', false, 1),
  ('chinchilla', false, 2),
  ('cheval', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perruche ondulée, chat et tortue terrestre, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la perruche ondulée vit environ 7-10 ans, nettement moins que le chat et la tortue terrestre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('tortue terrestre', false, 2),
  ('perruche ondulée', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi cochon, mouton et chèvre, lequel a la gestation la plus longue ?', 'La gestation dure environ 145-155 jours chez la chèvre, contre 112-115 jours chez le cochon et 144-152 jours chez le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('cochon', false, 2),
  ('chèvre', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi chat, hérisson domestique et chien, lequel a en moyenne les portées les plus nombreuses ?', 'Le chien a en moyenne 1-8 petits par portée, contre 1-6 pour le chat et 2-5 pour l''hérisson domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('chien', true, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, chèvre et vache, lequel a la gestation la plus longue ?', 'La gestation dure environ 279-292 jours chez la vache, contre 24-26 jours chez la gerbille et 145-155 jours chez la chèvre.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('vache', true, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi mouton, oie et rat domestique, lequel est principalement actif la nuit (nocturne) ?', 'Le rat domestique est nocturne, alors que le mouton est plutôt diurne et l''oie plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('mouton', false, 1),
  ('oie', false, 2),
  ('rat domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi betta (combattant), perruche ondulée et poule, lequel a un régime alimentaire strictement carnivore ?', 'Le betta (combattant) est carnivore, alors que la perruche ondulée est granivore et la poule est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', false, 1),
  ('poule', false, 2),
  ('betta (combattant)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un discus, laquelle de ces affirmations est exacte ? (variante 2)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Il est recommandé de transporter un animal la tête en bas pour économiser de la place.', false, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perruche ondulée, gerbille et poule, lequel est le plus léger à l''âge adulte ?', 'Une perruche ondulée adulte pèse en moyenne 0.03-0.04 kg, nettement moins que la gerbille et la poule.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('perruche ondulée', true, 1),
  ('poule', false, 2),
  ('gerbille', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi serpent des blés (couleuvre), pigeon et hérisson domestique, lequel est le plus lourd à l''âge adulte ?', 'Un hérisson domestique adulte pèse en moyenne 0.3-0.6 kg, bien plus qu''un serpent des blés (couleuvre) (0.15-0.45 kg) ou un pigeon (0.3-0.5 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('hérisson domestique', true, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('pigeon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, dindon et cochon, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, le cochon vit environ 10-15 ans, contre 2-4 ans pour la gerbille et 8-10 ans pour le dindon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', true, 1),
  ('gerbille', false, 2),
  ('dindon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''une poule, laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un contenant de transport doit être stable et fixé de façon à ne pas glisser ni se renverser en cas de freinage brusque.', true, 1),
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 2),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi cheval, gerbille et serpent des blés (couleuvre), lequel a un régime alimentaire strictement herbivore ?', 'Le cheval est herbivore, alors que la gerbille est omnivore et le serpent des blés (couleuvre) est carnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gerbille', false, 1),
  ('serpent des blés (couleuvre)', false, 2),
  ('cheval', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, chèvre et gerbille, lequel est principalement actif la nuit (nocturne) ?', 'L''axolotl est nocturne, alors que la chèvre est plutôt diurne et la gerbille plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('axolotl', true, 1),
  ('gerbille', false, 2),
  ('chèvre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi canari, gerbille et vache, lequel vit naturellement seul plutôt qu''en groupe ?', 'Le canari est plutôt solitaire à l''état naturel, alors que la gerbille et la vache sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('canari', true, 1),
  ('gerbille', false, 2),
  ('vache', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi souris domestique, gerbille et cheval, lequel a l''espérance de vie moyenne la plus courte ?', 'En moyenne, la souris domestique vit environ 1.5-2.5 ans, nettement moins que la gerbille et le cheval.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cheval', false, 1),
  ('gerbille', false, 2),
  ('souris domestique', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Quel aliment est dangereux pour un pogona (dragon barbu) ?', 'Chez le pogona (dragon barbu), la laitue iceberg en grande quantité (quasi aucun apport nutritif) est dangereux, contrairement aux distracteurs proposés, sans danger en petite quantité.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('la courgette cuite sans assaisonnement', false, 1),
  ('la carotte cuite', false, 2),
  ('la laitue iceberg en grande quantité (quasi aucun apport nutritif)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi gecko léopard, hérisson domestique et oie, lequel est principalement actif le jour (diurne) ?', 'L''oie est diurne, alors que le gecko léopard est plutôt nocturne et l''hérisson domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('gecko léopard', false, 1),
  ('hérisson domestique', false, 2),
  ('oie', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi abeille domestique, axolotl et perroquet gris du Gabon, lequel a un régime alimentaire strictement carnivore ?', 'L''axolotl est carnivore, alors que l''abeille domestique est herbivore et le perroquet gris du Gabon est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', false, 1),
  ('axolotl', true, 2),
  ('perroquet gris du Gabon', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi gerbille, lapin et cochon, lequel a en moyenne les portées les plus nombreuses ?', 'Le cochon a en moyenne 6-12 petits par portée, contre 3-6 pour la gerbille et 4-8 pour le lapin.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon', true, 1),
  ('gerbille', false, 2),
  ('lapin', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un perroquet gris du Gabon, laquelle de ces affirmations est exacte ? (variante 1)', 'Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un contenant de transport doit être suffisamment ventilé pour que l''air circule correctement pendant tout le trajet.', true, 1),
  ('L''accès à l''eau pendant un trajet long n''a aucune importance pour le bien-être de l''animal.', false, 2),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi serpent des blés (couleuvre), pogona (dragon barbu) et dindon, lequel est le plus léger à l''âge adulte ?', 'Un serpent des blés (couleuvre) adulte pèse en moyenne 0.15-0.45 kg, nettement moins que le pogona (dragon barbu) et le dindon.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('dindon', false, 1),
  ('pogona (dragon barbu)', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi betta (combattant), escargot petit-gris et axolotl, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''axolotl vit environ 10-15 ans, contre 2-4 ans pour le betta (combattant) et 5-8 ans pour l''escargot petit-gris.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('escargot petit-gris', false, 1),
  ('axolotl', true, 2),
  ('betta (combattant)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi abeille domestique, chèvre et grenouille griffue (Xenopus), lequel est principalement actif la nuit (nocturne) ?', 'La grenouille griffue (Xenopus) est nocturne, alors que l''abeille domestique est plutôt diurne et la chèvre plutôt diurne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('abeille domestique', false, 1),
  ('grenouille griffue (Xenopus)', true, 2),
  ('chèvre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi furet, hamster syrien et serpent des blés (couleuvre), lequel a besoin de vivre en groupe (espèce grégaire) ?', 'Le furet est grégaire et a besoin de compagnie de son espèce, alors que l''hamster syrien et le serpent des blés (couleuvre) vivent plutôt seuls dans la nature.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('serpent des blés (couleuvre)', false, 1),
  ('hamster syrien', false, 2),
  ('furet', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi perruche ondulée, poule et chèvre, lequel est le plus lourd à l''âge adulte ?', 'Une chèvre adulte pèse en moyenne 30-65 kg, bien plus qu''une perruche ondulée (0.03-0.04 kg) ou une poule (1.5-3 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', true, 1),
  ('poule', false, 2),
  ('perruche ondulée', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('hebergement', 'Quel aménagement ou besoin est particulièrement important pour un perroquet gris du Gabon ?', 'Chez le perroquet gris du Gabon, une stimulation mentale quotidienne (jeux, interactions) : l''ennui provoque souvent des troubles du comportement comme l''arrachage de plumes.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('une stimulation mentale quotidienne (jeux, interactions) : l''ennui provoque souvent des troubles du comportement comme l''arrachage de plumes', true, 1),
  ('des surfaces à grimper et à explorer : c''est un animal naturellement escaladeur', false, 2),
  ('un aquarium bien couvert : elle est capable de sauter hors de l''eau si le couvercle n''est pas hermétique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi âne, gerbille et serpent des blés (couleuvre), lequel a un régime alimentaire strictement carnivore ?', 'Le serpent des blés (couleuvre) est carnivore, alors que l''âne est herbivore et la gerbille est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('âne', false, 1),
  ('gerbille', false, 2),
  ('serpent des blés (couleuvre)', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canari, abeille domestique et tortue terrestre, lequel a la période d''incubation la plus longue ?', 'L''incubation dure environ 60-90 jours chez la tortue terrestre, contre 13-14 jours chez le canari et 20-24 jours chez l''abeille domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('tortue terrestre', true, 1),
  ('canari', false, 2),
  ('abeille domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi mouche soldat noire (larves), canard et oie, lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, l''oie vit environ 15-20 ans, contre 0.15-0.3 ans pour la mouche soldat noire (larves) et 8-12 ans pour le canard.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('oie', true, 1),
  ('mouche soldat noire (larves)', false, 2),
  ('canard', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, lapin et pogona (dragon barbu), lequel vit naturellement seul plutôt qu''en groupe ?', 'Le pogona (dragon barbu) est plutôt solitaire à l''état naturel, alors que la chèvre et le lapin sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('pogona (dragon barbu)', true, 1),
  ('lapin', false, 2),
  ('chèvre', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi escargot petit-gris, furet et grenouille griffue (Xenopus), lequel a l''espérance de vie moyenne la plus longue ?', 'En moyenne, la grenouille griffue (Xenopus) vit environ 10-15 ans, contre 5-8 ans pour l''escargot petit-gris et 7-10 ans pour le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('grenouille griffue (Xenopus)', true, 1),
  ('furet', false, 2),
  ('escargot petit-gris', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('alimentation', 'Parmi betta (combattant), canari et pogona (dragon barbu), lequel a un régime alimentaire strictement carnivore ?', 'Le betta (combattant) est carnivore, alors que le canari est granivore et le pogona (dragon barbu) est omnivore.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('betta (combattant)', true, 1),
  ('canari', false, 2),
  ('pogona (dragon barbu)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('reglementation', 'Laquelle de ces affirmations sur la réglementation des animaux de compagnie est fausse ? (affirmation 4)', 'Un particulier peut céder un chiot sans aucun document ni identification, quelle que soit la situation.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un particulier peut céder un chiot sans aucun document ni identification, quelle que soit la situation.', true, 1),
  ('Un professionnel qui vend des chiens ou des chats doit tenir un registre d''entrées et de sorties des animaux.', false, 2),
  ('La vente de chiens ou de chats entre particuliers est encadrée : un numéro d''identification (puce ou tatouage) doit être communiqué à l''acheteur.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi lapin, mouton et chèvre, lequel a la gestation la plus longue ?', 'La gestation dure environ 145-155 jours chez la chèvre, contre 28-33 jours chez le lapin et 144-152 jours chez le mouton.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', true, 1),
  ('lapin', false, 2),
  ('mouton', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi dindon, furet et rat domestique, lequel est principalement actif le jour (diurne) ?', 'Le dindon est diurne, alors que le furet est plutôt crepusculaire et le rat domestique plutôt nocturne.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('dindon', true, 1),
  ('furet', false, 2),
  ('rat domestique', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi canard, chinchilla et hamster syrien, lequel n''appartient pas à la même classe biologique que les deux autres ?', 'Le canard est un oiseau, alors que le chinchilla et l''hamster syrien sont tous les deux des mammifères.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chinchilla', false, 1),
  ('hamster syrien', false, 2),
  ('canard', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi axolotl, betta (combattant) et chat, lequel est principalement actif la nuit (nocturne) ?', 'L''axolotl est nocturne, alors que le betta (combattant) est plutôt diurne et le chat plutôt crepusculaire.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chat', false, 1),
  ('betta (combattant)', false, 2),
  ('axolotl', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('comportement', 'Parmi chèvre, chinchilla et hamster syrien, lequel vit naturellement seul plutôt qu''en groupe ?', 'L''hamster syrien est plutôt solitaire à l''état naturel, alors que la chèvre et le chinchilla sont des espèces grégaires qui vivent en groupe.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('chèvre', false, 1),
  ('chinchilla', false, 2),
  ('hamster syrien', true, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('transport', 'Concernant le transport d''un hérisson domestique, laquelle de ces affirmations est exacte ? (variante 1)', 'Un animal transporté doit pouvoir accéder à de l''eau lors des trajets longs, notamment par forte chaleur.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('Un animal peut être transporté enfermé dans un contenant totalement hermétique sans aucune ventilation.', false, 1),
  ('Un animal transporté doit pouvoir accéder à de l''eau lors des trajets longs, notamment par forte chaleur.', true, 2),
  ('La taille du contenant de transport n''a aucune importance, quelle que soit la taille de l''animal.', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, furet et cochon d''Inde, lequel a la gestation la plus longue ?', 'La gestation dure environ 59-72 jours chez le cochon d''Inde, contre 33-37 jours chez l''hérisson domestique et 41-43 jours chez le furet.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('cochon d''Inde', true, 1),
  ('hérisson domestique', false, 2),
  ('furet', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi discus, serpent des blés (couleuvre) et chinchilla, lequel est le plus lourd à l''âge adulte ?', 'Un chinchilla adulte pèse en moyenne 0.4-0.6 kg, bien plus qu''un discus (0.1-0.3 kg) ou un serpent des blés (couleuvre) (0.15-0.45 kg).')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('discus', false, 1),
  ('chinchilla', true, 2),
  ('serpent des blés (couleuvre)', false, 3)
) as r(texte, correcte, ordre);

with q as (
  insert into public.quiz_questions (theme, intitule, explication)
  values ('biologie_besoins', 'Parmi hérisson domestique, souris domestique et rat domestique, lequel a en moyenne les portées les plus nombreuses ?', 'Le rat domestique a en moyenne 6-12 petits par portée, contre 2-5 pour l''hérisson domestique et 4-8 pour la souris domestique.')
  returning id
)
insert into public.quiz_reponses (question_id, intitule, est_correcte, ordre)
select id, texte, correcte, ordre
from q, (values
  ('rat domestique', true, 1),
  ('souris domestique', false, 2),
  ('hérisson domestique', false, 3)
) as r(texte, correcte, ordre);

-- ---------------------------------------------------------------------------
-- Produits réels du catalogue Trufféo, par thème
-- ---------------------------------------------------------------------------
insert into public.quiz_produits_suggeres (theme, produit_handle, produit_titre, produit_image_url, poids)
values
  ('alimentation', 'gamelle-en-acier-inoxydable', 'Gamelle en acier inoxydable', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/puppyschalen.png', 1),
  ('alimentation', 'support-gamelles-reglable-topmast-2-bols-inox', 'Support de gamelles réglable Topmast avec 2 bols en inox', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/300083.jpg', 1),
  ('alimentation', 'gamelle-silver-touch-acier-inoxydable', 'Gamelle Silver Touch – Acier Inoxydable', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/voerbak-silver-touch.png', 1),
  ('alimentation', 'double-gamelle-avec-support-en-acier-inoxydable-topmast', 'Double Gamelle avec Support en Acier Inoxydable Topmast', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/rvs-voerbak.png', 1),
  ('alimentation', 'gamelle-inox-chien-200-ml-6-l', 'Gamelle standard en Acier Inoxydable – 200ml à 6L', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/voerbak-new-2.png', 1),
  ('alimentation', 'puppybar-gamelle-multiple-6-chiots-plastique-robuste-bleu', 'Puppybar - Gamelle Multiple 6 Chiots', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/puppybar_blauw.png', 1),
  ('alimentation', 'gourde-de-voyage-pour-chien-duvo-bouteille-d-eau-portable-anti-fuite', 'Gourde de Voyage pour Chien Duvo+', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/schermafbeelding_2025-07-02_130437.jpg', 1),
  ('alimentation', 'silicone-reiskom-rood-diverse-maten', 'Gamelle de Voyage Pliable en Silicone', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/5414365251895_prd_webl_2.jpg', 1),
  ('alimentation', 'kufra-voerreservoir-3500ml-sol-3-marchioro', 'Distributeur de Croquettes 3,5L Marchioro Kufra', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/1d520816d61963be24e27fdab9cc5f53.jpg', 1),
  ('alimentation', 'fontaine-a-eau-sans-fil-pour-chien-chat-hydratation-intelligente', 'Fontaine à eau sans fil pour chien & chat', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/AFPH05702.jpg', 1),
  ('alimentation', 'fontaine-d-exterieur-pour-chien-rafraichissement-et-hydratation-ete', 'Fontaine d''extérieur pour chien', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/AFPH08170.png', 1),
  ('alimentation', 'gamelle-chat-antiderapante-stable-pratique-facile-a-nettoyer-bleu', 'Gamelle chat antidérapante (bleu)', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/AFPK02403.png', 1),
  ('alimentation', 'eats065tp', 'Gamelle anti-glouton à dôme central', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/EATS065TP.png', 1),
  ('alimentation', 'afp-gourde-de-voyage-2-en-1-en-inox-pour-chien', 'AFP Gourde de voyage 2-en-1 en inox pour chien', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/afp-gourde-de-voyage-2-en-1-en-inox-pour-chien-7240547.jpg', 1),
  ('alimentation', 'gamelle-anti-glouton-sloweat-doogy-pour-chien', 'Gamelle Anti-Glouton Sloweat Doogy', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/658562.jpg', 1),
  ('alimentation', 'abreuvoir-a-palette-avec-cuillere-bovins-chevaux', 'Abreuvoir à palette (bovins & chevaux)', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/DRIN001A.png', 1),
  ('alimentation', 'abreuvoir-automatique-a-flotteur-toutes-especes', 'Abreuvoir automatique à flotteur « Toutes espèces »', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/DRIN011.png', 1),
  ('hebergement', 'topmast-coussin-matelas-derby-pour-chien', 'Topmast – Coussin matelas Derby pour chien', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/engels_matras_01.png', 1),
  ('hebergement', 'topmast-coussin-de-banquette-aspect-cuir-pour-chien', 'Coussin de cage Topmast Leatherlook', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/topmast-coussin-de-banquette-aspect-cuir-pour-chien-9068042.png', 1),
  ('hebergement', 'comfortbay-coussin-outdoor-strong-pour-chien', 'Comfortbay – Coussin outdoor Strong pour chien', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/comfortbay-coussin-outdoor-strong-pour-chien-1480698.png', 1),
  ('hebergement', 'beau-bess-coussin-impermeable-pour-chien-90-77-cm', 'Beau&Bess – Coussin imperméable pour chien', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/beaubess-coussin-impermeable-pour-chien-90-77-cm-8405504.jpg', 1),
  ('hebergement', 'afp-lambswool-panier-donut-pour-chat', 'AFP Lambswool – Panier donut pour chat', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/afp-lambswool-panier-donut-pour-chat-5646390.png', 1),
  ('hebergement', 'cage-pour-chien-topmast-noire', 'Cage pour chien Topmast – Noir', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/tussenschot-bench-78cm_d1635d82-84db-44df-b9ce-682f892df1b4.png', 1),
  ('hebergement', 'cage-pour-chien-topmast-premium-revetement-noir-et-argent', 'Cage pour chien Topmast Premium', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/logo-1727710088_8ef534a5-f0f4-497b-ab68-059cbf0fccbc.png', 1),
  ('hebergement', 'cage-pour-chien-topmast-heavy-duty-pliable-avec-roulettes', 'Cage pour chien Topmast Heavy Duty pliable', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/e72830c3bb4b4f25ebc81067678eaf8c.jpg', 1),
  ('hebergement', 'cage-pour-chien-galvanisee-topmast-bench-verzinkt', 'Cage pour chien galvanisée – Topmast Bench', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/verzinkt-bench-topmast-2_1.png', 1),
  ('comportement', 'addi001', 'Addicted! Haltère en Bois (jouet chat au MADNIP)', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/ADDI001_4.jpg', 1),
  ('comportement', 'addi022', 'Addicted! Atomium avec Balle', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/ADDI022.png', 1),
  ('comportement', 'addi012', 'Addicted! Balle', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/ADDI012.png', 1),
  ('comportement', 'afp-classic-comfort-griffoir-l-pour-chat', 'AFP Classic Comfort – Griffoir L pour chat', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/afp-classic-comfort-griffoir-l-pour-chat-4700180.png', 1),
  ('comportement', 'griffoir-carton-pour-chat-avec-cataire-double-face-design-epure', 'Griffoir carton pour chat avec cataire', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/AFPK02386.png', 1),
  ('comportement', 'afph03200', 'AFP Interactives - Food Maze', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/AFPH03200_3.jpg', 1),
  ('comportement', 'fetch-n-treat-jouet-distributeur-interactif-pour-chien', 'Fetch''N''Treat – Jouet distributeur interactif pour chien', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/AFPH03201.png', 1),
  ('comportement', 'distributeur-de-friandises-interactif-jouet-intelligence-chien-chat-amp-lapin', 'Distributeur de friandises interactif – chien, chat & lapin', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/AFPH03209.png', 1),
  ('comportement', 'jeu-d-intelligence-pour-chien-puzzle-interactif-avec-friandises', 'Jeu d''intelligence pour chien – Puzzle interactif', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/AFPH03210_2.png', 1),
  ('comportement', 'wild-life-dog-jouet-naturel-lapin-pour-chien-avec-corde-dentaire', 'Wild Life Dog – Jouet Naturel Lapin avec Corde Dentaire', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/WILD006_1.jpg', 1),
  ('comportement', 'yeowww-jouet-pour-chat-a-l-herbe-a-chat-bio-arc-en-ciel-17-7-cm', 'Yeowww! Jouet pour Chat à l''Herbe à Chat Bio', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/YEOW025.png', 1),
  ('comportement', 'chuckit-ultra-squeaker-ball-pour-chien', 'Chuckit! – Ultra Squeaker Ball pour chien', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/CHUC52070.png', 1),
  ('comportement', 'afp-dig-it-tapis-de-fouille-tortue-pour-chien', 'AFP Dig It – Tapis de fouille tortue pour chien', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/afp-dig-it-tapis-de-fouille-tortue-pour-chien-3635656.png', 1),
  ('comportement', 'afp-chill-out-tapis-de-lechage-glace-pour-chien', 'AFP Chill Out – Tapis de léchage glace pour chien', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/AFPH08189_1.png', 1),
  ('comportement', 'wild-life-collection-jouet-naturel-papillon-pour-chat-avec-herbe-a-chat', 'Wild Life Collection – Jouet Naturel Papillon pour Chat', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/WILD032_1.jpg', 1),
  ('transport', 'cage-topmast-avec-separateur-transport-securite', 'Cage Topmast avec séparateur – Transport & sécurité', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/bench-met-tussenschot-1.png', 1),
  ('transport', 'cage-de-voiture-inclinee-special-coffre-63-48-55-cm', 'Cage de voiture inclinée – spécial coffre', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/gr3kl-3.png', 1),
  ('transport', 'cage-de-transport-en-nylon-topmast', 'Cage de transport en nylon Topmast', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/d8a750a42baf030218ce01c55d309c66.jpg', 1),
  ('transport', 'cage-transport-voiture-ellipse-topmast', 'Cage de transport voiture Ellipse Topmast', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/ellipse-medium-01.png', 1),
  ('transport', 'cage-transport-nylon-premium-topmast', 'Cage de transport Nylon Premium Topmast', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/caad1f3cc55da6e404aa7e9240d8df58.jpg', 1),
  ('transport', 'topmast-hondentas-reistas-brilliant-zwart-55-cm', 'Sac de Transport Topmast Brilliant Noir 55 cm', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/copilot_20250617_160639.png', 1),
  ('transport', 'transportbox-travelaire-premium-iata-gecertificeerd', 'Caisse de Transport Avion Travelaire Premium – Homologuée IATA', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/1200x1105.jpg', 1),
  ('transport', 'sac-de-transport-pour-chien-a-roulettes-afp-travel-dog-rolling-pet-carrier', 'Sac de transport à roulettes pour chien – AFP', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/AFPH08134.png', 1),
  ('transport', 'petmate-cage-de-transport-ronde-pour-chat-bleu', 'Petmate – Cage de transport ronde pour chat', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/PETM41429.jpg', 1),
  ('transport', 'petmate-top-load-cage-de-transport-avec-ouverture-superieure-pour-chats', 'Petmate Top Load – Cage de transport ouverture supérieure', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/PETM41455.jpg', 1),
  ('transport', 'caisse-de-transport-topmast-airline-deluxe-pour-chien-et-chat', 'Caisse de transport Topmast Airline Deluxe', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/caisse-de-transport-topmast-airline-deluxe-pour-chien-et-chat-2142964.png', 1),
  ('sante_prophylaxie', 'nettoyeur-de-pattes-automatique-pattes-propres-en-quelques-secondes', 'Nettoyeur de pattes automatique', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/AFPH07715.jpg', 1),
  ('sante_prophylaxie', 'kit-soins-complets-chien-oreilles-yeux-truffe-coussinets', 'Kit Soins Complets Chien – Oreilles, Yeux, Truffe & Coussinets', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/ANIM5091.png', 1),
  ('sante_prophylaxie', 'lotion-soin-oreilles-bio-certifiee-ecocert-chien-chat-70-ml-anju-beaute', 'Lotion Soin Oreilles Bio – Chien & Chat', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/lotion-soin-oreilles-bio-anju.jpg', 1),
  ('sante_prophylaxie', 'lingettes-nettoyantes-a-laloe-vera-chien-chat-boite-de-30-bubimex', 'Lingettes Nettoyantes à l''Aloe Vera – Chien & Chat', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/lingettes-nettoyantes-bubimex-30-lingettes.jpg', 1),
  ('sante_prophylaxie', 'dentifrice-a-pulveriser-sans-brossage-chien-chat-50-ml-dentidog', 'Dentifrice à Pulvériser Sans Brossage – Chien & Chat', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/dentidog-dentifrice-a-pulveriser-pour-chien-ou-chat.jpg', 1),
  ('sante_prophylaxie', 'baume-truffe-coussinets-100-naturel-fabrique-en-france-50-ml-dog-generation', 'Baume Truffe & Coussinets 100% Naturel', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/baume-truffe-coussinets-100-naturel-fabrique-en-france-50-ml-dog-generation-9063752.jpg', 1),
  ('sante_prophylaxie', 'lotion-oculaire-quotidienne-spray-125-ml-oh-my-dog', 'Lotion Oculaire Quotidienne – Chien', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/oh-my-dog-for-eyes.jpg', 1),
  ('sante_prophylaxie', 'shampooing-chat-a-lextrait-de-poire-95-bio-200-ml-plouf', 'Shampooing Chat à l''Extrait de Poire – 95% Bio', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/shampooing-chat-plouf-200-ml.jpg', 1),
  ('sante_prophylaxie', 'wahl-brosse-carde-pour-chien', 'Wahl – Brosse carde pour chien', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/wahl-brosse-carde-pour-chien-4159980.jpg', 1),
  ('sante_prophylaxie', 'excellent-horse-brosse-de-toilettage-multifonction-pour-cheval', 'Excellent Horse – Brosse de toilettage multifonction pour cheval', 'https://cdn.shopify.com/s/files/1/0964/4579/2633/files/BORS0004F.png', 1);
