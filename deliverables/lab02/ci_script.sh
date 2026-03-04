#!/bin/bash


set -e

echo "🚀 Lancement du Pipeline d'Intégration Continue..."


echo "📦 Étape 1 : Analyse des dépendances et installation..."


mkdir -p reports


pnpm audit --json > reports/vulnerable-dependencies.json || true
pnpm outdated --format json > reports/outdated-dependencies.json || true


pnpm install

pnpm nuxt prepare

echo "✅ Environnement prêt et rapports générés dans /reports."


echo "🔍 Étape 2 : Vérification du typage et analyse statique..."


pnpm nuxt typecheck


pnpm eslint .

echo "✅ Code valide et bien formaté."


echo "🧪 Étape 3 : Exécution de la suite de tests..."


pnpm vitest run

echo "✅ Tous les tests sont passés avec succès."


echo "🏗️ Étape 4 : Construction du package de production..."

pnpm nuxt build

echo "✅ Build terminé. Le projet est prêt pour le déploiement."

echo "🎉 [SUCCESS] Le pipeline CI s'est terminé sans aucune erreur !"