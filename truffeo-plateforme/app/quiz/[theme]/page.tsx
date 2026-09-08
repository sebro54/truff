import { notFound } from 'next/navigation';
import { supabasePublic } from '@/lib/supabase';
import { THEMES_QUIZ } from '@/lib/quiz-themes';
import QuizClient from './quiz-client';

export const dynamic = 'force-dynamic';

const NB_QUESTIONS = 10;

function melanger<T>(tableau: T[]): T[] {
  const copie = [...tableau];
  for (let i = copie.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [copie[i], copie[j]] = [copie[j], copie[i]];
  }
  return copie;
}

export default async function QuizTheme({ params }: { params: { theme: string } }) {
  const theme = THEMES_QUIZ.find((t) => t.slug === params.theme);
  if (!theme) notFound();

  const db = supabasePublic();

  const { data: toutesLesQuestions, error } = await db
    .from('quiz_questions')
    .select('id, intitule')
    .eq('theme', theme.slug)
    .eq('statut', 'publie');

  if (error) {
    return <p>Le quiz est momentanément indisponible. Réessayez dans quelques minutes.</p>;
  }

  if (!toutesLesQuestions?.length) {
    return <p>Ce thème n&apos;a pas encore de questions.</p>;
  }

  const questionsChoisies = melanger(toutesLesQuestions).slice(0, NB_QUESTIONS);
  const ids = questionsChoisies.map((q) => q.id);

  const { data: reponses } = await db
    .from('quiz_reponses_publiques')
    .select('id, question_id, intitule, ordre')
    .in('question_id', ids)
    .order('ordre');

  const questions = questionsChoisies.map((q) => ({
    ...q,
    reponses: melanger((reponses ?? []).filter((r) => r.question_id === q.id)),
  }));

  return <QuizClient theme={theme} questions={questions} />;
}
