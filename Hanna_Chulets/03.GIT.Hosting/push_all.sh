#!/bin/bash

echo "push to all repos, one by one"
for r in $(git remote); 
    do 
        echo "push to $r"
        git push -u $r main; 
done

if [ $? -eq 0 ]
then
    echo "push was finished successfully"
else
    echo "something went wrong, please check the error message"
fi
