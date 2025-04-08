#!/bin/bash

all_local_repo=( "/path/to/the_first_git_repo" "/path/to/the_second_git_repo" )

for local_repo in ${all_local_repo[*]}
do
	if [ -d $local_repo/.git ]
	then
		echo $local_repo good
		cd $local_repo
		git add .
		git commit -m "Auto commit for new changes"
		
		for remote in $(git remote)
		do
			git push $remote --all
		done
	else
		echo $local_repo - is not a git repository
	fi
done
