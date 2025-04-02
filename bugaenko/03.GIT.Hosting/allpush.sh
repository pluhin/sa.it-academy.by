#!/bin/bash

gitlist=($(git remote))
for i in "${gitlist[@]}";
do
git push -u "$i" --all;
done

