# 🚀 Bash Script: Automated React + TypeScript Setup

## ⚡ Overview

This Bash script automates the setup of a React + TypeScript project, ensuring a clean, ready-to-use environment without manual configuration.

## 🛠 Features

- ✅ Installs Vite, React, and TypeScript
- ✅ Configures TailwindCSS with Tailwind Vite Plugin and Tailwind Motion
- ✅ Installs and configures React Router
- ✅ Installs Axios with type definitions
- ✅ Installs Redux Toolkit for state management
- ✅ Generates essential project files with the correct setup
- ✅ Cleans up unnecessary files for a minimal boilerplate
- ✅ Saves time by skipping the manual setup process

## 📌 Usage

Run the script to create and configure a new project in your desired directory:

```bash
bash react-typescript.sh project-directory
```

(Replace `project-directory` with your preferred directory name.) If no directory is specified, the script runs in the current folder.

## 📦 Installed Dependencies

The script sets up the following dependencies:

- **Core Setup**

  - `vite@6.0.5`
  - `react@18.3.1`
  - `typescript@5.6.2`
  - `react-router@7.1.3`
  - `@types/react-router@5.1.20`
  - `reduxjs/toolkit@2.5.1`

- **Styling**

  - `tailwindcss@4.0.0`
  - `@tailwindcss/vite@4.0.1`
  - `tailwindcss-motion@1.0.1`

- **Utilities**

  - `axios@1.7.9`
  - `@types/axios@0.9.36`

## 🔧 Project Structure & Configurations

- Configures `vite.config.ts` with TailwindCSS plugin
- Sets up `src/App.tsx` with a sample Tailwind-styled component
- Configures `src/main.tsx` with React Router setup
- Removes default `src/index.css` and replaces it with `src/App.css`
- Generates a minimal `index.html` template
- Creates a simple `README.md` for the project

## 🚀 Getting Started

After running the script, navigate to your project directory and start development:

```bash
npm run dev
```

## 🚧 Work in Progress

This script is still evolving and reflects personal preferences for a streamlined development setup. Future updates may include:

- Additional configuration options
- Improved error handling
- More customization choices

Feedback and suggestions are welcome!
