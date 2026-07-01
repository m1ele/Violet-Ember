# Violet Ember ls/man/grep colors.

if [[ -x /usr/bin/dircolors ]]; then
  # Accent-based LS_COLORS.
  # Directories use the user accent, links use the lighter directory color,
  # executables use the path accent, archives use Golden/Ember.
  export LS_COLORS='di=1;38;2;162;136;227:ln=38;2;206;167;238:ex=1;38;2;157;78;221:*.zip=38;2;255;173;3:*.tar=38;2;255;173;3:*.gz=38;2;255;173;3:*.png=38;2;182;123;230:*.jpg=38;2;182;123;230:*.jpeg=38;2;182;123;230:ow=30;44'
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
  zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'
export LESS_TERMCAP_ue=$'\E[0m'
export MANROFFOPT="-c"
