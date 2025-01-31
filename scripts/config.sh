#!/bin/bash
set -euo pipefail

config() {
  # Get the directory where the script is located, handling both direct execution and sourcing
  if [[ -n "${BASH_SOURCE[0]:-}" ]]; then
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  else
    SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
  fi
  
  # Move up one directory from scripts to get to the project root
  PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
  TEMPLATE_DIR="$PROJECT_ROOT/templates"

  echo -e "\nCreating project files...\n"
  mkdir -p src
  
  # Use absolute paths for template files
  cp "$TEMPLATE_DIR/vite.config.ts" "./vite.config.ts"
  cp "$TEMPLATE_DIR/src/App.tsx" "./src/App.tsx"
  cp "$TEMPLATE_DIR/src/App.css" "./src/App.css"
  cp "$TEMPLATE_DIR/src/main.tsx" "./src/main.tsx"
  cp "$TEMPLATE_DIR/index.html" "./index.html"
  cp "$TEMPLATE_DIR/README.md" "./README.md"
  
  # Delete default styles
  rm -f "./src/index.css" || true
  
  echo -e "\nFiles created successfully.\n"
}
