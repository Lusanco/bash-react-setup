#!/bin/bash
set -euo pipefail

setup() {
  local DIR="$1"

  echo -e "\nCreating and cleaning directory: $DIR\n"
  mkdir -p "$DIR"
  cd "$DIR" || exit 1

  # Remove previous contents
  rm -rf ./* ./.{git,github,gitignore,vite,vscode} 2>/dev/null || true
}
