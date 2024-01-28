#!/bin/bash

command=$(git remote)

if [[ $command ]]
then
for repo in $command 
do
echo "$repo"
git push
done
else 
echo "no remotes in current dirrectory. Check .git"
fi
