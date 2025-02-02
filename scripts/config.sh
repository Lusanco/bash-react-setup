#!/bin/bash
set -euo pipefail

config() {
  # Get the directory where the script is located, 
  # handling both direct execution and sourcing
  if [[ -n "${BASH_SOURCE[0]:-}" ]]; then
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  else
    SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
  fi
  
  # Setting Directories
  PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
  TEMPLATE_DIR="$PROJECT_ROOT/templates"

  echo -e "\nCreating project files...\n"
  mkdir -p src
  
  # Copy Templates To Target Directory
  cp -r "$TEMPLATE_DIR/." "./"
  
  # Delete default styles
  rm -f "./src/index.css" || true
  
  echo -e "\nFiles created successfully.\n"
}
