## 02.Git Homework

```bash
    8  git config --global init.defaultBranch master
    9  git config --global  user.name "Maskim Bahdanovich"
   10  git config --global  user.email "maksbogdanovichh@gmail.com"
   11  git status
   12  date > file.txt
   13  cat file.txt
   14  git status
   15  git add --all
   16  git status
   17  git commit -m "Init commit"
   18  git log --oneline
   19  git log
   20  git config --global  user.name "Maksim Bahdanovich"
   21  git log
   22  touch system.log
   23  ls -la
   24  git status
   25  vim .gitignore
   26  git status
   27  git add --all
   28  git commit -m "Add gitignore"
   29  git log --oneline
   30  git log
   31  git commit --amend -a
   32  git log --oneline
   33  git checkout cfe97b9
   34  git checkout 0312558
   35  ls -la
   36  git checkout master
   37  ls -la
   38  git checkout -
   39  git checkout master
   40  clear
   41  git checkout 0312558
   42  clear
   43  git tag -a R1.0 -m "Release 1.0
   44  git checkout master
   45  git log --oneline
   46  git checkout R1.0
   47  git checkout master
   48  clear
   49  alias c="clear"
   50  c
   51  git branch
   52  git branch -a
   53  git checkout -b second2
   54  git branch -a
   55  git checkout master
   56  git branch -a
   57  git checkout second2
   58  git branch -m second3
   59  git branch -a
   60  git checkout master
   61  git branch -D second3
   62  git branch -a
   63  git checkout -b second
   64  c
   65  git log --oneline
   66  date >> file.txt
   67  cat file.txt
   68  git add -all
   69  git add --all
   70  git commit -m "add commit to second"
   71  git log --oneline
   72  git checkout master
   73  git log --oneline
   74  git merge second
   75  git log --oneline
   76  cat file.txt
   77  vim file.txt
   78  vim file.txt
   79  git add --all
   80  git commit -m "conflict in master"
   81  git checkout second
   82  vim file.txt
   83  git add --all
   84  git commit -m "conflict in second"
   85  git rebase master
   86  vim file.txt
   87  git add file.txt
   88  git rebase --continue
   89  date file.txt
   90  date >> file.txt
   91  git add --all && git commit -m "commit 1"
   92  date >> file.txt
   93  git add --all && git commit -m "commit 3"
   94  date >> file.txt
   95  git add --all && git commit -m "commit 5"
   96  git log --oneline
   97  git reset --hard HEAD~2
   98  git log --oneline
   99  git checkout master
  100  vim file.txt
  101  git checkout -
  102  git reset cf0a47f
  103  git revert 40f41f9
  104  vim file.txt
  105  git add file.txt
  106  git revert --continue
  107  history
  108  mkdir 02.Git.Local
  109  cd 02.Git.Local/
  110  pwd
  111  git init
  112  touch README.md
  113  git add --all
  114  git commit README.md
  115  git status
  116  git branch -m feature-branch
  117  ls -l
  118  vim README.md
  119  git add
  120  git add README.md
  121  git commit -m 'Edit README.md'
  122  git checkout master
  123  git switch maste
  124  git switch master
  125  git checkout master
  126  pwd
  127  pwd
  128  git status
  129  mkdir 02.Git.Local
  130  cd 02.Git.Local/
  131  git init
  132  touch README.md
  133  vim README.md
  134  git add -all
  135  git add --all
  136  git commit -m 'Homework Assignment 1'
  137  git checkout -b feature-branch
  138  vim README.md
  139  git add --all
  140  git commit -m 'Homework Assignment 2'
  141  git merge feature-branch
  142  git status
  143  vim README.md
  144  git commit -m 'Homework Assignment 2'
  145  git checkout master
  146  git status
  147  vim README.md
  148  git checkout
  149  git checkout feature-branch
  150  vim README.md
  151  git add -all
  152  git add --all
  153  git commit -m 'Homework Assignment 2'
  154  git checkout
  155  git checkout master
  156  git merge feature-branch
  157  git status
  158  vim README.md
  159  git log
  160  git log --oneline
  161  git show 99fdd36
  162  git show 8e2a777
  163  git checkout feature-branch
  164  git tag v1.0
  165  git tag
  166  git checkout -
  167  git log
  168  git checkout -
  169  git tag
  170  vim README.md
  171  git add --all
  172  git commit -m 'Homework Assignment 4'
  173  git tag v2.0
  174  git tag
  175  git checkout -
  176  git log
  177  git merge feature-branch
  178  git log
  179  git checkout -b gug-fix
  180  vim README.md
  181   git add --all
  182  git commit -m 'Homework Assignment 5'
  183  git reset
  184  git log
  185  git reset  6095663c1e8b750ec2cd4c64c0007e3cc5e7788d
  186  git log
  187  vim README.md
  188  git checkout -b experimental-feature
  189  vim README.md
  190  git stash
  191  git checkout feature-branch
  192  vim README.md
  193  git stash list
  194  git stash apply
  195  git add --all
  196  git commit -m 'Another set of changes'
  197  git checkout experimental-feature
  198  git stash apply
  199  git stash list
  200  git add README.md
  201  git stash apply
  202  git config --global
  203  git config --global user.name 'Maksim Bogdanovich'
  204  git config --global user.email 'maksbogdanovichh@gmail.com'
  205  git config
  206  history
  207  git ssh add
  208  git ssh --help
  209  ssh-keygen
  210  cat /c/Users/User/.ssh/id_ed25519.pub
  211  ssh-keygen
  212  cat /c/Users/User/.ssh/id_ed25519.pub
  213  git log
  214  git remote add origin https://github.com/Maks-Bbb/DevOps
  215  git init
  216  git status
  217  git checkout master
  218  git add --all
  219  git commit -m 'New Repo'
  220  git checkout master
  221  git remote add origin https://github.com/Maks-Bbb/DevOps
  222  git branch
  223  git push origin main
  224  git push origin master
  225  git remote add origin https://gitlab.com/md-sa2-29-24/DevOps
  226  git init
  227  git clone https://github.com/Maks-Bbb/sa.it-academy.by
  228  git clone https://github.com/Maks-Bbb/sa.it-academy.by
  229  git checkout md-sa2-29-24
  230  git checkout md-sa2-29-24
  231  ll
  232  cd sa.it-academy.by
  233  git checkout md-sa2-29-24
  234  mkdir Maksim_Bogdanovich
  235  cd Maksim_Bogdanovich/
  236  mkdir 02.Git.Local
  237  touch README.md
  238  vim README.md
  239  history

```
