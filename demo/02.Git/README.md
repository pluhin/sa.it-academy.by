## 01.Git

```bash
   9  git
   10  git version
   11  clear
   12  mkdir 02.Git
   13  cd 02.Git/
   14  git init
   15  ls  -la
   16  cat .git/config
   17  git status
   18  git config --global user.name "Siarhei Pishchyk"
   19  git config --global user.email "pluhin@gmail.com"
   20  date > file.txt
   21  cat file.txt
   22  git status
   23  git add --all
   24  git status
   25  git commit -m "Init commit"
   26  git log
   27  git log --oneline
   28  touch system.log
   29  git status
   30  vim .gitignore
   31  git status
   32  git add --all
   33  git commit -m "Add gitignore"
   34  vim .gitignore
   35  git status
   36  git commit --amend --all
   37  sudo update-alternatives --config editor
   38  git commit --amend --all
   39  git log --oneline
   40  git checkout be08480
   41  git log --oneline
   42  git checkout master
   43  git log --oneline
   44  git checkout be08480
   45  date >> file.txt
   46  git status
   47  git add --all
   48  git commit -m  "test"
   49  git log
   50  git checkout master
   51  git log
   52  git status
   53  git checkout be08480
   54  git tag -a R1.0 -m "Release 1.0"
   55  git checkout master
   56  git log --oneline
   57  git checkout R1.0
   58  git checkout master
   59  git branch
   60  git checkout -b second2
   61  git branch -m second3
   62  git branch
   63  git checkout master
   64  git branch -D second3
   65  git branch
   66  git checkout -b second
   67  git branch
   68  ls
   69  git log --oneline
   70  date >> file.txt
   71  git add file.txt
   72  git commit -m "add commit to second"
   73  git log --oneline
   74  git checkout master
   75  git log --oneline
   76  git checkout -
   77  git checkout master
   78  git checkout second
   79  git checkout master
   80  git merge second
   81  git branch
   82  git log --oneline
   83  vim file.txt
   84  git add --all
   85  git commit -m "Prepare conflict for master"
   86  git checkout second
   87  vim file.txt
   88  git add --all
   89  git commit -m "Prepare conflict for second"
   90  git rebase master
   91  vim file.txt
   92  git add file.txt
   93  git rebase --continue
   94  git log --oneline
   95  date >> file.txt
   96  git add --all && git commit -m "Add commit 01"
   97  date >> file.txt
   98  git add --all && git commit -m "Add commit 02"
   99  date >> file.txt
  100  git add --all && git commit -m "Add commit 02"
  101  git log --oneline
  102  git rebase -i HEAD~3
  103  git log --oneline
  104  git reset --hard HEAD~2
  105  git log --oneline
  106  history
```