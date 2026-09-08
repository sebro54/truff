import { NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

export const dynamic = 'force-dynamic';

/**
 * Pose une offre. Le montant n'est jamais validé ici : toute la logique
 * (statut du lot, horloge, montant minimum, lot du vendeur) vit dans la
 * fonction Postgres placer_offre(). Cette route ne fait que porter l'identité
 * de l'utilisateur jusqu'à la base.
 */
export async function POST(request: Request) {
  const jeton = request.headers.get('authorization')?.replace('Bearer ', '');
  if (!jeton) {
    return NextResponse.json({ erreur: 'Connectez-vous pour enchérir.' }, { status: 401 });
  }

  const { lot_id, montant_euros } = await request.json();
  const montant_cents = Math.round(Number(montant_euros) * 100);

  if (!lot_id || !Number.isInteger(montant_cents) || montant_cents <= 0) {
    return NextResponse.json({ erreur: 'Montant invalide.' }, { status: 400 });
  }

  const db = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    { global: { headers: { Authorization: `Bearer ${jeton}` } }, auth: { persistSession: false } }
  );

  const { data, error } = await db.rpc('placer_offre', { p_lot_id: lot_id, p_montant_cents: montant_cents });

  if (error) {
    // Les messages levés par placer_offre() sont rédigés pour l'utilisateur.
    return NextResponse.json({ erreur: error.message }, { status: 409 });
  }

  return NextResponse.json({ offre: data });
}
