#!/bin/bash
echo "Enter the SCN destination: "
read scn
echo "Enter repository name"
read repoName
git remote set-url origin git@${scn}:Eugene-Solovey/${repoName}.git
git add --all
echo "Enter commit"
read commit
git commit -m "$commit"
git status
for push in $(git remote); do
        git push -u $push --all
done

