## Git local

## History

```bash
    1  ls
    2  cd Documents/
    3  mkdir Git
    4  cd Git
    5  mkdir 02.GIT.Local
    6  cd 02.GIT.Local/
    7  git init
    8  git config --global user.email "zakaz.belon@gmail.com" git config --global user.email "zakaz.belon@gmail.com"
    9  git config --global user.email "zakaz.belon@gmail.com"
   10  git config --global user.name "Andrei Luchanok"
   11  nano 1.txt
   12  git commit -m "first commit"
   13  git add --all
   14  git commit -m "first commit"
   15  nano 2.txt
   16  git add --all
   17  git commit -m "second commit"
   18  git checkout -b dev 
   19  git log --oneline
   20  nano 2.txt
   21  git add --all
   22  git commit -m "3 commit"
   23  nano 1.txt
   24  git add --all
   25  git commit -m "4 commit"
   26  git checkout -b features/do_one
   27  nano feat.txt
   28  git add --all
   29  git commit -m "5 commit"
   30  git checkout master
   31  git checkout -b hotfix/we_gonna_die
   32  nano 6.txt
   33  git add --all
   34  git commit -m "6 commit"
   35  git status
   36  git log --oneline
   37  git checkout master
   38  git merge dev 
   39  git merge features/do_one
   40   git log --oneline
   41  git branch dev 
   42  git checkout dev 
   43  git checkout master
   44  git merge hotfix/we_gonna_die
   45  git checkout dev 
   46  git merge hotfix/we_gonna_die
   47   git log --oneline
   48   git checkout features/do_one 
   49  git merge hotfix/we_gonna_die 
   50  history >> README.md
```

## Branches and commits:

## master

```bash
f9339ed Merge branch 'hotfix/we_gonna_die'
8b22f43 6 commit
a1ecb79 5 commit
aa5c719 4 commit
bb67d57 3 commit
d23f8c3 second commit
e21a3bc first commit
```

## dev

```bash
9ae1b3d Merge branch 'hotfix/we_gonna_die' into dev
8b22f43 6 commit
aa5c719 4 commit
bb67d57 3 commit
d23f8c3 second commit
e21a3bc first commit
```

## features/do_one

```bash
59b522a Merge branch 'hotfix/we_gonna_die' into features/do_one
8b22f43 6 commit
a1ecb79 5 commit
aa5c719 4 commit
bb67d57 3 commit
d23f8c3 second commit
e21a3bc first commit
```

## hotfix/we_gonna_die

```bash
8b22f43 6 commit
d23f8c3 second commit
e21a3bc first commit
```
