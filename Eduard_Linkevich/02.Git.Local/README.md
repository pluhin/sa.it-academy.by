# 02 Git demo
```bash
  501  mkdir wnr_homework2
  502  cd wnr_homework2
  503  git init
  504  ls -ltr
  505  git status
  506  git add .
  507  git commit -m 'add folder sh'
  508  git add .
  509  git commit -m 'add folder sql'
  510  git status
  511  git checkout -b dev
  512  git status
  513  git add sql/new_sql.sql
  514  git commit -m 'modify sql/new_sql.sql'
  517  git add sh/new_sh2.sh
  518  git commit -m 'modify sh/new_sh2.sh'
  519  git checkout -b features/do_one
  520  git status
  521  git add sql/new_sql.sql
  522  git commit -m 'modify sql/new_sql.sql'
  523  git checkout master
  524  git checkout -b hotfix/we_gonna_die
  525  git status
  526  git add sql/new_sql.sql
  527  git commit -m 'modify sql/new_sql.sql'
  528  git checkout master
  529  history
  530  git branch -a
  531  git merge dev
  532  git merge features/do_one
  533  git diff master hotfix/we_gonna_die
  534  git merge hotfix/we_gonna_die
Auto-merging sql/new_sql.sql
CONFLICT (content): Merge conflict in sql/new_sql.sql
Automatic merge failed; fix conflicts and then commit the result.
  535  history
  536  git checkout --ours sql/new_sql.sql
  537  git status
On branch master
Your branch is ahead of 'origin/master' by 5 commits.
  (use "git push" to publish your local commits)

You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file>..." to mark resolution)
        both modified:   sql/new_sql.sql

no changes added to commit (use "git add" and/or "git commit -a")
  538  git add sql/new_sql.sql
  539  git merge --continue
  541  git branch -a
  542  git checkout dev
  543  git merge hotfix/we_gonna_die
  544  git checkout --ours sql/new_sql.sql
  545  git add sql/new_sql.sql
  546   git merge --continue
  547  git checkout features/do_one
  548  git merge hotfix/we_gonna_die
  549  git checkout --ours sql/new_sql.sql
  550  git add sql/new_sql.sql
  551  git merge --continue 
```  