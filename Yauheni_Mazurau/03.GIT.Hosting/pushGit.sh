#!bin/bash

cd /home/ym/03.Git/repo
# Get an array of remote repositories from .git/config
remote_names=(`git remote`)
# Iterate through each remote repository from the array and execute git push
for remote_name in "${remote_names[@]}"
do
  echo "A push to a remote repository is being performed": ${remote_name}"
  git push -u "${remote_name}" --all
done
