# Homework git local

```bash
    1  git init
    2  ls
    3  ls -la
    4  touch README.md && echo "Hello World!" >> README.md
    5  cat README.md
    6  git status
    7  git add -all
    8  git add --all
    9  git status
   10  git commit -m "Init commit"
   11  git status
   12  git config --global user.email "Acawfc124@yahoo.com"
   13  git config --global user.name "Vlad"
   14  git commit -m "Init commit"
   15  git status
   16  git checkout -b feature-branch
   17  echo "Branches control test" >> README.md
   18  git add .
   19  git statsu
   20  git status
   21  git commit -m "Added description of this hometask"
   22  git status
   23  git checkout -
   24  git branch
   25  git merge feature-branch
   26  git log
   27  git log --oneline
   28  git show 7e1b390
   29  git tag v1.0 5d0cdd4
   30  git tag
   31  echo "Another change on the file" >> README.md
   32  git add -all
   33  git add --all
   34  git commit -m "v2.0 tag"
   35  git log --oneline
   36  git tag v2.0 fcaed76
   37  git checkout -b bug-fix
   38  echo "Another change on the file2" >> README.md
   39  git add --all
   40  git commit -m "Another update of README.md file"
   41  echo "Another change on the file3" >> README.md
   42  git add --all
   43  git commit -m "Another update2 of README.md file"
   44  git reset --soft HEAD~1
   45  git status
   46  git checkout -b experimental-feature
   47  echo "Another change on the file4" >> README.md
   48  git stash
   49  git branch
   50  git checkout feature-branch
   51  echo "Another change on the file5" >> README.md
   52  cat README.md
   53  git stash apply
   54  cat README.md
   55  git stash push -m "temp changes before applying stash"
   56  git stash apply stash@{1}
   57  git add .
   58  git commit
   59  git commit -m "Merge conflict"
   60  git status
   61  git stash apply
   62  git status
   63  nano README.md
   64  git add --all
   65  git commit -m "Merge conflict resolve"
   66  git status
   67  git checkout main
   68  git checkout master
   69  cat README.md
   70  git checkout feature-branch
   71  cat README.md
   72  git status
   73  git config --global alias.st status
   74  git st
   75  git config
   76  git config --global --list
   77  history
```
