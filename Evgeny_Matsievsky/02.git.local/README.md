    # Bash history
	
	```bash
	4  git init
    5  git config --list
    6  git config user.name "Evgeny Matsievsky"
    7  git config user.email "nikefrike1997@mail.ru"
    8  git config --list
    9  touch file.txt
   10  git add --all
   11  git commit -m "1 commit master"
   12  date > file.txt
   13  nano file.txt
   14  git add --all
   15  git commit -m "2 commit master"
   16  git log --oneline
   17  git checkout -b dev
   18  touch file_dev.txt
   19  date > file_dev.txt
   20  git add --all
   21  git commit -m "1 commit dev"
   22  touch file_dev2.txt
   23  git add --all
   24  git commit -m "2 commit dev"
   25  git log --oneline
   26  git checkout -b features/do_one
   27  touch file_features.txt
   28  git add --all
   29  git commit -m "1 commit features"
   30  git log --oneline
   31  git checkout master
   32  git log --oneline
   33  git checkout -b hotfix/we_gonna_die
   34  touch file_hotfix.txt
   35  date > file_hotfix.txt
   36  git add --all
   37  commit -m "1 commit hotfix"
   38  git commit -m "1 commit hotfix"
   39  git log --oneline
   40  git log --oneline
   41  git checkout dev
   42  git rebase -i master
   43  git log --oneline
   44  git checkout master
   45  git log --oneline
   46  git checkout dev
   47* git rebase -i mast
   48  git log --oneline
   49  git checkout hotfix/we_gonna_die
   50  git log --oneline
   51  git checkout master
   52  git cherry-pick 7fa16c0
   53  git log --oneline
   54  git checkout dev
   55  git log --oneline
   56  git rebase master
   57  git checkout master
   58  git log --oneline
   59  git checkout dev
   60  git log --oneline
   61  git checkout features/do_one
   62  git log --oneline
   63  git rebase master
   64  git log --oneline
   65  git checkout master
   66  git rebase dev
   67  git log --oneline
   68  git rebase features/do_one
```

## MASTER commits

```bash
c92bdf5 (HEAD -> master, features/do_one) 1 commit features
20a1fb3 2 commit dev
d88d5cc 1 commit dev
bc717b6 1 commit hotfix
3815015 2 commit master
e7ac1af 1 commit master
```

## DEV commits

```bash
9b0ccbb (HEAD -> dev) 2 commit dev
c37e4fb 1 commit dev
bc717b6 1 commit hotfix
3815015 2 commit master
e7ac1af 1 commit master
```

## features/do_one commits

```bash
c92bdf5 (HEAD -> features/do_one, master) 1 commit features
20a1fb3 2 commit dev
d88d5cc 1 commit dev
bc717b6 1 commit hotfix
3815015 2 commit master
e7ac1af 1 commit master
```

## hotfix/we_gonna_die commits

```bash
7fa16c0 (HEAD -> hotfix/we_gonna_die) 1 commit hotfix
3815015 2 commit master
e7ac1af 1 commit master
```
