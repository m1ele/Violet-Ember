#!/usr/bin/env bash
# ◆ Violet Ember ◆
# Unified CLI output helpers.

ve_header() {
    printf '\n◆ Violet Ember ◆\n\n'
}

ve_section() {
    printf '%s\n' "$1"
    printf '────────────────────────\n'
}

ve_info() {
    printf '• %s\n' "$1"
}

ve_success() {
    printf '✔ %s\n' "$1"
}

ve_warning() {
    printf '⚠ %s\n' "$1"
}

ve_error() {
    printf '✖ %s\n' "$1" >&2
}

ve_key_value() {
    printf '%-14s %s\n' "$1" "$2"
}
