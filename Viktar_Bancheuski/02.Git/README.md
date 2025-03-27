# 02.GIT

## Homework Assignment 1: Initializing a Local Repository
- mkdir edu_git
- cd edu_git
- git init
- echo "My fisrt project" > README.md
- git add README.md
- git commit -m "Добавлен README.md"
- git config --global user.email "banchevski@gmail.com"
- git config --global user.name "Viktar Bancheuski"
- git commit -m "Добавлен README.md"
- git status

## Homework Assignment 2: Basic Version Control
- git checkout -b feature-branch
- git branch
- code README.md
- git add README.md
- git commit -m "Добавлено описание проекта в README.md"
- git checkout master
- git merge feature-branch


## Homework Assignment 3: Exploring Git History
- git log
- git log --oneline
- git log --pretty=format:"%h | %ad | %s" --date=short
- git show <commit-hash>
- git log --oneline


## Homework Assignment 4: Creating and Applying Tags
- git log --oneline
- git tag v1.0 47feaca
- git tag
- git show v1.0
- git add README.md
- git commit -m "Добавлен раздел с планами"
- git tag -a v2.0 -m "Вторая версия проекта с планами"
- git tag -n
- git show v2.0


## Homework Assignment 5: Undoing Changes
- git checkout -b bug-fix
- git add README.md
- git commit -m "Добавлен раздел с известными проблемами"
- git add README.md
- git commit -m "Исправлена опечатка"
- git reset HEAD~1


## Homework Assignment 6: Stashing Changes
- git status
- git checkout -b experimental-feature
- git status
- git stash
- git status
- git checkout main
- git checkout head
- git checkout
- git status
- git branch
- git checkout master
- git add README.md
- git commit -m "Добавлен раздел о стабильной версии"
- git stash apply
- git add README.md
- git commit -m "Объединение изменений из stash"
- git stash list


### Homework Assignment 7: Git Aliases and Configuration
- git config --global alias.graph "log --oneline --graph --all"
- git graph
- git config --list