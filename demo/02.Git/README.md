## Git history commnad

```bash
   12  mkdir 02.Git
   13  cd 02.Git/
   14  ls
   15  ls -la
   16  git --version
   17  git init
   18  ls -la
   19  ls -la .git/
   20  vim .git/config
   21  git config user.name "Siarhei Pishchyk"
   22  git config user.email "pluhin@gmail.com"
   23  vim .git/config
   24  git config user.name "Siarhei Pishchyk"
   25  git status
   26  cd ../
   27  git status
   28  cd 02.Git/
   29  git status
   30  date > file.txt
   31  cat file.txt
   32  git status
   33  git add --all
   34  git status
   35  git commit -m "Init commit"
   36  git status
   37  git log --oneline
   38  git log
   39  clear
   40  touch text.log .gitignore
   41  ls -la
   42  git status
   43  vim .gitignore
   44  git status
   45  git add --all
   46  git commit -m "Add gitignore"
   47  git log --oneline
   48  clear
   49  git log --oneline
   50  git checkout a4c8341
   51  ls -la
   52  git checkout HEAD
   53  ls -la
   54  git checkout master
   55  ls -la
   56  git checkout a4c8341
   57  git tag -a R1.0 -m "Release 1.0"
   58  git log --oneline
   59  git checkout master
   60  git log --oneline
   61  git checkout R1.0
   62  git log --oneline
   63  claer
   64  alias c="clear"
   65  c
   66  git checkout master
   67  git branch
   68  git branch -a
   69  git checkout -b "second"
   70  git branch -a
   71  git log --oneline
   72  git checkout master
   73  git log --oneline
   74  git checkout second
   75  git checkout second2
   76  git checkout -b second2
   77  git checkout -a
   78  git branch -a
   79  git checkout second
   80  git branch -D second2
   81  git branch -a
   82  date >> file.txt
   83  cat file.txt
   84  git add --all
   85  git commit -m "add commit to second"
   86  git log --oneline
   87  git checkout master
   88  git log --oneline
   89  git merge second
   90  cat file.txt
   91  git log --oneline
   92  vim file.txt
   93  git add --all
   94  git commit -m "conflict in master"
   95  git checkout second
   96  vim file.txt
   97  git add --all
   98  git commit -m "conflict in second"
   99  git rebase master
  100  vim file.txt
  101  git add file.txt
  102  git rebase --continue
  103  sudo update-alternatives --config editor
  104  git log --oneline
  105  date >> file.txt
  106  git add --all && git commit -m "more changes"
  107  git log --oneline
  108  vim file.txt
  109  git commit --amend -a
  110  git log --oneline
  111  git reset --hard HEAD~2
  112  git log --oneline
  113  git revert 2be92ad
  114  vim file.txt
  115  git add file.txt
  116  git revert --continue
  117  git log --oneline
  118  history
```