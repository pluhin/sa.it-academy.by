#!/bin/bash
remotes=($(git remote)) #Put remote repo into array

for i in ${!remotes[@]}; do
       echo "Push to ${remotes[$i]}"
       git push ${remotes[$i]}
       echo "-------------------------------" #delimiter
done  