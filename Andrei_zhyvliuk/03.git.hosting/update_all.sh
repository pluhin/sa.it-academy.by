#!/bin/bash

git add --all
read commit
git commit -m "$commit"
git push --all gitbucket -f
git push --all gitlab -f
git push --all github -f
echo "All files and branches is update!"
