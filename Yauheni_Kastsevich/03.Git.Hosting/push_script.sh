#!/bin/bash

# repositories variable
remote_repositories=("git@github.com:YauheniKastsevich/GitHub-repository-03HW.git" "git@gitlab.com:YauheniKastsevich/gitlab-repository-03hw.git")

for remote in "${remote_repositories[@]}"
do
	git push "$remote"      # push changes to each remote repository
done
