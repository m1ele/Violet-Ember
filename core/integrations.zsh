# Optional integrations.

if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
fi

if [[ -f /etc/zsh_command_not_found ]]; then
  source /etc/zsh_command_not_found
fi
