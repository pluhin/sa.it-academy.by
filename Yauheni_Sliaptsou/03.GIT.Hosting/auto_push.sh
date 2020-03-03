#!/bin/bash

remotes=(github bitbucket gitlab)

for remote in ${remotes[*]}; do
  git push $remote m-sa2-12-20
done
