# 02.Git.Local

## CLI History

_Getting new version of git from [Launchpad.net](https://launchpad.net/~git-core/+archive/ubuntu/ppa)_

```bash
   1  git --version  
   2  sudo add-apt-repository ppa:git-core/ppa  
   3  sudo apt update  
   4  sudo apt upgrade -y  
   5  git --version  
```

Main commands

```bash
   6  mkdir -p git/02.Git.Local  
   7  cd git/02.Git.Local/  
   8  git init
   9  ll
   10  git config user.name "Sergey Harbach"
   11  git config user.email "sgoser@gmail.com"
   12  date > f1_date.txt
   13  date > f2_date.txt
   14  git status
   15  vi .gitignore
   16  date > date.log
   17  ll
   18  git status
   19  git add --all
   20  git status 
   21  git commit -m "1.Commit to Master. Initial commit."
   22  date >> f1_date.txt 
   23  git status 
   24  git commit -a -m "2.Commit to Master. File changes."
   25  git log --oneline
   26  date >> f2_date.txt 
   27  git status 
   28  git commit --amend -a --no-edit 
   29  git log
   30  git checkout -b dev
   31  git branch 
   32  git log
   33  touch dev.module1.py
   34  git status
   35  git add .
   36  git commit -m "1.Dev. Add module 1."
   37  touch dev.module2.py
   38  git add .
   39  git commit -m "2.Dev. Add module 2."
   40  git checkout -b features/do_one
   41  touch features.txt
   42  git add .
   43  git commit -m "1.Features. Specification text."
   44  git status 
   45  ll
   46  git checkout master 
   47  ll
   48  git checkout -b hotfix/we_gonna_die
   49  date > fix_date.rip
   50  git add --all
   51  git commit -m "1.HotFix. But still alive."
   52  git checkout master 
```

## "Play" section

### Merge

```bash
   53  echo PLAY
   54  git branch 
   55  git merge dev 
   56  git log 
   57  git merge features/do_one 
   58  git status 
```

### Hotfix

```bash
   59  echo HOTFIX
   60  git branch 
   61  git cherry-pick d0d7dac
   62  git checkout dev 
   63  git cherry-pick d0d7dac
   64  git checkout features/do_one 
   65  git cherry-pick d0d7dac
```

## LOGS Section

### cli

```bash
   66  echo LOGS
   67  git checkout master
   68  git log --oneline
   69  git checkout dev
   70  git log --oneline
   71  git checkout features/do_one
   72  git log --oneline
   73  git checkout hotfix/we_gonna_die
   74  git log --oneline
   75  cd ..
   76  history > 02.GIT.Local.md
```

### master

```bash
  sadmin@devops:~/git/02.Git.Local$ git checkout master
  Switched to branch 'master'
  sadmin@devops:~/git/02.Git.Local$ git log --oneline

  d0ecaa5 (HEAD -> master) 1.HotFix. But still alive.
  ef4e6f1 1.Features. Specification text.
  995694d 2.Dev. Add module 2.
  f0c8fad 1.Dev. Add module 1.
  39f9ec6 2.Commit to Master. File changes.
  65947bc 1.Commit to Master. Initial commit.
```

### dev

```bash
  sadmin@devops:~/git/02.Git.Local$ git checkout dev
  Switched to branch 'dev'
  sadmin@devops:~/git/02.Git.Local$ git log --oneline

  46a29b1 (HEAD -> dev) 1.HotFix. But still alive.
  995694d 2.Dev. Add module 2.
  f0c8fad 1.Dev. Add module 1.
  39f9ec6 2.Commit to Master. File changes.
  65947bc 1.Commit to Master. Initial commit.
```

### features/do_one

```bash
  sadmin@devops:~/git/02.Git.Local$ git checkout features/do_one
  Switched to branch 'features/do_one'
  sadmin@devops:~/git/02.Git.Local$ git log --oneline

  8dec4cf (HEAD -> features/do_one) 1.HotFix. But still alive.
  ef4e6f1 1.Features. Specification text.
  995694d 2.Dev. Add module 2.
  f0c8fad 1.Dev. Add module 1.
  39f9ec6 2.Commit to Master. File changes.
  65947bc 1.Commit to Master. Initial commit.
```

### hotfix/we_gonna_die

```bash
  sadmin@devops:~/git/02.Git.Local$ git checkout hotfix/we_gonna_die
  Switched to branch 'hotfix/we_gonna_die'
  sadmin@devops:~/git/02.Git.Local$ git log --oneline

  d0d7dac (HEAD -> hotfix/we_gonna_die) 1.HotFix. But still alive.
  39f9ec6 2.Commit to Master. File changes.
  65947bc 1.Commit to Master. Initial commit.
```
