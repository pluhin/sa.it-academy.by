#!/bin/bash

commit="$1"
git add .
git commit -m "$commit"
for repo in $(git remote)
do
    git push $repo --all
done