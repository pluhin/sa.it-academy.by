#Homework Assignment 1: Initializing a Local Repository & Homework Assignment 7: Git Aliases and Configuration
1. git init ./02.GIT.Local/
2. git config --global init.defaultBranch master
3. git congig --global user.name "Andrei_Tsimakhovich"
4. git config --global user.name "Andrei_Tsimakhovich"
5. git config --global user.email "taa421992@gmail.com"
6. git congig --list
7. touch README.md
8. date >>README.md
9. git commit -m "Add README.md - Initializing a Local Repository"

#Homework Assignment 2: Basic Version Control
1. git switch -c feature-branch
2. git commit -m "Add a brief description of project - Basic Version Control"
3. git switch master
4. git merge feature-branch

#Homework Assignment 3: Exploring Git History
1. git log --oneline --grap --all
2. git log --pretty=format:"%h | %an | %s | %ar"
3. git show 6ea78e0

#Homework Assignment 4: Creating and Applying Tags
1. git tag v1.0
2. git show v1.0
3. git commit -m "Add changes to README.md for v2.0 tag testing"
4. git tag -a v2.0 -m "Release 2.0 - changes related to tag testing. Homework Assignment 4: Creating and Applying Tags "
5. git show v2.0

#Homework Assignment 5: Undoing Changes
1. git branch bug-fix
2. git checkout bug-fix
3. vim README.md
4. git add .
5. git commit -m "Add changes to bug-fix branch - 1"
6. vim README.md
7. git add README.md
8. git commit -m "Add another changes to bug-fix branch - 2"
9. git reset --soft ab289dd
10. git log --oneline
11. git reset --mixed ab289dd
12. git status
13. git reset --hard ab289dd
14. git status
15. cat ./README.md

#Homework Assignment 6: Stashing Changes
1. git switch -c experimental-feature
2. vim README.md
3. git stash
4. git switch feature-branch
5. git stash apply
6. cat ./README.md
7. vim README.md *resolving conflict*
8. git add README.md
9. git commit -m "Add changes from stash to feature-branch"
10. git log --oneline
11. git stash list
