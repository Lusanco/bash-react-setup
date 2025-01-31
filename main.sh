#!/bin/bash
# main.sh
set -euo pipefail

# Get the absolute path of the main script directory
MAIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_DIR="$MAIN_DIR/scripts"

# Source the component scripts
source "$SCRIPTS_DIR/setup.sh"
source "$SCRIPTS_DIR/install.sh"
source "$SCRIPTS_DIR/config.sh"

# Get target directory from argument or use current directory
TARGET_DIR="${1:-.}"

# Convert target directory to absolute path
TARGET_DIR="$(cd "$(dirname "$TARGET_DIR")" && pwd)/$(basename "$TARGET_DIR")"

# Run the setup steps
setup "$TARGET_DIR"
install
config "$MAIN_DIR"

echo "Setup completed successfully!"
