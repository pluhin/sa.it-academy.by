#!/bin/bash

remotes=(github bitbucket gitlab)

for remote in ${remotes[*]}; do
  git push $remote master
done
