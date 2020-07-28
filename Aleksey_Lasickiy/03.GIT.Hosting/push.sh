#!/bin/bash

#git push in all repositories script

gitremote=(github gitlab bitbucket)

for remote in ${gitremote[*]}; do

  git push $remote $1
done
