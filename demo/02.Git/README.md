## History

```bash
   2  mkdir
    3  mkdir 02.Git
    4  cd 02
    5  cd 02.Git/
    6  git init
    7  ls -la
    8  git config --global user.name "Siarhei Pishchyk"
    9  git config --global user.email "pluhin@gmail.com"
   10  date > file.txt
   11  git status
   12  git add --all
   13  git status
   14  git commit -m "Init commit"
   15  git log
   16  touch system.log
   17  vim .gitignore
   18  git sta
   19  git status
   20  ls -l
   21  ls -la
   22  git add --all
   23  git commit -m "Add gitignore"
   24  git log --oneline
   25  clear
   26  date >> file.txt && git add --all && git commit -m "Add history 1"
   27  date >> file.txt && git add --all && git commit -m "Add history 2"
   28  date >> file.txt && git add --all && git commit -m "Add history 4"
   29  date >> file.txt && git add --all && git commit -m "Add history 5"
   30  git log --oneline
   31  git checkout 2641149
   32  ls
   33  cat file.txt
   34  git checkout master
   35  cat file.txt
   36  git log --o
   37  git log --oneline
   38  git tag -a R1.0 -m "Release 1.0"
   39  git log --oneline
   40  git checkout 2641149
   41  git tag -a R0.5 -m "Release 0.5"
   42  git checkout master
   43  git log --oneline
   44  git checkout R0.5
   45  git checkout R1.0
   46  git checkout master
   47  git log --oneline
   48  clear
   49  git branch
   50  git checkout -b second2
   51  git branch
   52  git checkout master
   53  git branch
   54  git branch -D second2
   55  git checkout -b second
   56  date >> file.txt && git add --all && git commit -m "Add commit to second"
   57  date >> file.txt && git add --all && git commit -m "Add commit to second 1"
   58  date >> file.txt && git add --all && git commit -m "Add commit to second 2"
   59  git log --oneline
   60  git checkout master
   61  git log --oneline
   62  git checkout -
   63  git merge second
   64  git log --oneline
   65  git branch
   66  clear
   67  vim file.txt
   68  git add --all
   69  git commit -m "Add conflict to master"
   70  git checkout second
   71  vim file.txt
   72  git add --all
   73  git commit -m "Add conflict to second"
   74  git branch
   75  sudo update-alternatives --config editor
   76  git rebase -i master
   77  git branch
   78  vim file.txt
   79  git add file.txt
   80  git rebase --continue
   81  git checkout second
   82  ls
   83  clear
   84  git log --oneline
   85  vim file.txt
   86  git status
   87  git commit --amend -a
   88  git status
   89  date >> file.txt && git add --all && git commit -m "Add 1"
   90  date >> file.txt && git add --all && git commit -m "Add 2"
   91  date >> file.txt && git add --all && git commit -m "Add 3"
   92  date >> file.txt && git add --all && git commit -m "Add 4"
   93  date >> file.txt && git add --all && git commit -m "Add 5"
   94  git log --oneline
   95  git reset --hard HEAD~2
   96  git log --oneline
   97  git rebase -i HEAD~3
   98  git log --oneline
   99  history
```
