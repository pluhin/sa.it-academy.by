  494  cd C:\academy.by
  495  git clone https://github.com/Zhenyakuch/sa.it-academy.by
  496  git checkout -b md-sa2-17-21
  497  git checkout -b md-sa2-17-21
  498  ls
  499  cd C:\academy.by\sa.it-academy.by
  500  cd sa.it-academy.by/
  501  LS
  502  git checkout -b md-sa2-17-21
  503  mkdir Evgeniya_Pehota
  504  mkdir 02.Git.Local
  505  cd \Evgeniya_Pehota
  506  mkdir 02.Git.Local
  507  touch README.md
  508  git checkout master
  509  git status
  510  cd 02.Git.Local/
  511  date > new_date.txt
  512  git add *
  513  git commit " 1 commit master"
  514  git commit -m "1 commit master"
  515  date > new_date2.txt
  516  git add *
  517  git commit -m "2 commit master"
  518  git checkout -b dev
  519  date > new_date_dev.txt
  520  git add *
  521  git commit -m "1 commit dev"
  522  date > new_date_dev2.txt
  523  git add *
  524  git commit -m "2 commit dev"
  525  git checkout -b features/do_one
  526  date > new_date_features_do_one.txt
  527  git add *
  528  git commit -m "1 commit features/do_one"
  529  git checkout master
  530  git checkout -b hotfix/we_gonna_die
  531  date > new_date_we_gonna_die.txt
  532  git add *
  533  git commit -m "1 commit we_gonna_die"
  534  git log --oneline
  535  git checkout master
  536  git log --oneline
  537  git checkout dev
  538  ~git push origin master
  539  git push origin master
  540  git push origin master
  541  git push origin
  542  git push origin --all
  543  git history
  544  git -history
  545  history
  
### master log --oneline

bc69a879 (HEAD -> master, origin/master, origin/HEAD) number 1
ba81aa69 readme
2e30fc55 2 commit master
8c9a5ca7 1 commit master
d23e0eb9 (md-sa2-17-21) Add gitignore
a3f48fef Migration to wiki
1c1d8b9b Update README.md
87ee8db3 Project changes
30e71bc9 Add ansible spinup task
60fda4bb home work changes
187feb33 project changes
2c749044 init
e06fc66d First commit

### dev log --oneline

fe8b6ad2 (HEAD -> dev, origin/dev) 2 commit dev
d28fa444 1 commit dev
2e30fc55 2 commit master
8c9a5ca7 1 commit master
d23e0eb9 (md-sa2-17-21) Add gitignore
a3f48fef Migration to wiki
1c1d8b9b Update README.md
87ee8db3 Project changes
30e71bc9 Add ansible spinup task
60fda4bb home work changes
187feb33 project changes
2c749044 init
e06fc66d First commit

### features/do_one log --oneline

23c24c1b (HEAD -> features/do_one, origin/features/do_one) 1 commit features/do_one
fe8b6ad2 (origin/dev, dev) 2 commit dev
d28fa444 1 commit dev
2e30fc55 2 commit master
8c9a5ca7 1 commit master
d23e0eb9 (md-sa2-17-21) Add gitignore
a3f48fef Migration to wiki
1c1d8b9b Update README.md
87ee8db3 Project changes
30e71bc9 Add ansible spinup task
60fda4bb home work changes
187feb33 project changes
2c749044 init
e06fc66d First commit

### hotfix/we_gonna_die log --oneline

28b76a6f (HEAD -> hotfix/we_gonna_die, origin/hotfix/we_gonna_die) 1 commit we_gonna_die
2e30fc55 2 commit master
8c9a5ca7 1 commit master
d23e0eb9 (md-sa2-17-21) Add gitignore
a3f48fef Migration to wiki
1c1d8b9b Update README.md
87ee8db3 Project changes
30e71bc9 Add ansible spinup task
60fda4bb home work changes
187feb33 project changes
2c749044 init
e06fc66d First commit

