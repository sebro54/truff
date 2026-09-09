import { verifierAppProxy } from '@/lib/app-proxy';
import { THEMES_QUIZ } from '@/lib/quiz-themes';
import { BASE_PATH } from '@/lib/base-path';
import { escapeHtml, enveloppeQuiz, reponseLiquid } from '@/lib/quiz-html';

export const dynamic = 'force-dynamic';

export async function GET(request: Request) {
  const url = new URL(request.url);
  if (process.env.NODE_ENV === 'production' && !verifierAppProxy(url)) {
    return reponseLiquid('Cette page doit être consultée depuis truffeo.shop.');
  }

  const items = THEMES_QUIZ.map((theme) => `
    <li>
      <a class="tq-carte" href="${BASE_PATH}/quiz/${theme.slug}">
        <h2>${escapeHtml(theme.label)}</h2>
        <p>${escapeHtml(theme.description)}</p>
      </a>
    </li>
  `).join('');

  return reponseLiquid(enveloppeQuiz(`
    <h1>Quiz ACACED</h1>
    <p class="tq-intro">Teste tes connaissances comme à l'examen, thème par thème.</p>
    <ul class="tq-grille">${items}</ul>
  `));
}
