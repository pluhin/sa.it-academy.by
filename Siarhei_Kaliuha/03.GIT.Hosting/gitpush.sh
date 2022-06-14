#!/bin/bash

echo -e "## Remote repositories list:\n$(git remote)"

for remote in $(git remote)
do
        echo "## Pushing changes to $remote repository:"
        git push --all $remote
done