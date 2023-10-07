#!/bin/bash

#
repos=($(git remote))

if [[ $(git status -s) ]]; then
	echo "You must save changes before pushing to repo"
	exit 
fi

for remote_repo in "${repos[@]}"; do
	echo "Receiving changes to $remote_repo..."
	git push -u "$remote_repo" --all
	echo "It's done for  $remote_repo."
done

echo "Done"
