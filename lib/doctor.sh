#!/usr/bin/env bash
# ◆ Violet Ember ◆
# Doctor checks. Check functions return status and do not print.

ve_check_zsh() {
    [[ "$(ve_system_shell)" == "zsh" ]]
}

ve_check_config_dir() {
    ve_dir_exists "${VE_CONFIG_DIR}"
}

ve_check_theme_file() {
    ve_file_exists "${VE_THEME_FILE}"
}

ve_check_cli() {
    ve_command_exists violet-ember
}

ve_check_terminal_colors() {
    ve_has_256_colors
}

ve_check_backup() {
    ve_backup_available
}

ve_check_accent() {
    [[ -r "${VE_ACCENT_FILE}" ]] && ve_accent_is_valid_file "${VE_ACCENT_FILE}"
}
