import { verifierAppProxy } from '@/lib/app-proxy';
import { supabasePublic } from '@/lib/supabase';
import { THEMES_QUIZ } from '@/lib/quiz-themes';
import { BASE_PATH } from '@/lib/base-path';
import { escapeHtml, enveloppeQuiz, melanger, reponseLiquid } from '@/lib/quiz-html';

export const dynamic = 'force-dynamic';

const NB_QUESTIONS = 10;

function urlQuestion(slug: string, ids: string[], i: number, score: number): string {
  return `${BASE_PATH}/quiz/${slug}?ids=${ids.join(',')}&i=${i}&score=${score}`;
}

function pasDeQuestions(): Response {
  return reponseLiquid(enveloppeQuiz('<p>Ce thème n\'a pas encore de questions.</p>'));
}

export async function GET(request: Request, { params }: { params: { theme: string } }) {
  const url = new URL(request.url);
  if (process.env.NODE_ENV === 'production' && !verifierAppProxy(url)) {
    return reponseLiquid('Cette page doit être consultée depuis truffeo.shop.');
  }

  const theme = THEMES_QUIZ.find((t) => t.slug === params.theme);
  if (!theme) {
    return reponseLiquid(enveloppeQuiz('<p>Ce thème n\'existe pas.</p>'));
  }

  const db = supabasePublic();
  const idsParam = url.searchParams.get('ids');
  let ids: string[];
  let i: number;
  let score: number;

  if (idsParam) {
    ids = idsParam.split(',').filter(Boolean);
    i = Number(url.searchParams.get('i') ?? '0');
    score = Number(url.searchParams.get('score') ?? '0');
  } else {
    const { data, error } = await db
      .from('quiz_questions')
      .select('id')
      .eq('theme', theme.slug)
      .eq('statut', 'publie');

    if (error || !data?.length) return pasDeQuestions();

    ids = melanger(data.map((q) => q.id)).slice(0, NB_QUESTIONS);
    i = 0;
    score = 0;
  }

  if (i >= ids.length) {
    return reponseLiquid(enveloppeQuiz(`
      <h1>Quiz terminé — ${escapeHtml(theme.label)}</h1>
      <p class="tq-verdict ok" style="font-size:1.3rem">Score : ${score} / ${ids.length}</p>
      <a href="${BASE_PATH}/quiz" class="tq-bouton">Choisir un autre thème</a>
    `));
  }

  const questionId = ids[i];
  const { data: question } = await db
    .from('quiz_questions')
    .select('id, intitule')
    .eq('id', questionId)
    .maybeSingle();

  const { data: reponses } = await db
    .from('quiz_reponses_publiques')
    .select('id, intitule')
    .eq('question_id', questionId);

  if (!question || !reponses?.length) {
    return reponseLiquid(enveloppeQuiz('<p>Cette question est momentanément indisponible.</p>'));
  }

  const optionsHtml = melanger(reponses)
    .map((r) => `<button type="submit" name="reponse_id" value="${escapeHtml(r.id)}" class="tq-reponse">${escapeHtml(r.intitule)}</button>`)
    .join('');

  return reponseLiquid(enveloppeQuiz(`
    <h1>${escapeHtml(theme.label)}</h1>
    <p class="tq-progression">Question ${i + 1} / ${ids.length}</p>
    <div class="tq-question">
      <h2>${escapeHtml(question.intitule)}</h2>
      <form method="post" action="${BASE_PATH}/quiz/${theme.slug}">
        <input type="hidden" name="ids" value="${escapeHtml(ids.join(','))}" />
        <input type="hidden" name="i" value="${i}" />
        <input type="hidden" name="score" value="${score}" />
        <input type="hidden" name="question_id" value="${escapeHtml(questionId)}" />
        ${optionsHtml}
      </form>
    </div>
  `));
}

export async function POST(request: Request, { params }: { params: { theme: string } }) {
  const url = new URL(request.url);
  if (process.env.NODE_ENV === 'production' && !verifierAppProxy(url)) {
    return reponseLiquid('Cette page doit être consultée depuis truffeo.shop.');
  }

  const theme = THEMES_QUIZ.find((t) => t.slug === params.theme);
  if (!theme) {
    return reponseLiquid(enveloppeQuiz('<p>Ce thème n\'existe pas.</p>'));
  }

  const form = await request.formData();
  const ids = String(form.get('ids') ?? '').split(',').filter(Boolean);
  const i = Number(form.get('i') ?? '0');
  const scoreActuel = Number(form.get('score') ?? '0');
  const questionId = String(form.get('question_id') ?? '');
  const reponseId = String(form.get('reponse_id') ?? '');

  const db = supabasePublic();
  const { data, error } = await db.rpc('repondre_quiz', {
    p_question_id: questionId,
    p_reponse_id: reponseId,
  });

  const resultat = data?.[0];
  if (error || !resultat) {
    return reponseLiquid(enveloppeQuiz(`<p>Impossible de vérifier cette réponse pour le moment.</p><a href="${BASE_PATH}/quiz" class="tq-bouton">Retour aux thèmes</a>`));
  }

  const nouveauScore = scoreActuel + (resultat.correcte ? 1 : 0);
  const suite = urlQuestion(theme.slug, ids, i + 1, nouveauScore);

  const produitHtml = resultat.suggestion ? `
    <a href="https://truffeo.shop/products/${escapeHtml(resultat.suggestion.handle)}" rel="nofollow noopener" class="tq-produit">
      ${resultat.suggestion.image_url ? `<img src="${escapeHtml(resultat.suggestion.image_url)}" alt="" />` : ''}
      <span>${escapeHtml(resultat.suggestion.titre)}</span>
    </a>
  ` : '';

  return reponseLiquid(enveloppeQuiz(`
    <h1>${escapeHtml(theme.label)}</h1>
    <p class="tq-progression">Question ${i + 1} / ${ids.length}</p>
    <div class="tq-question">
      <p class="tq-verdict ${resultat.correcte ? 'ok' : 'ko'}">${resultat.correcte ? 'Bonne réponse !' : 'Pas tout à fait.'}</p>
      <p class="tq-explication">${escapeHtml(resultat.explication)}</p>
      ${produitHtml}
      <a href="${suite}" class="tq-bouton">${i + 1 < ids.length ? 'Question suivante' : 'Voir le résultat'}</a>
    </div>
  `));
}
