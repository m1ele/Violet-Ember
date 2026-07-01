#!/usr/bin/env bash
# ◆ Violet Ember ◆
# System detection helpers. Business logic does not print.

ve_system_shell() {
    basename "${SHELL:-unknown}"
}

ve_system_os() {
    if [[ -r /etc/os-release ]]; then
        . /etc/os-release
        printf '%s\n' "${PRETTY_NAME:-${NAME:-Linux}}"
    else
        uname -s
    fi
}

ve_system_terminal() {
    printf '%s\n' "${TERM:-unknown}"
}

ve_has_256_colors() {
    [[ "${TERM:-}" == *256color* || "${COLORTERM:-}" == "truecolor" || "${COLORTERM:-}" == "24bit" ]]
}

ve_command_exists() {
    command -v "$1" >/dev/null 2>&1
}
