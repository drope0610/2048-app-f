## Apprentissage

- Compréhension des concepts fondamentaux de GitHub Actions (Workflows, Jobs, Steps, Runners, Actions).
- Apprentissage de la syntaxe YAML pour définir un pipeline et configurer les déclencheurs (triggers).
- Automatisation et déportation du script d'intégration continue local (Lab 2) vers les serveurs distants de GitHub (Runners).
- Stockage et partage des fichiers compilés sous forme d'artifacts téléchargeables (`actions/upload-artifact`).

## Méthodologie adoptée

- Validation initiale de la syntaxe et des runners GitHub Actions avec un pipeline minimal "Hello World".
- Transposition rigoureuse des commandes du script Bash local du Lab 2 en jobs et steps dans le fichier YAML.

## Dificultés rencontrées:

- Problèmes de chargement de Node.js et du gestionnaire de paquets `pnpm` sur le runner virtuel de GitHub Actions.
  - *Résolu en utilisant les actions officielles `actions/setup-node` et `pnpm/action-setup` avec la bonne version.*
- Perte ou mauvais ciblage de l'artifact produit par le build Nuxt lors de l'upload.
  - *Résolu en comprenant la structure des fichiers générés par Nuxt et en ciblant précisément le dossier de sortie `.output`.*
