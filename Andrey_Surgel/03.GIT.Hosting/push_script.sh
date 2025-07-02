#!/usr/bin/bash


remotes=($(git remote))

#echo ${remotes[0]}
#echo ${remotes[1]}

for remote in "${remotes[@]}"
do
	echo $(git push -u $remote --all)
done
