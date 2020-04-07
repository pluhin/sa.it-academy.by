#!/bin/bash

git add .

echo 'Enter the commit message:'
read commit
git commit -m "$commit"

REMOTES=(gh)

for remote in ${REMOTES[*]}; do
  git push $remote m-sa2-12-20
done

echo "push successful"
