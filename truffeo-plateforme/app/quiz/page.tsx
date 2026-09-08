import Link from 'next/link';
import { THEMES_QUIZ } from '@/lib/quiz-themes';

export const dynamic = 'force-dynamic';

export default function QuizAccueil() {
  return (
    <section>
      <h1>Quiz ACACED</h1>
      <p>Teste tes connaissances comme à l&apos;examen, thème par thème.</p>

      <ul>
        {THEMES_QUIZ.map((theme) => (
          <li key={theme.slug}>
            <h2><Link href={`/quiz/${theme.slug}`}>{theme.label}</Link></h2>
            <p>{theme.description}</p>
          </li>
        ))}
      </ul>
    </section>
  );
}
