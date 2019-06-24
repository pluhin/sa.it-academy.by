```bash
  394  git config --global user.user "Vladimir Rekun"
  395  git config --global user.email "wladimirre@gmail.com"
  396  git config list
  397  git config --list
  398  cd
  399  cd d:
  400  cd DevOPS/
  401  ls
  402  mkdir.exe 02.GIT.Local
  403  cd 02.GIT.Local/
  404  date > file.txt
  405  git status
  406  nano.exe .gitignor
  407  git status
  408  nano.exe .gitignor
  409  git status
  410  nano.exe .gitignor
  411  git status
  412  git status
  413  cd ../
  414  git status
  415  git commit -m "init commit"
  416  git add 02.GIT.Local/
  417  git commit -m "init commit"
  418  cd 02.GIT.Local/
  419  ls
  420  git log --oneline
  421  git branch
  422  git branch -a
  423  git branch -r
  424  git checkout -b second
  425  git checkout master
  426  git checkout second
  427  ps > second.txt
  428  git add second.txt
  429  git commit -m "second file"
  430  git checkout master
  431  git log --oneline
  432  git merge second
  433  git log --oneline
  434  git log --graph --all --decorate
  435  ls
  436  date >> second.txt
  437  date >> second.txt
  438  date >> second.txt
  439  date >> second.txt
  440  date >> second.txt
  441  ps >> second.txt
  442  ps >> second.txt
  443  ps >> second.txt
  444  git add --all
  445  git commit -m "second 2"
  446  git checkout second
  447  git log --oneline
  448  git rebase master
  449  git log --oneline
  450  git rebase master -i
  451  git checkout master
  452  date >> file.txt
  453  date >> file.txt
  454  date >> file.txt
  455  date >> file.txt
  456  date >> file.txt
  457  date >> file.txt
  458  date >> file.txt
  459  git add --all
  460  git commit -m "conflicts"
  461  git checkout second
  462  nano.exe file.txt
  463  git add file.txt
  464  git commit -m "conflicts2"
  465  git rebase -i master
  466  nano.exe file.txt
  467  nano.exe file.txt
  468  git add file.txt
  469  git rebase --continue
  470  git log --oneline
  471  git rebase -i HEAD~4
  472  git log --oneline
  473  git config
  474  ls
  475  git checkout master
  476  date > 1.txt
  477  git init
  478  date > 1.txt
  479  git add 1.txt
  480  git commit -m "1 commit"
  481  date >> 1.txt
  482  date >> 1.txt
  483  git add 1.txt
  484  git commit -m "2 commit"
  485  git checkout -b dev
  486   git log --graph --all --decorate
  487  ps >> 1.txt
  488  git add 1.txt
  489  git commit -m "1 commit dev"
  490   git log --graph --all --decorate
  491  ps >> 1.txt
  492  git add 1.txt
  493  git commit -m "2 commit dev"
  494  git checkout -b features/do_one
  495  date >> 1.txt
  496  git add 1.txt
  497  git commit -m "1 commit features/do_one"
  498   git log --graph --all --decorate
  499  git checkout master
  500  git checkout -b hotfix/we_gonna_die
  501  date.exe >> 1.txt
  502  ps >> 1.txt
  503  git add 1.txt
  504  git commit -m "1 commit hotfix/we_gonna_die"
  505   git log --graph --all --decorate
  506  git status
  507  git log --oneline
  508  git add 1.txt
  509  git checkout dev
  510  git merge features/do_one --no-ff
  511  git log --oneline
  512  git log --oneline
  513  git checkout master
  514  git merge dev
  515  git log --oneline
  516   git log --graph --all --decorate
  517  git rebase master
  518  git log --oneline
  519  git checkout dev
  520  git rebase master
  521  git checkout features/do_one
  522  git rebase master
  523  git rebase master -i
  524  git status
  525  git log --oneline
  526  git checkout hotfix/we_gonna_die
  527  git rebase master -i
  528  git checkout master
  529  git merge master
  530  git log --oneline
  531  git checkout master
  532  git merge master -i
  533  git checkout dev
  534  git merge hotfix/we_gonna_die --no-ff
  535  git merge --abort
  536  git checkout dev
  537  git rebase hotfix/we_gonna_die --no-ff
  538  git rebase hotfix/we_gonna_die  -i
  539  git rebase --continue
  540  git add 1.txt
  541  git commit -m "fatal"
  542  git rebase --continue
  543  git checkout dev
  544  git merge hotfix/we_gonna_die --no-ff
  545  git status
  546  git log --oneline
  547  git checkout master
  548  git merge dev --no-ff
  549  git log --oneline
  550  history
``` 
