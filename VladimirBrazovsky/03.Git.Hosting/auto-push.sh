#!/bin/bash

gitrepos=(orig_bit_braz orig_gitlab_braz orig_github_braz)

for remotegit in ${gitrepos[*]}; do
	git push $remotegit
done
