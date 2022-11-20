#!/bin/bash

echo -n "Enter text for commit: "
read commit

git add --all
git commit -m $commit

for push in $(git remote); do
	git push -u $push
done
