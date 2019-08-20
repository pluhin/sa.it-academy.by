#!/bin/bash
echo "Automate push you commit into Github,Gitlab,Bitbucket"
# read -p "Enter comment for commit: " comment
# git commit -m $comment

function error_exit {
  echo "$1" 1>&2
  exit 1
}

# Using error_exit

git remote add github_rep git@github.com:Den4ik27/03.test.rep.git
git remote add bitbucket_rep git@bitbucket.org:den4ik27/03.bitbucket.git
git remote add gitlab_rep git@gitlab.com:den4ik27/03.gtlab.git


for var in github_rep bitbucket_rep gitlab_rep
do 
 if git push ${var}; then
    echo "Push to "${var} "done!"
    else
   error_exit "Error! Aborting."
  exit 1
 fi   
done
