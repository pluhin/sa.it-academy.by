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
master
``` 

## DEV commits
```bash
DEV
``` 
## features/do_one commits
```bash
features/do_one
``` 
## hotfix/we_gonna_die commits
```bash
hotfix/we_gonna_die
``` 
