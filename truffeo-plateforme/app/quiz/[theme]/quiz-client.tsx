'use client';

import { useState } from 'react';
import type { ThemeQuiz } from '@/lib/quiz-themes';

type Reponse = { id: string; question_id: string; intitule: string; ordre: number };
type Question = { id: string; intitule: string; reponses: Reponse[] };
type Suggestion = { handle: string; titre: string; image_url: string | null };
type Correction = {
  correcte: boolean;
  reponse_correcte_id: string;
  explication: string;
  suggestion: Suggestion | null;
};

export default function QuizClient({ theme, questions }: { theme: ThemeQuiz; questions: Question[] }) {
  const [index, setIndex] = useState(0);
  const [score, setScore] = useState(0);
  const [reponseChoisie, setReponseChoisie] = useState<string | null>(null);
  const [correction, setCorrection] = useState<Correction | null>(null);
  const [envoiEnCours, setEnvoiEnCours] = useState(false);

  const question = questions[index];
  const termine = index >= questions.length;

  async function repondre(reponseId: string) {
    if (correction || envoiEnCours) return;
    setReponseChoisie(reponseId);
    setEnvoiEnCours(true);
    try {
      const reponseHttp = await fetch('/api/quiz/repondre', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ question_id: question.id, reponse_id: reponseId }),
      });
      const donnees = await reponseHttp.json();
      if (!reponseHttp.ok) throw new Error(donnees.erreur ?? 'Erreur inconnue');
      setCorrection(donnees);
      if (donnees.correcte) setScore((s) => s + 1);
    } catch {
      setCorrection({
        correcte: false,
        reponse_correcte_id: '',
        explication: "Impossible de vérifier cette réponse pour le moment.",
        suggestion: null,
      });
    } finally {
      setEnvoiEnCours(false);
    }
  }

  function suivant() {
    setReponseChoisie(null);
    setCorrection(null);
    setIndex((i) => i + 1);
  }

  if (termine) {
    return (
      <section>
        <h1>Quiz terminé — {theme.label}</h1>
        <p>Score : {score} / {questions.length}</p>
        <a href="/quiz">Choisir un autre thème</a>
      </section>
    );
  }

  return (
    <section>
      <h1>{theme.label}</h1>
      <p>Question {index + 1} / {questions.length}</p>
      <h2>{question.intitule}</h2>

      <ul>
        {question.reponses.map((r) => {
          const estChoisie = reponseChoisie === r.id;
          const estLaBonne = correction && r.id === correction.reponse_correcte_id;
          return (
            <li key={r.id}>
              <button
                type="button"
                onClick={() => repondre(r.id)}
                disabled={!!correction || envoiEnCours}
                aria-pressed={estChoisie}
                style={{
                  fontWeight: estLaBonne ? 'bold' : undefined,
                  textDecoration: estChoisie && correction && !correction.correcte ? 'line-through' : undefined,
                }}
              >
                {r.intitule}
              </button>
            </li>
          );
        })}
      </ul>

      {correction && (
        <div>
          <p>{correction.correcte ? 'Bonne réponse !' : 'Pas tout à fait.'}</p>
          <p>{correction.explication}</p>

          {correction.suggestion && (
            <p>
              En lien avec cette question :{' '}
              <a
                href={`https://truffeo.shop/products/${correction.suggestion.handle}`}
                rel="nofollow noopener"
              >
                {correction.suggestion.titre}
              </a>
            </p>
          )}

          <button type="button" onClick={suivant}>
            {index + 1 < questions.length ? 'Question suivante' : 'Voir le résultat'}
          </button>
        </div>
      )}
    </section>
  );
}
