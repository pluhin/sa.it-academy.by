  
  748  git clone https://github.com/volat1977/sa.it-academy.by.git
  749  git config --global user.name "Aliaksand Komlik"
  750  git config --global user.email komlik.al@gmail.com 
  751  mkdir akomlik
  752  cd akomlik/
  753  git init
  754  >README.md
  755  git add README.md
  756  git commit -m "First commit in master"
  757  echo "Second commit in master branch" >hometask.txt
  758  ls
  759  git  add hometask.txt 
  760  git commit -m "Second commit in master branch"
  761  git checkout -b dev
  762  ls
  763  git branch
  764  echo "Add line  from dev branch">> hometask.txt 
  765  cat hometask.txt 
  766  git status
  767  git add hometask.txt 
  768  git commit
  769  echo "Add second line  from dev branch">> hometask.txt 
  770* 
  771  git add hometask.txt 
  772  git commit
  773  git checkout -b features/do_one
  774  ls
  775  cat hometask.txt
  776  echo "Add first line in features/do_one branch from dev branch">> hometask.txt 
  777  git add hometask.txt 
  778  git commit -m "First commint in features/do_one branch"
  779  git checkout master 
  780  git checkout -b hotfix/we_gonna_die
  781  cat hometask.txt 
  782  echo "Add first line in hotfix/we_gonna_die branch">> hometask.txt 
  783  git add hometask.txt 
  784  git commit -m "first commit in hotfix/we_gonna_die branch"
  785  git checkout master
  786  git branch
  787  git merge features/do_one
  788  git merge hotfix/we_gonna_die
  789  ls
  790  git status
  791  git add *
  792  git merge hotfix/we_gonna_die
  793  git commit -m "conflict resolution in the master branch"
  794  git merge hotfix/we_gonna_die
  795  cd ..
  796  history > 02_GIT.md
