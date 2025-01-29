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

# "Strict Mode"
set -euo pipefail

# Current Directory Variable
DIR="${1:-.}"

# Create Directory If Not Exists
mkdir -p "$DIR"

# Navigate to the Provided Directory
cd "$DIR" || { echo "Failed to navigate to directory:" $DIR; exit 1; }

# Empty Directory (and sub-directories)
printf "\nEmptying the directory...\n"
rm -rf ./* ./.{git,github,gitignore} 2>/dev/null || true

# Install Vite
printf "\nInstalling:\n 
	Vite\n
	React\n
	TypeScript\n
	TailwindCSS\n"
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

# Update Styles: src/App.css
cat > src/App.css <<EOF
@import "tailwindcss";
EOF

# Update Template: src/App.tsx
cat > src/App.tsx <<EOF
import "./App.css";

function App() {
  return (
    <>
      <h1 className="text-5xl font-extrabold underline bg-green-500">Tailwind Setup w/Bash Script</h1>
    </>
  );
}

export default App;
EOF

# Update Main: src/main.tsx
cat > src/main.tsx <<EOF
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import App from "./App.tsx";

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <App />
  </StrictMode>
);
EOF

# Delete Styles: src/index.css
rm src/index.css

# Update Template: index.html
cat > index.html <<EOF
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bash_Vite_React_TS_TW</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html>
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

\`\`\`bash
npm install
npm run dev
\`\`\`

## 🛠 About This Setup

This setup was created using an automated script to save time and provide a ready-to-use development environment.
EOF

# npm install instruction
npm install

# npm run dev instruction
npm run dev
