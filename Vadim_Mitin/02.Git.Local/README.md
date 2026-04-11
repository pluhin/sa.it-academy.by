# 02.Git.Local

```bash
git init
touch README.md
nano README.md
git add .
git commit -m "first commit"
git checkout -b feature-branch
nano README.md
git commit -a -m "Add description of project"
git checkout main
git merge feature-branch
git log
git show b9056ead7e2617c58781c2d7dec53fe165bce815
git log --pretty=oneline
git log
git log --pretty=oneline
git tag -a v1.0 b9056ead7e2617c58781c2d7dec53fe165bce815
git log --pretty=oneline
vim README.md
cat README.md
git commit -a -m "Homework Assignment 4"
git status
git tag v2.0
git log --pretty=oneline
git checkout -b bug-fix
vim README.md
git status
git commit -a -m "HW5. First iteration"
vim README.md
git commit -a -m "HW5. Second iteration"
git reset HEAD README.md
git log --pretty=oneline
git status
cat README.md
git cat-file -p HEAD
git reset --soft HEAD~
git status
cat README.md
git log
git commit -a -m "HW5. Second iteration"
git log --pretty=oneline
git reset --hard HEAD~
git log
git checkout -b experimental-feature
vim README.md
git stash push
git checkout -b experimental-feature-second
vim README.md
git stash apply
git add .
git stash apply
git status
vim README.md
git add README.md
git status
git commit -m "Resolve stash conflict"
git config --global user.name "Vadim Mitin"
git config --global user.email "mitin.vadim1999@gmail.com"
git config --local alias.co checkout
```