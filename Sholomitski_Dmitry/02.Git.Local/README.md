# Homework Assignment 1: Initializing a Local Repository
   ```bash

  mkdir git_local
  cd git_local/
  git init
  git config --global user.name "Sholomitski Dmitry"
  git config --global user.email "xaos613@gmail.com"
  touch README.md
  man touch > README.md
  git add .
  git status
  git commit -m "first commit"
   ```

# Homework Assignment 2: Basic Version Control
   ```bash
  git checkout -b feature-branch
  git branch
  date >> README.md
  cat README.md
  git add .
  git commit -m "feature commit"
  git checkout master
  git merge feature-branch
  cat README.md
```

# Homework Assignment 3: Exploring Git History
```bash
   git log
   git log -p
   git log --stat
   git log -pretty
   git log --pretty
   git log --oneline
   git log --short
   git log --pretty=short
   git log --pretty=shorter
   git log --pretty=fuller
   git log --pretty=format:"%h - %an, %ar : %s"
   git log --pretty=format:"%h - %an, %ar : %s" --graph
   git log --abbrev-commit
   git show 9ff3da4
   ```


## Homework Assignment 5: Undoing Changes
```bash
  
  git checkout -b bug-fix
  date >> README.md
  git add .
  git commit -m "bug-fix"
  date >> README.md
  git reset --hard
  cat README.md
  date >> README.md
  git reset --soft
  cat README.md
  git ls-files -s
  git status
  git reset --hard
  cat README.md

   ```


## Homework Assignment 6: Stashing Changes
```bash
   git checkout -b experimental-feature
   echo "some changes" >> README.md
   git stash
   git stash list
   git checkout bug-fix
   cat README.md
   echo "different set of changes" >> README.md
   git stash apply
   git add .
   git stash apply
   cat README.md
   nano README.md
   git add README.md
   git commit -m "different set of changes"
   ```



## Homework Assignment 7: Git Aliases and Configuration
```bash
   git config --global user.name "Sholomitski Dmitry"
   git config --global user.email "xaos613@gmail.com"
   git config --global alias.ci "commit -m"
   git config --list   
   ```
