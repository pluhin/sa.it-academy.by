#!/bin/bash

for repo in $(git remote); do
  git push -u $repo --all
done
