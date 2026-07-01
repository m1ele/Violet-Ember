#!/usr/bin/env bash
set -euo pipefail

VE_COMMAND_RESTORE_NAME="restore"
VE_COMMAND_RESTORE_DESCRIPTION="Restore backups"

ve_command_restore() {
    local action="${1:-interactive}"

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

        interactive|list|"")
            local backups=()
            local backup

            while IFS= read -r backup; do
                backups+=("$backup")
            done < <(ve_backup_list_files)

            if [[ "${#backups[@]}" -eq 0 ]]; then
                ve_error "No backups available"
                return 1
            fi

            ve_header
            ve_section "Available backups"

            local i
            for i in "${!backups[@]}"; do
                printf "%s) %s\n" "$((i + 1))" "$(basename "${backups[$i]}")"
            done

            printf "\nChoose backup to restore: "
            read -r choice

            if ! [[ "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice > ${#backups[@]} )); then
                ve_error "Invalid selection"
                return 1
            fi

            local selected="${backups[$((choice - 1))]}"

            cp "$selected" "$HOME/.zshrc"
            ve_success "Restored: $(basename "$selected")"
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
