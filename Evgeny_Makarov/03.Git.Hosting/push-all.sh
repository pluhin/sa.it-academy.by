#!/bin/bash

BRANCH=$(git branch --show-current)

echo "_____________________"
echo "Current branch: $BRANCH"
echo "_____________________"

REMOTES=$(git remote | grep -v "origin\|upstream" || git remote)

for remote in $REMOTES; do
    REMOTE_URL=$(git remote get-url $remote)
    echo "REMOTE URL: $REMOTE_URL"
    

    echo "Pushing $BRANCH to $remote"
    git push $remote $BRANCH
done
