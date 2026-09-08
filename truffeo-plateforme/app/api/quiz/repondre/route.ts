import { NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

export const dynamic = 'force-dynamic';

/**
 * Valide une réponse au quiz et renvoie parfois une suggestion produit.
 * Toute la décision (bonne réponse, thème, probabilité de suggestion) vit
 * dans repondre_quiz() : le client ne doit jamais recevoir `est_correcte`
 * avant d'avoir répondu.
 */
export async function POST(request: Request) {
  const jeton = request.headers.get('authorization')?.replace('Bearer ', '');

  const { question_id, reponse_id } = await request.json();
  if (!question_id || !reponse_id) {
    return NextResponse.json({ erreur: 'Question ou réponse manquante.' }, { status: 400 });
  }

  const db = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      global: jeton ? { headers: { Authorization: `Bearer ${jeton}` } } : undefined,
      auth: { persistSession: false },
    }
  );

  const { data, error } = await db.rpc('repondre_quiz', {
    p_question_id: question_id,
    p_reponse_id: reponse_id,
  });

  if (error) {
    // Les messages levés par repondre_quiz() sont rédigés pour l'utilisateur.
    return NextResponse.json({ erreur: error.message }, { status: 409 });
  }

  const resultat = data?.[0];
  return NextResponse.json({
    correcte: resultat?.correcte ?? false,
    reponse_correcte_id: resultat?.reponse_correcte_id ?? null,
    explication: resultat?.explication ?? '',
    suggestion: resultat?.suggestion ?? null,
  });
}
