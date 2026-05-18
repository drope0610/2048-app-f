## Apprentissage

- Utilisation de `vue-tsc` (via la commande `nuxt typecheck`) pour vérifier la validité du typage statique du code TypeScript de notre application Nuxt 4.
- Configuration et utilisation d'ESLint pour analyser statiquement le style et s'assurer du respect des bonnes pratiques de développement.
- Apprentissage des mécanismes de compilation de Vite (via `nuxt build`) et de prévisualisation locale (`nuxt preview`).
- Mise en œuvre de Vitest pour écrire et exécuter des tests unitaires rapides et isolés sur nos composants Vue (ex. vérifier la couleur de fond des tuiles 2 et 4).
- Identification et export des rapports sur les dépendances obsolètes et les vulnérabilités de sécurité avec `pnpm` au format JSON.

## Méthodologie adoptée

- Approche incrémentale étape par étape : test manuel de chaque outil en ligne de commande dans le terminal avant d'automatiser son exécution dans le script global.
- Validation approfondie de l'impact du cache de package manager en testant la suppression et réinstallation de `node_modules` avec `pnpm`.

## Dificultés rencontrées:

- Configuration de Vitest avec Happy DOM : des erreurs apparaissaient lors du rendu de certains composants exploitant des fonctionnalités avancées de Vue 3.
  - *Résolu en configurant correctement le plugin `@vitejs/plugin-vue` et les dépendances nécessaires dans `vitest.config.ts`.*
- Erreurs de typage TypeScript strictes bloquant la commande `nuxt typecheck`.
  - *Résolu en s'appuyant sur l'autocomplétion de VS Code et la documentation officielle de Nuxt UI pour typer correctement les props.*
