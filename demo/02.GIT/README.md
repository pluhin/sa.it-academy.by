## 02.Git

```bash
   5  sudo apt install git
    6  mkdir 02.Git
    7  cd 02.Git/
    8  git init
    9  ls -la
   10  vim .git/config
   11  git config --global init.defaultBranch master
   12  git config --global  user.name "Siarhei Pishchyk"
   13  git config --global  user.email "pluhin@gmail.com"
   14  git sttus
   15  git status
   16  date > file.txt
   17  cat file.txt
   18  git status
   19  git add --all
   20  git status
   21  git commit -m "Init commit"
   22  git log --oneline
   23  git log
   24  touch system.log
   25  ls -la
   26  git sta
   27  git status
   28  vim .gitignore
   29  git status
   30  git add --all
   31  git commit -m "Add gitignre"
   32  git log --oneline
   33  git commit --amend -a
   34  sudo update-alternatives --config editor
   35  git commit --amend -a
   36  git log --oneline
   37  clear
   38  git log --oneline
   39  git checkout 56e8d47
   40  ls -la
   41  git checkout master
   42  ls -la
   43  git checkout -
   44  git checkout master
   45  clear
   46  git checkout 56e8d47
   47  git tag -a R1.0 -m "Release 1.0"
   48  git checkout master
   49  git log --oneline
   50  git checkout R1.0
   51  git checkout master
   52  clean
   53  history
   54  clear
   55  alias c="clear"
   56  c
   57  git branch
   58  git branch -a
   59  git checkout -b second2
   60  git branch -a
   61  git checkout master
   62  git checkout second2
   63  git branch -m second3
   64  git branch -a
   65  git checkout master
   66  git branch -D second3
   67  git branch -a
   68  git checkout -b second
   69  c
   70  git log --oneline
   71  date >> file.txt
   72  cat file.txt \
   73  cat file.txt
   74  git add --all
   75  git commit -m "add commit to second"
   76  git log --oneline
   77  git checkout master
   78  git log --oneline
   79  git merge second
   80  git log --oneline
   81  cat file.txt
   82  vim file.txt
   83  git add --all
   84  git commit -m "conflict in master"
   85  git checkout second
   86  vim file.txt
   87  git add --all
   88  git commit -m "conflict in second"
   89  git rebase master
   90  vim file.txt
   91  git rebase --continue
   92  git add file.txt
   93  git rebase --continue
   94  date >> file.txt
   95  git add --all && git commit -m "commit 1"
   96  date >> file.txt
   97  git add --all && git commit -m "commit 3"
   98  date >> file.txt
   99  git add --all && git commit -m "commit 5"
  100  git log --oneline
  101  git reset --hard HEAD~2
  102  git log --oneline
  103  git reset 05e0537
  104  git log --oneline
  105  git revert c311593
  106  git add --all
  107  git commit -m "test"
  108  git log --oneline
  109  git revert c311593
  110  vim file.txt
  111  git add file.txt
  112  git log --oneline
  113  git revert 4518c0f
  114  git branch
  115  git revert
  116  git revert c311593
  117  git revert --continue
  118  git log --oneline
  119  history
```