# Git. Local

```bash
    2  clear
    3  cat /etc/os-release
    4  clear
    5  mkdir 02.Git
    6  cd 02
    7  cd 02.Git/
    8  ls
    9  ls -la
   10  sudo apt install git
   11  git init
   12  ls -la
   13  vim .git/config
   14  git config --global init.defaultBranch master
   15  git config --global user.name "Siarhei Pishchyk"
   16  git config --global user.email "pluhin@gmail.com"
   17  git status
   18  date > file.txt
   19  cat file.txt
   20  git status
   21  git add --all
   22  git status
   23  git commit -m "Init commit"
   24  git init
   25  git logs
   26  git log
   27  git log --oneline
   28  touch system.log
   29  git status
   30  vim .gitignore
   31  git status
   32  git add --all
   33  git status
   34  git commit -m "Add gitigne"
   35  git log --oneline
   36  git commit --amend -a
   37  sudo update-alternatives --config editor
   38  git commit --amend -a
   39  git log --oneline
   40  git checkout c3522c2
   41  git log --oneline
   42  ls -la
   43  git checkout master
   44  git log --oneline
   45  ls -la
   46  git checkout c3522c2
   47  git tag -a R1.0 -m "Release 1.0"
   48  git checkout master
   49  git log --oneline
   50  git checkout R1.0
   51  git checkout master
   52  git branch
   53  git branch -a
   54  git checkout -b second2
   55  git branch -a
   56  git checkout master
   57  git checkout second2
   58  git branch -m second3
   59  git branch -a
   60  git checkout master
   61  git branch -D second3
   62  git branch -a
   63  git checkout -b second
   64  git branch -a
   65  date >> file.txt
   66  cat file.txt
   67  git add file.txt
   68  git commit -m "add commit to second"
   69  git log --oneline
   70  git checkout master
   71  git log --oneline
   72  git merge second
   73  git log --oneline
   74  cat file.txt
   75  vim file.txt
   76  git add file.txt
   77  git commit -m "add conflict master"
   78  git checkout second
   79  vim file.txt
   80  git add file.txt
   81  git commit -m "add conflict second"
   82  git rebase master
   83  vim file.txt
   84  git rebase --continue
   85  git add file.txt
   86  git rebase --continue
   87  date >> file.txt
   88  git add --all && git commit -m "commit 1"
   89  date >> file.txt
   90  git add --all && git commit -m "commit 2"
   91  date >> file.txt
   92  git add --all && git commit -m "commit 3"
   93  git log --oneline
   94  git rebase -i HEAD~3
   95  git log --oneline
   96  cat file.txt
   97  git reset --hard HEAD~1
   98  git log --oneline
   99  history
```