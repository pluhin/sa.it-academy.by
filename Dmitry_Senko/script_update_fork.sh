#!/bin/bash

# Once add one more remote repository:
#	git remote add upstream https://github.com/pluhin/sa.it-academy.by.git 
# Add this file to your work directory like [Dmitry_Senko]
# Change permissions to file:
# 	chmod 777 script_update_fork.sh 
# Execute script:
# 	./script_update_fork.sh 

# Also you can add new local branches from remote branch:
#	git branch BRANCH_NAME upstream/BRANCH_NAME


cd ..
LOCAL_BRANCHES=( $( git branch | awk '{print $NF}' ) ) # Get all local branches and parse output with # awk '{print $NF}' - last element in line
git fetch upstream
for branch in "${LOCAL_BRANCHES[@]}"
do
	git checkout $branch
	git rebase upstream/$branch
	printf "\n"
done

git push origin -f --all # push local to my remote forked repository

printf "\nSwitching to our working branch\n"
git checkout m-sa2-13-20 # switching to our working branch
