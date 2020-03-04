#!/bin/bash

gitrepos=(orig_bit_braz orig_gitlab_braz orig_github_braz)

for remote in ${gitrepos[*]}; 
do
	git push $remote
done
