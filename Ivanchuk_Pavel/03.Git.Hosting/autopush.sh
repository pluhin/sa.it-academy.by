#!/bin/bash

#List of remote repositories
remote_repositories=("github-origin" "gitlab-origin")

#Checking the status and availability of changes in the repository
if [[ $(git status -s) ]]; then
	echo "You have unsaved changes in your brunch. Please, save them before send"
	exit 
fi

#Pushing changes from the current local repository to all remote repositories
for remote_repo in "${remote_repositories[@]}"; do
	echo "Sending changes in $remote_repo..."
	git push -u "$remote_repo" --all
	echo "Changes send in $remote_repo."
done


echo "Done"

