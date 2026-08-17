## History

```bash
    6  cat /etc/os-release
    7  mkdir 02.Git
    8  cd 092
    9  cd 02.Git/
   10  ls
   11  git init
   12  git config --global user.name "Siarhei Pishchyk"
   13  git config --global user.email "pluhin@gmail.com"
   14  ls -la
   15  cat .git/config
   16  date > file.txt
   17  git status
   18  git add --all
   19  git status
   20  git commit -m "Init commit"
   21  git status
   22  git log
   23  git log --oneline
   24  touch system.log
   25  git status
   26  vim .gitignore
   27  git status
   28  git add --all
   29  git commit -m "Add gitignore"
   30  git log --oneline
   31  clear
   32  date >> file.txt && git add --all && git commit -m "Add history 1"
   33  date >> file.txt && git add --all && git commit -m "Add history 2"
   34  date >> file.txt && git add --all && git commit -m "Add history 3"
   35  date >> file.txt && git add --all && git commit -m "Add history 4"
   36  git log --oneline
   37  git checkout ea6a2f9
   38  git log --oneline
   39  git checkout master
   40  git log --oneline
   41  git tag -a R1.0 -m "Release 1.0"
   42  git log --oneline
   43  git checkout ea6a2f9
   44  git tag -a R0.0 -m "Release 0.0"
   45  git checkout master
   46  git log --oneline
   47  git checkout R0.0
   48  git checkout master
   49  git log --oneline
   50  git branch -a
   51  clear
   52  git branch -a
   53  git checkout -b second2
   54  git branch
   55  git log
   56  git log --oneline
   57  git checkout master
   58  git branch -D second2
   59  git checkout -b second
   60  date >> file.txt && git add --all && git commit -m "Add commit ot second"
   61  git log --oneline
   62  git checkout master
   63  git log --oneline
   64  git checkout -
   65  git checkout master
   66  git merge second
   67  git log --oneline
   68  git branch
   69  vim file.txt
   70  git add --all
   71  git commit -m "Add conflict to master"
   72  cat file.txt
   73  git checkout second
   74  vim file.txt
   75  git add --all
   76  git commit -m "Add conflict to second"
   77  sudo update-alternatives --config editor
   78  git rebase -i master
   79  vim file.txt
   80  git rebase --continue
   81  git add file.txt
   82  git rebase --continue
   83  git branch
   84  git log --oneline
   85  git checkout master
   86  git merge second
   87  cat file.txt
   88  date >> file.txt && git add --all && git commit -m "Add history 10"
   89  date >> file.txt && git add --all && git commit -m "Add history 12"
   90  date >> file.txt && git add --all && git commit -m "Add history 14"
   91  git commit  --amend -a
   92  git log --oneline
   93  vim file.txt
   94  git commit  --amend -a
   95  git reset --hard HEAD~2
   96  git log --oneline
   97  history
```