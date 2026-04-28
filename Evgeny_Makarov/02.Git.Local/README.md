## 02.Git.Local

‘’’bash
  206  mkdir 02.Git.Local
  207  cd 02.Git.Local
  208  git init
  209  echo '## 02.Git.Local' > README.md
  210  git add .
  211  git commit -m "Init commit with README.md"
  212  history
  213  git branch feature-branch
  214  git checkout feature-branch
  215  git branch
  216  ls -l
  217  vim README.md
  218  git add .
  219  git status
  220  commit -m "Editing README.md"
  221  git commit -m "Editing README.md"
  222  git checkout master
  223  git checkout main
  224  git merge feature-branch
  225  git log
  226  got log --oneline --graph --all
  227  git log --oneline --graph --all
  228  git show 97f1877
  241  git log --oneline --graph --all
  242  git tag -a v1.0 97f1877
  243  git tag
  244  git log --oneline --graph --all
  245  echo 'chages' >> README.md
  246  git add .
  247  git status
  248  git commit -m "Tag v1.0 added, README.md changed"
  249  git tag v2.0
  250  git tag
  251  git log
  252  git show
  253  git branch bug-fix
  254  git branch
  255  git checkout bug-fix
  256  git branch
  257  vim README.md
  258  git add README.md
  259  git commit -m "added branch bug-fix, README.md changed"
  260  vim README.md
  261  git add .
  262  git status
  263  git commit -m "README.md changed"
  264  git log
  265  git reset HEAD~1
  266  vim README.md
  267  git status
  268  git add .
  269  git status
  270  git reset --soft HEAD~1
  271  git status
  272  git log
  273  git reset --hard HEAD~1
  274  git log
  275  git status
  276  git branch experimental-feature
  277  vim README.md
  278  git stash
  279  git checkout main
  280  vim README.md
  281  git stash list
  282  git stash pop
  283  cat README.md
  284  git add README.md
  285  git commit -m "hw-a6"
  286  git stash list
  287  git stash drop stash@{0}
  288  git config --global user.name "Evgeny Makarov"
  289  git config --global user.email "mbl.makarov@gmail.com"
  290  git config --global alias.st status
  291  git st
‘’’
