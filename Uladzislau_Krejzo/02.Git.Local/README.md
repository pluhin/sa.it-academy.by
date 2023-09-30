# 02. GIT. Local
* Uladzislau Krejzo
>Note: It's reworked Homework 02.Git.Local. I had some difficults few days ago to prepare them. Think that I could resolve them right 
Sat Sep 30 15:05:47 +03 2023

##Description
It's my belated Homework for 02.Git.Local.
I think it's better to have difficulties to learn
 than not to have at all and not understand how to solve low-level problems

##Added tags
Added tags v1.0 and v2.0 with description.

##Bug-fix
Added Descibe of actions in latest point. Added date and undid change.

##Stashing changes
Added change in experimental-feature branch
It was stashed
I added some changes to master branch
Sat Sep 30 16:14:01 +03 2023


##History
```bash
    1  cd /DEVOPS
    2  cd Repo
    3  git init
    4  git clone git@github.com:jankalep/sa.it-academy.by.git
    5  ssh-keygen
    6  vim /root/.ssh/id_rsa.pub
    7  git clone git@github.com:jankalep/sa.it-academy.by.git
    8  ping github.com
    9  vim /etc/resolv.conf
   10  date
   11  vim /etc/resolv.conf
   12  ping github.com
   13  git clone git@github.com:jankalep/sa.it-academy.by.git
   14  cd ./sa.it-academy.by
   15  git branch -a
   16  git checkout md-sa2-25-23
   17  mkdir Uladzislau_Krejzo
   18  cd Uladzislau_Krejzo
   19  mkdir 02.Git.Local
   20  ls
   21  02.Git.Local
   22  cd 02.Git.Local
   23  git init
   24  git branch
   25  git branch -m
   26  git branch -a
   27  rm -r ./.git
   28  git branch
   29  cd ../
   30  git remote add github-up git@github.com:jankalep/sa.it-academy.by.git
   31  cd /DEVOPS/Repo/sa.it-academy.by/Uladzislau_Krejzo/02.Git.Local
   32  git branch
   33  git init
   34  git branch
   35  vim README.md
   36  date >>README.md
   37  vim README.md
   38  git add README.md
   39  git status
   40  git add -m "Add README.md"
   41  git commit -m "Add README.md"
   42  git branch
   43  git checkout -b feature-branch
   44  git branch
   45  vim README.md
   46  git add README.md
   47  git commit -m "Add brief description"
   48  git status
   49  git checkout master
   50  git merge feature-branch
   51  git log
   52  git log --oneline
   53  git log --graph
   54  git log --decorate
   55  git show 75890a0
   56  git tag v1.0 ee6c54e
   57  git tag
   58  git show v1.0
   59  vim README.md
   60  git tag >>README.md
   61  vim README.md
   62  git add README.md
   63  git commit -m "Add tag v1.0"
   64  git tag -a v2.0 -m "Version with tag" 
   65  git tag
   66  git show v2.0
   67  git branch
   68  git checkout -b bug-fix
   69  vim README.md
   70  git show
   71  git tag
   72  vim README.md
   73  git add README.md
   74  git commit -m "Fix "Fixed the absence of description of actions with tags шт README.md"
   75  git commit -m "Fix "Fixed the absence of description of actions with tags in README.md"
   76  git commit -m "Fix "Fixed the absence  of actions with tags in README.md"




   77  git status
   78* 
   79  git add README.md
   80  git commit -m "Fix "Fixed the absence  of actions with tags in README.md"

   81  git log
   82  git branch
   83  vim README.md
   84  git add  README.md
   85  git commit -m "Fix README.md"
   86  date>>README.md
   87  git add README.md
   88  git commit -m "Commit for undoing changes"
   89  vim README.md
   90  git reset --hard
   91  vim README.md
   92  git reset --hard
   93  vim README.md
   94  git reset --hard HEAD~1
   95  vim README.md
   96  git checkout master
   97  git checkout -b experimental-feature
   98  vim README.md
   99  date >> README.md
  100  vim README.md
  101  git stash
  102  git checkout master
  103  vim README.md
  104  date >> README.md
  105  vim README.md
  106  git branch
  107  git checkout experimental-feature
  108  git branch
  109  git stash apply
  110  git stash apply --merge
  111  git stash apply
  112  git mergetool
  113  git stash pop
  114  git config --list
  115  git config --global alias.st status
  116  git config --global alias.chb checkout
  117* 
  118  git config --list
  119  git branch
  120  git chb master
  121  vim README.md
  122  history >> README.md
