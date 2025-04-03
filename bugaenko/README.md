
# 02.GIT.local
## 1   Initializing a Local Repository
```
149  cd /home/ss/git/02.git/
  150  ls
  151  cler
  152  clear
  153  git init
  154  nano README.md
  155  ls
  156  git status 
  157  git add --all
  158  git commit -m "empty"
  159  git status
  160  git commit
  161  git status
```
## 2  Basic Version Control
``` 
 162  git branch feature-branch
  163  git branch
  164  nano README.md
  165  git status
  166  git add README.md
  167  git status
  168  git commit
  169  git switch feature-branch
  170  cat README.md
  171  git pull all
  172  git pull --all
  173  git switch master
  174  cat README.md
  175  git switch feature-branch
  176  git merge master
  177  cat README.md
  178  nano README.md
  179  git add README.md
  180  git commit -m "2records"
  181  git switch master
  182  cat README.md
  183  git merg
  184  git status
  185  git switch
  186  git branch
  187  git merge feature-branch
  188  cat README.md
```
## 3  Exploring Git History
```
  189  git log
  190  git log --oneline
  191  git log --merges
  192  git log --name-only
  193  git show
  194  git log --oneline
  195  git status
```
## 4  Creating and Applying Tags
```
  196  git tag v1.0 6ebd7d4
  197  git status
  198  git status tag
  199  git tag
  200  git show v1.0
  201  nano README.md
  202  git add README.md
  203  git commit -m "some ch"
  204  git tag v2.0 97f8a07
  205  git tag
  206  git show
  207  git tag -n
  ```
## 5 Undoing Changes
```
 208  git branch bug-fix
  209  nano README.md
  210  git switch bug-fix
  211  nano README.md
  212  git add README.md
  213  git commit -m "bf"
  214  nano README.md
  215  git commit -m "fix"
  216  git commit -a -m "fix"
  217  git reset
  218  git status
  219  nano README.md
  220  git status
  221  git log --oneline
  222  git reset --soft 33df824
  223  git status
  224  cat README.md
  225  git reset --mixed 33df824
  226  cat README.md
  227  git status
  228  cat README.md
  229  git reset --hard 33df824
  230  cat README.md
  ```
## 6  Stashing Changes
``` 
 231  git branch experimental-feature
  232  git switch experimental-feature
  233  nano README.md
  234  git stash
  235  cat README.md
  236  git stash list
  237  git switch master
  238  cat README.md
  239  git stash apply
  240  cat README.md
  241  nano README.md
  242  git stash apply
  ```
## 7  Git Aliases and Configuration
 ```
 243  git config --global user.name "Bugaenko"
  244  git config --global user.email "pokermmail@gmail.com"
  245  git config --global alias.lol "log --oneline"
  246  history
```
