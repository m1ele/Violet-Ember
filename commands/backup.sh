#!/usr/bin/env bash
set -euo pipefail

VE_COMMAND_BACKUP_NAME="backup"
VE_COMMAND_BACKUP_DESCRIPTION="Manage backups"

ve_command_backup() {
    local action="${1:-list}"

    case "$action" in
        list)
            ve_header
            ve_section "Available backups"
            local found=0
            while IFS= read -r backup; do
                found=1
                ve_info "$(basename "$backup")"
            done < <(ve_backup_list_files)
            if [[ "$found" -eq 0 ]]; then
                ve_warning "No backups found"
            fi
            ;;
        create)
            ve_header
            ve_info "Creating backup"
            local backup
            backup="$(ve_backup_create_file "$HOME/.zshrc" "zshrc-user")"
            ve_success "Backup created: $backup"
            ;;
        *)
            ve_error "Unknown backup command: $action"
            return 1
            ;;
    esac
}

ve_register_command \
    "$VE_COMMAND_BACKUP_NAME" \
    "$VE_COMMAND_BACKUP_DESCRIPTION" \
    "ve_command_backup"
