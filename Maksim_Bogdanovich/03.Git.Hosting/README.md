## Homework_3: Add auto pushing in different repo

```bash
 286  cd sa.it-academy.by/Maksim_Bogdanovich/
  287  ll
  288  git status
  289  cat README.md
  290  vim README.md
  291  git add --all
  292  git commit -m 'Add backticks'
  293  git push origin
  294  cd /
  295  ls -la
  296  cd -
  297  pwd
  298  cd /c/Users/User/
  299  ls -ls
  300  cd 02.Git
  301  git branch
  302  git checkout master
  303  git remote add origin git@github.com:Maks-Bbb/DevOps.git
  304  git push -u origin --all
  305  git pull
  306  git push -u origin --all
  307  git push -u origin --all -f
  308  git status
  309  ls -l
  310  vim file.txt
  311  git add --all
  312  git commit -m 'Check notifications'
  313  git push origin
  314  git remote rename origin gitlab_origin
  315  git ramote
  316  git remote rename origin github_origin
  317  git remote rename gitlab_origin github_origin
  318  git remote
  319  git remote add origin https://gitlab.com/md-sa2-29-24/DevOps.git
  320  git remote add origin git@gitlab.com/md-sa2-29-24/DevOps.git
  321  git remote remove origin
  322  git remote add origin git@gitlab.com/md-sa2-29-24/DevOps.git
  323  git remote
  324  git push -u origin --all
  325  git push -u origin --all
  326  git push -u origin --all
  327  git remote remove origin
  328  git remote add origin git@gitlab.com/md-sa2-29-24/DevOps.git
  329  git push -u origin --all
  330  git push -u origin --all
  331  git push -u origin --all
  332  git remote remove origin
  333  git remote
  334  git remote add origin git@gitlab.com:md-sa2-29-24/DevOps.git
  335  git remote
  336  git push -u origin --all
  337  vim script.sh
  338  git remote
  339  git config --global alias.pushall 'script.sh'
  340  vim file.txt
  341  git pushall
  342  git config --global alias.pushall '!git remote | xargs -L1 git push --all'
  343  git add --all
  344  git config --global alias.pushall '!sh script.sh'
  345  git add --all
  346  git commit -m 'Add script.sh and alias pushall'
  347  git pushall
  348  history
```
