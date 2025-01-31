#!/bin/bash
set -euo pipefail

install() {
  echo -e "\nInstalling dependencies...\n"

  # Create Vite project
  npm create vite@latest . -- --template react-ts

  # Install all required dependencies
  npm install tailwindcss @tailwindcss/vite
  npm install -D tailwindcss-motion
  npm install axios @types/axios
  npm install react-router @types/react-router
  npm install @reduxjs/toolkit

  echo -e "\nDependencies installed.\n"
}
