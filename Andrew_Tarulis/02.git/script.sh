#!/bin/bash

	git init
### commit#1
	git add --all
	git commit -m "first commit in master"
### commit#2
	git log --graph --all > master.txt
	git add --all
	git status
	git commit -m "second commit in master"
### branch#a
	git checkout -b hotfix/we_gonna_die
### branch#b
	git checkout master
	git checkout -b dev
### commit#3
	git log --graph --all > dev.txt
	git add --all
	git status
	git commit -m "first commit in dev"
### commit#4
	git log --graph --all > dev.txt
	git add --all
	git status
	git commit -m "second commit in dev"
### branch#c
	git checkout -b features/do_one
### commit#5
	git log --graph --all > features.txt
	git add --all
	git status
	git commit -m "first commit in features/do_one"
### commit#6
        git checkout hotfix/we_gonna_die
	git log --graph --all > hotfix.txt
        git add --all;
        git status
        git commit -m "first commit in hotfix/we_gonna_die"

## RELEASE_PHASE

### merge#d
	git checkout master
	git merge --no-commit features/do_one
	git log --graph --all > master.txt
	git add --all
	git status
	git commit -m "merge features to master"

## HOTFIX_DEPLOY

### merge#e
	git checkout master
	git merge --no-commit hotfix/we_gonna_die
	git log --graph --all > branches.txt
	git add --all
	git status
	git commit -m "merge hotfix to master"
### rebase#f
	git rebase hotfix/we_gonna_die dev
### rebase#g
	git rebase hotfix/we_gonna_die features/do_one
