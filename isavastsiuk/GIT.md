## Homework
### Log of my git
```bash
  371  git init
  372  git status
  373  git config --global user.name "Igor Savastsiuk"
  374  git config --global user.email "igor.savastsiuk@it-academy.by"
  375  git config 
  376  git config --list 
  377  touch victim.txt
  378  vim victim.txt 
  379  cat victim.txt 
  380  git status
  381  git add victim.txt 
  382  git statua
  383  git status
  384  git config --global core.autocrlf false
  385  git status
  386  git commit
  387  git status 
  388  vim victim.txt 
  389  git status
  390  git add victim.txt 
  391  git status
  392  git commit
  393  git log --oneline
  394  git commit --amend -a
  395  git log --oneline
  396  git checkout -b "dev"
  397  git branch 
  398  vim victim2.txt
  399  git status 
  400  git add victim2.txt 
  401  git commit -m "First commit in dev"
  402  git status 
  403  git log --oneline 
  404  vim victim2.txt
  405  git add victim2.txt 
  406  git commit -m "Second commit in dev"
  407  git status 
  408  git log --oneline 
  409  git checkout master 
  410  git checkout dev 
  411  git checkout -b "features/do_one"
  412  vim victim3.txt
  413  git add victim3.txt 
  414  git commit -m "Only one commit in feature/do_one"
  415  git log --oneline 
  416  git checkout master 
  417  git checkout -b "hotfix/we_gonna_die"
  418  git log --oneline 
  419  vim hot-hot-hotfix.txt
  420  git status 
  421  git add hot-hot-hotfix.txt 
  422  git commit -m "Hotfix complite"
  423  git log --oneline 
  424  git log --graph --all --decorate
  425  git checkout master 
  426  git log --graph --all --decorate
  427  git checkout hotfix/we_gonna_die 
  428  git checkout master 
  429  git merge hotfix/we_gonna_die 
  430  git log --oneline 
  431  git checkout dev 
  432  git rebase -i master 
  433  git log --oneline 
  434  git checkout features/do_one 
  435  git rebase -i dev 
  436  git log --oneline 
  437  git checkout master 
  438  git merge features/do_one 
  439  git log --oneline 
  440  git log --graph --all --decorate
  441  history > GIT.log
```