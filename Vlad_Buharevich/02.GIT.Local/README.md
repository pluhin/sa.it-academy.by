  # Bash history

```bash
  254  cd test2.0/
  255  git init
  256  git config user.name "Vlad Buharevich"
  257  git config user.email "ubuharevich@gmail.com"
  258  git config --list
  259  vim .gitignore
  260  vim temp.txt
  261  git add --all
  262  git commit -m "1st in master"
  263  vim temp.txt
  264  git add temp.txt
  265  git commit -m "2nd in master"
  266  git log --oneline
  267  git checkout -b dev
  268  mkdir dev
  269  vim dev/temp_dev.txt
  270  git add --all
  271  git commit -m "1st in dev"
  272  vim dev/temp_dev.txt
  273  git add --all
  274  git commit -m "2 in dev"
  275  git log --oneline
  276  remove commit
  277  git checkout -b features/do_one
  278  mkdir features
  279  vim features/temp_featutes.txt
  280  git add --all
  281  git commit -m "1st in features"
  282  git log --oneline
  283  git status
  284  git checkout master
  285  git log --oneline
  286  git checkout -b hotfix/we_gonna_die
  287  vim temp.txt
  288  git add temp.txt
  289  commit -m "1st in features"
  290  ll
  291  git commit -m "1st in features"
  292  git checkout master
  293  git merge features/do_one
  294  git log --oneline
  295  git checkout  hotfix/we_gonna_die
  296  git log --oneline
  297  git --amend -a #rename commit "1st in features" >> "1st in hotfix"
  298  git commit --amend -a
  299  git log --oneline
  300  git checkout master
  301  git cherry-pick c4dc3e3
  302  git log --oneline
  303  git checkout dev
  304  git rebase -i master
  305  git log --oneline
  306  git checkout features/do_one
  307  git log --oneline
  308  git rebase -i master
  309  git checkout master
  310  history
  ```

## MASTER commits

```bash

69eb1f6 (HEAD -> master) 1st in hotfix
410ff12 (features/do_one) 1st in features
16e9c2a (dev) 2 in dev
29f1cdf 1st in dev
128e22e 2nd in master
0725fc6 1st in master
```

## DEV commits

```bash
69eb1f6 (HEAD -> dev, master) 1st in hotfix
410ff12 (features/do_one) 1st in features
16e9c2a 2 in dev
29f1cdf 1st in dev
128e22e 2nd in master
0725fc6 1st in master
```

## features/do_one commits

```bash

410ff12 (HEAD -> master, features/do_one) 1st in features
16e9c2a (dev) 2 in dev
29f1cdf 1st in dev
128e22e 2nd in master
0725fc6 1st in master
```

## hotfix/we_gonna_die commits

```bash

c4dc3e3 (HEAD -> hotfix/we_gonna_die) 1st in hotfix
128e22e 2nd in master
0725fc6 1st in master
```
