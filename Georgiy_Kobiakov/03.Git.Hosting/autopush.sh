#!/bin/bash

remote_repos=($(git remote))

if [[ $(git status -s) ]]; then
        echo "Save your changes before sending"
        exit
fi

# Pushing changes to remote repos
for repo in "${remote_repos[@]}"; do
        echo "Sending changes in $repo..."
        git push -u "$repo" --all
        echo "Are sent in $repo."
done

echo "Complete!"
