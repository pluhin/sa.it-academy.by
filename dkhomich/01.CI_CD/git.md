380  mkdir test
  381  cd test
  382  git init
  383  git config user.name "Dmitry Khomich"
  384  git config user.email "hodv@tut.by"
  385  date > master.txt
  386  git add .
  387  git commit -m "1 - Master"
  388  date >> master.txt 
  389  git add .
  390  git commit -m "2 -Master"
  391  git checkout -b dev
  392  date > dev.txt
  393  git add dev.txt 
  394  git commit -m "1 - Dev"
  395  date >> dev.txt 
  396  git add dev.txt 
  397  git commit -m "2 - Dev"
  398  git checkout -b features
  399  mkdir do_one
  400  date > ./do_one/features.txt
  401  git checkout master
  402  git checkout -b hotfix
  403  mkdir we_gonna_die
  404  date > ./we_gonna_die/hotfix.txt
  405  git add we_gonna_die/
  406  git commit -m "1 - Hotfix"
  407  git checkout features
  408  git status
  409  git add do_one/
  410  git commit -m "1 - Features"
  411  git checkout dev
  412  git checkout features
  413  git log
  414  git checkout dev
  415  git log
  416  git mrege fetures
  417  git merge fetures
  418  git branch
  419  git merge features
  420  git log
  421  git checkout master
  422  git log
  423  git merge dev
  424  git log
  425  git checkout hotfix
  426  git log --oneline
  427  git checkout master
  428  git cherry-pick 8b6c6f6
  429  git log
  430  git checkout dev
  431  git cherry-pick 8b6c6f6
  432  git log
  433  git checkout features 
  434  git cherry-pick 8b6c6f6
  435  git log
  436  history > git.md
  437  vi git.md 
  438  git log >> git.md
  439  cat git.md 
  440  echo "COMMIT FROM FEATURE" && git log > git.md
  441  cat git.md 
  442  echo "COMMIT FROM FEATURES BRANCH" > git.md $$ git log --oneline > git.md 
  443  cat git.md 
  444  echo "COMMIT FROM FEATURES BRANCH" > git.md
  445  git log --oneline > git.md 
  446  cat git.md 
  447  echo "COMMIT FROM FEATURES BRANCH" > git.md
  448  git log --oneline >> git.md 
  449  cat git.md 
  450  history
COMMIT FROM FEATURES BRANCH
794ea8a 1 - Hotfix
921fbb5 1 - Features
9fb052e 2 - Dev
25db70f 1 - Dev
4b2e1f8 2 -Master
6b899c8 1 - Master
