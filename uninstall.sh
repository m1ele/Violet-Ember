#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$ROOT_DIR/lib/output.sh"

WITH_ROOT=0
for arg in "$@"; do
  case "$arg" in
    --with-root) WITH_ROOT=1 ;;
    -h|--help)
      ve_header
      cat <<'HELP'
Usage:
  ./uninstall.sh [--with-root]

Removes Violet Ember source blocks from .zshrc files.
It does not delete backups.
HELP
      exit 0
      ;;
  esac
done

START_MARK="# >>> Violet Ember >>>"
END_MARK="# <<< Violet Ember <<<"
ZSHRC="$HOME/.zshrc"

ve_header

if [[ -f "$ZSHRC" ]]; then
  tmp="$(mktemp)"
  awk -v start="$START_MARK" -v end="$END_MARK" '
    $0 == start {skip=1; next}
    $0 == end {skip=0; next}
    !skip {print}
  ' "$ZSHRC" > "$tmp"
  mv "$tmp" "$ZSHRC"
  ve_success "Removed user source block"
fi

if [[ "$WITH_ROOT" -eq 1 ]]; then
  if sudo test -f /root/.zshrc; then
    sudo awk -v start="$START_MARK" -v end="$END_MARK" '
      $0 == start {skip=1; next}
      $0 == end {skip=0; next}
      !skip {print}
    ' /root/.zshrc | sudo tee /root/.zshrc.violet-ember.tmp >/dev/null
    sudo mv /root/.zshrc.violet-ember.tmp /root/.zshrc
    ve_success "Removed root source block"
  fi
fi

ve_warn "Configuration files in ~/.config/violet-ember were kept."
ve_success "Done"
