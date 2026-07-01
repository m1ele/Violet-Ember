#!/usr/bin/env bash
# ◆ Violet Ember ◆
# Accent Pack helpers.

ve_accent_current() {
    if [[ -r "${VE_ACCENT_FILE}" ]]; then
        # shellcheck disable=SC1090
        source "${VE_ACCENT_FILE}"
        printf '%s\n' "${VE_ACCENT_NAME:-Unknown}"
    else
        printf 'None\n'
    fi
}

ve_accent_is_valid_file() {
    local file="$1"
    [[ -r "$file" ]] || return 1

    local required=(VE_ACCENT_NAME VE_USERNAME VE_DIRECTORY VE_ARROW VE_ALIAS VE_PATH)
    local key
    for key in "${required[@]}"; do
        grep -Eq "^${key}=" "$file" || return 1
    done
}

ve_accent_list() {
    local root="$1"
    find "$root/themes/official" -mindepth 2 -maxdepth 2 -name accent.conf 2>/dev/null | sort
}

ve_accent_find() {
    local root="$1"
    local accent="$2"
    local file="$root/themes/official/${accent}/accent.conf"
    [[ -f "$file" ]] && printf '%s\n' "$file"
}
