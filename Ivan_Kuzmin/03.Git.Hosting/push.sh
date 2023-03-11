#! /bin/bash

git add --all
for push in $(git remote)
do
git push $push --all
done
echo "OK"
