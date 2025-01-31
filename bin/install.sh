#!/bin/bash
# bash 'strict' mode
set -euo pipefail

echo -e "\nInstalling dependencies..."

npm create vite@latest . -- --template react-ts
npm install tailwindcss @tailwindcss/vite
npm i -D tailwindcss-motion
npm install axios
npm install @types/axios
npm i react-router
npm install @types/react-router
npm install @reduxjs/toolkit

echo "Dependencies installed."
