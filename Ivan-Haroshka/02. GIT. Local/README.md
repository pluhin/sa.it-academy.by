02.GIT.local
-------------
## add 2 commits in master
```bash
    $ history 
   1  git init 
    2  git config user.name "Haroshka"
    3  ls -la
    4  git config user.email "vargosclash@gmail.com"
    5  git add .
    6  git commit -m "created test02"
    7  git add .
    8  git commit -m "add file"
```
## add 2 commits in dev
```bash
   9  git checkout -b dev
   10  git add .
   11  git commit -m "add file name dev"
   12  git add .
   13  git commit -m "change file dev"
```
## add commit in features/do_one
```bash
   14  git checkout -b features/do_one
   15  git add .
   16  git commit -m "add file features/do_one"
```
## add commit in hotfix/we_gonna_die
```bash
   17  git checkout master
   18  git checkout -b hotfix/we_gonna_die
   19  git add .
   20  git commit -m "add file hotfix/we_gonna_die"
```
```bash
   21  git checkout master
   22  git merge dev
   23  git reset HEAD~
   24  git reset HEAD~
   25  git add .
   26  git commit -c ORIG_HEAD
   27  git commit -c ORIG_HEAD
   28  git reset --hard HEAD~1
```
## merge features/do_one to dev
```bash
   29  git checkout dev
   30  history
   31  git merge features/do_one
```
## merge dev to master
```bash
   32  git checkout master
   33  git merge dev
   34  git log --oneline
```
## second task
```bash 
   35  git checkout dev
   36  git log --oneline
   37  git checkout features/do_one
   38  git log --oneline
   39  git checkout hotfix/we_gonna_die
   40  git log --oneline
   41  git checkout master
   42  git merge hotfix/we_gonna_die
   43  git log --oneline
   44  git checkout dev
   45  git rebase master
   46  git log --oneline
   47  git checkout features/do_one
   48  git log --oneline
   49  git rebase dev
   50  git log --oneline
   51  history
``` 
Play of the situations number 1
-------------
## master
```bash
$ git log --oneline
f30d1cf (HEAD -> master, features/do_one, dev) add file features/do_one
cfdc236 change file dev
41b3600 add file name dev
98704e4 add file
74058ee created test02
```
## dev
```bash
$ git log --oneline 
f30d1cf (HEAD -> dev, master, features/do_one) add file features/do_one
cfdc236 change file dev
41b3600 add file name dev
98704e4 add file
74058ee created test02
```
## features/do_one
```bash
$ git log --oneline
f30d1cf (HEAD -> features/do_one, master, dev) add file features/do_one
cfdc236 change file dev
41b3600 add file name dev
98704e4 add file
74058ee created test02
```
## hotfix/we_gonna_die
```bash
$ git log --oneline
0d4e2e8 (HEAD -> hotfix/we_gonna_die) add file hotfix/we_gonna_die
98704e4 add file
74058ee created test02
```
Play of the situations number 2
-------------
## master
```bash
$ git log --oneline 
2e124bf (HEAD -> master) Merge branch 'hotfix/we_gonna_die'
0d4e2e8 (hotfix/we_gonna_die) add file hotfix/we_gonna_die
f30d1cf (features/do_one, dev) add file features/do_one
cfdc236 change file dev
41b3600 add file name dev
98704e4 add file
74058ee created test02
```
## dev
```bash
$ git log --oneline 
2e124bf (HEAD -> dev, master) Merge branch 'hotfix/we_gonna_die'
0d4e2e8 (hotfix/we_gonna_die) add file hotfix/we_gonna_die
f30d1cf (features/do_one) add file features/do_one
cfdc236 change file dev
41b3600 add file name dev
98704e4 add file
74058ee created test02
```
## features/do_one
```bash
$ git log --oneline 
2e124bf (HEAD -> features/do_one, master, dev) Merge branch 'hotfix/we_gonna_die'
0d4e2e8 (hotfix/we_gonna_die) add file hotfix/we_gonna_die
f30d1cf add file features/do_one
cfdc236 change file dev
41b3600 add file name dev
98704e4 add file
74058ee created test02
```