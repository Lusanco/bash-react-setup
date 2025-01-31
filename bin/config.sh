#!/bin/bash
# bash 'strict' mode
set -euo pipefail

echo -e "\nCopying configuration files..."

TEMPLATE_DIR="$(dirname "$0")/../templates"

cp -r "$TEMPLATE_DIR"* .

echo "Configuration complete."
