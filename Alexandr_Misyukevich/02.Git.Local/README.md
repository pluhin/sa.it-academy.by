# Homework 02.Git.Local
## Homework Assignment 1: Initializing a Local Repository
```shell
mkdir 02.Git
cd 02.Git/
git init
touch README.md
nano README.md 
git status
git add README.md 
git commit -m "Add README"
```
## Homework Assignment 2: Basic Version Control
```shell
git checkout -b feature-branch
git branch 
git log
nano README.md 
git status 
git add .
git commit -m "Changed README"
git log
git log --oneline 
git checkout master 
git merge feature-branch 
```
## Homework Assignment 3: Exploring Git History
```shell   
git log
git log --oneline 
git log -p
git log --oneline --graph
git log --graph
git show cb61a47
```
## Homework Assignment 4: Creating and Applying Tags
```shell
git tag v1.0 cb61a47
git tag
date >> README.md 
git add README.md 
git commit 
git commit -m "Add date in README"
git log
git tag -a v2.0 -m "Release 2.0"
git tag
git show v1.0 
git show v2.0 
```
## Homework Assignment 5: Undoing Changes
```shell
git checkout -b bug-fix
nano README.md 
git add .
git commit -m "Add Test README"
git reset HEAD~1
git status 
git log
cat README.md 
git add .
git commit -m "Add Test README"
git log
git status 
cat README.md 
nano README.md 
git add .
git commit -m "Add Test README"
git reset --mixed HEAD~1
cat README.md 
git add .
git commit -m "Add Test README"
git reset --soft HEAD~1
git status 
git commit -m "Add Test README"
git reset --soft HEAD~1
```
## Homework Assignment 6: Stashing Changes
```shell
git checkout -b experimental-feature
date >> README.md 
git stash
git checkout master 
nano README.md 
git stash list
git branch
git add .
git commit -m "Add Test 2 README"
git stash pop
nano README.md 
git status
git add README.md 
git commit -m "Add Test 2 README"
```
## Homework Assignment 7: Git Aliases and Configuration
```shell 
git config --global user.name "Alexandr_Misyukevich"
git config --global user.email "misyukevich91@gmail.com"
git config --list
```
