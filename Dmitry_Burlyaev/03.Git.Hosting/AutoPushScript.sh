#!/bin/bash

echo "Start push in specifyed remote repositories"

# Get repo list
remote_repositories=$(git remote)

# Push in repo
for This_repo in $remote_repositories
do
if [  $This_repo = GHub ] || [ $This_repo = GLub ]
then
    git push -u $This_repo --all
fi
done

echo "End push in all repositories"