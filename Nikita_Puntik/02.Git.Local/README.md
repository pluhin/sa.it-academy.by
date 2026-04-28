cd git-practice-homework/
git init
echo "DevOps Project" > README.md
git add README.md
git commit -m "Commit ADD Readme.md"
git status
git log --oneline
git branch feature-branch
git checkout feature-branch
echo "Second Commit" >> README.md
git add --all
git commit -m "Add Date Readme.md"
git log --oneline
git checkout master
cat README.md
git merge feature-branch
cat README.md
git branch -d feature-branch
cat README.md
git log
git log --oneline
git log --oneline --graph --all
git log --patch
git log --oneline
git show 427c1db
git show HEAD
git log --oneline
git show 427c1db
git tag v1.0
git log --oneline
git tag
git show v1.0
echo "Commit 3" >> README.md
date >> README.md
git add README.md
git commit -m "3 Commit tag"
git tag -a v2.0 -m "Version2.0"
git show v1.0
git show v2.0
git checkout -b bugFix
echo "BugFix">> README.md
git add README.md
git commit -m "1 Fix Bug"
echo "BugFix 2 ">> README.md
git add README.md
git commit -m "2 Fix Bug"
git log --oneline
cat README.md
git reset --soft HEAD~1
git status
git log --oneline
git reset HEAD~1
git log --oneline
cat README.md
echo "Test" > test.txt
git add test.txt
git commit -m "Test Commit"
git log --oneline
git reset --hard HEAD~1
git status
ls
git log --oneline
cat README.md
git checkout master
git checkout -b experiment
echo "Experiment" >> README.md
git stash
git status
cat README.md
git log --oneline
git checkout master
echo "Critical" >> README.md
git add --all
git commit -m "Critical changes"
git checkout experiment
git stash pop
git status
cat README.md
git stash list
cat README.md
git checkout master
git add --all
git commit -m "Test"
git log --oneline
git checkout master
git branch
git config --global user.name "Nikita Puntik"
git config --global user.email "nikita.puntik1@gmail.com"
git config --global alias.l "log --oneline"
git l
