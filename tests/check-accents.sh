#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
required=(VE_ACCENT_NAME VE_USERNAME VE_DIRECTORY VE_ARROW VE_ALIAS VE_PATH)
fail=0
for file in "$ROOT_DIR"/themes/official/*/accent.conf; do
  echo "Checking $file"
  for var in "${required[@]}"; do
    if ! grep -q "^$var=" "$file"; then
      echo "Missing $var in $file"
      fail=1
    fi
  done
  if grep -Eiq 'VE_(USERNAME|DIRECTORY|ARROW|ALIAS|PATH)="?#(F56A00|FA8C02|FB8500|FF0000|FF4500)' "$file"; then
    echo "Semantic/root-like color found in user accent: $file"
    fail=1
  fi
done
exit "$fail"
