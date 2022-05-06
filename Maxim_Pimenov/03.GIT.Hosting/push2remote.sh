#!/bin/bash

#git remote add bitbucket git@bitbucket.org:mnpimenov/it-academy.git
#git remote add gitlab git@gitlab.com:mnpimenov/it-academy.git
#git remote add github git@github.com:mnpimenov/it-academy.git

for repo in bitbucket gitlab github
do
  git push $repo master
done;