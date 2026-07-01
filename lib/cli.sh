#!/usr/bin/env bash
# ◆ Violet Ember ◆
# CLI dispatcher.

ve_dispatch() {
    local command_name="${1:-help}"
    shift || true

    case "$command_name" in
        accent) ve_command_accent "$@" ;;
        backup) ve_command_backup "$@" ;;
        doctor) ve_command_doctor ;;
        version|--version|-v)
            ve_header
            ve_key_value "Version" "${VE_VERSION}"
            ;;

        help|--help|-h)
    	    ve_header
	    ve_section "Available commands"
    	    ve_key_value "$VE_COMMAND_ACCENT_NAME" "$VE_COMMAND_ACCENT_DESCRIPTION"
            ve_key_value "$VE_COMMAND_BACKUP_NAME" "$VE_COMMAND_BACKUP_DESCRIPTION"
            ve_key_value "$VE_COMMAND_DOCTOR_NAME" "$VE_COMMAND_DOCTOR_DESCRIPTION"
            ve_key_value "version" "Show installed version"
            ;;
         *)
            ve_error "Unknown command: ${command_name}"
            return 1
            ;;
    esac
}
