# Roadmap

## Version families

- `v0.x` — Foundation
- `v1.x` — Core
- `v2.x` — Workspace
- `v3.x` — Ecosystem

## v0.x — Foundation

- v0.1.0 Ignition: initial installable project structure
- v0.2.0 Foundation: design rules, Git workflow and Accent Pack documentation
- v0.3.0 Accent Engine: selectable Accent Packs
- v0.4.0 Publication Foundation: Charter, issue templates and publishing preparation
- v0.5.0 Safety & Restore: doctor, backup list and restore flow

## v1.x — Core

- Stable installer
- Stable uninstall
- Stable restore
- Stable doctor
- Stable Accent Engine
- Public v1.0.0 release

## v2.x — Workspace

- Optional themes for tools such as `bat`, `git`, `btop`, `nano` and `tmux`

## v3.x — Ecosystem

- Community Accent Packs
- Contribution validation
- Extended documentation

## v0.5.0 — Framework

Goal: render the project maintainable.

- Modular configuration under `~/.config/violet-ember/`
- Idempotent installer
- Small `.zshrc` source block
- Shared CLI output helpers
- Root remains Ember and separate from user Accent Packs

## v0.6.0 — Safety & Restore

Goal: make recovery trustworthy.

- `violet-ember doctor`
- `violet-ember backup list`
- `violet-ember restore`
- `violet-ember restore latest`
