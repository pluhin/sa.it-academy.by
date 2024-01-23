# 02. GIT. Local
## Homework Assignment 1: Initializing a Local Repository
```Git 
cd /d/it_academia/
mkdir myRepository
cd /d/it_academia/myRepository/
git init
touch README.md
vim README.md
git add README.md
git commit -m "Intial commit (HA1)"
```
## Homework Assignment 2: Basic Version Control
```Git
git branch feature-branch
git checkout feature-branch
vim README.md
git add README.md
git commit
git switch master
git merge feature-branch
```
## Homework Assignment 3: Exploring Git History
```Git
git log
git log --stat
git log --graph
git log --oneline
git log --pretty=format:"%h <- %P, %cd : %s "
git log --pretty=oneline --graph
git show f3dc227
```
## Homework Assignment 4: Creating and Applying Tags
```Git
git log --oneline
git tag v1.0 f3dc227
git tag
git show v1.0
vim README.md
git add README.md
git commit -m "Second commit (HA4)"
git tag v2.0
git tag
git show v2.0
```
Tag objects (created with -a, -s, or -u) are called **"annotated"** tags; they contain a creation date, the tagger name and e-mail, a tagging message, and an optional GnuPG signature. Whereas a **"lightweight"** tag (command without options -a -s -m) is simply a name for an object . Annotated tags are meant for release while lightweight tags are meant for private or temporary object labels.

## Homework Assignment 5: Undoing Changes
```Git
git checkout -b bug-fix
vim README.md
git commit -a -m "Third commit to bug-fix branch"
vim README.md
git commit -a -m "commit for reset command in bug-fix branch"
git log --oneline
git reset --soft c1691d9
git log --oneline
!!!!!!!!!Explore the effects of git reset with different options (soft, mixed, hard
```

Git reset is a command that reverses making changes to the working directory, adding them to the index and saving them to the repository, depending on the selected options. It is difficult to describe the execution of a command, so we will look it at an example. We have a branch **A-B-C(HEAD in C)**
When executing the git reset **--soft** B command, HEAD will point to B and the changes from commit C will be in the index (staging area)
When executing the git reset **--mixed** B or git reset command, HEAD will again point to B, but this time the changes from C will not be in the index.
When executing the git reset **--hard** B command, HEAD will move to B and clear the index, but unlike --mixed hard reset, change the files in your working directory (it will change as in commit B).
The difference in options is shown in which area the files will fall into after the last commit.

## Homework Assignment 6: Stashing Changes
```Git
git checkout -b experimental-feature
vim README.md
git status
git stash
git branch
git checkout bug-fix
vim README.md
git stash list
git stash apply stash@{0}
```
## Homework Assignment 7: Git Aliases and Configuration
```Git
git config --list
git config --global user.name "NataliaMyslivets"
git config --global user.email "belogolovayanv@gmail.com"
git config --list
git config --global alias.addall 'git add --all'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.logs 'git log --pretty=oneline --graph'
git config --list
```