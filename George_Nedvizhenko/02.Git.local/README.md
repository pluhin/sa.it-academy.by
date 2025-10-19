    git local
    1  sudo apt-get update
    2  sudo apt-git install git-all
    3  sudo apt-get install git-all
    4  ls
    5  cd /home/g/Documents
    6  mkdir study
    7  ls
    8  cd /home/g/Documents/study/git init
    9  cd /home/g/Documents/study/
git local
   10  git init
   11  git add README.md
   12  README.md
   13  > README.md
   14  sudo nano README.md
   15  git add README.md
   16  git commit -m "Initial commit:add README file"
   17  git config --global user.email "georgenedvizenko@gmail.com"
   18  git config --global user.name "GeorgeNedvizhenko"
   19  git commit -m "Initial commit:add README file"
   20  git checkout -b feature/new-feature
   21  sudo nano README.md
   22  git commit -m "docs:update README with brief discription"
   23  git add README.md
   24  git commit -m "docs:update README with brief discription"
   25  git log
   26  git switch master
   27  git pull origin master
   28  git merge feature/new-feature
   29  git log
   30  sudo nano README.md
   31  git log -n 1
   32  git show ba1e0a
   33  git log
   34  git tag v1.0
   35  sudo nano README.md
   36  git add README.md
   37  git commit -m "init commit: README.md changes"
   38  git tag v2.0
   39  git checkout -b bug-fix
   40  sudo nano README.md
   41  git commit -m "init commit: README.md sad changes"
   42  git add README.md
   43  git commit -m "init commit: README.md sad changes"
   44  sudo nano README.md
   45  git add README.md
   46  git commit -m "init commit: README.md happy changes"
   47  git logs
   48  git log
   49  git reset --soft HEAD~1
   50  git log
   51  git commit -m "init commit: README.md happy changes"
   52  git reset --hard HEAD~1
   53  git checkout -b experemental-feature
   54  sudo nano README.md
   55  git stash
   56  git switch bug-fix
   57  sudo nano README.md
   58  git stash apply
   59  git add README.md
   60  git stash apply
   61  git commit -m "init commit: README.md changes1"
   62  git stash apply
   63  git log
   64  sudo nano README.md
   65  git switch bug-fix
   66  git status
   67  git merge
   68  git commit
   69  git add
   70  git add README.md
   71  git commit -m "init commit: README.md changes1"
   72  git status
   73  sudo nano README.md
   74  git log
   75  git config --list
   76  history
