#!/bin/bash

remotes=$(git remote)

current_branch=$(git rev-parse --abbrev-ref HEAD)

for remote in $remotes; do
  echo "Pushing changes to remote: $remote on branch: $current_branch"
  git push "$remote" "$current_branch"
  if [ $? -ne 0 ]; then
    echo "Error pushing to $remote. Aborting."
    exit 1
  fi
done

echo "Successfully pushed changes to all remotes."
