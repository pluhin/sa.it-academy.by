## 02.Git



## Homework Assignment 1: Initializing a Local Repository

```bash
mkdir 02.Git
d 02.Git/
git init
git status
touch README.md
git commit -m "Create new folder and file README"
git add --all
git commit --amend -a
it commit --amend
git log
git commit -m "Create new folder and file README"
git log
it commit --amend -a
```
## Homework Assignment 2: Basic Version Control

```bash
git branch 
git branch feature-branch
git branch 
git checkout feature-branch 
date >> README.md
git commit -m "Create new branch and editing file README"
git add --all
git commit -m "Create new branch and editing file README"
git checkout master 
git merge feature-branch
```
## Homework Assignment 3: Exploring Git History

```bash
git log
git log --oneline
git show ed6712c
```
## Homework Assignment 4: Creating and Applying Tags

```bash
 git tag -a V1.0 -m "Release 1.0"
git log
git tag
git show
date >> README.md
git commit -m "Second editing file README"
git add --all
git commit -m "Second editing file README"
git tag -a V2.0 -m "Release 1.1"
git tag
git log
```
## Homework Assignment 5: Undoing Changes

```bash
git checkout -b bug-fix
git branch 
date >> README.md
git reset 
```

## Homework Assignment 6: Stashing Changes

```bash
git checkout -b experimental-feature
date >> README.md
git stash 
git checkout master 
date >> README.md
git merge experimental-feature 
```

## Homework Assignment 7: Git Aliases and Configuration

```bash
git config --global init.defaultBranch master
git config --global  user.name "Dzmitry Skarabahatau"
git config --global  user.email "dimastyj12@gmail.com"
git config
'''