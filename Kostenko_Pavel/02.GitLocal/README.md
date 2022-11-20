### 02.Git.Local

## Commands
```bash
    1  git init
    2  cd 02.GitLocal/
    3  git config user.name "Pavel"
    4  git config user.email "Pavel"
    5  git config user.email "pasha.167988@yandex.by"
    6  ls -l
    7  ll
    8  date > date1.txt
    9  git add .
   10  git commit -m "1 commit to master"
   11  date > date2.txt
   12  git add .
   13  git status
   14  git commit -m "2 commit to master"
   15  git log --oneline
   16  git checkout -b dev
   17  touch dev1.php
   18  git add dev1.php
   19  git status
   20  git commit -m "1 commit to dev"
   21  touch dev2.php
   22  git add dev2.php 
   23  git commit -m "2 commit to dev"
   24  git log --oneline
   25  git checkout -b features/do_one
   26  touch features.txt
   27  git add features.txt 
   28  git commit -m "1 commit to features/do_one"
   29  git log --oneline
   30  git checkout master
   31  git checkout -b hotfix/we_gonna_die
   32  touch hotfix.txt
   33  git add hotfix.txt 
   34  git commit -m "1 commit to hotfix"
   35  git log --oneline
   36  ls -l
   37  git checkout master
   38  ls -l
   39  git log --oneline
   40  git status
   41  git log --oneline
   42  git merge dev
   43  git merge features/do_one 
   44  git commit -m "master+dev+features"
   45  git log --oneline
   46  git log
   47  git checkout hotfix/we_gonna_die 
   48  git log --oneline
   49  git checkout master
   50  git cherry-pick c68af63
   51  git checkout dev 
   52  git cherry-pick c68af63
   53  git checkout features/do_one 
   54  git cherry-pick c68af63
   55  git checkout master 
   56  git log --oneline
   57  git checkout dev 
   58  git log --oneline
  ```



### LOGS

## Master branch
```bash
admloc@ubuntu20:~/repo/02.GitLocal$ git log --online
fatal: unrecognized argument: --online
admloc@ubuntu20:~/repo/02.GitLocal$ git log --oneline
9e25a66 (HEAD -> master) 1 commit to hotfix
db24e97 1 commit to features/do_one
6f4af0b 2 commit to dev
22c8976 1 commit to dev
5b3a839 2 commit to master
89374a0 1 commit to master
```
## dev branch
```bash
admloc@ubuntu20:~/repo/02.GitLocal$ git checkout dev
Switched to branch 'dev'
admloc@ubuntu20:~/repo/02.GitLocal$ git log --oneline
f39717e (HEAD -> dev) 1 commit to hotfix
6f4af0b 2 commit to dev
22c8976 1 commit to dev
5b3a839 2 commit to master
89374a0 1 commit to master
```
## features/do_one branch
```bash
admloc@ubuntu20:~/repo/02.GitLocal$ git checkout features/do_one
Switched to branch 'features/do_one'
admloc@ubuntu20:~/repo/02.GitLocal$ git log --oneline
a3fe20c (HEAD -> features/do_one) 1 commit to hotfix
db24e97 1 commit to features/do_one
6f4af0b 2 commit to dev
22c8976 1 commit to dev
5b3a839 2 commit to master
89374a0 1 commit to master
```

## hotfix/we_gonna_die branch
```bash
admloc@ubuntu20:~/repo/02.GitLocal$ git checkout hotfix/we_gonna_die
Switched to branch 'hotfix/we_gonna_die'
admloc@ubuntu20:~/repo/02.GitLocal$ git log --oneline
c68af63 (HEAD -> hotfix/we_gonna_die) 1 commit to hotfix
5b3a839 2 commit to master
89374a0 1 commit to master
```

