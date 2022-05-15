 ## 02.Git.Local
 
 ```bash
 1008  mkdir 02.Git_local
 1009  cd $_
 1010  git init
 1011  git config user.name "Dziavitski Artsiom"
 1012  echo -e "*.exe\n*.log\n*.tmp\n.*" > .gitignore
 1013  fortune | cowsay > file1.txt
 1014  cat file1.txt 
 1015  git add --all
 1016  git commit -m "Commit #1 to master"
 1017  fortune | cowsay > file2.txt
 1018  git commit -m "Commit #2 to master"
 1019  git log --oneline 
 1020  git status
 1021  git checkout -b dev
 1022  fortune | cowsay > file3.txt
 1023  git add file3.txt
 1024  git commit -m "Commit #1 to dev"
 1025  fortune | cowsay > file4.txt
 1026  git add file4.txt
 1027  git commit -m "Commit #2 to dev"
 1028  git checkout -b features/do_one
 1029  fortune | cowsay -f tux > file5.txt
 1030  git add file5.txt
 1031  git commit -m "Commit #1 to features/do_one"
 1032  git checkout master
 1033  git checkout -b hotfix/we_gonna_die
 1034  fortune | cowsay -f daemon > file6.txt
 1035  git add file6.txt
 1036  git commit -m "Commit #1 to HotFix"
 1037  git log --oneline
 1038  git branch
 1039  git checkout master
 1040  git cherry-pick 4ba925b
 1041  ls -al
 1042  history |tail -n 50
 ```


---
## Master branch
```bash
fde7dfb (HEAD -> master) Commit #1 to HotFix
52edc8f Commit #2 to master
ae0693c Commit #1 to master
```


---
## dev branch
```bash
508570a (HEAD -> dev) Commit #2 to dev
2d090d6 Commit #1 to dev
52edc8f Commit #2 to master
ae0693c Commit #1 to master
```
---


## features/do_one branch
```bash
7446092 (HEAD -> features/do_one) Commit #1 to features/do_one
508570a (dev) Commit #2 to dev
2d090d6 Commit #1 to dev
52edc8f Commit #2 to master
ae0693c Commit #1 to master
```
---


## hotfix/we_gonna_die branch
```bash
4ba925b (HEAD -> hotfix/we_gonna_die) Commit #1 to HotFix
52edc8f Commit #2 to master
ae0693c Commit #1 to master
```

