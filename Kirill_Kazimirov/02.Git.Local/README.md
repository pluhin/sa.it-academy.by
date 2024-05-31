#Homework Assignment 1: Initializing a Local Repository
    7  cd /home/kirill/courses/devops/sa.it-academy.by/Kirill_Kazimirov/02.Git.Local
    8  ls -a
    9  git branch
   10  git branch -a
   11  cd /home/kirill/courses/devops/sa.it-academy.by
   12  git branch -a
   13  cd /home/kirill/courses/devops/sa.it-academy.by/Kirill_Kazimirov/02.Git.Local
   14  nano .git/config
   15  git config user.name "Kirill Kazimirov"
   16  nano .git/config
   17  git status
   18  touch README.md
   19  nano README.md
   20  git add -all
   21  git add --all
   22  git status
   23  git commit
   24  git config --global user.email "kirill-kazimirov.1993@ynadex.by"
   25  nano .git/config
   26  git config --global user.email "kirill-kazimirov.1993@ynadex.by"git status
   27  git status
   28  git commit
   29  git log --oneline
   30  history
#Homework Assignment 2: Basic Version Control
15  git branch feature-branch
   16  git branch -all
   17  git branch --all
   18  git checkout feature-branch
   19  git branch --all
   20  git status
   21  nano README.md
   22  git add --all
   23  git status
   24  git commit
   25  git status
   26  git checkout master
   27  git merge feature-branch
#Homework Assignment 3: Exploring Git History
31  git log
   32  git log oneline
   33  git log one line
   34  git log --oneline
   35  git show b20edd6
36.  git show b20edd643ec2989b2937c15df900bb3dc9e20ebf
# Homework Assignment 4: Creating and Applying Tags
   39  git log --oneline
   40  git checkout 19542e3
   41  git status
   42  git checkout b20edd6
   43  git status
   44  git tag -a v1.0 m "Release 1"
   45  git tag -a v1.0 -m "Release 1"
   46  git log --oneline
   47  nano README.md
   48  git add -all
   49  git add --all
   50  git commit
   51  git log --oneline
   52  nano README.md
   53  git tag -a v1.1 m "Release 1"
   54  git tag -a v1.1 -m "Release 1"
   55  git log --oneline
   56  nano README.md
   57  git add -all
   58  git add --all
   59  git commit
   60  git tag -a v2.0 -m "Release 1"
   61  git log --oneline
   62  git log
   63  git log --oneline
   64  git tag -a  v2.0
#Homework Assignment 5: Undoing Changes
   66  git branch bug-fix
   67  git status
   68  git checkout bug-fix
   69  git status
   70  nano README.md
   71  git add --all
   72  git commit
   73  nano README.md
   74  git add --all
   75  git commit
   76  git log oneline
   77  git log --oneline
   78  git reset --soft
   79  git log --oneline
   80  git reset --soft 0513949
   81  git log --oneline
   82  git reset --soft 98433bb
   83  git log --oneline
   84  cat README.md
   85  git show 98433bb
   86  git reset --hard 98433bb
   87  git log --oneline
   88  git reset --hard 98433bb
   89  git reset --hard 4f4a9fb
   90  git log --oneline
   91  git reset --mixed 19542e3
   92  git log --oneline
   93  git commit -m "Resets"
   94  git add --all
   95  git commit -m "Resets"
   96  cat README.md
   97  history
#Homework Assignment 6: Stashing Changes
   98  git checkout master
   99  cat README.md
  100  git branch experimental-feature
  101  git checkout experimental-feature
  102  nano README.md
  103  git stash
  104  git log --oneline
  105  git branch feature-stash
  106  git checkout feature-stash
  107  git log --oneline
  108  git checkout master
  109  git log --oneline
  110  cat README.md
  111  git stash pop
  112  git log --oneline
  113  cat README.md
  114  history


