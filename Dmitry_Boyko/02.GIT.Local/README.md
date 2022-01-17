# 02.GIT.Local

```
   54  git init
   55  git config user.email "bdmitry@gmail.com"
   56  git config user.name "Dmitry Boyko"
   57  date > 1.txt
   58  date > 2.txt
   59  git add 1.txt && git commit -m "First commit in master"
   61  git add 2.txt && git commit -m "Second commit in master"
   62  git branch dev
   63  git checkout dev
   64  ls
   65  date > 3.txt
   66  date > 4.txt
   67  git add 3.txt && git commit -m "First commit in dev branch"
   68  git add 4.txt && git commit -m "Second commit in dev branch"
   69  git branch features/do_one
   70  git checkout features/do_one
   71  nano 4.txt
   72  git commit -m "Fist commit in features/do_one branch"
   73  git add 4.txt && git commit -m "Fist commit in features/do_one branch"
   74  git checkout master
   75  git branch hotfix/we_gonna_die
   76  git checkout hotfix/we_gonna_die
   77  git log
   78  nano 2.txt
   79  git commit -a -m "First commit in hotfix/we_gonna_die branch"
   80  git checkout master
   81  git merge features/do_one
   82  git log --oneline --graph
   83  git merge hotfix/we_gonna_die
   84  cat 2.txt
   85  git rebase --onto master dev features/do_one
   86  git log --oneline --graph
   87  git rebase --onto master dev
```

## Branch master
```
*   066d9b6 (HEAD -> master, features/do_one, dev) Merge branch 'hotfix/we_gonna_die'
|\
| * 7eaf0ad (hotfix/we_gonna_die) First commit in hotfix/we_gonna_die branch
* | a325106 Fist commit in features/do_one branch
* | ec54f7a Second commit in dev branch
* | ca17359 First commit in dev branch
|/
* fdb20e8 Second commit in master
* fcf5051 First commit in master
```

## Branch dev
```
*   066d9b6 (HEAD -> dev, master, features/do_one) Merge branch 'hotfix/we_gonna_die'
|\
| * 7eaf0ad (hotfix/we_gonna_die) First commit in hotfix/we_gonna_die branch
* | a325106 Fist commit in features/do_one branch
* | ec54f7a Second commit in dev branch
* | ca17359 First commit in dev branch
|/
* fdb20e8 Second commit in master
* fcf5051 First commit in master
```

## Branch features/do_one
```
*   066d9b6 (HEAD -> features/do_one, master, dev) Merge branch 'hotfix/we_gonna_die'
|\
| * 7eaf0ad (hotfix/we_gonna_die) First commit in hotfix/we_gonna_die branch
* | a325106 Fist commit in features/do_one branch
* | ec54f7a Second commit in dev branch
* | ca17359 First commit in dev branch
|/
* fdb20e8 Second commit in master
* fcf5051 First commit in master
```
## Branch hotfix/we_gonna_die
```
* 7eaf0ad (HEAD -> hotfix/we_gonna_die) First commit in hotfix/we_gonna_die branch
* fdb20e8 Second commit in master
* fcf5051 First commit in master
```
