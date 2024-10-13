!/bin/bash

# Get the list of remote repositories
remotes=$(git remote)

# Loop through each remote repository and push changes
for remote in $remotes; do
    echo "Pushing to $remote..."
    git push "$remote"
done

echo "All changes pushed to remote repositories."
