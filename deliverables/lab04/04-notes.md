## Apprentissage

- Utilisation avancée des déclencheurs GitHub Actions (`push`, `pull_request`, `workflow_dispatch`).
- Optimisation des déclenchements avec des filtres d'exclusion de chemins (`paths-ignore` pour le dossier de documentation `docs/`).
- Parallélisation des jobs pour optimiser les performances de la CI (linter, typecheck et tests unitaires s'exécutent en parallèle).
- Mise en cache avancée des dépendances `pnpm` (`actions/cache`) pour réduire considérablement le temps d'exécution global du workflow.
- Gestion dynamique de la durée de rétention des artifacts (1 semaine pour `main`, 24 heures pour les branches de feature) avec des expressions logiques GitHub.
- Ajout de paramètres d'exécution manuelle (`workflow_dispatch`) pour piloter interactivement les environnements cibles de déploiement (QA ou Production).

## Méthodologie adoptée

- Structuration du workflow sous forme de Directed Acyclic Graph (DAG) en utilisant l'attribut `needs` pour forcer le build avant de lancer en parallèle la validation.
- Découplage de la configuration à l'aide de variables d'environnement globales.

## Dificultés rencontrées:

- Syntaxe des expressions conditionnelles complexes de GitHub Actions, en particulier pour adapter dynamiquement la variable `retention-days`.
  - *Résolu en utilisant l'expression `${{ github.ref == 'refs/heads/main' && 7 || 1 }}` et en validant la syntaxe dans l'éditeur de flux.*
- Partage efficace et sans collision du cache pnpm sur des jobs s'exécutant simultanément.
  - *Résolu en exploitant l'intégration automatique de cache disponible dans l'action `actions/setup-node`.*
