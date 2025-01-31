#!/bin/bash
# bash 'strict' mode
set --euo pipefail

# Load utility functions
source "$(dirname "$0")/../utils/validate_directory.sh"

# Ensure a directory is provided
DIR="${1:-.}"
validate_directory "$DIR"

# Run setup scripts
bash "$(dirname "$0")/setup.sh" "$DIR"
echo -e "\nSetup complete! Run\n\n cd $DIR && npm run dev\n"
