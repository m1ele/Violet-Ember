#!/usr/bin/env bash
set -euo pipefail

VE_COMMAND_DOCTOR_NAME="doctor"
VE_COMMAND_DOCTOR_DESCRIPTION="Run diagnostics"

ve_command_doctor() {
    local issues=0
    local warnings=0

    ve_header
    ve_info "Running diagnostics"
    printf '\n'

    ve_section "System"
    ve_key_value "OS" "$(ve_system_os)"
    ve_key_value "Shell" "$(ve_system_shell)"
    ve_key_value "Terminal" "$(ve_system_terminal)"
    ve_key_value "Version" "${VE_VERSION}"
    printf '\n'

    ve_section "Checks"

    if ve_check_zsh; then ve_success "Zsh shell"; else ve_error "Zsh shell"; ((issues++)); fi
    if ve_check_config_dir; then ve_success "Config directory"; else ve_error "Config directory"; ((issues++)); fi
    if ve_check_theme_file; then ve_success "Theme file"; else ve_error "Theme file"; ((issues++)); fi
    if ve_check_cli; then ve_success "CLI installed"; else ve_error "CLI installed"; ((issues++)); fi
    if ve_check_terminal_colors; then ve_success "Terminal 256 colors"; else ve_warning "Terminal 256 colors"; ((warnings++)); fi
    if ve_check_accent; then ve_success "Current Accent: $(ve_accent_current)"; else ve_error "Current Accent"; ((issues++)); fi
    if ve_check_backup; then ve_success "Backup available"; else ve_warning "Backup available"; ((warnings++)); fi
    printf '\n'

    ve_section "Summary"
    if (( issues == 0 && warnings == 0 )); then
        ve_success "Health Score: 100%"
        ve_success "System healthy."
    elif (( issues == 0 )); then
        ve_warning "Health Score: 90%"
        ve_warning "${warnings} warning(s) detected."
    else
        ve_error "Health Score: 70%"
        ve_error "${issues} issue(s), ${warnings} warning(s) detected."
    fi
}

ve_register_command \
    "$VE_COMMAND_DOCTOR_NAME" \
    "$VE_COMMAND_DOCTOR_DESCRIPTION" \
    "ve_command_doctor"
