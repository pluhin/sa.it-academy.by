# 02.GIT.Local

## Homework Assignment 1: Initializing a Local Repository
```shell
mkdir 02.GIT.Local
cd 02.GIT.Local/
git init
echo "Homework 02.GIT.Local." >> README.md
git add README.md
git commit -m "Add README.md"
```

## Homework Assignment 2: Basic Version Control
```shell
git checkout -b feature-branch
echo "Working with a local repository" >> README.md
git add README.md
git commit -m "Add a project description"
git checkout master
git merge feature-branch
```

## Homework Assignment 3: Exploring Git History
``` shell
git log
git log --oneline
git log --graph
git log --stat
git log --pretty=format:"%h - %an, %ar : %s"
git show 93fd4
```

## Homework Assignment 4: Creating and Applying Tags
```shell
git tag -a v1.0 -m "Realease 1.0" 21116a3
git tag
echo "Completing task 4" >> README.md
git status
git add README.md
git commit -m "Add description about version 2.0"
git tag v2.0
git tag
git show v1.0
git show v2.0
```

## Homework Assignment 5: Undoing Changes
```shell
git checkout -b bug-fix
echo "Denis Fedosevic" >> README.md
git add  README.md
git commit -m "Add the name of the project author"
nano README.md
git commit -m "Fix: spelling error in author's name"
git reset --soft HEAD~1
git commit -m "Fix: spelling error in author's name"
git reset --mixed HEAD^
git add README.md
git commit -m "Fix: spelling error in author's name"
git reset --hard HEAD^
```

## Homework Assignment 6: Stashing Changes
```shell
git checkout -b experimental-feature
echo "COMPLETING TASK 6" >> README.md
git status
git stash
git stash list
git checkout master
git stash pop 
nano README.md #corrected CONFLICT (content)
git add README.md
git commit -m "Add description of 6 tasks and author's name"
```

## Homework Assignment 7: Git Aliases and Configuration
```shell
git config --global user.email "fedosgrodno@gmail.com"
git config --global user.name "Denis_Fedosevich"
git config --list
```