# Violet Ember user prompt.

VIRTUAL_ENV_DISABLE_PROMPT=1
NEWLINE_BEFORE_PROMPT="${NEWLINE_BEFORE_PROMPT:-yes}"

configure_prompt() {
  PROMPT='%F{'$VE_USERNAME'}%n %F{242}• %F{'$VE_DIRECTORY'}%1~ %F{'$VE_ARROW'}➜ %f'
  RPROMPT=''
}

configure_prompt

precmd() {
  print -Pn "\e]0;%n • %1~\a"

  if [[ "$NEWLINE_BEFORE_PROMPT" == yes ]]; then
    if [[ -z "${_NEW_LINE_BEFORE_PROMPT:-}" ]]; then
      _NEW_LINE_BEFORE_PROMPT=1
    else
      print ""
    fi
  fi
}
