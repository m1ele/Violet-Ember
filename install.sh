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
  ./install.sh [--with-root]

Installs Violet Ember as a modular Zsh theme.
The installer is idempotent: running it multiple times will not duplicate the source block.

Options:
  --with-root   Also install the Ember root theme.
HELP
      exit 0
      ;;
  esac
done

STAMP="$(date +%Y%m%d-%H%M%S)"
VE_HOME="$HOME/.config/violet-ember"
BIN_DIR="$HOME/.local/bin"
ZSHRC="$HOME/.zshrc"
START_MARK="# >>> Violet Ember >>>"
END_MARK="# <<< Violet Ember <<<"
SOURCE_LINE='source "$HOME/.config/violet-ember/theme.zsh"'

ve_header
ve_info "Installing modular framework"

mkdir -p "$VE_HOME/core" "$VE_HOME/lib" "$VE_HOME/accents" "$VE_HOME/backups" "$BIN_DIR"
cp "$ROOT_DIR"/lib/*.sh "$VE_HOME/lib/"
cp "$ROOT_DIR"/core/theme.zsh "$VE_HOME/core/theme.zsh"
cp "$ROOT_DIR"/core/prompt.zsh "$VE_HOME/core/prompt.zsh"
cp "$ROOT_DIR"/core/syntax.zsh "$VE_HOME/core/syntax.zsh"
cp "$ROOT_DIR"/core/ls.zsh "$VE_HOME/core/ls.zsh"
cp "$ROOT_DIR"/core/integrations.zsh "$VE_HOME/core/integrations.zsh"
# theme.zsh expects core files under $VE_HOME/core but is sourced as $VE_HOME/theme.zsh
cp "$ROOT_DIR"/core/theme.zsh "$VE_HOME/theme.zsh"

for dir in "$ROOT_DIR"/themes/official/*; do
  [[ -d "$dir" ]] || continue
  name="$(basename "$dir")"
  cp "$dir/accent.conf" "$VE_HOME/accents/$name.conf"
done

if [[ ! -f "$VE_HOME/current-accent.conf" ]]; then
  cp "$VE_HOME/accents/violet.conf" "$VE_HOME/current-accent.conf"
  ve_success "Default accent set to Violet"
else
  ve_success "Current accent preserved"
fi

cp "$ROOT_DIR/scripts/violet-ember" "$BIN_DIR/violet-ember"
chmod +x "$BIN_DIR/violet-ember"
ve_success "CLI installed: $BIN_DIR/violet-ember"

# Backup zshrc before changing it.
if [[ -f "$ZSHRC" ]]; then
  cp "$ZSHRC" "$HOME/.zshrc.backup-violet-ember-$STAMP"
  ve_success "Backup created: $HOME/.zshrc.backup-violet-ember-$STAMP"
else
  touch "$ZSHRC"
fi

# Remove old Violet Ember managed blocks, then append one clean block.
tmp="$(mktemp)"
awk -v start="$START_MARK" -v end="$END_MARK" '
  $0 == start {skip=1; next}
  $0 == end {skip=0; next}
  !skip {print}
' "$ZSHRC" > "$tmp"
mv "$tmp" "$ZSHRC"

cat >> "$ZSHRC" <<EOF_BLOCK

$START_MARK
# Keep this block small: Violet Ember lives in ~/.config/violet-ember/.
$SOURCE_LINE
$END_MARK
EOF_BLOCK
ve_success "User shell configured: $ZSHRC"

if [[ "$WITH_ROOT" -eq 1 ]]; then
  ve_info "Installing root theme"
  sudo mkdir -p /etc/violet-ember/core
  sudo cp "$ROOT_DIR/themes/root/ember.conf" /etc/violet-ember/ember.conf
  sudo cp "$ROOT_DIR/core/theme-root.zsh" /etc/violet-ember/theme-root.zsh

  if sudo test -f /root/.zshrc; then
    sudo cp /root/.zshrc "/root/.zshrc.backup-violet-ember-$STAMP"
    ve_success "Root backup created: /root/.zshrc.backup-violet-ember-$STAMP"
  else
    sudo touch /root/.zshrc
  fi

  # Use awk for idempotent root block replacement.
  sudo awk -v start="$START_MARK" -v end="$END_MARK" '
    $0 == start {skip=1; next}
    $0 == end {skip=0; next}
    !skip {print}
  ' /root/.zshrc | sudo tee /root/.zshrc.violet-ember.tmp >/dev/null
  sudo mv /root/.zshrc.violet-ember.tmp /root/.zshrc
  {
    echo
    echo "$START_MARK"
    echo "# Root is semantic and always uses Ember."
    echo 'source /etc/violet-ember/theme-root.zsh'
    echo "$END_MARK"
  } | sudo tee -a /root/.zshrc >/dev/null
  ve_success "Root shell configured: /root/.zshrc"
fi

ve_success "Done"
ve_info "Open a new terminal or run: source ~/.zshrc"
ve_info "Try: violet-ember accent list"
