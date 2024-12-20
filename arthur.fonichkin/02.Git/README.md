# Git. Local

```bash
  138  git init
  139  mkdir sa.it-academy.by
  140  cd sa.it-academy.by/
  141  git init
  142  touch README.md
  143  git status
  144  git add README.md
  145  git commit -m "add README.md"
  146  git checkout -b feature-branch
  147  ls -la
  148  date > README.md
  149  git status
  150  git add README.md
  151  git status
  152  git commit commit -m "feature-branch commit"
  153  git commit -m "feature-branch commit"
  154  git checkout master
  155  git merge feature-branch
  156  git log
  157  git log --oneline
  158  git show e4d1aca
  159  date >> README.md
  160  git status
  161  git add README.md
  162  git commit
  163  git log
  164  git log --oneline
  165  git tag -a TAG_1.0 -m "TAG v1"
  166  git log --oneline
  167  date >> README.md
  168  git add README.md
  169  git tag -a TAG_2.0 -m "TAG v2"
  170  git log
  171  git status
  172  git commit
  173  git status
  174  git log --oneline
  175  git checkout -b bug-fix
  176  date >> README.md
  179  git add README.md
  180  git commit -m "bug fix commit"
  181  date >> README.md
  182  git commit -m "bug fix commit2"
  183  git add README.md
  184  git commit -m "bug fix commit2"
  185  git log
  188  git status
  189  git reset --hard 61145ecb3c9c6276dc721d1227e9e445dd589c92
  190  git log
  191  git status
  192  git checkout -b "experimental-feature"
  193  date >> README.md
  196  git stash
  197  git status
  202  git checkout bug-fix
  203  git stash pop
  204  git status
  205  git add README.md
  206  git commit -m "stash commit"
  210  git config --list
  211  git config --global user.name Arthur
  212  git config --global user.email fonichkin.arthur@gmail.com
  213  git config --list
  214  history
```
