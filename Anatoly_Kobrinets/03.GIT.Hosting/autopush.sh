#!/bin/bash

echo -n "Fill in the text for commit: "
read commit

git pull
git add --all
git commit -m $commit

for push in $(git remote); do
        git push -u $push
done
