#!/bin/bash

# 03.Git.Hosting
# Auto git push to all remote repos

REPO="./"

git remote add github git@github.com:Magguro/it-academy.by.git &> /dev/null 
git remote add gitlab git@gitlab.com:Magguro/it-academy.by.git &> /dev/null
git remote add bitbucket git@bitbucket.org:magguro/it-academy.by.git &> /dev/null

read -p "Do you want to push changes in current directory? (y/n)  " answ

if [[ "$answ" == "y" ]]
then
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
  git push --all bitbucket -f
elif [[ $answ == 'n' ]]
then
  exit 0
else
  echo "wrong answer"
fi

