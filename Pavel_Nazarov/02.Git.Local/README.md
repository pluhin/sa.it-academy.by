## 02. GIT. Local Homework

### Homework Assignment 1: Initializing a Local Repository
```Bash
  190  ll
  191  mkdir 02.Git.local
  192  cd 02.Git.local
  193  git init
  194  ls -al
  195  echo '# Title' > README.md
  196  git add README.md
  197  git commit -m "02.Git.Local First commit"
  198  git status
```

### Homework Assignment 2: Basic Version Control
```Bash
  199  git branch feature-branch
  200  git checkout feature-branch
  201  vim README.md
  202  git add .
  203  git status
  204  git commit -m "Added description to README.md"
  205  git checkout master
  206  cat README.md
  207  git merge feature-branch
  208  cat README.md
```

### Homework Assignment 3: Exploring Git History
```Bash
  209  git log
  210  git log --oneline
  211  git log --graph --oneline
  212  git log --graph
  213  git log --oneline
  214  git show e157b6e
  215  git log --oneline
  216  git show 9a73c42
```

### Homework Assignment 4: Creating and Applying Tags
```Bash
  217  git tag v1.0 9a73c42
  218  git log
  219  git tag
  220  vim README.md
  221  git add .
  222  git commit -m "Added some change to README.md"
  223  git tag v2.0
  224  git tag
  225  git log
```

### Homework Assignment 5: Undoing Changes
```Bash
  226  git checkout -b bug-fix
  227  vim README.md
  228  git add .
  229  git commit -m "First bugfix"
  230  vim README.md
  231  git add .
  232  git commit -m "Second bugfix"
  233  git status
  234  git log
  235  git reset --soft HEAD~1
  236  git status
  237  cat README.md
  238  git log
  239  git commit -m "Second bugfix"
  240  git reset --mixed HEAD~1
  241  git status
  242  cat README.md
  243  git add .
  244  git commit -m "Second bugfix"
  245  git reset --hard HEAD~1
  246  git status
  247  cat README.md
```

### Homework Assignment 6: Stashing Changes
```Bash
  248  git checkout -b experimental-feature
  249  git log --graph
  250  git checkout -b master
  251  git checkout master
  252  git merge bug-fix
  253  cat README.md
  254  git log --graph
  255  git checkout experimental-feature
  256  cat README.md
  257  vim README.md
  258  git stash
  259  cat README.md
  260  git checkout master
  261  cat README.md
  262  vim README.md
  263  git add .
  264  git commit -m "Main branch updates"
  265  git checkout experimental-feature
  266  cat README.md
  267  git stash apply
  268  cat README.md
  269  git add .
  270  git commit -m "Added some experimental feature"
  271  cat README.md
```

### Homework Assignment 7: Git Aliases and Configuration
```Bash
  272  vim ~/.zshrc
  273  git config --global user.name "Pavel Nazarov"
  274  git config --global user.email "nazaroff2712@gmail.com"
  275  log --oneline --graph
  276  git log --oneline --graph
  277  git log --graph
  278  git log
  279  git config --global alias.lg log --graph
  280  git lg
  281  git config --global alias.lg "log --graph"
  282  git lg
  283  git config
  284  git config --global --list
```

---
---
---
```Bash
  293  cd ~
  294  ll
  295  git clone https://github.com/MisterRobo/sa.it-academy.by.git
  296  ll
  297  cd sa.it-academy.by
  298  git checkout md-sa2-30-24
  299  ll
  300  mkdir -p Pavel_Nazarov/02.Git.Local
  301  cd Pavel_Nazarov/02.Git.Local
  302  history > README.md
```
