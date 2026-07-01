# ◆ Violet Ember ◆

**A coherent, reliable and portable workspace theme for Zsh on Linux.**

Designed for people who spend hours in a terminal.

Violet Ember is not just a prompt. It is a minimal workspace experience where colors communicate state, root is always recognizable, and the terminal stays readable after long sessions.

```text
◆ Violet Ember ◆

Coherent.
Reliable.
Portable.
Minimal.
```

## Philosophy

Violet Ember exists to make the terminal disappear while you work.

It does not aim to be flashy. It aims to be calm, predictable and useful.

Core ideas:

- Accent Packs customize the normal user identity.
- Root always uses Ember colors.
- Semantic colors always win.
- Simple code is a feature.
- Trust comes before customization.

Read more in [`CHARTER.md`](CHARTER.md) and [`DESIGN.md`](DESIGN.md).

## Status

Current version: **v0.4.0 — Publication Foundation**

This is still an early project, but it is already installable and testable.

## Install

```bash
unzip Violet-Ember-v0.4.0-Publication-Foundation.zip
cd Violet-Ember-v0.4.0-Publication-Foundation
chmod +x install.sh uninstall.sh
./install.sh --with-root
```

Open a new terminal or run:

```bash
source ~/.zshrc
```

## Accent Engine

List Accent Packs:

```bash
violet-ember accent list
```

Show current Accent Pack:

```bash
violet-ember accent current
```

Change Accent Pack:

```bash
violet-ember accent set ocean
source ~/.zshrc
```

Root remains Ember regardless of the selected Accent Pack.

## Official Accent Packs

- Violet
- Ocean
- Emerald
- Sapphire
- Golden
- Rose

## Portability

Violet Ember is developed on Kali Linux, but the goal is to support Linux systems where Zsh is available.

The project avoids unnecessary dependencies and distribution-specific logic in the core.

## Project workflow

- `main` contains stable releases.
- `dev` contains experimental work.
- Features are discussed, tested and documented before release.

## License

MIT License.
