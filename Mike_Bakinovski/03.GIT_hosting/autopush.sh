#!/bin/bash

ssh-add
git remote show | while read line
do 
    echo "---------------------------------------------------------"
    git push $line master 
done
