#!/bin/bash
git add --all
git commit -m "$1"
for repository in $(git remote)
do
	git push $repository --all
done

