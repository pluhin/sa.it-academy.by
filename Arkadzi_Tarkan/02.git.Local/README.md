# Home task 02.git.local

## history

```
  337  cd git_devops_course
  338  ls
  339  cd test_git_local
  340  git init
  341  touch m1
  342  git add m1
  343  git commit -m "first m1 commit"
  344  touch m2
  345  git add m2
  346  git commit -m "second m2 commit"
  347  git checkout -b dev
  348  touch d1
  349  git add d1
  350  git commit -m "first d1 commit"
  351  touch d2
  352  git add d2
  353  git commit -m "second d2 commit"
  354  git checkout -b features/do_one
  355  touch f_d1
  356  git add f_d1
  357  git commit -m "first f_d1 commit"
  358  git checkout master
  359  git checkout -b hotfix/we_gonna_die
  360  touch h_w1
  361  git add h_w1
  362  git commit -m "first h_w1 commit"
  363  git checkout master
  364  git merge features/do_one
  365  git log --oneline
  366  git checkout hotfix/we_gonna_die
  367  git log --oneline
  368  git checkout master
  369  git cherry-pick f2d169a
  370  git checkout dev
  371  git cherry-pick f2d169a
  372  git checkout features/do_one
  373  git cherry-pick f2d169a
  374  git checkout master
  375  git log --oneline
  376  git checkout dev
  377  git log --oneline
  378  git checkout features/do_one
  379  git log --oneline
  380  git checkout hotfix/we_gonna_die
  381  git log --oneline
```

## master

```
2538d4f (HEAD -> master) first h_w1 commit
d3a5b67 first f_d1 commit
e0145ad second d2 commit
7fce2bf first d1 commit
5bf3c87 second m2 commit
6e135d0 first m1 commit
```

## dev

```
c828373 (HEAD -> dev) first h_w1 commit
e0145ad second d2 commit
7fce2bf first d1 commit
5bf3c87 second m2 commit
6e135d0 first m1 commit
```

## features/do_one

```
98718e2 (HEAD -> features/do_one) first h_w1 commit
d3a5b67 first f_d1 commit
e0145ad second d2 commit
7fce2bf first d1 commit
5bf3c87 second m2 commit
6e135d0 first m1 commit
```

## hotfix/we_gonna_die

```
f2d169a (HEAD -> hotfix/we_gonna_die) first h_w1 commit
5bf3c87 second m2 commit
6e135d0 first m1 commit
```
