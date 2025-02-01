#!/bin/bash

# Script to count git contributions in a target repository
# Usage: ./git-commits.sh /path/to/repository

# Get target directory from argument, exit if not provided
if [ -z "$1" ]; then
    echo "Error: Please provide a target directory"
    echo "Usage: ./git-contrib.sh /path/to/repository"
    exit 1
fi

# Store the target directory
TARGET_DIR="$1"

# Check if target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory does not exist: $TARGET_DIR"
    exit 1
fi

# Navigate to the target directory
cd "$TARGET_DIR" || { echo "Error: Failed to navigate to $TARGET_DIR"; exit 1; }

# Check if the directory is a Git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: The directory is not a Git repository: $TARGET_DIR"
    exit 1
fi

# Get the default branch name
DEFAULT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null || echo "main")

# Print the commit counts
printf "\nCommit counts for repository:\n%s\n\n" "$TARGET_DIR"
git shortlog -s -n --no-merges "$DEFAULT_BRANCH"
