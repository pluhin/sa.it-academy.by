  #history

  ```bash
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
```

  
### master log --oneline

```bash

5d5dcede (HEAD -> master) 1 commit we_gonna_die
4af4be61 dz 1
ec21a32b 1
91ecce02 1
6412f7a2 1
dadb0fdd delete
f3e9d73a number one
a7c32e23 number one
bd1e193f number one
3d08bd70 number one
6ea6d830 number 1
45d74ea2 readme
fe8b6ad2 (origin/dev) 2 commit dev
d28fa444 1 commit dev
2e30fc55 2 commit master
8c9a5ca7 1 commit master

```

### dev log --oneline

```bash

8af3c634 (HEAD -> dev) 1 commit we_gonna_die
fe8b6ad2 (origin/dev) 2 commit dev
d28fa444 1 commit dev
2e30fc55 2 commit master
8c9a5ca7 1 commit master


```

### features/do_one log --oneline

```bash

75acc559 (HEAD -> features/do_one) 1 commit we_gonna_die
23c24c1b (origin/features/do_one) 1 commit features/do_one
fe8b6ad2 (origin/dev) 2 commit dev
d28fa444 1 commit dev
2e30fc55 2 commit master
8c9a5ca7 1 commit master

```

### hotfix/we_gonna_die log --oneline

```bash
28b76a6f (HEAD -> hotfix/we_gonna_die, origin/hotfix/we_gonna_die) 1 commit we_gonna_die
2e30fc55 2 commit master
8c9a5ca7 1 commit master
```

