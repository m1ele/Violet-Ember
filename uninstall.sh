#!/usr/bin/env bash
set -euo pipefail

VE_HOME="$HOME/.config/violet-ember"
BIN="$HOME/.local/bin/violet-ember"

echo "◆ Violet Ember ◆ uninstall"

latest_backup="$(ls -t "$HOME"/.zshrc.backup-violet-ember-* 2>/dev/null | head -n1 || true)"
if [[ -n "$latest_backup" ]]; then
  cp "$latest_backup" "$HOME/.zshrc"
  echo "Restored user backup: $latest_backup"
else
  echo "No user backup found. Leaving ~/.zshrc unchanged."
fi

rm -f "$BIN"
echo "Removed command: $BIN"

# Keep ~/.config/violet-ember by default because it contains accent backups.
echo "Kept config directory: $VE_HOME"
echo "Remove it manually if you no longer need it."
