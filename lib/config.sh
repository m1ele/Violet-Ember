#!/usr/bin/env bash
# ◆ Violet Ember ◆
# Central configuration for paths and versioning.

: "${VE_VERSION:=0.8.0-dev}"
: "${VE_NAME:=Violet Ember}"

: "${VE_CONFIG_DIR:=${HOME}/.config/violet-ember}"
: "${VE_STATE_DIR:=${HOME}/.local/state/violet-ember}"
: "${VE_CACHE_DIR:=${HOME}/.cache/violet-ember}"

: "${VE_ACCENT_FILE:=${VE_CONFIG_DIR}/current-accent.conf}"
: "${VE_THEME_FILE:=${VE_CONFIG_DIR}/theme.zsh}"
: "${VE_BACKUP_DIR:=${VE_STATE_DIR}/backups}"
: "${VE_LOG_DIR:=${VE_STATE_DIR}/logs}"
