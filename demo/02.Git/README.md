# Git local

```bash
10103  git version
10104  cd Documents/git_repos/home/sa.it-academy.by/
10105  git checkout -b md-sa2-17-21
10106  git push --set-upstream origin md-sa2-17-21
10107  cd /tmp
10108  mkdir test
10109  cd test
10110  ls
10111  ls -a
10112  git init
10113  ls -la
10114  ls -l .git
10115  cat .git/config
10116  git config --list
10117  git config  user.name "Siarhei Pishchyk"
10118  git config  user.email "pluhin@gmail.com"
10119  git config --list
10120  touch file.txt
10121  ls -l 
10122  date > file.txt
10123  ls -l
10124  git status 
10125  vim .gitignore
10126  git status 
10127  mkdir temp
10128  touch temp/tmp.txt
10129  git status 
10130  ls -l
10131  git add --all
10132  git status 
10133  git commit -m "init commit"
10134  git log --oneline
10135  clear
10136  git branch -a
10137  git branch
10138  git checkout -b second
10139  git branch
10140  git checkout master
10141  git checkout second
10142  date > second.txt
10143  ls -l 
10144  git add --all
10145  git commit -m "2 in 2 commit"
10146  ls -l
10147  git log --oneline
10148  git checkout master
10149  git log --oneline
10150  ls -l
10151  git merge second
10152  ls -l
10153  git log --oneline
10154  git log --graph --all --decorate
10155  vim second.txt
10156  git add --all
10157  git commit -m "3 in 1 commit"
10158  git log --oneline
10159  git checkout second
10160  git log --oneline
10161  git rebase -i master
10162  git log --oneline
10163  vim second.txt
10164  git add --all
10165  git commit -m "4 in 2 commit"
10166  git checkout master
10167  vim second.txt
10168  git add --all
10169  git commit -m "4 in 1 commit"
10170  git checkout second
10171  git rebase -i master
10172  vim second.txt
10173  git add second.txt
10174  git rebase --continue
10175  git log --oneline
10176  !
10177  vim second.txt
10178  git add second.txt
10179  git commit -m "5 in 2 commit"
10180  vim second.txt
10181  git commit --amend -a
10182  git log --oneline
10183  git rebase -i H
10184  git rebase -i HEAD~2
10185  git log --oneline
10186  git tag -a R1.0 -m "R1 first"
10187  git tags
10188  git tag
10189  touch tag_file.txt
10190  git add --all
10191  git commit -m "next tag"
10192  git tag -a R2.0 -m "R2 first"
10193  git tag
10194  git show R1.0
10195  git show R2.0
10196  git log --oneline
10197  git checkout R1.0
10198  git log --oneline
10199  git diff ad0bdf3 b7c3042
```

---


```bash
ad0bdf3 (HEAD, tag: R1.0) 4 in 2 commit
b7c3042 (master) 4 in 1 commit
5cb8577 3 in 1 commit
343405f 2 in 2 commit
4d73fa8 init commit

```