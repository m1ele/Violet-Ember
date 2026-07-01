# ◆ Violet Ember ◆ Architecture

Violet Ember is designed around small files with clear responsibilities.

## Layers

```text
CLI
  ↓
commands/
  ↓
lib/
  ↓
core/
  ↓
themes/
```

## Layer Rule

Each layer may only talk to the layer below it.

- `bin/` dispatches commands.
- `commands/` interprets user intent.
- `lib/` contains reusable logic.
- `core/` contains shell theme integration.
- `themes/` contains Accent Packs and Root Theme data.

## Internal API

Public internal functions use the `ve_` prefix.

Examples:

- `ve_header`
- `ve_success`
- `ve_accent_current`
- `ve_backup_create_file`
- `ve_check_zsh`

## Business Logic Never Prints

Check and helper functions return status or data.
Presentation is handled by `lib/output.sh`.

## Definition of Done

A change is complete only when it is:

- working;
- documented;
- tested or testable;
- using the internal API;
- not duplicating logic.
