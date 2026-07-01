# ◆ Violet Ember ◆ Charter

## Vision

Violet Ember exists to make the terminal feel coherent, reliable and calm for people who spend hours working in it.

It is not just a prompt theme. It is a workspace experience where every visual choice has a purpose.

## Mission

Provide a minimal, readable and portable Zsh workspace theme for Linux that clearly separates normal user work from privileged root sessions.

The terminal should communicate state without distracting from the work.

## Core Principles

### Coherence over customization

Customization is welcome only when it preserves the identity and readability of the project.

### Colors have meaning

Colors are not decoration. They communicate state.

- Accent colors represent the normal user identity.
- Ember represents privileged root sessions.
- Red represents errors.
- Green represents success or recognized commands.
- Gray represents structure.
- Dark backgrounds support focus.

### Semantic colors always win

Semantic colors have priority over Accent Packs. Accent Packs must never redefine root, errors, warnings or other system states.

### Root is sacred

Root is not an Accent Pack. Root always uses Ember colors to communicate privilege and attention.

### Minimalism over decoration

Every symbol and color must have a purpose. Violet Ember avoids visual noise, unnecessary icons and flashy terminal effects.

### Trust first

The project should never leave the user's terminal in a broken state. Backup, restore and clear diagnostics are part of the product, not optional extras.

### Portability

Violet Ember should depend on as little as possible and avoid distribution-specific logic in the core.

Official development happens on Kali Linux, but the project should work anywhere Zsh is available.

### Simple code is a feature

Readable Bash and plain configuration files are preferred over complex dependencies.

## Non-goals

Violet Ember will not try to become:

- a Powerlevel10k replacement;
- a prompt full of decorative segments;
- a collection of unrelated color schemes;
- a distribution-specific Kali-only configuration;
- a theme that lets root look like a normal user.

## Definition of Done

A feature is done only when:

1. It is coherent with `DESIGN.md` and this Charter.
2. It improves the terminal experience.
3. It is safe to install and restore.
4. It is documented.
5. It is simple enough to maintain.
6. It is something we would still want to maintain in two years.

## Project motto

> Build slowly. Build carefully. Build something that lasts.
