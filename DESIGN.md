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
