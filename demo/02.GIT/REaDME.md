# GIT local

```bash
10460  git --version
10461  mkdir git_demo
10462  cd git_demo
10463  ls -la
10464  git init
10465  ls -la
10466  ls -l .git
10467  vim .git/config
10468  git config user.email "pluhin@gmail.com"
10469  git config user.name "Siarhei Pishchyk"
10470  vim .git/config
10471  git config list
10472  git config --list
10473  ls
10474  date > file.txt
10475  git status
10476  touch .env
10477  ls -l
10478  ls -la
10479  git status
10480  vim .gitignore
10481  git status
10482  vim .gitignore
10483  git add --all
10484  git status
10485  git commit -m "First commit"
10486  git log --oneline
10487  ls -l
10488  git status
10489  date >> file.txt
10490  cat file.txt
10491  git status
10492  git add --all
10493  git status
10494  git commit --amend -a
10495  git log --all
10496  git log --oneline
10497  git commit --amend -a
10498  git log --oneline
10499  git branch -a
10500  git log --all
10501  git branch -a
10502  git branch -b "second"
10503  git checkout -b "second"
10504  git branch -a
10505  ls
10506  git log --all
10507  date > second.txt
10508  git add --all
10509  git commit -m "Commit to second branch"
10510  git log --all
10511  git checkout master 
10512  git log --all
10513  git log --oneline
10514  git checkout second
10515  git log --oneline
10516  git checkout master
10517  git merge second
10518  ls -l
10519  git log --oneline
10520  vim second.txt
10521  git add --all
10522  git commit -m "Changes for rebase"
10523  git checkout second
10524  git rebase master
10525  git log --oneline
10526  git checkout master
10527  vim second.txt
10528  vim first.txt
10529  vim file.txt
10530  git add --all
10531  git commit -m "Confict in master"
10532  git checkout second
10533  vim file.txt
10534  git add .
10535  git commit -m "Confict in second"
10536  git rebase -i master
10537  vim file.txt
10538  git rebase --continue
10539  git add file.txt
10540  git rebase --continue
10541  git rebase HEAD~2
10542  git rebase -i HEAD~2
10543  git log --oneline
10544  git rebase -i HEAD~2
10545  git log --oneline
10546  git reset --hard HEAD~1
10547  git log --oneline
10548  git tag -a R1.0 -m "Rl 2"
10549  ls -l
10550  touch new_r.txt
10551  git add --all
10552  git commit -m "Next release"
10553  git tag -a R2.0 -m "Rl 2"
10554  git tag
10555  git checkout R1.0
10556  git checkout second
10557  git show R1.0


```