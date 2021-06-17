
#!/bin/bash

# 03.Git.Hosting
# Auto git push to all remote repos

REPO="./"

git remote add github git@github.com:Magguro/it-academy.by.git 2> /dev/null 
git remote add gitlab git@gitlab.com:Magguro/it-academy.by.git 2> /dev/null
git remote add bitbucket git@bitbucket.org:magguro/it-academy.by.git 2> /dev/null

while true; do
  read -p "Do you want to push changes in current directory? (y/n)  " answ
  case $answ in 
    [Yy]* ) \
    if [ ! -d ${REPO}/.git ]
    then
      echo "${REPO} is not a valid git repo! Aborting..."
    exit 0
    else
      echo "${REPO} is a valid git repo! Proceeding..."
    fi
    git add --all
    echo "enter commit message :  "
    read comm_msg
    git commit -m "$comm_msg"
    git push --all github -f
    git push --all gitlab -f
    git push --all bitbucket -f; break;;
    [Nn]* ) exit 0;;
    * ) echo "Please answer Y or N.";;
  esac
done

