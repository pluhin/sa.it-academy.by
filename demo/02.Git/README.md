# Demo git local

```bash
   8  mkdir 02.Git
    9  cd 02.Git/
   10  git init
   11  ls -l .git/
   12  git status
   13  git config --global user.name "Siarhei Pishchyk"
   14  git config --global user.email "pluhin@gmail.com"
   15  date > file.txt
   16  cat file.txt
   17  git status
   18  git add --all
   19  git status
   20  git commit -m "Init commit"
   21  git log
   22  git log --oneline
   23  clear
   24  touch system.log
   25  git status
   26  vim .gitignore
   27  git status
   28  git add --all
   29  git commit -m "Add gitignore file"
   30  vim .gitignore
   31  git commit --amend --all
   32  sudo update-alternatives --config editor
   33  git commit --amend --all
   34  git log --oneline
   35  git checkout d54906d
   36  ls -l
   37  ls -la
   38  git checkout master
   39  ls -la
   40  date >> file.txt
   41  git add file.txt
   42  git commit -m "commit next"
   43  date >> file.txt
   44  git add file.txt
   45  git commit -m "commit next 2"
   46  git log -on
   47  git log --oneline
   48  git checkout 3f3811a
   49  git tag -a R1.0 -m "Release 1.0"
   50  git checkout master
   51  git log --oneline
   52  git checkout R1.0
   53  git checkout -
   54  git branch
   55  git checkout -b second2
   56  git branch
   57  git checkout master
   58  git branch
   59  git branch -D second2
   60  git branch
   61  git checkout -b second
   62  git log --oneline
   63  date >> file.txt
   64  git add file.txt
   65  git commit -m "add commit to second branch"
   66  git log --oneline
   67  git checkout master
   68  git log --oneline
   69  git merge second
   70  git log --oneline
   71  git branch
   72  vim file.txt
   73  git add --all
   74  git commit -m "Prepare conflict for master"
   75  git checkout second
   76  vim file.txt
   77  git add file.txt
   78  git commit -m "Prepare conflict for second"
   79  git branch
   80  git rebase master
   81  vim file.txt
   82  git add file.txt
   83  git rebase --continue
   84  date >> file.txt && git add --all && git commit -m "Add commit 1"
   85  date >> file.txt && git add --all && git commit -m "Add commit 2"
   86  date >> file.txt && git add --all && git commit -m "Add commit 3"
   87  date >> file.txt && git add --all && git commit -m "Add commit 4"
   88  git log --oneline
   89  git rebase -i HEAD~4
   90  git log --oneline
   91  date >> file.txt && git add --all && git commit -m "Add commit 2"
   92  date >> file.txt && git add --all && git commit -m "Add commit 3"
   93  date >> file.txt && git add --all && git commit -m "Add commit 4"
   94  git log --oneline
   95  git reset --hard HEAD~3
   96  git log --oneline
   97  history
```