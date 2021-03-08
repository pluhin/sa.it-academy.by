# Log

```bash
10188  mkdir git_test
10189  cd git_test
10190  ls -la
10191  git init
10192  ls -la
10193  ls -l .git
10194  cat .git/config
10195  clear
10196  git config user.name "Siarhei Pishchyk"
10197  git config user.email "pluhin@gmail.com"
10198  cat .git/config
10199  git config --list
10200  ls
10201  date > first.txt
10202  ls 
10203  cat first.txt
10204  git status
10205  touch .env
10206  git status
10207  vim .gitignore
10208  git status
10209  cat .gitignore
10210  git add --all
10211  git status
10212  git commit -m "Initial Commit"
10213  git log --oneline
10214  date >> first.txt
10215  cat first.txt
10216  git status
10217  git commit --amend -a
10218  git status
10219  git log --oneline
10220  git branch -a
10221  git checkout -b "second"
10222  git branch -a
10223  ls -l
10224  cat first.txt
10225  git log --oneline
10226  date > second.txt
10227  ls -l
10228  git add --all
10229  git commit -m "Commit to second"
10230  git log --oneline
10231  git checkout master 
10232  ls -l
10233  git checkout second
10234  git checkout master 
10235  git merge second
10236  git log --oneline
10237  git checkout master
10238  git checkout second
10239  git log --oneline
10240  vim second.txt
10241  git add --all
10242  vim ~/.bas
10243  vim ~/.bashrc
10244  git add --all
10245  git commit -m "Commit for rebase"
10246  git reset --hard HEAD~1
10247  git log --oneline
10248  git checkout master
10249  vim second.txt
10250  git add --all
10251  git commit -m "Commit for rebase"
10252  git log --oneline
10253  git checkout second
10254  git log --oneline
10255  git rebase master
10256  git log --oneline
10257  git checkout master
10258  vim first.txt
10259  git add --all
10260  git commit -m "Confict in first"
10261  git checkout second
10262  vim first.txt
10263  git add --all
10264  git commit -m "Confict in second"
10265  git rebase -i master
10266  vim first.txt
10267  git add --all
10268  git rebase --continue
10269  git rebase HEAD~2
10270  vim first.txt
10271  git add --all
10272  git commit -m "Confict in second 2"
10273  git rebase HEAD~2
10274  git rebase HEAD~2 -i
10275  git log --oneline
10276  git checkout 8b1db2b
10277  ls -l
10278  git checkout second
10279  git checkout 8b1db2b
10280  git tag -a R1.0 -m "R1 first"
10281  git checkout second
10282  git checkout master
10283  git tag -a R2.0 -m "R2 first"
10284  git show 
10285  git show R1.0
10286  git show R2.0
10287  git checkout R1.0
10288* git pull
10289* git checkout md-sa2-16-21
10290* git status
10291* rm -rf demo
10292* ls
10293* mkdir -p demo/02.GIT
10294* cd  demo/02.GIT
10295* vim README.md
```
---

## Second header

