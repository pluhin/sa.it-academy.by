#!/bin/bash

#git remote add github git@github.com:hladki/my_repos.git
#git remote add gitlab git@gitlab.com:hladki1990/my_repos.git
#git remote add bitbucket git@bitbucket.org:ilya_hladki/my_repos.git

for line in github gitlab bitbucket
do
	git push $line --all
done

