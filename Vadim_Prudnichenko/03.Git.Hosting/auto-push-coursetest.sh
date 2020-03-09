#!/bin/bash

git add .

echo 'Enter the commit message:'
read commit
git commit -m "$commit"

REMOTES=(gh gl bb)

for remote in ${REMOTES[*]}; do
  git push $remote master
done

echo "push successful"
