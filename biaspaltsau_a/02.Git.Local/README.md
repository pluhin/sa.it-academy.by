## 02.Git.Local
'''
   38  git clone https://github.com/MsWik/sa.it-academy.by
   39  ls
   40  git init
   41  date >> l.txt
   42  git add --all
   44  git commit -m "1 commit"
   45  date >> 2.txt
   46  git add --all
   47  git commit -m "2 master commit"
   48  git checkout -b dev
   49  git log
   50  date >> 3.txt
   51  git commit -m "1 dev commit"
   52  git add --all
   53  git commit -m "1 dev commit"
   54  date >> 4.txt
   55  git add --all
   56  git commit -m "2 dev commit"
   57  git checkout -b features
   58  git log
   59  date >> 5.txt
   60  git add --all
   61  git commit -m "1 features commit"
   63  git checkout master
   64  date >> 6.txt
   65  git checkout -b hotfix
   66  date >> 6.txt
   68  git add --all
   69  git commit -m "1 hotfix commit"
   70  git checkout master
   75  git merge dev
   76  git merge features
   77  git log
   81  git merge hotfix
   82  git checkout dev
   83  git merge hotfix
   84  git merge features
   85  git checkout features
   86  git merge hotfix
   87  history


'''
## FINAL


































# Home Task 02.Git.Local

##List of commands for task completion provided below:

```
  173  mkdir testForFirst
  174  cd testForFirst/
  175  git init
  176  git status
  177  "first file" > firstFile.txt
  178  echo "first file" > firstFile.txt
  179  cat firstFile.txt 
  180  git status
  181  git add *
  182  git status
  183  git commit -m "First commit to master"
  184  git status
  185  git config user.name "Sergei Koltochihin"
  186  git config user.email "sergey.koltochihin@gmail.com"
  187  git commit -m "First commit to master"
  188  echo "second file" > secondFile.txt
  189  git status
  190  git add *
  191  git commit -m "Second commit to master"
  192  ls -l
  193  git status
  194  git ckeckout -b "dev"
  195  git checkout -b "dev"
  196  git status
  197  echo "First file on dev" > firstFileDev.txt
  198  git status
  199  git add *
  200  git reset --hard master
  201  git status
  202  ls
  203  git checkout -b "features/do_one"
  204  git status
  205  git branch -d features/do_one
  206  git checkout master
  207  git branch -d features/do_one
  208  git log
  209  git checkout dev
  210  git status
  211  git log
  212  git status
  213  echo "First file on dev" > firstFileDev.txt
  214  git status
  215  git add *
  216  git commit -m "First additional commit to dev"
  217  echo "Second file on dev" > secondFileDev.txt
  218  git status
  219  git add *
  220  git commit -m "Second additional commit to dev"
  221  git log
  222  git checkout -b "features/do_one"
  223  git status
  224  echo "First file on features" > firstFileFeatures.txt
  225  git status
  226  git log
  227  git status
  228  git add *
  229  git commit -m "First additional commit to features"
  230  git checkout master
  231  git status
  232  git checkout -b "hotfix/we_gonna_die"
  233  git tatus
  234  git status
  235  echo "First file on hotfix" > firstFileHotfix.txt
  236  git status
  237  git add *
  238  git commit -m "First additional commit to hotfix"
  239  git status
  240  git log
  241  git status
  242  git checkout master 
  243  git status
  244  git merge features/do_one
  245  git status
  246  git log
  247  git status
  248  git checkout hotfix/we_gonna_die 
  249  git status
  250  git log
  251  git log --oneline 
  252  git checkout master 
  253  git status
  254  git cherry-pick 11d1167
  255  git status
  256  git log
  257  git log --oneline 
  258  git checkout dev 
  259  git cherry-pick 11d1167
  260  git checkout features/do_one 
  261  git cherry-pick 11d1167
  262  git checkout master 
  263  git status
  264  git log --oneline 
  265  git checkout dev
  266  git log --oneline 
  267  git status
  268  git checkout features/do_one 
  269  git log --oneline 
  270  git checkout hotfix/we_gonna_die 
  271  git log --oneline 
  272  history
```

##Git log of all branches

###master

```
git log --oneline 
d39f64e (HEAD -> master) First additional commit to hotfix
8755141 First additional commit to features
1ae83e4 Second additional commit to dev
bf029b8 First additional commit to dev
75af262 Second commit to master
39a60b4 First commit to master
```

###dev

```
git log --oneline 
3209f38 (HEAD -> dev) First additional commit to hotfix
1ae83e4 Second additional commit to dev
bf029b8 First additional commit to dev
75af262 Second commit to master
39a60b4 First commit to master
```

###features/do_one

```
git log --oneline 
a908fe2 (HEAD -> features/do_one) First additional commit to hotfix
8755141 First additional commit to features
1ae83e4 Second additional commit to dev
bf029b8 First additional commit to dev
75af262 Second commit to master
39a60b4 First commit to master
```

###hotfix/we_gonna_die

```
git log --oneline 
11d1167 (HEAD -> hotfix/we_gonna_die) First additional commit to hotfix
75af262 Second commit to master
39a60b4 First commit to master
```