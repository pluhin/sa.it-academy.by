#!/bin/bash

git add .

echo 'Enter the commit message:'
read cm
git commit -m "$cm"

REMOTES=(gh gl bb)

for remote in ${REMOTES[*]}; do
  git push $remote master
done

echo "push successful"
