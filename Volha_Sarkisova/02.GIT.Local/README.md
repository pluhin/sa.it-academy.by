   51  mkdir 02.GIT.Local
   52  cd 02.GIT.Local
   53  git init
   54  touch README.md
   55  echo "first change">>README.md
   56  git status
   57  git add --all
   58  git commit -m "creation of README.md and first insertion"
   59  git log --oneline
   60  git status
   61  git checkout -b feature-branch
   62  git status
   63  echo "second change">>README.md
   64  git status
   65  git add README.md
   66  git log --oneline
   67  git commit -m "second insert README.md"
   68  git log --oneline
   69  git checkout master
   70  vim README.md
   71  git merge feature-branch
   72  vim README.md
   73  git log --oneline
   74  git log
   75  git show 461dc43 
   76  git log --oneline --graph
   77  git log --pretty=full
   78  git log README.md
   79  git show HEAD
   80  git tag -a v1.0 7aae973 -m "version 1.0"
   81  git tag
   82  git log --oneline
   83  git show v1.0
   84  echo "##v1.0">>README.md
   85  git status
   86  git add .
   87  git commit -m "add versioning to README.md"
   88  git log --oneline
   89  git tag v2.0 805638f 
   90  git log --oneline
   91  git tag
   92  git show v1.0
   93  git show v2.0
   94  git cat-file -s v1.0
   95  git cat-file -s v2.0
   96  git tag -l -n
   97  git branch bug-fix
   98  git checkout bug-fix
   99  echo "third change">>README.md
  100  git status
  101  git add --all
  102  git commit -m "third insertion README.md"
  103  echo "fourth change">>README.md
  104  git commit -m "fourth insertion README.md"
  105  git add README.md
  106  git commit -m "fourth insertion README.md"
  107  git log --oneline
  108  git reset --soft HEAD^
  109  git log --oneline
  110  git status
  111  git diff --cached
  112  git commit -m "fourth insertion README.md"
  113  git reset --hard HEAD~1
  114  git log --oneline
  115  git status
  116  git diff --cached
  117  echo "fourth change">>README.md
  118  git commit -m "fourth insertion README.md"
  119  git add .
  120  git commit -m "fourth insertion README.md"
  121  git log --oneline
  122  git reset --mixed HEAD^
  123  git log --oneline
  124  git status
  125  git diff --cached
  126  git checkout -b experimental-feature
  127  echo "fifth change">>README.md
  128  git status
  129  git stash 
  130  git status
  131  git stash list
  132  git checkout bag-fix
  133  git checkout bug-fix
  134  git status
  135  git diff README.md
  136  vim README.md
  137  git stash apply
  138  git add README.md
  139  vim README.md
  140  git log --oneline
  141  git config --global user.name "Volha Sarkisova"
  142  git config --global user.email "olkavalkiria@gmail.com"
  143  git config --global --list
  144  git config
  145  history
  146  vim README.md
  147  history>>README.md
Wed Apr 29 14:01:57 RTZ 2026
