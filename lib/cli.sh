#!/usr/bin/env bash
# ◆ Violet Ember ◆
# CLI dispatcher and command registry.

declare -a VE_COMMANDS=()
declare -A VE_COMMAND_FUNCTIONS=()
declare -A VE_COMMAND_DESCRIPTIONS=()

ve_register_command() {
    local name="$1"
    local description="$2"
    local function="$3"

    VE_COMMANDS+=("$name")
    VE_COMMAND_DESCRIPTIONS["$name"]="$description"
    VE_COMMAND_FUNCTIONS["$name"]="$function"
}

ve_dispatch() {
    local command_name="${1:-help}"
    shift || true

    case "$command_name" in
        help|--help|-h)
            ve_header
            ve_key_value "Version" "$VE_VERSION"
            printf "\n"
            ve_section "Available commands"

            local command
            for command in "${VE_COMMANDS[@]}"; do
                ve_key_value "$command" "${VE_COMMAND_DESCRIPTIONS[$command]}"
            done

            ve_key_value "version" "Show installed version"
            ;;
        version|--version|-v)
            ve_header
            ve_key_value "Version" "$VE_VERSION"
            ;;
        *)
            local function="${VE_COMMAND_FUNCTIONS[$command_name]:-}"

            if [[ -n "$function" ]]; then
                "$function" "$@"
                return
            fi

            ve_error "Unknown command: ${command_name}"
            return 1
            ;;
    esac
}
