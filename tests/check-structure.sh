#!/usr/bin/env bash
set -euo pipefail

required_dirs=(
  ".github"
  "assets"
  "bin"
  "commands"
  "core"
  "docs"
  "docs/adr"
  "docs/guides"
  "lib"
  "tests"
  "themes"
  "themes/official"
  "themes/root"
  "themes/user"
)

required_files=(
  "README.md"
  "MANIFESTO.md"
  "PHILOSOPHY.md"
  "STYLE.md"
  "DESIGN.md"
  "ARCHITECTURE.md"
  "ROADMAP.md"
  "CHANGELOG.md"
  "CONTRIBUTING.md"
  "CHARTER.md"
  "QUALITY.md"
  "LICENSE"
  "install.sh"
  "uninstall.sh"
)

for dir in "${required_dirs[@]}"; do
  [[ -d "$dir" ]] || { echo "Missing directory: $dir"; exit 1; }
done

for file in "${required_files[@]}"; do
  [[ -f "$file" ]] || { echo "Missing file: $file"; exit 1; }
done

echo "Repository structure OK"
