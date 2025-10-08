```bash
  131  cd 02.GIT.Local
  132  git init
  133  echo "# 02.GIT.Local" > README.md
  134  git add README.md
  135  git commit -m "Repo ini + readme.md"
  136  git checkout -b feature-branch
  137  vim 02.Git.Local/README.md
  138  vim 02.Git.Local/README.md
  139  ls -la
  140  cat README.md
  141  git add README.md
  142  git commit -m "Add Prj description"
  143  git checkout -
  144  git log
  145  git log --oneline
  146  git checkout
  147  git merge feature-branch
  148  cat README.md
  149  git log
  150  git log --oneline --graph --decorate
  151  git show 73f8104
  152  git tag v1.0 13ee38d
  153  git tag
  154  vim README.md
  155  git add README.md
  156  git commit -m "Add some dif"
  157  git log --oneline
  158  git tag v2.0 b934f86
  159  git tag
  160  git tag -a v1.5 -m "Version 1.5" 73f8104
  161  git tag
  162  git log --oneline
  163  git show 73f8104
  164  git checkout -b bug-fix
  165  history
  166  echo "Dif #1" > README.md && gia add README.md && Git commit -m "Add Dif #1"
  167  echo "Dif #1" > README.md && git add README.md && Git commit -m "Add Dif #1"
  168  echo "Dif #2" > README.md && git add README.md && Git commit -m "Add Dif #2"
  169  git checkout
  170  git log
  172  git log --oneline
  173  git reset --soft HEAD~1
  174  date >> README.md && git add README.md && Git commit -m "Add Date #1"
  175  date >> README.md && git add README.md && Git commit -m "Add Date #2"
  176  git log --oneline
  177  git reset --soft HEAD~2
  178  git log --oneline
  179  cat README.md
  180  date >> README.md && git add README.md && Git commit -m "Add Date #3"
  181  date >> README.md && git add README.md && Git commit -m "Add Date #4"
  182  git log --oneline
  183  git reset --hard HEAD~1
  184  git log --oneline
  185  cat README.md
  186  date >> README.md && git add README.md && Git commit -m "Add Date #4"
  188  git reset --mixed HEAD~2
  189  cat README.md
  190  git checkout -b experimental-feature
  191  echo "Experimental Dif" > README.md
  192  cat README.md
  193  git stash
  194  git checkout another-branch
  195  git checkout -b another-branch
  196  git stash apply
  197  vim README.md
  198  git stash apply
  199  cat README.md
  200  git stash list
  201  git config --global user.name "Siarhei Auchynnik"
  202  git config --global user.email "artegaas@gmail.com"
  203  git config --list
