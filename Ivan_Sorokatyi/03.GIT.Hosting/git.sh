#! /bin/bash

for push in $(git remote)
do
git push $push --all
done