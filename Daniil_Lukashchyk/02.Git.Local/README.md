## Homework Assignment 1: Initializing a Local Repository
```bash
mkdir 02.Git.Local
ls -la
cd 02.Git.Local/
git init
touch README.md
date > README.md
git add --all 
git commit -m "add README.md"
```


## Homework Assignment 2: Basic Version Control
```bash
git checkout -b feature-branch
date > README.md 
git add --all 
git commit -m "commit feature-branch"
git log --oneline 
git checkout master 
git merge feature-branch
```


## Homework Assignment 3: Exploring Git History
```bash 
git log
git log --oneline
git log --graph 
git show 45d0a31
```


## Homework Assignment 4: Creating and Applying Tags
```bash
git checkout 45d0a31
git tag -a v1.0 -m "Version 1.0"
git log
date >> README.md 
git add --all 
git commit -m "Changed README.md"
git log --oneline 
git checkout a4919d4
git tag -a v2.0 -m "Version 2.0"
git log --oneline
```


## Homework Assignment 5: Undoing Changes
```bash
git checkout -b bug-fix
date >> README.md 
git add --all 
git commit -m "README.md changed1"
git branch
date >> README.md 
git add --all 
git commit -m "README.md changed2"
git log --oneline 
git reset 4994c98
git log --oneline 
cat README.md 
git reset --mixed 4994c98
cat README.md 
git log --oneline
```


## Homework Assignment 6: Stashing Changes
```bash 
git branch -b experemental-feature
git checkout  -b experemental-feature
git branch
date >> README.md 
git stash 
git checkout bug-fix 
git stash pop
cat README.md 
git add --all 
git log --oneline 
git commit -m "README.md changed stash pop"
git log --oneline 
cat README.md
```


## Homework Assignment 7: Git Aliases and Configuration
```bash
git config --global user.name "Daniil Lukashchyk"
git config --global user.email "lukasforwork@gmail.com"
git config --global alias.cm commit
git config --list
```

 
