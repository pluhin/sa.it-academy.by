#!/bin/bash

for remote in $(git remote); do
  echo "Pushing to $remote..."
  git push $remote master
done