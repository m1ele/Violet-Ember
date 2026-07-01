#!/usr/bin/env bash

ve_valid_hex_color() {
  [[ "${1:-}" =~ ^#[0-9A-Fa-f]{6}$ ]]
}

ve_validate_accent_file() {
  local file="${1:-}"
  [[ -f "$file" ]] || return 1

  # shellcheck disable=SC1090
  source "$file"

  local required=(
    VE_ACCENT_NAME
    VE_ACCENT_USERNAME
    VE_ACCENT_DIRECTORY
    VE_ACCENT_ARROW
    VE_ACCENT_ALIAS
    VE_ACCENT_PATH
  )

  local var value
  for var in "${required[@]}"; do
    value="${!var:-}"
    [[ -n "$value" ]] || return 1
  done

  ve_valid_hex_color "$VE_ACCENT_USERNAME" || return 1
  ve_valid_hex_color "$VE_ACCENT_DIRECTORY" || return 1
  ve_valid_hex_color "$VE_ACCENT_ARROW" || return 1
  ve_valid_hex_color "$VE_ACCENT_ALIAS" || return 1
  ve_valid_hex_color "$VE_ACCENT_PATH" || return 1
}
