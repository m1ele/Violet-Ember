# ADR 0002 — Internal API

## Decision

All internal functions use the `ve_` prefix.

## Motivation

Separate public shell functions from Violet Ember internals.

Improve readability.

Avoid collisions with user-defined functions.

## Examples

ve_header
ve_info
ve_success
ve_backup_create
ve_dispatch
