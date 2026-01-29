#!/bin/bash

REMOTES=$(git remote)
BRANCH=$(git branch --show-current)
for REMOTE in $REMOTES; do
    echo "Push to $REMOTE"
    git push $REMOTE $BRANCH
done
