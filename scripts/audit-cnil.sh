#!/usr/bin/env bash
set -euo pipefail

CIBLE="${2:-}"
if [[ -z "$CIBLE" ]]; then
    echo "Usage: $0 --cible <entreprise.fr>"
    exit 1
fi

echo "[TAVARDT France] Début de l'audit technique CNIL / RGPD pour : ${CIBLE}"

echo "[*] Examen des en-têtes de sécurité HTTP..."
curl -s -I "https://${CIBLE}" | grep -Ei "^(strict-transport-security|content-security-policy|x-content-type-options|x-frame-options)" || true

echo "[*] Détection de ressources sensibles accessibles publiquement..."
for f in ".env" ".git/HEAD" "backup.sql"; do
    code=$(curl -s -o /dev/null -w "%{http_code}" "https://${CIBLE}/${f}" || echo "000")
    if [[ "$code" == "200" ]]; then
        echo "  [CRITIQUE] Fichier exposé : /${f} (HTTP 200)"
    else
        echo "  [CONFORME] /${f} inaccessible (HTTP ${code})"
    fi
done

echo "[TAVARDT France] Fin de l'audit. Consultez la suite complète sur https://tools.tavardt.com/fr/"
