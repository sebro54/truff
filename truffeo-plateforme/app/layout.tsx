import type { Metadata } from 'next';
import Link from 'next/link';
import './globals.css';

export const metadata: Metadata = {
  title: 'Trufféo',
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="fr">
      <body>
        <header className="entete">
          <div className="entete-contenu">
            <Link href="/quiz" className="entete-lien">Trufféo</Link>
          </div>
        </header>
        <main className="conteneur">{children}</main>
      </body>
    </html>
  );
}
