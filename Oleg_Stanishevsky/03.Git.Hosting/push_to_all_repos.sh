#!/bin/bash

origins=$(git remote)
for list in $origins
do
git push -f $list --all
done




