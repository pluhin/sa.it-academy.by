#!/bin/bash
# Script: push-to-all.sh
# Description: Push current branch to all remote repositories

set -e  # Exit on error

# Get current branch name
CURRENT_BRANCH=$(git branch --show-current)

# Print header
echo "========================================="
echo "Pushing branch: $CURRENT_BRANCH"
echo "========================================="

# Get all remote names except origin if you want to treat specially
REMOTES=$(git remote | grep -v "origin\|upstream" || git remote)

# If only origin exists, use it
if [ -z "$REMOTES" ]; then
    REMOTES="origin"
fi

# Push to each remote
for remote in $REMOTES; do
    echo "-----------------------------------------"
    echo "Pushing to remote: $remote"
    echo "-----------------------------------------"
    
    # Get remote URLs
    REMOTE_URL=$(git remote get-url $remote)
    echo "Remote URL: $REMOTE_URL"
    
    # Perform push
    if git push $remote $CURRENT_BRANCH; then
        echo "✓ Successfully pushed to $remote"
    else
        echo "✗ Failed to push to $remote"
        exit 1
    fi
done

echo "========================================="
echo "✓ All pushes completed successfully"
echo "========================================="
