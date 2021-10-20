02.GIT.local

#Commands

```bash
  223  cd ~
  224  ls
#Create folder and init git
  225  mkdir 02.GIT.local
  226  cd 02.GIT.local
  227  git init
#Ceate first file add change git and commit
  228  vim 1.txt
  229  git add -all
  230  git add 1.txt
  231  git commit -m "Init master and frist commit"
  232  git config user.name "Sergey Kulina"
  233  git config user.email "kulinych@gmail.com"
  234  git status
#Create secon file add change git and second commit
  235  vim 2.txt
  236  ls
  237  cd 02.GIT.local
  238  ls
  239  vim 2.txt
  240  git add --all
  241  git commit -m "Second commit"
#Create branch dev
  242  git checkout -b dev
  243  vim 3.txt
  244  git add --all
  245  git commit -m "First commit on dev"
  246  vim 4.txt
  247  git add -all
  248  git add -aall
  249  git add --all
  250  git status
  251  git log --oneline
  252  git commit
#Create branch features/do_one 
  253  git checkout -b features/do_one
  254  vim 5.txt
  255  git add --all
  256  git commit -m "First commit on features"
  257  git checkout master
#Create branch hotfix/we_gonna_die
  258  git checkout -b hotfix/we_gonna_die
  259  vim hotfix.txt
  260  git add --all
  261  git commit -m "hotfix"
#Rebase features/do_one
  262  git checkout master
  263  git rebase features/do_one
  264  git log --oneline
#Merge Hotfix 
  265  git merge hotfix/we_gonna_die
  266  git checkout dev
  267  git branch
  268  git show
#Cherry-pick all branch
  269  git cherry-pick hotfix/we_gonna_die
  270  git checkout features/do_one
  271  git cherry-pick hotfix/we_gonna_die
  272  history
```
```
#Commits list `master`

25f91ea (HEAD -> master) Merge branch 'hotfix/we_gonna_die'
33992ae (hotfix/we_gonna_die) hotfix
be41f03 First commit on features
a13bf21 Second commit on dev
057e94c First commit on dev
e4e334c Second commit
0dbd6c6 Init master and frist commit

#Commits list `dev`

a68a37e (HEAD -> dev) hotfix
a13bf21 Second commit on dev
057e94c First commit on dev
e4e334c Second commit
0dbd6c6 Init master and frist commit

#Commits list `features/do_one`

679a07c (HEAD -> features/do_one) hotfix
be41f03 First commit on features
a13bf21 Second commit on dev
057e94c First commit on dev
e4e334c Second commit
0dbd6c6 Init master and frist commit

#Commits list `hotfix /we_gonna_die`

33992ae (HEAD -> hotfix/we_gonna_die) hotfix
e4e334c Second commit
0dbd6c6 Init master and frist commit
```

