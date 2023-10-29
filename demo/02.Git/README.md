## 02.Git

```bash
    3  mkdir 02.Git
    4  cd 02.Git/
    5  git --version
    6  mkdir repo
    7  cd  repo/
    8  clear
    9  git init
   10  ls -la
   11  ls -la .git/
   12  vim .git/config
   13  git config --global init.defaultBranch master
   14  git status
   15  git config user.name "Siarhei Pishchyk"
   16  git config user.email "pluhin@gmail.com"
   17  date
   18  vim .git/config
   19  date > file.txt
   20  cat file.txt
   21  git status
   22  git add --all
   23  git status
   24  git commit -m "Init commit"
   25  git log --online
   26  git log --oneline
   27  git log
   28  touch text.log .gitignore
   29  ls -l
   30  ls -la
   31  git status
   32  vim .gitignore
   33  git status
   34  git add --all
   35  git status
   36  git commit -m "Add gitignore"
   37  git log --oneline
   38  ls -la
   39  git checkout 3a67eab
   40  ls -la
   41  git checkout master
   42* ls -l
   43  git checkout HEAD
   44  git log --oneline
   45  date >> file.txt
   46  git add --all
   47  git commit -m "Add more dates"
   48  git log --oneline
   49  git checkout 9c25fa4
   50  git tag -a R1.0 -m "Revision 1.0
"
   51  git tag -a R1.0 -m "Revision 1.0"
   52  git checkout HEAD
   53  git log --oneline
   54  git checkout master
   55  git log --oneline
   56  git tag
   57  git checkout R1.0
   58  git checkout master
   59  git log --oneline
   60  git branch -a
   61  git branch
   62  git checkout -b "second"
   63  git log --oneline
   64  git branch -a
   65  git checkout -b "second2"
   66* git branch -d
   67  git checkout "second"
   68  git branch -a
   69  git checkout "second2"
   70*
   71  git checkout "second"
   72  git branch -D second2
   73  date >> file.txt
   74  cat file.txt
   75  git add --all
   76  git commit -m "add commit to second"
   77  git log --oneline
   78  git checkout master
   79  git log --oneline
   80  git checkout second
   81  git checkout master
   82  git merge second
   83  git log --oneline
   84  git branch -a
   85  git checkout second
   86  git log --oneline
   87  git branch -a
   88  git checkout master
   89  vim file.txt
   90  git add --all
   91  git commit -m "conflict in master"
   92  git checkout second
   93  vim file.txt
   94  git add --all
   95  git commit -m "conflict in second"
   96  git rebase master
   97  vim file.txt
   98  git add file.txt
   99  git rebase --continue
  100  date >> file.txt
  101  git add --all
  102  git commit -m "more date"
  103  git log --oneline
  104  vim file.txt
  105  git commit --amend -a
  106  sudo update-alternatives --config editor
  107  git commit --amend -a
  108  git log --oneline
  109  git reset --hard HEAD~1
  110  git log --oneline
  111  git revert 02042f2
  112  vim file.txt
  113  git revert --continue
  114  git add file.txt
  115  git revert --continue
  116  git log --oneline
  117  cat /etc/os-release
  118  history
```