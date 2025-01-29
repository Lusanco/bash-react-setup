#!/bin/bash

# ---------------------	#
# Script:		#
# ---------------------	#
# - vite-react-ts-tw.sh	#
# ---------------------	#
# Dependencies:		#
# --------------------- #
# - Vite: 6.0.5		#
# - React: 18.3.1	#
# - TypeScript: 5.6.2	#
# - TailwindCSS: 4.0.0	#
# ---------------------	#

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

# Update README.md
cat > README.md <<EOF
# ⚡ Vite + React + TypeScript + TailwindCSS

## 🚀 Project Setup

This project was automatically generated using a custom Bash script, ensuring a fully configured environment with:

- ✅ Vite – Fast build tool
- ✅ React – UI library
- ✅ TypeScript – Strongly typed JavaScript
- ✅ TailwindCSS – Utility-first CSS framework

## 📌 Getting Started

To start development, run:

```bash
npm install
npm run dev
```

## 🛠 About This Setup

This setup was created using an automated script to save time and provide a ready-to-use development environment.

<!-- Want to use this script for your own projects? Check it out here. -->
EOF
