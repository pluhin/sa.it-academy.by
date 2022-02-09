 ## Git.Local History
 ```bash
  438  cd Pavel_Sergeev/  
  439  ls  
  440  cd 02.Git/  
  441  vim  
  442  ls  
  443  git init  
  444  git config user.name "Pavel Sergeev"  
  445  git config user.email "pavel.sergeev@softswiss.com"  
  446  vem 1.txt  
  447  vim 1.txt  
  448  fit add .  
  449  git add .  
  450  git status  
  451  cd ..  
  452  git init  
  453  ls  
  454  git status  
  455  git add .  
  456  git status  
  457  git config user.name "Pavel Sergeev"  
  458  git config user.email "pavel.sergeev@softswiss.com"  
  459  git commit -m "First com"  
  460  vim /02.Git/2.txt  
  461  ls  
  462  cd 02.Git/  
  463  ls  
  464  vim 2.txt  
  465  cd ..  
  466  git add .  
  467  git status  
  468  git commit -m "Second Com"  
  469  git branch dev  
  470  git checkout dev  
  471  ls  
  472  cd 02.Git/  
  473  vim f3.txt  
  474  git add .  
  475  git commit -m "1 com for dev"  
  476  vim f4.txt  
  477  add .  
  478  git add .  
  479  git commit -m "Sec com for dev"  
  480  git checkout features/do_one  
  481  ls  
  482  cd ..  
  483  git branch features/do_one  
  484  git checkout features/do_one  
  485  vim f5.txt  
  486  git add .  
  487  git commit -m "1 for futures"  
  488  git checkout master  
  489  git branch hotfix/we_gonna_die  
  490  git checkout hotfix/we_gonna_die  
  491  vim f6.txt  
  492  git add .  
  493  git status  
  494  git commit -m "HotFix"  
  495  git checkout dev  
  496  git merg features/do_one  
  497  git checkout master  
  498  git merg dev  
  499  git merge hotfix/we_gonna_die  
  500  git checkout dev  
  501  git merge hotfix/we_gonna_die  
  502  git checkout features/do_one  
  503  git merg dev  
  504  history  
```
## master commits
```bash
15826e0f (HEAD -> md-sa2-19-22, origin/md-sa2-19-22) correct6
7fffa64f (origin/hotfix/we_gonna_die, hotfix/we_gonna_die) correct5
1b0e2b94 correct4
ab525724 correct3
``` 

## DEV commits
```bash
cf53c430 (HEAD -> dev, origin/dev) 2 in dev
35f73b1c 1 in dev
7fffa64f (origin/hotfix/we_gonna_die, hotfix/we_gonna_die) correct5
``` 
## features/do_one commits
```bash
5604fe5d (HEAD -> features/do_one, origin/features/do_one) 1 Futures
cf53c430 (origin/dev, dev) 2 in dev
35f73b1c 1 in dev
7fffa64f (origin/hotfix/we_gonna_die, hotfix/we_gonna_die) correct5

``` 
## hotfix/we_gonna_die commits
```bash
7fffa64f (HEAD -> hotfix/we_gonna_die, origin/hotfix/we_gonna_die) correct5
1b0e2b94 correct4
ab525724 correct3
b9bf2619 correct2
``` 
