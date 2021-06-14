# Git Local

```bash
    2  git clone https://github.com/WESTnik/sa.it-academy.by
    3  cd sa.it-academy.by/
    4  ll
    5  mkdir -p plysianok/02.Git.Local 
    6  cd plysianok/02.Git.Local/
    7  git init
    8  git status 
    9  git branch 
   10  git branch -a
   11  git checkout md-sa2-17-21
   12  clear
   13  cd ..
   14  ll
   15  git checkout md-sa2-17-21
   16  git branch -a
   17  ll
   18  cd plysianok/
   19  ll
   20  cd 02.Git.Local/
   21  ll
   22  git checkout master
   23  git init
   24  git status 
   25  date > master_date.txt
   26  git add *
   27  git status 
   28  git commit -m "First commit on master branch"
   29  lscpu > master_cpu.txt
   30  git add master_cpu.txt 
   31  git commit -m "Second commit on master branch"
   32  git status 
   33  git log --oneline 
   34  git checkout -b dev
   35  date > dev_date.txt
   36  git add dev_date.txt 
   37  git commit -m "First commit on dev branch"
   38  lscpu > dev_cpu.txt
   39  git add dev_cpu.txt 
   40  git commit -m "Second commit on dev branch"
   41  git status 
   42  git log --oneline 
   43  git branch -a
   44  git checkout -b features/do_one
   45  lscpu > do_one.txt
   46  git add do_one.txt 
   47  git commit -m "First commit on features/do_one"
   48  git log --oneline 
   49  git checkout master 
   50  git checkout -b hotfix/we_gonna_die
   51  git log --oneline 
   52  date > fatalist.txt
   53  git add fatalist.txt 
   54  git commit -m "Fatality commit on we_gonna_die"
   55  git log --oneline 
   56  git checkout master 
   57  git merge features/do_one
   58  git log --oneline 
   59  git checkout hotfix/we_gonna_die
   60  git log --oneline 
   61  git checkout master 
   62  git cherry-pick 9b7682f
   63  git checkout dev
   64  git cherry-pick 9b7682f
   65  git checkout features/do_one 
   66  git cherry-pick 9b7682f
   67  git log --oneline 
   68  git checkout dev 
   69  git log --oneline 
   70  git checkout master 
   71  git log --oneline 
   72  git checkout hotfix/we_gonna_die 
   73  git log --oneline 
   74  history > history.txt
```
---
## Master branch
```bash
ef0d435 (HEAD -> master) Fatality commit on we_gonna_die
8c4ccb1 First commit on features/do_one
342e38c Second commit on dev branch
2b69710 First commit on dev branch
f53c768 Second commit on master branch
ecb3226 First commit on master branch
```
---
## Dev branch

```bash 
543fe1b (HEAD -> dev) Fatality commit on we_gonna_die
342e38c Second commit on dev branch
2b69710 First commit on dev branch
f53c768 Second commit on master branch
ecb3226 First commit on master branch
```
---
## Features/do_one

```bash
f3afea2 (HEAD -> features/do_one) Fatality commit on we_gonna_die
8c4ccb1 First commit on features/do_one
342e38c Second commit on dev branch
2b69710 First commit on dev branch
f53c768 Second commit on master branch
ecb3226 First commit on master branch
```
---
## Hotfix/we_gonna_die
```bash 
9b7682f (HEAD -> hotfix/we_gonna_die) Fatality commit on we_gonna_die
f53c768 Second commit on master branch
ecb3226 First commit on master branch
```