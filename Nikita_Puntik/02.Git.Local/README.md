  268  cd git-practice-homework/
  269  git init
  270  "DevOps Project" > README.md
  271  echo "DevOps Project" > README.md
  272  git add README.md
  273  git commit -m "Commit ADD Readme.md"
  274  git status
  275  git log --online
  276  git log --oneline
  277  git branch feature-branch
  278  git checkout feature-branch 
  279* date >> README.md 2
  280  echo "Second Commit" >> README.md 
  281  git status 
  282  git add --all 
  283  git commit -m "Add Date Readme.md"
  284  git log --oneline 
  285    git checkout main 
  286    git checkout master 
  287  cat README.md 
  288  git merge feature-branch 
  289  cat README.md 
  290  git branch -d feature-branch 
  291  cat README.md 
  292  git log 
  293  git log --oneline 
  294  git log --oneline --graph --all
  295  git log --patch
  296  git log --oneline 
  297  git show 427cldb
  298  git show 427cldb
  299  git show HEAD
  300  git log --oneline 
  301  git show 427c1db
  302  git show 427c1db
  303  git tag v1.0
  304  git log --oneline 
  305  git tag 
  306  git show v1.0 
  307  echo "Commit 3" >> README.md 
  308  date >> README.md 
  309  git status 
  310  git add README.md 
  311  git status 
  312  git commit -m "3 Commit tag"
  313  git tag -a v2.0 "Version 2.0"
  314  git tag -a v2.0 -m "Version2.0"
  315  git show tag v1.0 
  316  git show v1.0 
  317  git show v2.0 
  318  history 
  319  git show v2.0 
  320  git show v1.0 
  321  git checkout -b bugFix
  322  echo "BugFix">> README.md 
  323  git add README.md 
  324  git commit -m "1 Fix Bug"
  325  echo "BugFix 2 ">> README.md 
  326  git add README.md 
  327  git commit -m "2 Fix Bug"
  328  git log --oneline 
  329  cat README.md
  330  git reset --soft HEAD~1
  331  git status 
  332  git log --oneline 
  333  git reset HEAD~1
  334  git log --oneline 
  335  cat README.md
  336  echo "Test" > test.txt
  337  git add test.txt 
  338  git commit -m "Test Commit"
  339  git log --oneline 
  340  git reset --hard HEAD~1
  341  git status 
  342  ls 
  343  git log --oneline 
  344  cat bugFix
  345  cat README.md 
  346  git checkout master 
  347  git checkout -b experiment
  348  echo "Experiment" >> README.md 
  349  git stash 
  350  git status 
  351  cat README.md 
  352  git --one
  353  git log --oneline 
  354  git checkout main
  355  git checkout master
  356   
  357  echo "Critical" >> README.md 
  358  dit add --all
  359  git add --all
  360  git commit -m "Critical changes"
  361  git checkout experiment 
  362  git stash pop 
  363  git status 
  364  cat README.md 
  365  git stash list
  366  cat README.md 
  367  git checkout main
  368  git checkout master
  369  git commit -m "Test"
  370  git add --all
  371  git commit -m "Test"
  372* git log --oneline
  373  git checkout main
  374  git branch 
  375  git checkout master 
  376  git config --global user.name "Nikita Puntik"
  377  git config --global user.email "nikita.puntik1@gmail.com"
  378  git config --global alias.l "log --oneline"
  379  git l
 
 
