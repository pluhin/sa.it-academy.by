## GIT commands   
   ```bash
    5  git config --global user.name "Anton Bartoshevich"
    6  git config --global user.email "anton-bartas@mail.ru"
    246  echo "Hello world" > file1.txt
    247  git status
    248  git add .
    249  git commit -m "The first commit from master"
    250  echo "Hello GIT" > file1.txt
    251  git status
    252  git add .
    253  git commit -m "The second commit from master"
    254  git log --oneline 
    255  git checkout -b dev
    256  git branch
    257  echo "Some code created by developers" > devfile1.txt
    258  git status
    259  git add .
    260  git commit -m "The first commit from dev"
    261  echo "Some bugfixes in the code created by developers" > devfile1.txt 
    262  git status
    263  git add .
    264  git commit -m "The second commit from dev"
    265  git log --oneline 
    266  git branch
    267  git checkout -b features/do_one
    268  echo "Some new strings in the code" > featfile.txt
    269  git add .
    270  git commit -m "The first commit from features/do_one"
    271  echo "Some changes in the code" > featfile.txt
    272  git add .
    273  git commit -m "The second commit from features/do_one"
    274  git log --oneline 
    275  git checkout master 
    276  git checkout -b hotfix/we_gonna_die
    277  echo "Some fixes in code" > fixfile.txt
    278  git add .
    279  git commit -m "The commit from hotfix"
    280  git checkout master
    281  git merge dev
    282  git merge features/do_one 
    283  git cherry-pick hotfix/we_gonna_die 
    284  git checkout dev
    285  git cherry-pick hotfix/we_gonna_die 
    286  git checkout features/do_one 
    287  git cherry-pick hotfix/we_gonna_die
    288  git checkout master
```
______________________
## Master log output
```bash
37e2acb (HEAD -> master) The commit from hotfix
475ccba The second commit from features/do_one
47da241 The first commit from features/do_one
03bc672 The second commit from dev
a7581e5 The first commit from dev
cfe4ab1 The second commit from master
557b5a1 First commit from master
```
_________________
## Dev log output
```bash
31d7e4d (HEAD -> dev) The commit from hotfix
03bc672 The second commit from dev
a7581e5 The first commit from dev
cfe4ab1 The second commit from master
557b5a1 First commit from master
```
________________
## Features/do_one log output
```bash
19337b3 (HEAD -> features/do_one) The commit from hotfix
475ccba The second commit from features/do_one
47da241 The first commit from features/do_one
03bc672 The second commit from dev
a7581e5 The first commit from dev
cfe4ab1 The second commit from master
557b5a1 First commit from master
```
___________________