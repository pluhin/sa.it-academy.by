#!/bin/bash

REMOTES=$(git remote)
CURRENT_BRANCH=$(git branch --show-current)

for remote in $REMOTES; do
    echo "------------------------------------------"
    echo "Syncing -> $remote..."
    git push "$remote" "$CURRENT_BRANCH"
    
    if [ $? -eq 0 ]; then
        echo "SUCCESS push into $remote"
    else
        echo "ERROR in sending into $remote"
    fi
done

echo "------------------------------------------"
echo "DONE!"
