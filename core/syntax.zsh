# Violet Ember syntax highlighting.

if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
  ZSH_HIGHLIGHT_STYLES[default]=none
  ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
  ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=${VE_ALIAS},bold
  ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=${VE_ALIAS},underline
  ZSH_HIGHLIGHT_STYLES[global-alias]=fg=${VE_ALIAS},bold
  ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
  ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=${VE_ALIAS},bold
  ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=${VE_PATH},underline
  ZSH_HIGHLIGHT_STYLES[path]=fg=${VE_PATH}
  ZSH_HIGHLIGHT_STYLES[path_pathseparator]=fg=${VE_USERNAME}
  ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=fg=${VE_USERNAME}
  ZSH_HIGHLIGHT_STYLES[globbing]=fg=${VE_ALIAS},bold
  ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=${VE_ALIAS},bold
  ZSH_HIGHLIGHT_STYLES[command-substitution]=none
  ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=${VE_ALIAS},bold
  ZSH_HIGHLIGHT_STYLES[process-substitution]=none
  ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=${VE_ALIAS},bold
  ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=${VE_ALIAS}
  ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=${VE_ALIAS}
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=${VE_DIRECTORY}
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=${VE_DIRECTORY}
  ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=${VE_DIRECTORY}
  ZSH_HIGHLIGHT_STYLES[redirection]=fg=${VE_ALIAS},bold
  ZSH_HIGHLIGHT_STYLES[comment]=fg=244
  ZSH_HIGHLIGHT_STYLES[arg0]=fg=#F3E8FF,bold
  ZSH_HIGHLIGHT_STYLES[command]=fg=#F3E8FF,bold
  ZSH_HIGHLIGHT_STYLES[builtin]=fg=#F3E8FF,bold
  ZSH_HIGHLIGHT_STYLES[alias]=fg=${VE_ALIAS},bold
  ZSH_HIGHLIGHT_STYLES[path]=fg=${VE_PATH}
  ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=${VE_ALIAS},bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=${VE_USERNAME},bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=${VE_DIRECTORY},bold
  ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi
