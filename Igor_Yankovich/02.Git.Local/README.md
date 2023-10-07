```bash
    1  git --version
    2  sudo apt install git
    3  git --version
    4  sudo apt update
    5  git --version
    6  pwd
    7  git --version 
    8  cd GIT
    9  cd 1
   10  ls -la
   11  mkdir GIT
   12  cd GIT/
   13  cd 02.Git.Local
   14  mkdir 02.Git.Local
   15  cd 02.Git.Local
   16  git init
   17  ls -la
   18  clear
   19  history 
   20  git config --global user.name "Igor Yankovich"
   21  git config --global user.email "irsy0304@gmail.com"
   22  touch README.md
   23  date >> README.md
   24  git add --all
   25  git commit -m "first init commit"
   26  git branch 
   27  git branch feature-branch
   28  git checkout feature-branch
   29  nano README.md 
   30  git add --all
   31  git commit -m "edit README commit"
   32  git switch HEAD
   33  git switch master 
   34  git merge feature-branch 
   35  git log --oneline 
   36  git show b337287
   37  git tag -a v1.0 -m "Version 1.0" b337287
   38  git tag
   39  nano README.md 
   40  git add --all
   41  git commit -m "next version README.md"
   42  git log --oneline 
   43  git tag -a v2.0 -m "Version 2.0"
   44  git branch bug-fix
   45  git switch bug-fix 
   46  nano README.md 
   47  git add --all
   48  git commit -m "bug-fix README.md"
   49  nano  README.md 
   50  git add --all
   51  git commit -m "bug-fix v2 README.md"
   52  git reset --hard master 
   53  git branch experimental-feature
   54  git switch experimental-feature 
   55  git stash
   56  git stash list
   57  git branch 
   58  git branch master 
   59  nano README.md 
   60  git stash
   61  git switch experimental-feature 
   62  git log --oneline 
   63  history 
```
