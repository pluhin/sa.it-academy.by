## Home work
### Local git 
```bash
  912  git init .
  913  git config --global user.name "Roman Shved"
  914  git config --global user.email "romanshved@outlook.com"
  915  git config --global core.editor vim
  916  git config -l
  917  vim file1.py
  918  git add *
  919  git commit -m "first commit in master"
  920  vim file2.py
  921  git add *
  922  git commit -m "second commit in master"
  923  git status
  924  git log --oneline
  925  git log --graph --all --decorate
  926  git checkout -b dev
  927  git branch
  928  vim file3.py
  929  git add *
  930  git commit -m "first commit in dev"
  931  vim file2.py
  932  git add *
  933  git commit -m "second commit in dev"
  934  git status
  935  git log --oneline
  936  git log --graph --all --decorate
  937  git checkout -b "features/do_one"
  938  git branch
  939  ll
  940  vim file1.py
  941  git add *
  942  git commit -m "first commit in features"
  943  git status
  944  git log --oneline
  945  git log --graph --all --decorate
  946  git checkout master
  947  ll
  948  git checkout -b "hotfix/we_gonna_die"
  949  ll
  950  vim file4.py
  951  git add *
  952  git commit -m "first commit in hotfix"
  953  git status
  954  git log --oneline
  955  git log --graph --all --decorate
  956  git branch
  957  git checkout master
  958  git merge dev
  959  git merge features/do_one
  960  ll
  961  git status
  962  git log --graph --all --decorate
  963  git merge hotfix/we_gonna_die
  964  ll
  965  git branch
  966  git status
  967  git log --graph --all --decorate
  968  git checkout dev
  969  git merge hotfix/we_gonna_die
  970  git checkout features/do_one
  971  git merge hotfix/we_gonna_die
  972  git log --graph --all --decorate
  973  git branch
  974  ll
  975  git log --oneline
  976  git checkout dev
  977  git log --oneline
  978  git checkout hotfix/we_gonna_die
  979  git log --oneline
  980  git checkout master
  981  git log --oneline
  982  git log --pretty="%H - %s"
  983  git rebase -i 43e3fe7c5494540f71c17664f1c8b03302a88131
  984  git log --pretty="%H - %s"
  985  history > 02_GIT.md
```
