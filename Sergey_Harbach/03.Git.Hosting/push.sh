#!/bin/bash

RemRepoArr=$(git remote)
for origin in $RemRepoArr
do
echo "git-push on remote $origin all branches"
git push -u $origin --all
done
