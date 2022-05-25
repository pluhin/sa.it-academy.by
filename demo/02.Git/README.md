## Git demo

```bash
    1  clear
    2  sudo apt update
    3  sudo apt install git vim
    4  clear
    5  git --version
    6  mkdir 02.Git
    7  cd 02.Git/
    8  ls
    9  ls -la
   10  git init
   11  ls -la
   12  ls -l .git/
   13  git status
   14  vim .git/config
   15  git config user.name "Siarhei P"
   16  git config user.email "pluhin@gmail.com"
   17  vim .git/config
   18  date > first.txt
   19  cat first.txt
   20  git status
   21  vim .gitignore
   22  git status
   23  touch .env
   24  git status
   25  git add --all
   26  git status
   27  git commit -m "Init commit"
   28  git log --oneline
   29  date >> first.txt
   30  cat first.txt
   31  git status
   32  git add --all
   33  git commit -m "Second commit"
   34  git log --oneline
   35  vim first.txt
   36  git status
   37  git commit --amend  -a
   38  sudo apt install bash-completion
   39  sudo update-alternatives --config editor
   40  cd 02.Git/
   41  ls -l
   42  git commit --amend -a
   43  git log --oneline
   44  git branch
   45  git checkout -b second
   46  git branch
   47  git log --oneline
   48  git checkout master
   49  git branch -D second
   50  git branch
   51  git checkout -b second
   52  git branch
   53  date >> second.txt
   54  git status
   55  git add second.txt
   56  git commit -m "First commit to second branch"
   57  git log --oneline
   58  git merge master
   59  git checkout master
   60  git merge second
   61  git log --oneline
   62  git checkout second
   63  git log --onq
   64  git log --oneline
   65  vim first.txt
   66  git add --all
   67  git commit -m "Commit in master for conflict"
   68  git checkout second
   69  git commit --amend -a
   70  git log --oneline
   71  git checkout master
   72  vim first.txt
   73  git add --all
   74  git commit -m "Commit in master for conflict"
   75  git checkout second
   76  git rebase master
   77  vim first.txt
   78  git status
   79  git add first.txt
   80  git rebase --continue
   81  git log --oneline
   82  git branch
   83  git rebase HEAD~2
   84  git rebase -i HEAD~2
   85  git log --oneline
   86  clear
   87  git log --oneline
   88  ls -l
   89  git checkout 04c2d6d
   90  ls -l
   91  git checkout second
   92  ls -l
   93  git checkout 04c2d6d
   94  git tag -a R1.0 -m "My first release"
   95  git checkout second
   96  git checkout R1.0
   97  ls -l
   98  history
```

---

## Header

Text
