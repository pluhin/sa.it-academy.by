#!/bin/bash

# Gets a list of remote repositories
remote_repos=($(git remote))

# Checks if there are unsaved changes in your repository
if [[ $(git status -s) ]]; then
    echo "Save your changes before submitting"
    exit 1
fi

# Push all branches to all remote repositories
for repo in "${remote_repos[@]}"; do
    echo "Sending changes to $repo..."
    git push -u "$repo" --all
    echo "Changes sent to $repo."
done

echo "Success"