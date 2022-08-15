# 01git

```
286  mkdir 01git
  287  cd 01git/
  288  git init
  289  ll
  290  git config user.name "MigelAlfa"
  291  git config user.email "migelalfa@gmail.com
  292  git config user.email "migelalfa@gmail.com"
  293  nano .gitognore
  294  ll
  295  mkdir 01git
  296  cd 01git/
  297  git init
  298  git --help
  299  date > m1
  300  date > m2
  301  cat m1
  302  cat m2
  303  git add .
  304  git status 
  305  git commit -m "First commit"
  306  git -h
  307  man git
  308  git branch hotfix/we_gonna_die
  309  git branch dev
  310  git commit -m "two branch"
  311  git status 
  312  git checkout
  313  git branch -a
  314  git checkout hotfix/we_gonna_die
  315  date > m3
  316  git status
  317  git add .
  318  git 
  319  git commit -m "hotfix +1"
  320  git checkout dev
  321  date > m4
  322  date > m5
  323  git add .
  324  git commit -m "dev +2"
  325  git checkout master 
  326  git checkout dev
  327  git branch features/do_one
  328  git checkout features/do_one
  329  date > m6
  330  git add m6
  331  git commit -m "+dev+features"
  332  gitk
  333  ll
  334  sudo reboot
  335  cd 01git/
  336  ll
  337  history 
  338  git log --oneline 
  339  gitg
  340  git checkout dev
  341  git checkout master
  342  git --help 
  343  git status 
  344  git checkout master
  345  git merge dev
  346  git merge features/do_one
  347  git commit -m "M+d+f"
  348  git log --oneline
  349  git log
  350* git 
  351  git log --oneline
  352  git checkout master
  353  git cherry-pick b84695b
  354  git checkout dev
  355  git cherry-pick b84695b
  356  git checkout features/do_one
  357  git cherry-pick b84695b
  358  history 

``` 

Master
```

migel@migel:~/01git$ git log --oneline
a5ada5a (HEAD -> master) hotfix +1
f53aebb +dev+features
2da05f0 dev +2
d5274a5 First commit
c05d5ea Initial commit
```

Dev

```
migel@migel:~/01git$ git log --oneline
3145948 (HEAD -> dev) hotfix +1
2da05f0 dev +2
d5274a5 First commit
c05d5ea Initial commit
```

features/do_one

```
migel@migel:~/01git$ git log --oneline
8369199 (HEAD -> features/do_one, origin/features/do_one) hotfix +1
f53aebb +dev+features
2da05f0 dev +2
d5274a5 First commit
c05d5ea Initial commit
```

hotfix/we_gonna_die

```
migel@migel:~/01git$ git log --oneline
b84695b (HEAD -> hotfix/we_gonna_die, origin/hotfix/we_gonna_die) hotfix +1
d5274a5 First commit
c05d5ea Initial commit

```




