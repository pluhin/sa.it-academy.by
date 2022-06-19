#!/bin/bash
echo "Push all remotes"
echo "- push to github -> master"
git push hub-origin master
echo "- push to gitlab -> master"
git push lab-origin master
echo "- push to bitbucket -> master"
git push bucket-origin master
echo "Done"
