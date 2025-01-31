#!/bin/bash

# Git Command
# git shortlog -s -n --no-merges main

# Current Directory Variable
REPO_DIR="${1:-.}"

# Navigate to the Provided Directory
cd "$REPO_DIR" || { echo "Failed to navigate to directory:" $REPO_DIR; exit 1; }

# Check if the directory is a Git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
	echo "Error: The provided directory is not a Git repository."
	exit 1
fi

# Get the list of contributors and their commit counts
printf "\n Commit counts for repository:\n $REPO_DIR \n\n"
git shortlog -s -n --no-merges main
