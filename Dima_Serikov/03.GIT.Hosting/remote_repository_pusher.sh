#!/bin/bash

# check if not indexed changes
if [ -n "$(git status --porcelain)" ]; then
  echo "There are changes to commit."
else
  echo "No changes to commit."
  exit 1
fi

# get users commit message
read -p "Enter commit message: " commit_message

# add alll changes
git add .

# commit creation
git commit -m "$commit_message"

# get all remotes
remotes=$(git remote)

# push to all remotes
for remote in $remotes; do
  echo "Pushing to remote: $remote"
  git push $remote --all
done

echo "Pushed to all remotes."