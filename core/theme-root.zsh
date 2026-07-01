# ◆ Violet Ember ◆
# Root theme. Root is semantic and always uses Ember.

[[ -n "${ZSH_VERSION:-}" ]] || return 0

setopt autocd
setopt interactivecomments
setopt magicequalsubst
setopt nonomatch
setopt notify
setopt numericglobsort
setopt promptsubst

WORDCHARS='_-' 
PROMPT_EOL_MARK=""

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

autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
alias history='history 0'

TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

if [[ -f /etc/violet-ember/ember.conf ]]; then
  source /etc/violet-ember/ember.conf
else
  VE_ROOT_NAME="#FFB703"
  VE_ROOT_DIRECTORY="#FFE29A"
  VE_ROOT_SYMBOL="#FB8500"
  VE_ROOT_ALIAS="#FFC242"
  VE_ROOT_PATH="#FFAD03"
fi

: "${VE_ROOT_NAME:=#FFB703}"
: "${VE_ROOT_DIRECTORY:=#FFE29A}"
: "${VE_ROOT_SYMBOL:=#FB8500}"
: "${VE_ROOT_ALIAS:=#FFC242}"
: "${VE_ROOT_PATH:=#FFAD03}"

NEWLINE_BEFORE_PROMPT="${NEWLINE_BEFORE_PROMPT:-yes}"
PROMPT='%F{'$VE_ROOT_NAME'}%n %F{242}◆ %F{'$VE_ROOT_DIRECTORY'}%1~ %F{'$VE_ROOT_SYMBOL'}# %f'
RPROMPT=''

precmd() {
  print -Pn "\e]0;ROOT ◆ %1~\a"

  if [[ "$NEWLINE_BEFORE_PROMPT" == yes ]]; then
    if [[ -z "${_NEW_LINE_BEFORE_PROMPT:-}" ]]; then
      _NEW_LINE_BEFORE_PROMPT=1
    else
      print ""
    fi
  fi
}

if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
  ZSH_HIGHLIGHT_STYLES[default]=none
  ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
  ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=${VE_ROOT_ALIAS},bold
  ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
  ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=${VE_ROOT_ALIAS},bold
  ZSH_HIGHLIGHT_STYLES[path]=fg=${VE_ROOT_PATH}
  ZSH_HIGHLIGHT_STYLES[arg0]=fg=#FFF1D6,bold
  ZSH_HIGHLIGHT_STYLES[command]=fg=#FFF1D6,bold
  ZSH_HIGHLIGHT_STYLES[builtin]=fg=#FFF1D6,bold
  ZSH_HIGHLIGHT_STYLES[alias]=fg=${VE_ROOT_ALIAS},bold
  ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
  ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi

export LS_COLORS='di=1;38;2;255;207;112:ln=38;2;255;194;66:ex=1;38;2;245;106;0:*.zip=38;2;255;173;3:*.tar=38;2;255;173;3:*.gz=38;2;255;173;3:*.png=38;2;206;167;238:*.jpg=38;2;206;167;238:*.jpeg=38;2;206;167;238:ow=30;44'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
fi

if [[ -f /etc/zsh_command_not_found ]]; then
  source /etc/zsh_command_not_found
fi
