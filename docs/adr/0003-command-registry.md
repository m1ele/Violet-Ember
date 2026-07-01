# ADR 0003 — Command Registry

## Decision

Commands register themselves.

The CLI dispatcher never knows individual commands.

## Reason

Adding a new command should not require modifying the dispatcher.

The project follows the Open/Closed Principle.

New commands extend the CLI without changing existing code.
