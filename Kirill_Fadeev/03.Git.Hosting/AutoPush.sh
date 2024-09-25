#!/bin/bash

echo "Start push in all repositories"

# Get repo list
remote_repositories=$(git remote)

# Push in all repo
for This_repo in $remote_repositories
do
    git push -u $This_repo --all
done

echo "End push in all repositories"