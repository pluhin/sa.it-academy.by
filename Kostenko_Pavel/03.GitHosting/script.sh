#!/bin/bash

repos=$(git remote)
for push in $repos  
do
git push -f $push --all	
done 
