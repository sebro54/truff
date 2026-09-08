export const THEMES_QUIZ = [
  { slug: 'reglementation', label: 'Réglementation', description: "Certificats, ACACED, obligations légales." },
  { slug: 'biologie_besoins', label: 'Biologie et besoins physiologiques', description: "Espèces, comportements naturels, besoins fondamentaux." },
  { slug: 'alimentation', label: 'Alimentation', description: "Rations, régimes, risques alimentaires." },
  { slug: 'hebergement', label: 'Hébergement', description: "Cages, enclos, aménagement, confort." },
  { slug: 'comportement', label: 'Comportement', description: "Signaux, socialisation, troubles du comportement." },
  { slug: 'sante_prophylaxie', label: 'Santé et prophylaxie', description: "Prévention, hygiène, signes de maladie." },
  { slug: 'transport', label: 'Transport', description: "Conditions et obligations de transport des animaux." },
] as const;

export type ThemeQuiz = (typeof THEMES_QUIZ)[number];
