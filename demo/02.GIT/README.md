# 02. GIT

```bash
9285  clear
 9286  mkdir sa
 9287  cd sa
 9288  mkdir git
 9289  cd git
 9290  git --version
 9291  ls -la
 9292  git init
 9293  ls -la
 9294  git branch -a
 9295  git branch
 9296  git branch -r
 9297  ls -l .git
 9298  vim .git/config
 9299  git config user.name "Siarhei Pishchyk"
 9300  git config user.email "pluhin@gmail.com"
 9301  vim .git/config
 9302  git config --list
 9303  date > file.txt
 9304  cat file.txt
 9305  git status
 9306  vim .gitignore
 9307  mkdir tmp
 9308  date > tmp/file2.txt
 9309  git status
 9310  vim .gitignore
 9311  vim ~/.bashrc
 9312  git add --all
 9313  git status
 9314  git commit -m "Add first files"
 9315  vim .gitignore
 9316  git status
 9317  git commit --amend -a
 9318  git status
 9319  git log --oneline
 9320  git log --graph --all --decorate
 9321  git branch
 9322  git checkout -b "second"
 9323  ls -l
 9324  git log --oneline
 9325  git branch
 9326  date > second.txt
 9327  cat second.txt
 9328  ls -l
 9329  git add second.txt
 9330  git commit -m "Commit to the second branch"
 9331  git log --oneline
 9332  git checkout master
 9333  git merge second
 9334  git log --oneline
 9335  date >> file.txt
 9336  cat file.txt
 9337  git add --all
 9338  git commit -m "master commit"
 9339  git checkout second
 9340  date >> second.txt
 9341  cat file.txt
 9342  cat second.txt
 9343  git add --all
 9344  git commit -m "second commit"
 9345  git log --all
 9346  git log --oneline
 9347  git checkout master
 9348  git log --oneline
 9349  git checkout second
 9350  git rebase master
 9351  git log --oneline
 9352  git checkout master
 9353  vim second.txt
 9354  git add --all
 9355  git commit -m "master2 commit"
 9356  git checkout second
 9357  vim second.txt
 9358  git add --all
 9359  git commit -m "second2 commit"
 9360  git checkout master
 9361  git checkout second
 9362  git rebase master
 9363  vim second.txt
 9364  git add second.txt
 9365  git rebase --continue
 9366  vim second.txt
 9367  git add second.txt
 9368  git rebase --continue
 9369  git rebase -i HEAD~2
 9370  git log --oneline
 9371  git tag -a R1.0 -m "Rel 1"
 9372  git log --oneline
 9373  vim second.txt
 9374  git add second.txt
 9375  git commit -m "after rel 1"
 9376  vim second.txt
 9377  git add second.txt
 9378  git commit -m "after rel 2"
 9379  git tag -a R2.0 -m "Rel 2"
 9380  cat second.txt
 9381  cat second.txt | wc -l
 9382  git tag
 9383  git show R1.0
 9384  git checkout R1.0
 9385  cat second.txt | wc -l
 9386  git checkout R2.0
 9387  git checkout second
 9388  git log --oneline
 9389  git checkout master
 9390  git cherry-pick 70593d6
 9391  vim second.txt
 9392  git add --all
 9393  git log --oneline
```