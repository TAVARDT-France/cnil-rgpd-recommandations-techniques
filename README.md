# Cadre d'Audit Technique & Recommandations CNIL / RGPD

[![Licence](https://img.shields.io/badge/licence-MIT-blue.svg)](LICENSE)
[![Outils TAVARDT](https://img.shields.io/badge/TAVARDT-Suite%20de%20Diagnostic-5b3cf5.svg)](https://tools.tavardt.com/fr/)
[![Conformité CNIL](https://img.shields.io/badge/France-CNIL%20%26%20RGPD-00C853.svg)](https://ag.tavardt.com/fr/cybersecurite/)

Outils d'audit technique, scripts d'évaluation de conformité et recommandations de sécurité alignés sur les lignes directrices de la **CNIL** et du **RGPD** en France.

Conçu et maintenu par le pôle cybersécurité et gouvernance numérique de **TAVARDT**.

***

## 1. Périmètre de Vérification Technique

* **Gouvernance des Traceurs & Cookies:** Détection des traceurs non essentiels déposés sans consentement préalable valide.
* **Sécurité des Échanges (HTTPS & HSTS):** Vérification de la configuration TLS 1.3 et de la politique Strict-Transport-Security.
* **Étanchéité du Périmètre Web:** Détection des fichiers de configuration sensibles exposés (`.env`, dépôts `.git`, sauvegardes SQL).
* **Protection de l'Identité Numérique:** Analyse des protocoles SPF, DKIM et DMARC pour bloquer l'usurpation de marque et le phishing.

***

## 2. Déploiement Rapide

Clonez ce dépôt et lancez l'audit percutant sur votre infrastructure :

```bash
git clone https://github.com/TAVARDT-France/cnil-rgpd-recommandations-techniques.git
cd cnil-rgpd-recommandations-techniques
bash scripts/audit-cnil.sh -cible entreprise.fr
```

***

## 3. Outils de Diagnostic en Ligne (France)

Évaluez gratuitement la résilience de vos applications publiques :

* [Analyseur d'En-têtes HTTP de Sécurité](https://tools.tavardt.com/fr/analyse-en-tetes-securite/)
* [Détecteur de Fichiers & Secrets Exposés](https://tools.tavardt.com/fr/scanner-fichiers-exposes/)
* [Vérificateur DMARC & Protection de Domaine](https://tools.tavardt.com/fr/verificateur-dmarc-email/)
* Suite Complète de Diagnostic TAVARDT

Pour un accompagnement personnalisé, un audit d'intrusion ou la mise en conformité CNIL en France, contactez **TAVARDT**.

***

© 2026 TAVARDT. Tous droits réservés.
