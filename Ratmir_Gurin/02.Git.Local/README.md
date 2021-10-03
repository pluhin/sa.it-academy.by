# 02.Git.Local

```bash
  359  git init
  360  ls
  361  git status
  362  touch  1.txt
  363  ls
  364  rm readme.md
  365  ls
  366  git init
  367  ls
  368  clear
  369  git status
  370  vim 1.txt
  371  git add 1.txt
  372  git status
  373  git commit
  374  git status
  375  git show
  376  touch 2.txt
  377  ls
  378  vim 2.txt
  379  git add 2.txt
  380  git commit -m "second commit master branch"
  381  git checkout -b "dev"
  382  touch 3.txt
  383  vim
  384  vim 3.txt
  385  git add 3.txt
  386  git commit -m "third commit dev branch"
  387  touch 4.txt
  388  vim 4.txt
  389  git add 4.txt
  390  git commit -m "fourth commit dev branch"
  391  git show
  392  git status
  393  git log
  394  git checkout -b "features/do_one"
  395  git sta
  396  git status
  397  vim 4.txt
  398  git status
  399  git add 4.txt
  400  git commit -m "add fifth commit features/do_one branch 4.txt"
  401  git checkout master
  402  git checkout -b "hotfix/we_gonna_die"
  403  vim 2.txt
  404  git status
  405  git add 2.txt
  406  git commit -m "sixth commit hotfix/we_gonna_die branch 2.txt"
  407  git log
  408  git checkout master
  409  git merge dev
  410  git log
  411  git merge features/do_one
  412  git log
  413  git log --oneline
  414  git checkout master
  415  git log
  416  git log --oneline --all
  417  git log --oneline --all --graph
  418  git status
  419  git log --oneline --all --graph
  420  git cherry-pick 8458759
  421  git log --oneline --all --graph
  422  git checkout dev
  423  git cherry-pick 8458759
  424  git checkout features/do_one
  425  git cherry-pick 8458759
  426  git log --oneline --all
```

## Commits in branch master

```bash
34afbac (master) sixth commit hotfix/we_gonna_die branch 2.txt
9285b02 add fifth commit features/do_one branch 4.txt
b6090b1 fourth commit dev branch
40ea2b1 third commit dev branch
f0f39fc second commit master branch
ff906f2 firat commit master branch
```

## Commits in branch dev

```bash
215ae8b (dev) sixth commit hotfix/we_gonna_die branch 2.txt
b6090b1 fourth commit dev branch
40ea2b1 third commit dev branch
f0f39fc second commit master branch
ff906f2 firat commit master branch
```

## Commits in branch features/do_one

```bash
46fc9ee (HEAD -> features/do_one) sixth commit hotfix/we_gonna_die branch 2.txt
9285b02 add fifth commit features/do_one branch 4.txt
b6090b1 fourth commit dev branch
40ea2b1 third commit dev branch
f0f39fc second commit master branch
ff906f2 firat commit master branch
```

## Commits in branch hotfix/we_gonna_die

```bash
8458759 (hotfix/we_gonna_die) sixth commit hotfix/we_gonna_die branch 2.txt
f0f39fc second commit master branch
ff906f2 firat commit master branch
```