# 02.GIT.Local Homework Report

## Command history

```
    2  mkdir 02.GIT.Local
    3  cd 02.GIT.Local/
    4  git init
    5  git status 
    6  nano README.md
    7  git commit -m "Initial commit"
    8  git add README.md 
    9  git commit -m "Initial commit"
   10  nano index.html
   11  git add index.html 
   12  git commit -m "First commit to the master" 
   13  git log
   14  git checkout -b dev
   15  git status 
   16  ls
   17  nano index.html 
   18  git status 
   19  git add .
   20  git commit -m "First commit to the dev" 
   21  nano index.html
   22  git add .
   23  git commit -m "Second commit to the dev" 
   24  git log
   25  git checkout -b features/do_one
   26  nano style.css
   27  git add .
   28  git commit -m "First commit to the features/do_one" 
   29  nano index.html
   30  git add .
   31  git commit -m "Second commit to the features/do_one" 
   32  git log
   33  git checkout master 
   34  git status 
   35  git log
   36  git checkout -b hotfix/we_gonna_die
   37  nano index.html
   38  git status 
   39  git add .
   40  git commit -m "Hotfix commit to the hotfix/we_gonna_die" 
   41  git log
   42  git checkout master 
   43  git log
   44  git status 
   45  git log --oneline
   46  git checkout dev
   47  git status 
   48  git log --oneline
   49  git checkout features/do_one 
   50  git log --oneline
   51  git checkout dev
   52  git merge features/do_one 
   53  git log --oneline
   54  git checkout master 
   55  git merge dev 
   56  git log --oneline
   57  git status
   58  git checkout hotfix/we_gonna_die 
   59  git log --oneline
   60  git checkout master 
   61  git cherry-pick 
   62  git cherry-pick bcc55b6
   63  nano index.html 
   64  git add .
   65  git commit -m "cherry-pick hotfix to master fixed conflict"
   66  cat index.html 
   67  git log --oneline 
   68  git checkout dev 
   69  git cherry-pick bcc55b6
   70  nano index.html 
   71  git commit -m "cherry-pick hotfix to dev fixed conflict"
   72  git add .
   73  git commit -m "cherry-pick hotfix to dev fixed conflict"
   74  git checkout features/do_one 
   75  git cherry-pick bcc55b6
   76  nano index.html 
   77  git add .
   78  git commit -m "cherry-pick hotfix to frature fixed conflict"
   79  git log --oneline 
   80  git checkout dev 
   81  git log --oneline 
   82  git checkout master 
   83  git log --oneline 
   84  git checkout hotfix/we_gonna_die 
   85  git log --oneline 
   86  cd ..
   87  history > 02.git.local.history
```

## Commit log

### master branch

```
34424b2 (HEAD -> master) cherry-pick hotfix to master fixed conflict
46053f8 Second commit to the features/do_one
935f349 First commit to the features/do_one
10aafc2 Second commit to the dev
83a5dd4 First commit to the dev
72e8ead First commit to the master
3045bfe Initial commit
```

### dev branch

```
b506981 (HEAD -> dev) cherry-pick hotfix to dev fixed conflict
46053f8 Second commit to the features/do_one
935f349 First commit to the features/do_one
10aafc2 Second commit to the dev
83a5dd4 First commit to the dev
72e8ead First commit to the master
3045bfe Initial commit
```

### features/do_one branch

```
3013aa1 (HEAD -> features/do_one) cherry-pick hotfix to frature fixed conflict
46053f8 Second commit to the features/do_one
935f349 First commit to the features/do_one
10aafc2 Second commit to the dev
83a5dd4 First commit to the dev
72e8ead First commit to the master
3045bfe Initial commit
```

### hotfix/we_gonna_die branch

```
bcc55b6 (HEAD -> hotfix/we_gonna_die) Hotfix commit to the hotfix/we_gonna_die
72e8ead First commit to the master
3045bfe Initial commit
```
