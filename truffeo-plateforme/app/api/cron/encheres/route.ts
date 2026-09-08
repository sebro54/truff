import { NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabase';

export const dynamic = 'force-dynamic';

/**
 * Ouvre les enchères programmées et clôture celles arrivées à échéance.
 * Déclenché toutes les minutes par le cron Vercel (voir vercel.json).
 * L'horloge de référence est celle de la base, pas celle du navigateur.
 */
export async function GET(request: Request) {
  const attendu = `Bearer ${process.env.CRON_SECRET}`;
  if (request.headers.get('authorization') !== attendu) {
    return NextResponse.json({ erreur: 'Non autorisé' }, { status: 401 });
  }

  const db = supabaseAdmin();
  const { data: ouvertes, error: e1 } = await db.rpc('ouvrir_encheres');
  const { data: cloturees, error: e2 } = await db.rpc('cloturer_encheres');

  if (e1 || e2) {
    return NextResponse.json({ erreur: (e1 ?? e2)!.message }, { status: 500 });
  }

  // TODO Stripe Connect : pour chaque lot 'terminee', créer le PaymentIntent
  // avec application_fee_amount = commission_cents(lot) et transfer_data vers
  // le compte connecté du vendeur. Notifier gagnant et vendeur.

  return NextResponse.json({ ouvertes, cloturees });
}
