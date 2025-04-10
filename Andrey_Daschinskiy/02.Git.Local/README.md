### 02. GIT. Local
#### Homework Assignment 1: Initializing a Local Repository
```bash
mkdir my-git-project
cd my-git-project
git init
echo "# My Project" > README.md
git add README.md
git commit -m "add README.md"
```
#### Homework Assignment 2: Basic Version Control
```bash
git branch feature-branch
git checkout feature-branch
echo "Project description" >> README.md
git add README.md
git commit -m "add a project description"
git checkout main
git merge feature-branch
```
#### Homework Assignment 3: Exploring Git History
```bash
git log
git log --oneline
git log --graph --oneline --all
git show <commit hash>
```
#### Homework Assignment 4: Creating and Applying Tags
```bash
git tag v1.0
git tag -a v2.0 -m "Version 2.0"
git tag
git show v2.0
```
#### Homework Assignment 5: Undoing Changes
```bash
git checkout -b bug-fix
echo "Bug fix" >> README.md
git add README.md
git commit -m "Bug fix №1"
echo "More fixes" >> README.md
git add README.md
git commit -m "Bug fix №2"
git reset --soft HEAD~1
git reset --hard HEAD~1
```
#### Homework Assignment 6: Stashing Changes
```bash
git checkout -b experimental-feature
echo "Experimental feature" >> README.md
git stash
git checkout main
git stash pop
```
#### Homework Assignment 7: Git Aliases and Configuration
```bash
git config --global user.name "Andrew"
git config --global user.email "my_personal_email@domain.com"
git config --global alias.lg "log --oneline --graph --decorate --all"
git config --list
```
