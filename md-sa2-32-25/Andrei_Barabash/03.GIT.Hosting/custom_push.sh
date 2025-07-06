#!/bin/bash
echo 'Strat push to multiple repositories:'

GIT=`which git`
CURRENT_BRANCH=$(git branch --show-current)
remotes=($(git remote))

for remote in "${remotes[@]}"
do
    ${GIT} push $remote ${CURRENT_BRANCH}
done    

echo "Push completed"
