#!/bin/bash

echo "Pushing to all repository"

cd ~/git;

git  push  origin --all;

git  push bitbucket --all;

git  push gitlab --all;
 
echo "Pusshing to all complete"

