  # 02.Git.Local
  
  ## Commands
  
```bash
  341  git init
  342  git config --global user.email "nickvab@gmail.com"
  343  git config --global user.name "nickvab"
  344  date >> file1.txt
  345  vi .gitignore
  346  git status
  347  git add --all
  348  git commit -m "first commit from master"
  349  git log --oneline
  350  date >> file2.txt
  351  git status
  352  git add --all
  353  git commit -m "second commit from master"
  354  git checkout -b dev
  355  git branch
  356  git log --oneline
  357  pwd >> file3.txt
  358  git add --all
  359  git commit -m "first commit from dev"
  360  uname -a >> file4.txt
  361  git add --all
  362  git commit -m "second commit from dev"
  363  git log --oneline
  364  git checkout -b features/do_one
  365  git log --oneline
  366  hostname >> file5.txt
  367  git add --all
  368  git commit -m "first commit from features/do_one"
  369  git log --oneline
  370  git checkout master
  371  git checkout -b hotfix/we_gonna_die
  372  echo hello >> file6.txt
  373  git status
  374  git add file6.txt
  375  git commit -m "first commit from hotfix/we_gonna_die"
  376  git log --oneline
```
  ## "Play" 
  
  ### Merge

```bash 
  377  git checkout master
  378  git merge devgit merge features/do_one
  379  git merge features/do_one
  380  git log --oneline
  381  git checkout features/do_one 
  382  git log --oneline
  383  git checkout master 
  384  git checkout hotfix/we_gonna_die 
  385  git log --oneline
```
  ### Cherry-pick
  
```bash   
  386  git checkout master 
  387  git cherry-pick a807094
  388  git log --oneline
  389  git checkout dev
  390  git cherry-pick a807094
  391  git checkout features/do_one 
  392  git cherry-pick a807094
  393  git log --oneline
  394  history
```
  ## LOGS 
    
  ### master

```bash
  VNL@adminpc1:~/LEARN/git/02.Git.Local$ git checkout master 
  VNL@adminpc1:~/LEARN/git/02.Git.Local$ git log --oneline
  c1c3641 (HEAD -> master) first commit from hotfix/we_gonna_die
  5cd6325 first commit from features/do_one
  2d9bf2d second commit from dev
  64632f8 first commit from dev
  3d4415c second commit from master
  7f008fd first commit from master
```
  
  ### dev

```bash
  VNL@adminpc1:~/LEARN/git/02.Git.Local$ git checkout dev
  VNL@adminpc1:~/LEARN/git/02.Git.Local$ git log --oneline
  b0d46c5 (HEAD -> dev) first commit from hotfix/we_gonna_die
  2d9bf2d second commit from dev
  64632f8 first commit from dev
  3d4415c second commit from master
  7f008fd first commit from master
```

  ### features/do_one

```bash
  VNL@adminpc1:~/LEARN/git/02.Git.Local$ git checkout features/do_one 
  VNL@adminpc1:~/LEARN/git/02.Git.Local$ git log --oneline
  4a3bc86 (HEAD -> features/do_one) first commit from hotfix/we_gonna_die
  5cd6325 first commit from features/do_one
  2d9bf2d second commit from dev
  64632f8 first commit from dev
  3d4415c second commit from master
  7f008fd first commit from master
```
  
  ### hotfix/we_gonna_die

```bash
  VNL@adminpc1:~/LEARN/git/02.Git.Local$ git checkout hotfix/we_gonna_die 
  VNL@adminpc1:~/LEARN/git/02.Git.Local$ git log --oneline
  a807094 (HEAD -> hotfix/we_gonna_die) first commit from hotfix/we_gonna_die
  3d4415c second commit from master
  7f008fd first commit from master
```
  

