#!/bin/bash
echo -n "Push to all repo enter commit:"
read commit

git add --all
git commit -m $commit

for push in $(git remote); do
        git push -u $push
done
