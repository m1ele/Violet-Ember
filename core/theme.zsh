# ◆ Violet Ember ◆
# Main Zsh entrypoint. Keep ~/.zshrc small and source this file.

# Stop if this file is sourced outside zsh.
[[ -n "${ZSH_VERSION:-}" ]] || return 0

export VIOLET_EMBER_HOME="${VIOLET_EMBER_HOME:-$HOME/.config/violet-ember}"

# Shell behavior
setopt autocd
setopt interactivecomments
setopt magicequalsubst
setopt nonomatch
setopt notify
setopt numericglobsort
setopt promptsubst

WORDCHARS='_-' 
PROMPT_EOL_MARK=""

# Keybindings
bindkey -e
bindkey ' ' magic-space
bindkey '^U' backward-kill-line
bindkey '^[[3;5~' kill-word
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[5~' beginning-of-buffer-or-history
bindkey '^[[6~' end-of-buffer-or-history
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[Z' undo

# Completion
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
alias history='history 0'

TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

if [[ -z "${debian_chroot:-}" && -r /etc/debian_chroot ]]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# Accent loading
if [[ -f "$VIOLET_EMBER_HOME/current-accent.conf" ]]; then
  source "$VIOLET_EMBER_HOME/current-accent.conf"
else
  VE_ACCENT_NAME="Violet"
  VE_USERNAME="#A288E3"
  VE_DIRECTORY="#CEA7EE"
  VE_ARROW="198"
  VE_ALIAS="#D8B4FE"
  VE_PATH="#C084FC"
fi

# Defaults for future compatibility
: "${VE_ACCENT_NAME:=Violet}"
: "${VE_USERNAME:=#A288E3}"
: "${VE_DIRECTORY:=#CEA7EE}"
: "${VE_ARROW:=198}"
: "${VE_ALIAS:=#D8B4FE}"
: "${VE_PATH:=#C084FC}"

source "$VIOLET_EMBER_HOME/core/prompt.zsh"
source "$VIOLET_EMBER_HOME/core/syntax.zsh"
source "$VIOLET_EMBER_HOME/core/ls.zsh"
source "$VIOLET_EMBER_HOME/core/integrations.zsh"
