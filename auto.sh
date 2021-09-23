#!/bin/bash
git remote add origin git@github.com:FIXPETROVICH/03.GIT.Hosting.git
git push -u origin --all
git remote rename origin old-origin
git remote add origin git@gitlab.com:fixpetrovich/devops.git
git push -u origin --all
git remote add origin git@bitbucket.org:FIXPETROVICH/03.git.hosting.git
git remote rename origin bb-origin
git push -u origin master
