#!/bin/bash

# TailwindCSS v4.0 Auto Install
# Vite: React | TypeScript

# Current Directory Variable
DIR="${1:-.}"

# Create Directory If Not Exists
mkdir -p "$DIR"

# Navigate to the Provided Directory
cd "$DIR" || { echo "Failed to navigate to directory:" $DIR; exit 1; }

# Install Vite
npm create vite@latest . -- --template react-ts

# Install Tailwind CSS
npm install tailwindcss @tailwindcss/vite

# Configure the Vite plugin
cat > vite.config.ts <<EOF
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import tailwindcss from "@tailwindcss/vite";

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
});
EOF

# Making Sure Directory  Exists
mkdir -p src

# Import Tailwind CSS
cat > src/App.css <<EOF
@import "tailwindcss";
EOF

# Tailwind CSS Test Template
cat > src/App.tsx <<EOF
import "./App.css";

function App() {
  return (
    <>
      <h1 className="text-5xl font-extrabold underline">Tailwind Setup w/Bash Script</h1>
    </>
  );
}

export default App;
EOF
