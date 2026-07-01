#!/usr/bin/env bash
# ◆ Violet Ember ◆
# Filesystem helpers.

ve_ensure_dir() {
    mkdir -p "$1"
}

ve_file_exists() {
    [[ -f "$1" ]]
}

ve_dir_exists() {
    [[ -d "$1" ]]
}

ve_copy_file() {
    cp "$1" "$2"
}

ve_safe_append_once() {
    local file="$1"
    local marker="$2"
    local content="$3"

    touch "$file"
    if ! grep -Fq "$marker" "$file"; then
        printf '\n%s\n' "$content" >> "$file"
    fi
}
