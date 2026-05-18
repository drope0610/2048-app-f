## Apprentissage

- Découverte pratique de la plateforme cloud Microsoft Azure et du service Azure Static Web Apps (SWA).
- Utilisation de l'Azure CLI pour provisionner des ressources cloud de manière automatisée et reproductible.
- Compréhension de l'intérêt d'une architecture multi-environnements stricte en séparant la QA et la Production.
- Découverte et installation de la SWA CLI pour tester, simuler et pousser des déploiements locaux.
- Sécurisation de la CI/CD pour des déploiements non interactifs en utilisant des tokens de déploiement Azure SWA cryptés et assignés à des environnements GitHub spécifiques.

## Méthodologie adoptée

- Rédaction de scripts Azure CLI (`script.azcli`) pour documenter et automatiser la création des groupes de ressources et des instances SWA.
- Factorisation maximale du code du pipeline en utilisant le même secret `AZURE_STATIC_WEB_APPS_API_TOKEN` assigné à différents périmètres d'environnements GitHub (QA et Production).

## Dificultés rencontrées:

- Erreurs d'affichage ou rafraîchissements infinis (erreurs 404) sur l'application Nuxt 4 hébergée sur Azure Static Web Apps en raison de la gestion des routes côté client (Single Page Application).
  - *Résolu en créant et en configurant le fichier `staticwebapp.config.json` à la racine pour rediriger toutes les requêtes vers `index.html`.*
- Configuration de l'action officielle Azure SWA pour déployer l'artifact statique pré-construit (`.output/public/`) sans déclencher à nouveau un build implicite qui écraserait nos étapes d'optimisation.
  - *Résolu en désactivant le build interne Azure avec l'argument `skip_app_build: true`.*
