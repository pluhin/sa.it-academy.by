#!/bin/bash

#Edit string: Test 7 

git add .

echo "Enter the commit message:"
read commitMessage

git commit -m "$commitMessage"

#https://gitlab.com/kristoit/test_sa
git push -u origin --all

#https://github.com/kristoit/test_sa
git push -u origin_github --all

#https://bitbucket.org/kristoit/test_sa/src/master/
git push -u origin_bitbucket --all
