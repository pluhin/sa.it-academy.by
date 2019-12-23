  557  mkdir test
  558  cd test
  559  git init
  560  git config user.name "Dmitry Khomich"
  561  git config user.email "hodv@tut.by"
  562  git config -l
  563  date > master.txt
  564  git add .
  565  git commit -m "1 - Master"
  566  date >> master.txt
  567  git add .
  568  git commit -m "2 - Master"
  569  git log --oneline
  570  git checkout -b dev
  571  date > dev.txt
  572  git add dev.txt 
  573  git commit -m "1 - Dev"
  574  date >> dev.txt
  575  git add dev.txt 
  576  git commit -m "2 - Dev"
  577  git status --oneline
  578  git log --oneline
  579  git checkout -b features
  580  mkdir do_one
  581  date > do_one/features.txt
  582  git add do_one
  583  git commit -m "1 - Features"
  584  ls
  585  git chekout master
  586  git checkout master
  587  git checkout -b hotfix
  588  mkdir we_gonna_die
  589  date > we_gonna_die/hotfix.txt
  590  git add we_gonna_die/
  591  ls
  592  git commit -m "1 - Hotfix"
  593  ls
  594  git checkout dev
  595  ls
  596  git merge features
  597  ls
  598  git log
  599  git checkout master
  600  git merge dev
  601  ls
  602  git log
  603  ping 8.8.8.8
  604  git log hotfix --oneline
  605  git branch
  606  git cherry-pick cd8980b
  607  git log
  608  git branch dev
  609  git checkout dev
  610  git log hotfix --oneline
  611  git cherry-pick cd8980b
  612  git log --oneline
  613  git checkout features
  614  git cherry-pick cd8980b
  615  history > git.md
  616  echo -en '\n' > git.md 
  617  history > git.md

Hotfix branch log

cd8980b 1 - Hotfix
d97b369 2 - Master
070d5c1 1 - Master

Master branch log
b052bcf 1 - Hotfix
422eed7 1 - Features
6457c1c 2 - Dev
d2b1dec 1 - Dev
d97b369 2 - Master
070d5c1 1 - Master

Dev branch log
6069295 1 - Hotfix
422eed7 1 - Features
6457c1c 2 - Dev
d2b1dec 1 - Dev
d97b369 2 - Master
070d5c1 1 - Master

Features branch log
a21069f 1 - Hotfix
422eed7 1 - Features
6457c1c 2 - Dev
d2b1dec 1 - Dev
d97b369 2 - Master
070d5c1 1 - Master
