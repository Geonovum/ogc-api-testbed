#!/bin/sh
# Usage: ./push-git.sh
# with message : ./push-git.sh my commit message
# If a command fails then the push stops
set -e

printf "\033[0;32mDoing updates to GitHub...\033[0m\n"

# Add changes to git.
git add .

# Commit changes with optional ccommit message.
COMMIT_MSG="changes on $(date)"
[[ -n "$*" ]] && COMMIT_MSG="$*"

printf "\033[0;32mCommit msg = ${COMMIT_MSG}\033[0m\n"
git commit -m "${COMMIT_MSG}"

# Push source and build repos.
git push origin main
