## Home work 01
### Local git
  363  ll
  364  alias ll='ls -la'
  365  ll
  366  pwd
  367  git clone https://github.com/OlegPlaxa/sa.it-academy.by.git
  368  git branch -a
  369  ll
  370  cd sa.it-academy.by/
  371  ll
  372  git branch -a
  373  git checkout m-sa2-06-19 
  374  ll
  375  ll
  376  mkdir oplaksa
  377  ll
  378  cd oplaksa/
  379  git config --global user.name "Oleg Plaxa"
  380  git config --global user.email "plaxaoleg@gmail.com"
  381  git congig -l
  382  git congig --list
  383  git config -l
  384  git init
  385  ll
  386  ll
  387  git add *
  388  git status
  389  git commit -m "First commit in MASTER"
  390  vim cond_for_driver.py 
  391  git add *
  392  git commit -m "Second commit in MASTER"
  393  git status
  394  git log
  395  git log --graph --all --decorate
  396  git checkout -b dev
  397  vim cond_for_driver.py
  398  git add *
  399  git commit -m "First commit in DEV"
  400  vim cond_for_driver.py
  401  git add *
  402  git commit -m "Second commit in DEV"
  403  git log --graph --all --decorate
  404  git branch
  405  git checkout -b "features/do_one"
  406  vim cond_for_driver.py 
  407  git add *
  408  git commit -m "First commit in FEATURES/DO_ONE"
  409  git branch
  410  git log --graph --all --decorate
  411  git checkout master 
  412  git checkout -b "hotfix/we_gonna_die"
  413  vim cond_for_driver.py 
  414  git add *
  415  git commit -m "First commit in HOTFIX/WE_GONNA_DIE"
  416  git status
  417  git log --graph --all --decorate
  418  git branch
  419  git checkout dev 
  420  git branch
  421  git merge features/do_one
  422  git checkout master 
  423  git merge dev
  424  git merge hotfix/we_gonna_die 
  425  git add --all
  426  git commit -m "Merge master and hotfix and fix conflicts"
  427  git status
  428  git log --graph --all --decorate
  429  history
  430  history --help
  431  history|tail -63 > 02_GIT.md
  432  ll
  433  history|tail -71 > 02_GIT.md
