'use client';

import { useState } from 'react';
import Link from 'next/link';
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
        <p className="resultat-score">Score : {score} / {questions.length}</p>
        <Link href="/quiz" className="bouton-principal">Choisir un autre thème</Link>
      </section>
    );
  }

  return (
    <section>
      <h1>{theme.label}</h1>
      <p className="progression">Question {index + 1} / {questions.length}</p>

      <div className="carte-question">
        <h2 className="enonce">{question.intitule}</h2>

        <ul className="liste-reponses">
          {question.reponses.map((r) => {
            const estChoisie = reponseChoisie === r.id;
            const estLaBonne = correction && r.id === correction.reponse_correcte_id;
            const classes = ['bouton-reponse'];
            if (estLaBonne) classes.push('correcte');
            else if (estChoisie && correction && !correction.correcte) classes.push('incorrecte');

            return (
              <li key={r.id}>
                <button
                  type="button"
                  onClick={() => repondre(r.id)}
                  disabled={!!correction || envoiEnCours}
                  aria-pressed={estChoisie}
                  className={classes.join(' ')}
                >
                  {r.intitule}
                </button>
              </li>
            );
          })}
        </ul>

        {correction && (
          <div className="bloc-correction">
            <p className={`verdict ${correction.correcte ? 'correcte' : 'incorrecte'}`}>
              {correction.correcte ? 'Bonne réponse !' : 'Pas tout à fait.'}
            </p>
            <p className="explication">{correction.explication}</p>

            {correction.suggestion && (
              <a
                href={`https://truffeo.shop/products/${correction.suggestion.handle}`}
                rel="nofollow noopener"
                className="carte-produit"
              >
                {correction.suggestion.image_url && (
                  // eslint-disable-next-line @next/next/no-img-element
                  <img src={correction.suggestion.image_url} alt="" />
                )}
                <span className="carte-produit-texte">
                  <span className="carte-produit-label">En lien avec cette question</span>
                  {correction.suggestion.titre}
                </span>
              </a>
            )}

            <button type="button" onClick={suivant} className="bouton-principal">
              {index + 1 < questions.length ? 'Question suivante' : 'Voir le résultat'}
            </button>
          </div>
        )}
      </div>
    </section>
  );
}
