# 02.Git.Local

## history

```` bash

    1  mkdir 02.Git.Local
    2  cd 02.Git.Local/
    3  git config --list
    4  git init
    5  echo "Insert 1 : `date`" > master.txt
    6  git status
    7  git add *
    8  git commit -m "Commit 1 in MASTER"
    9  echo "Insert 2 : `date`" >> master.txt
   10  git commit -a -m "Commit 2 in MASTER"
   11  git log --oneline
   12  git branch dev
   13  git checkout dev
   14  git log --oneline
   15  echo "Insert 1 : `date`" > dev.txt
   16  git add *
   17  git status -s
   18  git commit -m "Commit 1 in DEV"
   19  echo "Insert 2 : `date`" >> dev.txt
   20  git commit -a -m "Commit 2 in DEV"
   21  git checkout -b features/do_one
   22  echo "Insert 1 : `date`" > features.txt
   23  git add *
   24  git commit -m "Commit 1 in FEATURES"
   25  git log --oneline
   26  git checkout master
   27  git checkout -b hotfix/we_gonna_die
   28  git log --oneline
   29  echo "Insert 1 : `date`" > hotfix.txt
   30  git add *
   31  git commit -m "Commit 1 in HOTFIX"
   32  git log --oneline
   33  git status -s
   34  git checkout master
   35  git checkout features/do_one
   36  git rebase master
   37  git log --oneline
   38  git checkout master
   39  git log --oneline
   40  git log --oneline  --graph --all
   41  git log --oneline  --graph
   42  git status
   43  git rebase features/do_one
   44  git log --oneline  --graph
   45  git log --oneline  --graph --all
   46  git log --oneline  --graph
   47  git cherry-pick 1c33cef
   48  git checkout dev
   49  git cherry-pick 1c33cef
   50  git checkout features/do_one
   51  git cherry-pick 1c33cef
   52  git log --oneline --graph --all
   53  git log --oneline --graph features/do_one
   54  git log --oneline --graph dev
   55  git log --oneline --graph master
   56  git log --oneline --graph hotfix/we_gonna_die
   57  history

````

## git log --oneline --graph master

````git

* 7ed4dc7 (master) Commit 1 in HOTFIX
* 342315b Commit 1 in FEATURES
* 2c9b1cd Commit 2 in DEV
* 81e119b Commit 1 in DEV
* d887683 Commit 2 in MASTER
* 0eca64c Commit 1 in MASTER

````

## git log --oneline --graph dev

```git

* 406c33f (dev) Commit 1 in HOTFIX
* 2c9b1cd Commit 2 in DEV
* 81e119b Commit 1 in DEV
* d887683 Commit 2 in MASTER
* 0eca64c Commit 1 in MASTER

````
## git log --oneline --graph

````git

* 742ba6b (HEAD -> features/do_one) Commit 1 in HOTFIX
* 342315b Commit 1 in FEATURES
* 2c9b1cd Commit 2 in DEV
* 81e119b Commit 1 in DEV
* d887683 Commit 2 in MASTER
* 0eca64c Commit 1 in MASTER

````

## git log --oneline --graph hotfix/we_gonna_die

````git

* 1c33cef (hotfix/we_gonna_die) Commit 1 in HOTFIX
* d887683 Commit 2 in MASTER
* 0eca64c Commit 1 in MASTER

````



