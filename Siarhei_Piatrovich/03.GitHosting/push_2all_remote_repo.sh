#!/bin/bash

for remote_repo in $(git remote)
do
git push $remote_repo md-sa2-20-22
done
