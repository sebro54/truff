import { createClient } from '@supabase/supabase-js';

/** Client public : soumis à la RLS. Utilisable côté navigateur. */
export function supabasePublic() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    { auth: { persistSession: false } }
  );
}

/**
 * Client d'administration : contourne la RLS.
 * Réservé aux routes serveur (cron, modération, webhooks Stripe).
 * Ne jamais importer depuis un composant client.
 */
export function supabaseAdmin() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    { auth: { persistSession: false } }
  );
}
