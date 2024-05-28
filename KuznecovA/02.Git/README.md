# Home task 02. Basic operation with Git.
Training in basic commands for working with Git.

## Task 1. Initializing a Local Repository.

md 02.Git
cd 02.Git
git config --local user.name "Aleksandr Kuznecov"
git config --local user.email "AlexKWGit@gmail.com"
git init
echo Home task: 02.Git.local> README.md
git add README.md
git commit -m "Add first file in main branch"

## Task 2. Basic Version Control.

git branch feature-branch
git checkout feature-branch
edit in editor "far": README.md
  // Add title symbol in first str.
  // Add str: Training in basic commands for working with Git.
git commit -am "Add in staged and commit with one command."
git checkout master
git merge feature-branch

????????? Question:
????????? Should I delete the "feature-branch" branch?
????????? If you need to delete, then there is a command:
?????????   git branch -d

## Task 3. Exploring Git History.

git log
git checkout feature-branch
git log
git checkout master
git log --oneline
git log -p
git log -1
git log -2
git log -p --oneline -2 ad8e63b
git show
git show ad8e63b38367f6501ae94964bdf454dcf8b5009d
git show ad8e63b
git show ad8e63b --oneline
// :) git log -p == git show

echo *.log>.gitignore
git add --all
git commit -m "Add file gitignore"
git status

edit: .gitignore
git commit -am "Add a new commit because there is not enough history for the test"

## Task 4. Creating and Applying Tags.

git log --oneline
git checkout ad8e63b
git log --oneline
git tag -a R1.0 -m "Release 1.0"
git checkout master
git tag -a R1.1 -m "Release 1.1"
git log --oneline
edit: README.md
git add --all
git commit -m "Changed for tag and release.
git tag -a R2.0 -m "Release 2.0"
git tag
git tag -l "R1*"
git tag  "R1*"
git checkout r1.1
git tag r1l
git tag
git checkout master
git log --oneline
git show r1l
git log --pretty=oneline
git tag TestTeg-1 10ec605
git tag -d r1l

## Task 5. Undoing Changes.

git branch
git checkout -b bug-fix
edit: README.md
git branch
git commit -m "Test commit."
git commit -am "Test commit."
git log --oneline
edit: README.md
git commit -am "Test 2 commit."
git reset --hard
git commit -am "Reset - Test 2 commit."
git reset --hard 063198e
git log --oneline
git reset --soft
edit: README.md
git commit -am "Recommit with changes after soft restore"
git status
git log --oneline
git reset --sort 063198e
git reset --soft 9089e00
git status
git add --all
git status
git commit -m "Recommit all changes"

## Task 6. Stashing Changes.

git checkout master
git checkout -b experimental-feature
edit: README.md
git add --all
git stash push
git status
git stash list
git checkout bug-fix
git stash apply

git add --all
git commit -m "Commit changes that were received from stash."
git log --oneline
git reset e853b5a --hard
git log --oneline

git stash apply
edit: README.md // modify conflict
git add --all
git status
git commit -m "Commit changes that were received from stash."
git stash list
git stash drop

## Task 7. Git Aliases and Configuration.

git config --global user.name "Alexandr Kuznetsov"
git config --global user.email "AlexKWGit@gmail.com"

git config --global alias.lo 'log --oneline'
git lo
git config --global alias.co checkout
git config --global alias.br branch

git config --list