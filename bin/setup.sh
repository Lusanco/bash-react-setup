#!/bin/bash
# bash 'strict' mode
set -euo pipefail

DIR="$1"

echo -e "\nSetting up project in $DIR..."
mkdir -p "$DIR"
cd "$DIR" || exit 1

echo "Cleaning directory..."
rm -rf ./* ./.{git,github,gitignore,vite,vscode} 2>/dev/null || true

# Install dependencies
bash "$(dirname "$0")/install.sh"

# Configure files
bash "$(dirname "$0")/config.sh"
