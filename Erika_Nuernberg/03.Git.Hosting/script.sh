#!/usr/bin/env bash

GitHubURL=git@github.com:erikanuernberg/sa.it-academy.by.git
git remote add ghorigin $GitHubURL

GitLabURL=git@gitlab.com:erika.nuernberg/demo.git
git remote add glorigin $GitLabURL

BitbucketURL=git@bitbucket.org:erikanuernberg1/demo.git
git remote add bborigin $BitbucketURL


git  add .

DATE=$(date)

git commit -m "changes made on $DATE"

git push --all ghorigin
git push --all glorigin
git push --all bborigin
