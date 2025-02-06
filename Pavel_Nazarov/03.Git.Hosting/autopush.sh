#!/bin/bash

remotes=$(git remote)
branch='md-sa2-30-24'

if [ -z "$remotes" ]; then
    echo "No remotes configured. Exiting."
    exit 1
fi

for remote in $remotes; do
    echo "Pushing to $remote..."

    if git push "$remote" "$branch"; then
        echo "Successfully pushed to $remote."
    else
        echo "Failed to push to $remote. Continuing to next remote."
    fi
done

echo "Push to all remotes complete!"
