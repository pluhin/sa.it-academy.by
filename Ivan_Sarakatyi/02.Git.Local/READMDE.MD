Bash
``` bash

  309  cd 02.Git.Local/
  310  git init
  311  it config user.name "Ivan Sorokatyi"
  312  git config user.name "Ivan Sorokatyi"
  313  git config user.email "sorokatyi@gmail.com"
  314  echo "some_text" > file.txt
  315  git add --all
  316  git commit -m "first commit - master"
  317  git branch
  318  echo "some_text2" > file.txt
  319  git add --all
  320  git commit -m "second commit - master"
  321  git checkout -b dev
  322  echo "some_text dev" > file.txt
  323  git add --all
  324  git commit -m "first commit - dev"
  325  echo "some_text dev2" > file.txt
  326  git add --all
  327  git commit -m "second commit - dev"
  328  git status
  329  git branch
  330  git checkout -b features/do_one
  331  echo "some_text features" > file.txt
  332  git add --all
  333  git commit -m "second commit - features"
  334  git checkout master
  335  git checkout -b hotfix/we_gonna_die
  336  echo "some hotfix" > file.txt
  337  git add --all
  338  git commit -m "some hotfix"
  339  git checkout master
  340  git merge features/do_one
  341  git merge hotfix/we_gonna_die
  342  git log --oneline
  343  git cherry-pick dcfcdd3
  344  git checkout features/do_one
  345  git merge master
  346  git checkout dev
  347  git merge master
  348  git branch
  349  git log --oneline
  350  git checkout hotfix/we_gonna_die
  351  git add --all
  352  git checkout dev
  353  git commit -m "finish"
  354  git checkout dev
  355  git add --all
  356  git log --oneline
  357  git checkout hotfix/we_gonna_die
  358  git log --oneline
  359  git checkout features/do_one
  360  git rebase dev
```
master
```bash
c1c1c3b (HEAD -> master) finish
df9581f (hotfix/we_gonna_die) some hotfix
dcfcdd3 (features/do_one) second commit - features
d5e1d6c (dev) second commit - dev
e8695a6 first commit - dev
2089add second commit - master
63acb7c first commit - master
```
dev
```bash
d5e1d6c (HEAD -> dev) second commit - dev
e8695a6 first commit - dev
2089add second commit - master
63acb7c first commit - master
```
features
```bash
df9581f (HEAD -> hotfix/we_gonna_die) some hotfix
2089add second commit - master
63acb7c first commit - master
```
hotfix
```bash
df9581f (HEAD -> hotfix/we_gonna_die) some hotfix
2089add second commit - master
63acb7c first commit - master

```
