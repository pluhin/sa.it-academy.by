```
mkdir repo1
cd repo1
git init
nano README.md
git add .
git status
git commit -m "Initial commit"
git config --global user.email "lisaevich.m@gmail.com"
git config --global user.name "MaxL"
git commit -m "Initial commit"
git checkout -b feature-branch
nano README.md
git commit -m "Task 2: Basic Version Control"
git add .
git commit -m "Task 2: Basic Version Control"
git checkout master
git merge feature-branch
git log
git log --oneline
git log --pretty=short
git log --pretty=full
git log 210508ebd2f20ea945f9c8c536e3df430fc921ba
git log 210508e
git tag -a 'v1.0' -m 'Version 1.0'210508ebd2f20ea945f9c8c536e3df430fc921ba
git tag -l
git log
nano README.md
git commit -a -m "Task 4"
git log
git tag -a 'v2.0' -m 'Version 2.0' 34574609d0ea01de8ae5dbd3d2b05f597fdfeab0
git log
git checkout -b bug-fix
nano README.md
git commit -a -m "Task 5"
nano README.md
git commit -a -m "Task 5.2"
git reset HEAD~1
git status
git log
git commit -a -m "Task 5.2"
git log --oneline
git reset --hard HEAD~1
git status
git log
git checkout -b experimental-feature
nano README.md
git stash
git checkout -b "another-brach"
nano README.md
git commit -a -m "Task 6 - another changes"
git stash apply
git log
nano README.md
git add .
git status
git commit -a -m "Task 6.3 - apply stashed"
nano ~/.gitconfig
git st
git config list
```
