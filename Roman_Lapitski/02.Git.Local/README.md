# Bash history

```bash
  351  mkdir project
  352  cd project
  353  git init
  354  git config --list
  355  git config user.name "Roman Lapitski"
  356  git config user.email "romalap1@gmai.com"
  357  git config --list
  358  nano .gitignore
  359  nano tmp.txt
  360  git add --all
  361  git commit -m "1 in master"
  362  nano tmp.txt
  363  git add tmp.txt
  364  git commit -m "2 in master"
  365  git log --oneline
  366  git checkout -b dev
  367  mkdir dev
  368  nano dev/tmp_dev.txt
  369  git add --all
  370  git commit -m "1 in dev"
  371  nano dev/tmp_dev.txt
  372  git add --all
  373  git commit -m "2 in dev"
  374  git log --oneline
  375  git checkout -b features/do_one
  376  mkdir features
  377  nano features/tmp_featutes.txt
  378  git add --all
  379  git commit -m "1 in features"
  380  git log --oneline
  381  git status
  382  git checkout master
  383  git log --oneline
  384  git checkout -b hotfix/we_gonna_die
  385  nano tmp.txt
  386  git add tmp.txt
  387  ll
  388  commit -m "1 in features"
  389  git commit -m "1 in features"
  390  git checkout master
  391  git merge features/do_one
  392  git log --oneline
  393  git checkout  hotfix/we_gonna_die
  394  git log --oneline
  395  git --amend -a #rename commit "1 in features" >> "1 in hotfix"
  396  git commit --amend -a
  397  git log --oneline
  398  git checkout master
  399  git cherry-pick b7fb93e
  400  git log --oneline
  401  git checkout dev
  402  git rebase -i master
  403  git log --oneline
  404  git checkout features/do_one
  405  git log --oneline
  406  git rebase -i master
  407  git log --oneline
  408  git checkout master
```

## MASTER commits

```bash
ce2e259 (HEAD -> master, features/do_one, dev) 1 in hotfix
bb7e86a 1 in features
825dfa6 2 in dev
3da4345 1 in dev
2de9368 2 in master
3042bca 1 in master
```

## DEV commits

```bash
ce2e259 (HEAD -> dev, master, features/do_one) 1 in hotfix
bb7e86a 1 in features
825dfa6 2 in dev
3da4345 1 in dev
2de9368 2 in master
3042bca 1 in master
```

## features/do_one commits

```bash
ce2e259 (HEAD -> features/do_one, master, dev) 1 in hotfix
bb7e86a 1 in features
825dfa6 2 in dev
3da4345 1 in dev
2de9368 2 in master
3042bca 1 in master
```

## hotfix/we_gonna_die commits

```bash
b7fb93e (HEAD -> hotfix/we_gonna_die) 1 in hotfix
2de9368 2 in master
3042bca 1 in master
```
