## Git. Local work

```bash
    4  mkdir 02.Git
    5  cd 02.Git/
    6  ls
    7  ls -la
    8  git init
    9  ls -la
   10  git config --global user.name "Siarhei Pishchyk"
   11  git config --global user.email "pluhin@gmail.com"
   12  git branch
   13  git branch -a
   14  date > file.txt
   15  git branch -a
   16  git status
   17  git add --all
   18  git status
   19  git commit -m "Init commit"
   20  git log
   21  git log --oneline
   22  git branch -a
   23  touch system.log
   24  git status
   25  vim .gitignore
   26  git status
   27  git add --all
   28  git commit -m "Add gitignore"
   29  git log --oneline
   30  date >> file.txt
   31  cat file.txt
   32  git add --all && git commit -m "Add history 1"
   33  date >> file.txt
   34  git add --all && git commit -m "Add history 2"
   35  date >> file.txt
   36  git add --all && git commit -m "Add history 3"
   37  git log --oneline
   38  git checkout 1e48ada
   39  git log --oneline
   40  git checkout master
   41  git log --oneline
   42  git checkout 1e48ada
   43  git tag -a R1.0 -m "Release 1.0"
   44  git checkout master
   45  git log --oneline
   46  git checkout R1.0
   47  git branch
   48  git checkout master
   49  git checkout -b second2
   50  git branch
   51  git checkout master
   52  git branch
   53  git branch -D second2
   54  git checkout -b second
   55  date >> file.txt
   56  git add --all
   57  git commit -m "Changes in second branch"
   58  git log --oneline
   59  git checkout master
   60  git log --oneline
   61  git checkout -
   62  git merge second
   63  git log --oneline
   64  vim file.txt
   65  git add --all
   66  git commit -m "Add conflict in master"
   67  git checkout second
   68  vim file.txt
   69  git add --all
   70  git commit -m "Add conflict in second"
   71  git rebase -i master
   72  sudo update-alternatives --config editor
   73  git rebase --abort
   74  git rebase -i master
   75  vim file.txt
   76  git add file.txt
   77  git rebase --continue
   78  git log --oneline
   79  git checkout master
   80  git merge second
   81  date >> file.txt && git add --all && git commit -m "Add commit 1"
   82  date >> file.txt && git add --all && git commit -m "Add commit 2"
   83  date >> file.txt && git add --all && git commit -m "Add commit 3"
   84  date >> file.txt && git add --all && git commit -m "Add commit 4"
   85  git log --oneline
   86  git rebase -i HEAD~2
   87  git log --oneline
   88  git rebase -i HEAD~2
   89  git reset --hard HEAD~1
   90  git log --oneline
   91  history
```