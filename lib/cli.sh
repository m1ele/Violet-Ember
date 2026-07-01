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
            cat <<'HELP'
Usage:
  violet-ember accent list
  violet-ember accent current
  violet-ember accent set <name>
  violet-ember backup list
  violet-ember backup create
  violet-ember doctor
  violet-ember version
HELP
            ;;
        *)
            ve_error "Unknown command: ${command_name}"
            return 1
            ;;
    esac
}
