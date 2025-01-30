#!/bin/bash

# -----------------------------	#
# Script:			#
# -----------------------------	#
# react-typescript.sh		#
# -----------------------------	#
# Dependencies:			#
# -----------------------------	#
# node: 22.12.0			#
# vite: 6.0.5			#
# react: 18.3.1			#
# react-router: 7.1.3		#
# @types/react-router: 5.1.20	#
# typescript: 5.6.2		#
# tailwindcss: 4.0.0		#
# @tailwindcss/vite: 4.0.1	#
# tailwindcss-motion: 1.0.1	#
# axios: 1.7.9			#
# @types/axios: 0.9.36		#
# -----------------------------	#

# "Strict Mode"
set -euo pipefail

# Current Directory Variable
DIR="${1:-.}"

printf "\nDirectory Setup: $DIR\n"
# Create Directory If Not Exists
printf "\nCreating Directory...\n"
mkdir -p "$DIR"

# Navigate to the Provided Directory
printf "Navigating Directory...\n"
cd "$DIR" || { echo "Failed Navigating Directory...\n"; exit 1; }

# Empty Directory (and sub-directories)
printf "Emptying Directory...\n"
rm -rf ./* ./.{git,github,gitignore,vite,vscode} 2>/dev/null || true

# Install Vite
printf "\nInstalling:

  Vite
  React
  TypeScript\n"
npm create vite@latest . -- --template react-ts
printf "Ignoring:

  npm install
  npm run dev\n\n"

# Install Tailwind CSS
# Install Rombo (TailwindCSS Motion)
# Install Axios w/Type Definitions
# Install React Router w/Type Definitions
printf "Installing:

  TailwindCSS
  Rombo (TailwindCSS Motion)
  Axios w/Type Definitions
  React Router w/Type Definitions
  Redux Toolkit w/Type Definitions\n"
npm install tailwindcss @tailwindcss/vite
npm i -D tailwindcss-motion
npm install axios
npm install @types/axios
npm i react-router
npm install @types/react-router
npm install @reduxjs/toolkit

# Configure the Vite plugin
printf "\nUpdating Configuration...\n"
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
printf "Updating Styles...\n"
cat > src/App.css <<EOF
@import "tailwindcss";
@plugin "tailwindcss-motion";
EOF

# Update Template: src/App.tsx
printf "Updating Template...\n"
cat > src/App.tsx <<EOF
import "./App.css";

function App() {
  return (
    <>
      <h1 className="text-2xl font-bold text-slate-700">If you can see this <span className="text-green-700 font-extrabold text-4xl underline">text</span> green and styled, TailwindCSS is setup correctly.</h1>
    </>
  );
}

export default App;
EOF

# Update Main: src/main.tsx
printf "Updating Main...\n"
cat > src/main.tsx <<EOF
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { BrowserRouter, Routes, Route } from "react-router";
import App from "./App.tsx";

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<App />} />
      </Routes>
    </BrowserRouter>
  </StrictMode>
);
EOF

# Delete Styles: src/index.css
printf "Cleaning Files...\n"
rm src/index.css

# Update Template: index.html
printf "Updating Template...\n"
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
printf "Updating Readme...\n"
cat > README.md <<EOF
# ⚡ React + TypeScript

## 🚀 Project Setup

This project was automatically generated using a custom Bash script, ensuring a fully configured environment with:

- ✅ Vite – Fast build tool
- ✅ React – UI library
- ✅ TypeScript – Strongly typed JavaScript
- ✅ TailwindCSS – Utility-first CSS framework
- ✅ Redux Toolkit – State management
- ✅ React Router – Declarative routing
- ✅ Axios – HTTP client
- ✅ TailwindCSS Motion – Animation utility

## 📌 Getting Started

To start development, run:

\`\`\`bash
npm run dev
\`\`\`

## 🛠 About This Setup

This setup was created using an automated script to save time and provide a ready-to-use development environment. It ensures that all essential dependencies are installed and properly configured, so you can focus on building your application right away.
EOF

# npm install instruction
printf "Updating Packages...\n"
npm install

# Finishing Setup
printf "\nFinishing Setup...\n
Done. Now run:

  npm run dev\n\n"
