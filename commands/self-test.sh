#!/usr/bin/env bash
set -euo pipefail

VE_COMMAND_SELF_TEST_NAME="self-test"
VE_COMMAND_SELF_TEST_DESCRIPTION="Run Violet Ember self tests"

ve_command_self_test() {
    ve_header
    ve_info "Running self tests"
    printf "\n"

    ve_section "CLI"

    ./bin/violet-ember help >/dev/null && ve_success "help"
    ./bin/violet-ember version >/dev/null && ve_success "version"
    ./bin/violet-ember accent list >/dev/null && ve_success "accent list"
    ./bin/violet-ember accent current >/dev/null && ve_success "accent current"
    ./bin/violet-ember backup list >/dev/null && ve_success "backup list"
    ./bin/violet-ember doctor >/dev/null && ve_success "doctor"

    printf "\n"
    ve_section "Summary"
    ve_success "All self tests passed."
}

ve_register_command \
    "$VE_COMMAND_SELF_TEST_NAME" \
    "$VE_COMMAND_SELF_TEST_DESCRIPTION" \
    "ve_command_self_test"
