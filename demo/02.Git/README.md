## 02.Git

```bash
    1  sudo -i
    2  clear
    3  alias  c="clear"
    4  c
    5  vim .bashrc
    6  mkdir 02.Git
    7  cd 02.Git/
    8  c
    9  pwd
   10  git
   11  git --version
   12  free
   13  cat /proc/cpuinfo
   14  clear
   15  git init
   16  ls -a
   17  ls -la .git/config
   18  vim .git/config
   19  git config user.name "Siarhei Pishchyk"
   20  git config user.email "pluhin@gmail.com"
   21  vim .git/config
   22  git status
   23  date > file.txt
   24  git status
   25  git add --all
   26  git status
   27  git commit -m "Init commit"
   28  git sta
   29  git status
   30  git log --oneline
   31  git log
   32  vim text.log
   33  ls -la
   34  git status
   35  vim .gitignore
   36  git status
   37  git add --all
   38  git commit -m "Add gitignotre"
   39  git log --oneline
   40  git checkout 5805b0d
   41  git log --oneline
   42  git checkout 4641e10
   43  git checkout master
   44  git log --oneline
   45  git checkout 5805b0d
   46  git tag -a R1.0 -m "Release 1.0"
   47  git log --oneline
   48  git checkout master
   49  git log --oneline
   50  git checkout R1.0
   51  c
   52  git checkout master
   53  git branch
   54  git checkout -b second2
   55  git checkout master
   56  git branch -D second2
   57  git checkout master
   58  git branch
   59  git branch -b second
   60  git checkout  -b second
   61  git log --oneline
   62  git branch
   63  date >> file.txt
   64  cat file.txt
   65  git add -m "add commit to second"
   66  git add
   67  git add --all
   68  git commit  -m "add commit to second"
   69  git log --oneline
   70  git checkout master
   71  git log --oneline
   72  git merge second
   73  git log --oneline
   74  vim file.txt
   75  git add --all
   76  git commit -m "conflict in master"
   77  git checkout second
   78  vim file.txt
   79  git add --all
   80  git commit -m "conflict in second"
   81  git rebase master
   82  vim file.txt
   83  git add file.txt
   84  git rebase --continue
   85  git log --oneline
   86  vim file.txt
   87  git commit --amend -a
   88  sudo update-alternatives --config editor
   89  git commit --amend -a
   90  git reset --hard HEAD~2
   91  git log --oneline
   92  git checkout master
   93  git log --oneline
   94  git revert 7a53073
   95  vim file.txt
   96  git add file.txt
   97  git revert --continue
   98  git log --oneline
   99  git revert --abort
  100  git log --oneline
  101  git revert 4641e10
  102  git log --oneline
  103  history
```