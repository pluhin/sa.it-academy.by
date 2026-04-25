```bash
 mkdir 02.Git.Local
 cd 02.Git.Local/
 git init 
 nano README.md
 git add --all
 git commit -m "Homework Assignment 1"
 git checkout -b feature-branch
 nano README.md 
 git add README.md 
 git commit -m "Homework Assignment 2"
 git checkout master 
 git merge feature-branch 
 git log
 git log --oneline 
 git log --oneline --graph --all
 git show 650c39f
 git tag v1.0 650c39f
 git log --oneline 
 git tag
 nano README.md 
 git add --all
 git commit -m "Some changes in README"
 git tag -a v2.0 -m "Version 2.0"
 git log --oneline 
 git tag
 git log
 git checkout -b bug-fix
 nano README.md 
 git add --all
 git commit -m "Undoing Changes 1"
 nano README.md 
 git add --all
 git commit -m "Undoing Changes 2"
 git status
 git log --oneline 
 git reset --soft HEAD~1
 git log --oneline 
 git status
 git commit -m "Undoing Changes 2"
 git reset --mixed  HEAD~1
 git log --oneline 
 git status
 git add --all
 git commit -m "Undoing Changes 2"
 git reset --hard  HEAD~1
 git status
 git log --oneline 
 git checkout master 
 git checkout -b experimental-feature
 echo "Experimental line" >> README.md
 git stash 
 git checkout master 
 echo "Experimental line 2" >> README.md
 git add --all
 git commit -m "Stashing Changes"
 git log --oneline 
 git status 
 git stash apply 
 nano README.md 
 git status 
 git add --all
 git status 
 git commit -m "Fix conflict"
 git config --global user.name "Alexandr Zakharevich"
 git config --global user.email  "a.zakharevich7@gmail.com"
 git config --global alias.lg "log --oneline --graph"
 git lg
 git config --global --list
 history
```
