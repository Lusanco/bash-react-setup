#!/bin/bash
set -euo pipefail

setup() {
  local DIR="$1"

  echo -e "\nTarget Directory: $DIR\n"
  mkdir -p "$DIR"
  cd "$DIR" || exit 1

  # Clear Directory Git Excluded
  rm -rf ./* ./.{github,gitignore,vite,vscode} 2>/dev/null || true
}
