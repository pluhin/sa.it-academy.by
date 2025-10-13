#!/bin/bash
remotes=($(git remote))
echo "found remotes: ${remotes[@]}"

for remote in ${remotes[@]}; do
	echo "pushing to $remote..."
	git push $remote 
done


