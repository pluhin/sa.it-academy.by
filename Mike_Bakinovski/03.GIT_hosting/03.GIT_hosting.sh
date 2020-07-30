#!/bin/bash


#CLI should be set to 03.GIT_hosting folder.

git init
git config --global user.name "MikeBakinovski"
git config --global user.email "mike.bakinovski@gmail.com"

# Github remote repository

git remote add origin_github git@github.com:MikeBakinovski/03.GIT_hosting.git
git push -u origin_github master

# Gitlab remote repository

git remote add origin_gitlab git@gitlab.com:MikeBakinovski/03.GIT_hosting.git
git push -u origin_gitlab master

# Bitbucket remote repository

git remote add origin_bitbucket git@bitbucket.org:MikeBakinobski/03.git_hosting.git
git push -u origin_bitbucket master

git touch autopush.sh
git printf "#!/bin/bash

ssh-add
git remote show | while read line
do 
    echo "---------------------------------------------------------"
    git push $line master 
done
"


