# 02.Git


```bash
mkdir 02.Git
cd 02.Git/
git init
nano README.md
git status
git add .
git commit -m "Init commit"
git branch feature-branch
git checkout feature-branch 
git branch
nano README.md 
git status 
git add *
git status 
git commit -m "some changes"
git checkout master
git status 
git merge feature-branch 
git log
git log --oneline --graph --all
git show 5d48fd4ac854596009fb73816b83bd21b97e3935
git tag -a "v1.0"
git tag
git show v1.0 
nano README.md 
git add .
git commit -m "new commit"
git tag -a "v2.0" -m "new tag"
git show v2.0
git branch bug-fix
git checkout bug-fix 
git branch 
nano README.md 
git add .
git commit -m "bug-fix commit"
nano README.md 
git add .
git commit -m "bug-fix commit"
git log
git reset HEAD~1
git log
nano README.md 
git add .
git commit -m "new bug-fix"
git reset HEAD~1 --hard
git log
git branch experimental-feature
git checkout experimental-feature 
nano README.md 
git stash
git checkout master 
nano README.md 
git add .
git commit -m "one more text"
git stash pop
cat README.md 
git add
git add .
git commit -m "resolving conflict"
git stash list 
git stash drop stash@{0}
git config --global user.name "Aleksei Zaitsev"
git config --global user.email "ztsv.aleksei@gmail.com"
git config --local alias.st status
```