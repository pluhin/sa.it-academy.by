## 02.Git.Local

## Homework Assignment 1: Initializing a Local Repository
```bash
    1  mkdir 02.Git
    2  cd 02.Git/
    3  git init
    4  ls -la
    5  git config --global init.defaultBranch master
    6  git add --global user.name "Andrew Bulakh"
    7  git config --global user.name "Andrew Bulakh"
    8  git config --global user.email "mouk228322@gmail.com"
    9  git add README.md
   10  git add README.md
   11  echo 'First homework on git' >> README.md
   12  git add README.md
   13  git config --global core.autocrlf false
   14  git add README.md
   15  git status
   16  git commit -m "Create readme.md"
   ```
 ## Homework Assignment 2: Basic Version Control
```bash
   17  git branch feature-branch
   18  git checkout feature-branch
   19  echo "Edit file contents on demand" >> README.md
   20  git status
   21  git add README.md
   22  git status
   23  git commit -m "feature-branch"
   24  git branch
   25  git checkout master
   26  git merge feature-branch
```
## Homework Assignment 3: Exploring Git History
   ```bash
   27  git log
   28  git log --oneline
   29  git show 184d1f1
```
## Homework Assignment 4: Creating and Applying Tags
```bash
   30  git tag -a v1.0 184d1f1d6fb9491659e7a8dfc6db0e6f67d1ef3e -m "Tag v1.0"
   31  git log --oneline
   32  echo "First tag added" >> README.md
   33  git add README.md
   34  git tag -a v2.0 -m "Tag v2.0"
   35  git log
```
## Homework Assignment 5: Undoing Changes
```bash
   36  git checkout -b bug-fix
   37  echo "Anothet file change" >> README.md
   38  git commit -m "bug-fix branch"
   39  echo "for the future reset" >> README.md
   40  git commit -m "for the future reset"
   41  git add README.md
   42  git commit -m "for the future reset"
   43  git log --oneline
   44  git reset --hard HEAD~1
   45  git log --oneline
```
## Homework Assignment 6: Stashing Changes
```bash   
   46  git checkout -b experimental-feature
   47  echo "uncommitted change" >> README.md
   48  git stash
   49  git stash list
   50  git checkout bug-fix
   51  git stash apply
   52  git add README.md
   53  git commit -m "Stash"
   54  git status
```
## Homework Assignment 7: Git Aliases and Configuration
```bash
   55  git config --global user.name "Andrew Bulakh"
   56  git config --global user.email "mouk228322@gmail.com"
   57  git config --global alias.st status
   58  git config
   59  git config --list
   60  history
```