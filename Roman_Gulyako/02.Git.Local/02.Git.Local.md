## Homework Assignment 1: Initializing a Local Repository
```bash
mkdir -p Roman_Gulyako/02.Git.Local
cd Roman_Gulyako/02.Git.Local
git init
echo "Homework Assignment 1" > README.md
git add --all
git commit -m "Complete homework assignment 1"
```

## Homework Assignment 2: Basic Version Control
```bash
git checkout -b feature-branch
echo "Some description of my project" >> README.md
git add --all
git commit -m "Add description of project"
git checkout main
git merge feature-branch
```

## Homework Assignment 3: Exploring Git History
```bash
git log
git log --oneline
git log --pretty=full
git log --pretty=format:"%h - %an, %ar : %s"
git log --oneline -5
git log --author="Roman Gulyako"
git show 9e23c33
```

## Homework Assignment 4: Creating and Applying Tags
```bash
git log --oneline
git tag v1.0 c28e8b4
git tag
echo "New changes for new tag" >> README.md
git add --all
git commit -m "Add additional changes"
git tag -a v2.0 -m "Annotated tag"
```

## Homework Assignment 5: Undoing Changes
```bash
git checkout -b bug-fix
echo "Some changes to README.md" >> README.md
git add --all
git commit -m "Add change to README.md"
echo "Another change to README.md" >> README.md
git add --all
git commit -m "Add new change to README.md"
git reset --soft HEAD~1
git commit -m "Add new change to README.md"
git reset --mixed HEAD~1
git add --all
git commit -m "Add new change to README.md"
git reset --hard HEAD~1
```

## Homework Assignment 6: Stashing Changes
```bash
git checkout -b experimental-feature
echo "Experimental changes to README.md" >> README.md
git stash
git stash list
git checkout feature-branch
echo "different set of changes" >> README.md
git add --all
git commit -m "Add different set of changes"
git stash pop
git add --all
git commit -m "Get changes from stash and resolve conflict"
```

## Homework Assignment 7: Git Aliases and Configuration
```bash
git config --global user.name "Roman Gulyako"
git config --global user.email "romangulyako@gmail.com"
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.cam commit -am
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.cb checkout -b
git config --global alias.history 'log --pretty=format:"%C(yellow)%h%Creset %ad | %Cgreen%s%Creset %Cblue[%an]%Creset %C(red)%d%Creset" --date=short'
git config --global --list
```