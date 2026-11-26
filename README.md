<p align="center">
  <a href="https://ag.tavardt.com/fr/">
    <img src="https://ag.tavardt.com/img/tavardt-banner.png" alt="TAVARDT" width="1024" />
  </a>
</p>

# Cadre d'Audit Technique & Recommandations CNIL / RGPD

[![Outils TAVARDT](https://img.shields.io/badge/TAVARDT-Suite%20de%20Diagnostic-5b3cf5.svg)](https://tools.tavardt.com/fr/)
[![Conformité CNIL](https://img.shields.io/badge/France-CNIL%20%26%20RGPD-00C853.svg)](https://ag.tavardt.com/fr/cybersecurite/)
[![Licence](https://img.shields.io/badge/licencia-MIT-blue.svg)](LICENSE)

Outils d'audit technique, scripts d'évaluation de conformité et moteur de diagnostic percutant alignés sur les recommandations de la **CNIL** et les exigences du **RGPD** en France.

Conçu et maintenu par le pôle cybersécurité et gouvernance des données de **TAVARDT**.

***

## 1. Architecture de Conformité et Contrôles Techniques

Le cadre réglementaire du Règlement Général sur la Protection des Données (RGPD) et les recommandations de la CNIL imposent la mise en œuvre de mesures techniques appropriées pour garantir la sécurité des traitements. L'outil réalise des vérifications automatisées non intrusives sur deux couches fondamentales de l'infrastructure publique :

* **Sécurité des Échanges et En-têtes HTTP Défensifs**: Contrôle que le serveur web applique des politiques cryptographiques rigoureuses sur TLS. Il valide la présence effective des directives `Strict-Transport-Security` (HSTS), `Content-Security-Policy` (CSP), `X-Frame-Options` et `X-Content-Type-Options`.
* **Détection de Ressources Sensibles et Fuites de Configuration**: Sonde la racine publique de l'application afin d'identifier toute exposition involontaire d'actifs critiques. Il vérifie l'étanchéité des variables d'environnement (`.env`), des métadonnées de versionnement (`.git/HEAD`) et des sauvegardes relationnelles (`backup.sql`).

***

## 2. Vecteurs de Risque et Impact Opérationnel

Une configuration défaillante sur le périmètre web expose l'organisme à des compromissions directes et à des sanctions administratives de l'autorité de contrôle. Le moteur d'audit prévient quatre vecteurs majeurs de vulnérabilité :

* **Interception de Trafic et Dégradation Cryptographique**: L'absence de HSTS autorise les attaques de type intermédiaire et l'interception de sessions utilisateur non chiffrées. Le forçage du chiffrement garantit la confidentialité des données personnelles en transit.
* **Exfiltration de Claves Secrètes et d'Identifiants**: Les fichiers `.env` laissés en accès libre livrent aux attaquants les mots de passe de bases de données et les clés d'API tierces. Ces informations ouvrent la voie à une pénétration interne de l'architecture.
* **Reconstruction de Code Source par Métadonnées**: L'accès non restreint au répertoire `.git/HEAD` permet à des acteurs hostiles de reconstituer l'historique complet du code applicatif. Cette reconnaissance facilite l'identification de failles logiques non corrigées.
* **Fuite Massive par Téléchargement de Sauvegardes**: La présence de fichiers `backup.sql` permet le téléchargement direct de bases de données entières sans authentification. Cet incident caractérise une violation majeure de données imposant une notification obligatoire sous 72 heures à la CNIL.

***

## 3. Guide de Déploiement Rapide et Vérification

Exécutez l'audit technique de conformité CNIL sur votre domaine cible via l'interpréteur de commandes POSIX Bash :

```bash
git clone https://github.com/TAVARDT-France/cnil-rgpd-recommandations-techniques.git
cd cnil-rgpd-recommandations-techniques
bash scripts/audit-cnil.sh -cible domaine.fr
```

### Évaluation Diagnostique des Codes de Réponse

Le script d'inspection fournit un statut déterministe pour chaque ressource examinée en fonction du code retour HTTP :

* **Protection Conforme et Accès Restreint (`[CONFORME]`)**: Une réponse de rejet ou d'absence (telle que HTTP 403 Forbidden ou HTTP 404 Not Found) confirme l'étanchéité du périmètre.
* **Alerte Critique d'Exposition Publique (`[CRITIQUE]`)**: Un code d'état HTTP 200 OK révèle que la ressource sensible est accessible sans authentification et requiert un blocage immédiat.

***

## 4. Foire Aux Questions Techniques (FAQ)

### Comment l'audit des en-têtes HTTP contribue-t-il à la conformité aux exigences de sécurité de la CNIL ?
L'inspection automatique valide la présence active des directives Strict-Transport-Security, Content-Security-Policy, X-Frame-Options et X-Content-Type-Options sur le serveur web. Ces en-têtes défensifs renforcent la sécurité des communications requise par l'article 32 du RGPD en neutralisant les attaques par injection et l'interception de flux.

### Quels risques spécifiques le script identifie-t-il lors de la recherche de fichiers sensibles ?
L'outil teste l'accessibilité publique des variables d'environnement dans .env, de l'arbre Git dans .git/HEAD et des sauvegardes de bases de données dans backup.sql. La réception d'un code HTTP 200 indique une fuite critique de secrets exposant les données personnelles des usagers à une exfiltration immédiate.

### Quelles sont les obligations légales en cas de détection d'un fichier sensible accessible sur le périmètre public ?
L'exposition publique de données ou d'identifiants constitue une violation de données au sens du RGPD imposant des mesures de confinement immédiates. Si l'incident présente un risque pour les droits des personnes, l'organisme doit procéder à une notification officielle auprès de la CNIL dans un délai maximal de 72 heures.

### Comment le script garantit-il une exécution fiable et déterministe au sein d'une chaîne CI/CD ?
Développé en Bash POSIX avec l'activation du mode strict d'interruption sur erreur, le script fonctionne sans dépendances logicielles lourdes. Cette conception permet d'intégrer facilement le contrôle de surface d'attaque dans les pipelines de déploiement continu afin de bloquer les régressions de sécurité.

### Quelles actions de remédiation technique doivent être appliquées immédiatement en cas d'alerte critique ?
Les équipes d'infrastructure doivent restreindre sans délai la configuration du serveur web pour interdire l'accès direct aux fichiers cachés et aux archives de sauvegarde. Toutes les clés d'API, mots de passe et jetons cryptographiques présents dans les configurations exposées doivent également être révoqués et renouvelés.

***

## Liens Utiles

* **Portail Institutionnel:** https://ag.tavardt.com/fr/
* **Suite de Diagnostic:** https://tools.tavardt.com/fr/
* **Contact Technique:** https://ag.tavardt.com/fr/contact/

***

© 2026 TAVARDT. Tous droits réservés.
