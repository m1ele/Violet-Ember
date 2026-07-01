#!/usr/bin/env bash
set -euo pipefail

VE_COMMAND_RESTORE_NAME="restore"
VE_COMMAND_RESTORE_DESCRIPTION="Restore backups"

ve_command_restore() {
    local action="${1:-latest}"

    case "$action" in
        latest)
            local latest
            latest="$(ve_backup_list_files | tail -n 1)"

            if [[ -z "$latest" ]]; then
                ve_error "No backup available"
                return 1
            fi

            ve_header
            ve_info "Restoring latest backup"
            cp "$latest" "$HOME/.zshrc"
            ve_success "Restored: $(basename "$latest")"
            ve_info "Run: source ~/.zshrc"
            ;;
        *)
            ve_error "Unknown restore command: $action"
            return 1
            ;;
    esac
}

ve_register_command \
    "$VE_COMMAND_RESTORE_NAME" \
    "$VE_COMMAND_RESTORE_DESCRIPTION" \
    "ve_command_restore"
