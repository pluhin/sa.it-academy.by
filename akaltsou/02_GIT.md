```
  268  git init
  269  touch first.txt
  270  echo 'content of first file' > first.txt 
  271  cat first.txt 
  272  git add .
  273  git status
  274  git commit -m "first commit in master"
  275  touch second.txt
  276  echo 'content of second file' > second.txt 
  277  git add second.txt 
  278  git commit -m "second commit to master"
  279  git log
  280  git checkout -b dev
  281  touch third.txt
  282  echo 'content of third file' > second.txt 
  283  echo 'content of third file' > third.txt 
  284  git add third.txt 
  285  git commit -m "first commit to dev"
  286  git log --graph --all --decorate
  287  echo "just another line" >> third.txt 
  288  cat third.txt 
  289  commit -m "second commit to dev"
  290  git log --graph --all --decorate
  291  git status
  292  git add .
  293  git commit -m "second commit to dev"
  294  git log --graph --all --decorate
  295  git checkout -b feature/do_one
  296  touch do_one_feature.php
  297  echo <?php echo 'Hello World?'; > do_one_feature.php 
  298  echo "<?php echo 'Hello World?';" > do_one_feature.php 
  299  git add .
  300  git commit -m "first commit to feature branch"
  301  git checkout master 
  302  git chekout -b hotfix/we_gonna_die
  303  git checkout -b hotfix/we_gonna_die
  304  echo "<?php echo 'We gonna die. Soon.'" > hotfix.php
  305  cat hotfix.php 
  306  git add .
  307  git commit -m "commit to hotfix branch with a bit of self-irony"
  308  git log --graph --all --decorate
  309  git checkout master 
  310  git checkout dev 
  311  git merge feature/do_one 
  312  git checkout master 
  313  git merge dev
  314  git log --graph --all --decorate
  315  git merge hotfix/we_gonna_die 
  316  git log --graph --all --decorate
  317  history > history.txt
```