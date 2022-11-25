#!/bin/bash
rem_repo=$(git remote)
for item in $rem_repo
do
git push $push --all
done 

