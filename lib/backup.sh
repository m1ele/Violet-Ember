#!/usr/bin/env bash
# ◆ Violet Ember ◆
# Backup helpers.

ve_backup_timestamp() {
    date '+%Y%m%d-%H%M%S'
}

ve_backup_create_file() {
    local source_file="$1"
    local label="$2"
    local timestamp
    timestamp="$(ve_backup_timestamp)"

    ve_ensure_dir "${VE_BACKUP_DIR}"
    local dest="${VE_BACKUP_DIR}/${label}.backup-${timestamp}"

    cp "$source_file" "$dest"
    printf '%s\n' "$dest"
}

ve_backup_available() {
    [[ -d "${VE_BACKUP_DIR}" ]] && find "${VE_BACKUP_DIR}" -type f | grep -q .
}

ve_backup_list_files() {
    [[ -d "${VE_BACKUP_DIR}" ]] || return 0
    find "${VE_BACKUP_DIR}" -type f | sort
}
