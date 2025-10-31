# Homework Assignment 1: Initializing a Local Repository
   1  git init
   2  touch README.md 
   4  date >> README.md
   5  git add README.md 
   6  git commit -m "added README.md" 
   7  git log --oneline
# Homework Assignment 2: Basic Version Control
   8  git branch feature-branch
   9  git checkout feature-branch
  10  date >> README.md 
  12  git add README.md 
  13  git commit -m "edited README.md" 
  14  git log --oneline
  15  git checkout master
  16  git merge feature-branch
# Homework Assignment 3: Exploring Git History
  17  git log
  18  git log --oneline
  19  git show 6a847a29ceb529464d356ec8517d530c918430ae
  20  git show ffda1de
# Homework Assignment 4: Creating and Applying Tags
  21  git log 
  22  git tag -a v1.0 6a847a2
  23  git log --oneline
  24  date >> README.md 
  25  git add README.md 
  26  git commit -m "1 more edit README.md" 
  27  git log --oneline
  28  git tag -a v2.0 42c8c86
  29  git tag v3.0
  30  git show v2.0
  31  git show v3.0
# Homework Assignment 5: Undoing Changes
  32  git branch bug-fix
  33  git checkout bug-fix
  34  date >> README.md 
  35  git add README.md 
  36  git commit -m "undoung changes first commit README.md" 
  37  git log --oneline
  38  date >> README.md 
  39  git add README.md 
  40  git commit -m "undoung changes second commit README.md" 
  41  git log --oneline
  42  git reset
  43  git status
  44  git log
  45  git log --oneline | less
  46  git reset --soft 4cbc24a
  47  git log
  48  git reset --hard 4cbc24a
  49  git log
# Homework Assignment 6: Stashing Changes
  50  git branch experimental-feature
  51  git checkout experimental-feature
  52  date >> README.md 
  53  git status
  54  git add README.md
  55  git status
  56  git stash
  57  git status
  58  git checkout master
  59  date >> README.md 
  60  git add README.md 
  61  git commit -m "working with git stash" 
  62  git log --oneline
  63  git status
  64  git stash pop
  65  git status
  66  git add README.md
  67  git status
  68  git commit -m "Unstashed changes"
  69  git log --oneline
  70  git log
  71  git show c4c0423
  72  git show 7a3a6a0
  73  git show c4c0423
  74  git log
  75  git log --oneline
  76  git checkout bug-fix
  77  git log --oneline
# Homework Assignment 7: Git Aliases and Configuration
  78  git checkout master
  79  git config --global user.name "Timinsky"
  80  git config --global user.email "grnre61@gmail.com"
  81  git config --global alias.co checkout
  82  git config --global alias.cm commit
  83  git config --global alias.st status
  84  git config --global alias.br branch
  85  git co experimental-feature
