## Apprentissage

- Introduction concrète aux principes de la livraison continue (CD) et au concept d'environnements (Production vs Preview).
- Prise en main de Vercel et de son outil en ligne de commande (Vercel CLI) pour orchestrer les déploiements.
- Sécurisation de la chaîne de déploiement en configurant des secrets chiffrés sur GitHub Actions.
- Protection de l'environnement de production en exigeant une approbation humaine (validation manuelle) avant la mise en ligne.
- Découverte du déploiement Blue-Green en promouvant manuellement un build de Preview vers l'URL de Production sur l'interface Vercel.

## Méthodologie adoptée

- Utilisation stricte de secrets et de variables pour éviter toute fuite d'informations sensibles (tokens Vercel, identifiants d'organisation et de projet).
- Test systématique des flux de preview à travers l'ouverture de Pull Requests de test pour valider l'isolation totale des environnements.

## Dificultés rencontrées:

- Configuration de la Vercel CLI en mode non interactif dans le runner de CI/CD (erreurs d'authentification initiales).
  - *Résolu en exportant correctement les variables d'environnement `VERCEL_TOKEN`, `VERCEL_ORG_ID` et `VERCEL_PROJECT_ID`.*
- Évitement de la dérive de build (rebuild en production) en réutilisant l'artifact préalablement construit lors de la phase de CI.
  - *Résolu en exploitant les commandes de pré-construction de Vercel (`vercel pull --yes`, `vercel build --prod` et `vercel deploy --prebuilt`).*
