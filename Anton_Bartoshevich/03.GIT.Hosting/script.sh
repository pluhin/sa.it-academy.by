#!/bin/bash
git add .
echo "Please enter the name of commit:"
read commit
git commit -m "$commit"

for push_to in $(git remote); do
	git push --all $push_to
done
