#!/bin/bash
echo "Push has started"
for b in $(git branch);
do
	git checkout $b
	for a in $(git remote show);
	do
	if [ $a = update ]
	then
		echo "You don't have permissions to push your files in that repositiry"
	else                
		echo "Push has started in the $a. Branch $b"
		git push $a $b
		if [ $? -eq 0 ]
		then
			echo "Push to $a branch $b completed successfully"
		else
			echo "Push to $a branch $b faild. Error: $?"
		fi
	fi
        done
done


