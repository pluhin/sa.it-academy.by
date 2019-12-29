```bash
 393  ll
  394  git init
  395  echo "1.2. version">>file.log
  396  git add *
  397  git commit -m "new project"
  398  echo "1.3. version">>file.log
  399  git add *
  400  git commit -m "added 1.3v"
  401  git branch dev
  402  git checkout dev
  403  echo "1.4. version">>file.log
  404  git add *
  405  git commit -m "added 1.4v"
  406  echo "1.5. version">>file.log
  407  git add *
  408  git commit -m "added 1.5v"
  409  git branch features/do_one
  410  git checout features/do_one
  411  git checkout features/do_one
  412  echo "1.6. version">>file.log
  413  git add *
  414  git commit -m "added 1.6v"
  415  git log
  416  cat file.log
  417  git checkout master
  418  git branch hotfix/we_gonna_die
  419  git checkout hotfix/we_gonna_die
  420  git log
  421  vim file.log
  422  echo "1.4. version">>file.log
  423  echo "1.5. version">>file.log
  424  echo "1.6. version">>file.log
  425  echo "1.7. version">>file.log
  426  git add *
  427  git commit -m "final version"
  428  git log
  429  git branch -a
  430  git checkout dev
  431  git merge features/do_one
  432  git checkout master
  433  git merge dev
  434  cat file.log
  435  git cherry-pick hotfix/we_gonna_die
  436  cat file.log
  437  vim file.log
  438  git commit -a
  439  git log
  440  git checkout dev
  441  git cherry-pick master
  442  git checkout features/do_one
  443  git cherry-pick master
  444  cat file.log


```
