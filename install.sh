#!/usr/bin/env bash
set -euo pipefail

WITH_ROOT=0
for arg in "$@"; do
  case "$arg" in
    --with-root) WITH_ROOT=1 ;;
    -h|--help)
      cat <<'EOF'
◆ Violet Ember ◆ installer

Usage:
  ./install.sh [--with-root]

Installs the user theme, Accent Engine, and the violet-ember command.
Use --with-root to also install the Ember root theme.
EOF
      exit 0
      ;;
  esac
done

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d-%H%M%S)"
VE_HOME="$HOME/.config/violet-ember"
BIN_DIR="$HOME/.local/bin"

mkdir -p "$VE_HOME/accents" "$VE_HOME/backups" "$BIN_DIR"
cp "$ROOT_DIR"/themes/official/*/accent.conf "$VE_HOME/accents/" 2>/dev/null || true
# Rename copied accent files from repeated accent.conf using directory names
rm -f "$VE_HOME/accents/accent.conf"
for dir in "$ROOT_DIR"/themes/official/*; do
  [[ -d "$dir" ]] || continue
  name="$(basename "$dir")"
  cp "$dir/accent.conf" "$VE_HOME/accents/$name.conf"
done

if [[ ! -f "$VE_HOME/current-accent.conf" ]]; then
  cp "$VE_HOME/accents/violet.conf" "$VE_HOME/current-accent.conf"
fi

cp "$ROOT_DIR/scripts/violet-ember" "$BIN_DIR/violet-ember"
chmod +x "$BIN_DIR/violet-ember"

if [[ -f "$HOME/.zshrc" ]]; then
  cp "$HOME/.zshrc" "$HOME/.zshrc.backup-violet-ember-$STAMP"
  echo "Backup created: $HOME/.zshrc.backup-violet-ember-$STAMP"
fi
cp "$ROOT_DIR/themes/user/zshrc-template" "$HOME/.zshrc"
echo "Installed user theme: $HOME/.zshrc"
echo "Installed Accent Engine: $VE_HOME"
echo "Installed command: $BIN_DIR/violet-ember"

if [[ "$WITH_ROOT" -eq 1 ]]; then
  sudo mkdir -p /etc/violet-ember
  sudo cp "$ROOT_DIR/themes/root/ember.conf" /etc/violet-ember/ember.conf
  if sudo test -f /root/.zshrc; then
    sudo cp /root/.zshrc "/root/.zshrc.backup-violet-ember-$STAMP"
    echo "Root backup created: /root/.zshrc.backup-violet-ember-$STAMP"
  fi
  sudo cp "$ROOT_DIR/themes/root/zshrc-template" /root/.zshrc
  echo "Installed root theme: /root/.zshrc"
fi

echo "Done. Open a new terminal or run: source ~/.zshrc"
echo "Try: violet-ember accent list"
