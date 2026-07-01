#!/usr/bin/env bash
set -euo pipefail

VE_COMMAND_ACCENT_NAME="accent"
VE_COMMAND_ACCENT_DESCRIPTION="Manage Accent Packs"

ve_command_accent() {
    local action="${1:-list}"
    local project_root="${VE_PROJECT_ROOT:-$PWD}"

    case "$action" in
        list)
            ve_header
            ve_section "Official Accent Packs"
            while IFS= read -r file; do
                # shellcheck disable=SC1090
                source "$file"
                ve_info "${NAME}"
            done < <(ve_accent_list "$project_root")
            ;;
        current)
            ve_header
            ve_key_value "Current Accent" "$(ve_accent_current)"
            ;;
        set)
            local accent="${2:-}"
            [[ -n "$accent" ]] || { ve_error "Missing accent name"; return 1; }
            local file
            file="$(ve_accent_find "$project_root" "$accent" || true)"
            [[ -n "$file" ]] || { ve_error "Accent not found: $accent"; return 1; }
            ve_accent_is_valid_file "$file" || { ve_error "Invalid Accent Pack: $accent"; return 1; }

            ve_header
            ve_info "Applying accent: $accent"
            ve_ensure_dir "${VE_CONFIG_DIR}"
            ve_backup_create_file "${VE_ACCENT_FILE}" "accent" >/dev/null 2>&1 || true
            cp "$file" "${VE_ACCENT_FILE}"
            ve_success "Accent applied: $(ve_accent_current)"
            ve_info "Run: source ~/.zshrc"
            ;;
        *)
            ve_error "Unknown accent command: $action"
            return 1
            ;;
    esac
}

ve_register_command \
    "$VE_COMMAND_ACCENT_NAME" \
    "$VE_COMMAND_ACCENT_DESCRIPTION" \
    "ve_command_accent"
