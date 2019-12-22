#HISTORY

```bash
  430  mkdir 02.GIT.Local
  431  cd 02.GIT.Local/
  432  ls -l
  433  ls -la
  434  git init
  435  git config user.name "Andrey Moroz"
  436  git config user.email "morozandralek@gmail.com"
  437  cat .git/config
  438  git branch -a
  439  touch README.md && date > README.md
  440  cat README.md
  441  git add --all
  442  git commit -m "Create file and first commit in master"
  443  git status
  444  git log --oneline
  445  vim README.md
  446  git status
  447  git add README.md
  448  git commit -m "Add text and second commit in master"
  449  git status
  450  git log --onelint
  451  git log --oneline
  452  git branch -a
  453  git checkout -b "dev"
  454  git branch -a
  455  ls -l
  456  cat README.md
  457  git log --oneline
  458  touch file_dev.txt
  459  ls -l
  460  git status
  461  git add file_dev.txt
  462  git commit -m "Create file in dev"
  463  git status
  464  git log --oneline
  465  ls -l
  466  vim file_dev.txt
  467  git status
  468  git add file_dev.txt
  469  git commit -m "Add text in file in dev"
  470  git status
  471  git log --oneline
  472  git branch
  473  git checkout -b "features/do_one"
  474  git branch
  475  ls -l
  476  git log --oneline
  477  ls
  478  ls -l
  479  touch file_features.txt
  480  git status
  481  git add file_features.txt
  482  git commit -m "Create file in features"
  483  git status
  484  git log --onelint
  485  git log --oneline
  486  git branch -a
  487  git checkout master
  488  ls -l
  489  git branch -a
  490  git checkout -b "hotfix/we_gonna_die"
  491  ls -l
  492  git log --oneline
  493  touch file_hotfix.txt
  494  git add file_hotfix.txt
  495  git status
  496  git commit -m "Create new file in hotfix"
  497  git status
  498  git log --oneline
  499  git branch -a
  500  git checkout master
  501  git branch -a
  502  ls -l
  503  git rebase dev
  504  ls -l
  505  git log --oneline
  506  git rebase features/do_one
  507  ls -l
  508  git log --oneline
  509  git cherry-pick 0b8358d
  510  ls -l
  511  git log --oneline

```
