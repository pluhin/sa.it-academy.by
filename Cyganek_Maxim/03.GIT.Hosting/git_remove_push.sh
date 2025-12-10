#!/bin/bash
remotes=$(git remote)
if [ -z "$remotes" ]; then
    echo "No remote repositories"
    exit 1
fi

for remote in $remotes; do
    git push "$remote" --all
done


