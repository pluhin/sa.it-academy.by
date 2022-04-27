#!/bin/bash

# This script pushes to remote repositories automatically

for repository in $(git remote)
do
	git push $repository --all
done
echo "Done"
