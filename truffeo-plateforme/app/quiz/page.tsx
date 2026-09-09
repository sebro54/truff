import Link from 'next/link';
import { THEMES_QUIZ } from '@/lib/quiz-themes';

export const dynamic = 'force-dynamic';

export default function QuizAccueil() {
  return (
    <section>
      <h1>Quiz ACACED</h1>
      <p className="intro">Teste tes connaissances comme à l&apos;examen, thème par thème.</p>

      <ul className="grille-themes">
        {THEMES_QUIZ.map((theme) => (
          <li key={theme.slug}>
            <Link href={`/quiz/${theme.slug}`} className="carte-theme">
              <h2>{theme.label}</h2>
              <p>{theme.description}</p>
            </Link>
          </li>
        ))}
      </ul>
    </section>
  );
}
