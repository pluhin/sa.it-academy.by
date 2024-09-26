#!/bin/bash


for my_repo in `git remote`
    do
	git push -u $my_repo
    done
