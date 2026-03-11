## 02. GIT. Local
```bash
    1  cd homework/
    2  mkdir 02.\ GIT.\ Local
    3  cd 02.\ GIT.\ Local
    4  git init
    5  touch README.md
    6  echo "# Первая запись" > README.md
    7  git add README.md
    8  git commit -m "Initial commit"
    9  git branch feature-branch
   10  git checkout feature-branch
   11  echo "Задание 2: Ветки и слияние" >> README.md
   12  git add README.md
   13  git commit -m "Task 2"
   14  git checkout main
   15  git checkout master
   16  git merge feature-branch
   17  git log
   18  git log --oneline --graph --all
   19  git show HEAD
   20  git tag v1.0 HEAD~1
   21  git tag
   22  echo "Ещё изменения" >> README.md
   23  git add .
   24  git commit -m "Task 4"
   25  git tag -a v2.0 -m "Version 2"
   26  git show v1.0
   27  git show v2.0
   28  git checkout -b bug-fix
   29  echo "Правка 1" >> README.md
   30  git add .
   31  git commit -m "Fix commit 1"
   32  echo "Правка 2" >> README.md
   33  git add .
   34  git commit -m "Fix commit 2"
   35  git log --oneline
   36  git reset --soft HEAD~1
   37  git status
   38  git log --oneline
   39  git reset --mixed HEAD~1
   40  git status
   41  git log --oneline
   42  git reset --hard HEAD~1
   43  git status
   44  git log --oneline
   45  git checkout -b experimental-feature
   46  echo "Эксперимент" >> README.md
   47  git checkout master
   48  git stash
   49  git checkout master
   50  echo "Правка в мастер ветке" >> README.md
   51  git add .
   52  git commit -m "Fix"
   53  git stash pop
   54  git status
   55  git log --oneline --graph --all
   56  git config --global alias.logs "log --oneline --graph --all"
   57  git logs
   58  git config --global user.name
   59  git config --global user.email
   60  git config --list
   61  history
```