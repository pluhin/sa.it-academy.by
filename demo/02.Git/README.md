# 02.Git

```bash
   6  mkdir 02.Git
    7  cd 02.Git/
    8  ls
    9  cat /etc/os-release
   10  git init
   11  git branch
   12  git status
   13  cat .git/config
   14  git config --global user.name "Siarhei Pishchyk"
   15  git config --global user.email "pluhin@gmail.com"
   16  date > file.txt
   17  cat file.txt
   18  git status
   19  git add --all
   20  git status
   21  git commit -m "Init commit"
   22  git log
   23  git log --oneline
   24  touch system.log
   25  ls
   26  git status
   27  vim .gitignore
   28  git status
   29  git add --all
   30  git commit -m "Add gitignore"
   31  git commit --amend -a
   32  sudo update-alternatives --config editor
   33  git commit --amend -a
   34  vim .gitignore
   35  git commit --amend -a
   36  git log --oneline
   37  date >> file.txt
   38  git add --all
   39  git commit -m "History 1"
   40  date >> file.txt
   41  git add --all
   42  git commit -m "History 2"
   43  date >> file.txt
   44  git add --all
   45  git commit -m "History 3"
   46  git log
   47  git checkout 519300d
   48  git log --oneline
   49  git tag -a R1.0 -m "Release 1.0"
   50  git checkout master
   51  git log --all
   52  git log --oneline
   53  git checkout R1.0
   54  git checkout master
   55  ls
   56  git branch
   57  git checkout -b second2
   58  git branch
   59  git checkout -
   60  git branch
   61  git checkout master
   62  git branch -D second2
   63  git checkout -b second
   64  git log --oneline
   65  date >> file.txt
   66  git add --all
   67  git commit -m "Add commit to second"
   68  git log --oneline
   69  git checkout -
   70  git log --oneline
   71  git merge second
   72  git log --oneline
   73  git branch
   74  vim file.txt
   75  git add --all
   76  git commit -m "Add conflict in master"
   77  git checkout -
   78  vim file.txt
   79  git add --all
   80  git commit -m "Add conflict in second"
   81  git rebase master
   82  git status
   83  vim file.txt
   84  git add file.txt
   85  git rebase --continue
   86  git log --oneline
   87  git checkout -
   88  git log --oneline
   89  date >> file.txt && git add --all && git commit -m "Add commit 1"
   90  date >> file.txt && git add --all && git commit -m "Add commit 2"
   91  date >> file.txt && git add --all && git commit -m "Add commit 3"
   92  date >> file.txt && git add --all && git commit -m "Add commit 4"
   93  git log --oneline
   94  git rebase -i HEAD~4
   95  git log --oneline
   96  date >> file.txt && git add --all && git commit -m "Add commit 2"
   97  date >> file.txt && git add --all && git commit -m "Add commit 3"
   98  date >> file.txt && git add --all && git commit -m "Add commit 4"
   99  git log --oneline
  100  git reset --hard HEAD~3
  101  git log --oneline
  102  history
```