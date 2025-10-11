#!/bin/bash

BRANCH="${1:-$(git branch --show-current)}"
GIT_ARGS="${@:2}"

echo "Pushing branch '$BRANCH' to all remote repositories..."

REMOTES=$(git remote)

if [ -z "$REMOTES" ]; then
	echo "Error: remote repositories not found"
	exit 1
fi

echo "Found remote repositories: $REMOTES"

for REMOTE in $REMOTES; do
	echo "Pushing to $REMOTE..."
	git push $GIT_ARGS $REMOTE $BRANCH
	echo "Successfully sent to $REMOTE"
	echo
done

echo "All changes have been successfully pushed to all remote repositories!"
