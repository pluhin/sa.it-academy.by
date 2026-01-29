# 02. GIT. Local

## Homework Assignment 1: Initializing a Local Repository

```bash
mkdir sa.it-academy.by
cd sa.it-academy.by
git init
touch README.md
vim README.md
cat README.md
git add .
git commit -m "Init commit"
```

## Homework Assignment 2: Basic Version Control

```bash
git checkout -b feature-branch
vim README.md
cat README.md
git commit -m "Change README.md"
git add .
git commit -m "Change README.md"
git checkout main
git branch
git merge feature-branch
cat README.md
```

## Homework Assignment 3: Exploring Git History

```bash
git log
git log --oneline
git log --graph --all
git log --graph --pretty=format:'%C(yellow)%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'
git show -s b28194f
```

## Homework Assignment 4: Creating and Applying Tags

```bash
git tag v1.0 b28194f
git show v1.0
git log 
git checkout -b feature-branch2
vim README.md
git add .
git commit -m "Add new feature"
git checkout main
git merge feature-branch2
git log
git tag -a v2.0 b755c7a -m "Relise version 2.0"
git log --oneline
```

## Homework Assignment 5: Undoing Changes

```bash
git checkout -b bug-fix
vim README.md
git add .
git commit -m "Add another feature"
git log
git reset --soft HEAD~1
git log
```

## Homework Assignment 6: Stashing Changes

```bash
git checkout main
git checkout -b experimental-feature
vim README.md
git stash save "Add experimental feature"
git branch
git checkout feature-branch2
echo "Different changes on another branch" >> README.md
git add .
git commit -m "Add different changes"
git stash pop
vim README.md
git add .
git commit -m "Fix README.md conflict"
git log
```

## Homework Assignment 7: Git Aliases and Configuration

```bash
git config --global user.name "Aliaksandr Fiodarau"
git config --global user.email "fedorov.alexandr25@gmail.com"
git config --global alias.lg "log --graph --pretty=format:'%C(yellow)%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
git lg
git config --list --show-origin
```
