# 02 Git demo

```bash
  438  cd Documents/git_repos
  439  cd git_repos
  440  ls -l
  441  cd sa.it-academy.by
  442  ls
  443  git checkout -b md-sa2-18-21
  444  git push --set-upstream origin md-sa2-18-21
  445  cd git_repos
  446  ls
  447  mkdir git_01
  448  cd git_01
  449  ls -l
  450  ls -la
  451  git init
  452  ls -la
  453  ls -la .git
  454  vim .git/config
  455  git config --list
  456  git config user.name "Siarhei P"
  457  git config user.email "pluhin@gmail.com"
  458  vim .git/config
  459  ls -l
  460  git status
  461  pwd
  462  date > first.txt
  463  git status
  464  touch .env
  465  ls -l
  466  ls -la
  467  git status
  468  vim .gitignore
  469  git status
  470  git add --all
  471  git status
  472  git commit -m "Inint commit"
  473  git log --oneline
  474  cat first.txt
  475  date >> first.txt
  476  cat first.txt
  477  git status
  478  git commit --amend -a
  479  git log --oneline
  480  clear
  481  git checkout -b "second"
  482  git branch
  483  git status
  484  ls -l
  485  date > second.txt
  486  git status
  487  ls -l
  488  git add --all
  489  git commit -m "Commit to second branch"
  490  git log --oneline
  491  git checkout master
  492  ls -l
  493  git log --oneline
  494  git merge second
  495  ls -l
  496  git log --oneline
  497  vim second.txt
  498  git add --all
  499  git commit -m "Commit in master for rebase"
  500  git log --oneline
  501  git checkout second
  502  git log --oneline
  503  git rebase master
  504  vim first.txt
  505  git add --all
  506  git commit -m "Commint in second for conflict"
  507  git commit -m "Commint in second for conflict"
  508  git checkout master
  509  vim first.txt
  510  git add --all
  511  git commit -m "Commint in master for conflict"
  512  git checkout second
  513  git rebase -i master
  514  vim first.txt
  515  git add first.txt
  516  git rebase --continue
  517  vim first.txt
  518  git checkout master
  519  vim first.txt
  520  git log --oneline
  521  git rebase HEAD~2
  522  git rebase HEAD~2 -i
  523  git log --oneline
  524  git checkout b98de70
  525  git checkout
  526  git checkout master
  527  git checkout b98de70
  528  git tag -a R01 -m "First release"
  529  git checkout master
  530  git tag -a R02 -m "Last release"
  531  git sow
  532  git show
  533  git show R01
  534  git tag
  535  git checkout R01
```

## Commits in branch maser

```bash
b98de70 (HEAD, tag: R01) Commit to second branch
6f60d57 Inint commit. Edited
```