# ◆ Violet Ember ◆ Design

> A good terminal should disappear while you work.

## Principles

1. Coherence over customization.
2. Colors have meaning.
3. Semantic colors always win.
4. Root is sacred.
5. Minimalism over decoration.
6. Accessibility matters.

## Semantic colors

Semantic colors do not change with Accent Packs.

- Ember = privileged/root state
- Red = errors
- Green = success / recognized commands
- Gray = structure
- Dark background = focus

## Accent Packs

Accent Packs customize the user identity only.

For v0.3.0, an Accent Pack may define only:

```bash
VE_ACCENT_NAME
VE_USERNAME
VE_DIRECTORY
VE_ARROW
VE_ALIAS
VE_PATH
```

Root is not an Accent Pack. Root is a semantic state.

## Decision rule

Before adding a feature, ask:

1. Is it coherent with DESIGN.md?
2. Does it improve the experience?
3. Is it worth maintaining over time?

## Framework Principles

### Idempotence

Running an installer or setup command multiple times must not create duplicate configuration blocks or leave the shell in a broken state.

### Single Responsibility

Each script or core file should do one clear job.

Examples:

- `prompt.zsh` defines the prompt.
- `syntax.zsh` defines syntax highlighting.
- `ls.zsh` defines file listing colors and aliases.
- `output.sh` defines CLI output helpers.

### Simple code is a feature

Violet Ember should prefer readable shell code over complex abstractions. Dependencies should be avoided unless they clearly improve reliability.
