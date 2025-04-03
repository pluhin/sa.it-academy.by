## Git local

History

```bash
    2  clear
    3  ls -l
    4  mkdir 02.Git
    5  cd 02.Git/
    6  git init
    7  ls -l .git/
    8  git status
    9  cd ../
   10  git status
   11  cd 02.Git/
   12  git config --global init.defaultBranch master
   13  git config --global user.name "Siarhei Pishchyk"
   14  git config --global user.email "pluhin@gmail.com"
   15  git status
   16  date > file.txt
   17  cat file.txt
   18  git status
   19  git add --all
   20  git status
   21  git commit -m "Init commit"
   22  git log
   23  git log --oneline
   24  touch system.log
   25  git status
   26  vim .gitignore
   27  cat .gitignore
   28  vim .gitignore
   29  git status
   30  cat .gitignore
   31  git add --all
   32  git commit -m "Add gitignore"
   33  git log --oneline
   34  git commit --amend -a
   35  sudo update-alternatives --config editor
   36  git commit --amend -a
   37  git log --oneline
   38  vim file.txt
   39  git commit --amend -a
   40  git log --oneline
   41  git checkout 7e72e1c
   42  git log --oneline
   43  ls -l
   44  git checkout master
   45  ls -l
   46  ls -la
   47  git log --oneline
   48  git checkout 7e72e1c
   49  git tag -a R1.0 -m "Release 1.0"
   50  git checkout master
   51  git log --oneline
   52  git checkout R1.0
   53  git checkout master
   54  git log --oneline
   55  clear
   56  git branch
   57  git branch -a
   58  git checkout -b second2
   59  git branch
   60  git branch -m second3
   61  git branch
   62  git checkout master
   63  git checkout -
   64  git branch -D second3
   65  git checkout -b second
   66  git branch
   67  date >> file.txt
   68  cat file.txt
   69  git add file.txt
   70  git commit -m "add commit to second"
   71  git log --oneline
   72  git checkout master
   73  git log --oneline
   74  git checkout -
   75  git checkout master
   76  git merge second
   77  git log --oneline
   78  vim file.txt
   79  git add file.txt
   80  git commit -m "add conflict to master"
   81  git checkout second
   82  git add file.txt
   83  vim file.txt
   84  git add file.txt
   85  git commit -m "add conflict to second"
   86  git rebase master
   87  vim file.txt
   88  git log --oneline
   89  git branch
   90  git add file.txt
   91  git rebase --continue
   92  date >> file.txt
   93  git add --all && git commit -m "Add commit 1"
   94  date >> file.txt
   95  git add --all && git commit -m "Add commit 2"
   96  date >> file.txt
   97  git add --all && git commit -m "Add commit 3"
   98  git log --oneline
   99  git reset --hard HEAD~1
  100  git log --oneline
  101  date >> file.txt
  102  git add --all && git commit -m "Add commit 3"
  103  git revert b9526cc
  104  git log --oneline
  105  git rebase -i HEAD~4
  106  git log --oneline
  107  history

```