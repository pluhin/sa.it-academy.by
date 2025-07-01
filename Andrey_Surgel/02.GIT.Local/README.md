# HA1
```bash
   96  mkdir 02.git-homework
   97  cd 02.git-homework/
   98  git init
   99  touch README.md
  100  nano README.md
  101  git add README.md && git commit -m "HA1 commit"
```

# HA2
```bash
  104  git branch feature-branch
  105  git branch
  106  git checkout feature-branch
  107  nano README.md
  108  git status
  109  git commit -m "HA2 commit"
  110  git commit -a -m "HA2 commit"
  111  git switch master
  112  git merge feature-branch
```

# HA3
```bash
  114  git log
  115  git log --help
  116  git log -h
  117  git log -q
  118  git log --source
  119  git log HA1 commit
  120  git log master
  121  git log feature-branch
  122  git log feature-branch ^master
  123  git log --no-decorate
  124  git log --decorate=short
  125  git log --decorate=full
  126  git log --decorate=auto
  127  git log --decorate=not
  128  git log --log-size
  129  git log -n 2
  130  git log -n 1
  131  git log -full-history with parend rewriting
  132  git log -full-history
  133  git log --full-history
  134  git log --full-history with parent rewriting
  135  git log --oneline
  136  git show 9d52c41
```

# HA4
```bash
  138  git log
  139  git checkout afeea74367e1f06dfb0f935bb15901b940615102
  140  git tag v1.0
  141  git tag
  142  git log
  143  date >> README.md
  144  git add --all && git commit -m "add changes to v1.0 commit"
  145  git log
  146  git tag v2.0
  147  git log
  148  git tag -a v2.0-annotated -m "annotation"
  149  git tag
  150  git log
  151  git show v2.0-annotated
```

# HA5
```bash
  153  git branch master
  154  git checkout master
  155  git log
  156  git branch
  157  git branch bug-fix
  158  date >> README.md
  159  git add README.md
  160  ls
  161  git status
  162  git restore --staged README.md
  163  cat README.md
  164  git checkout bug-fix
  165  ls
  166  date >> README.md
  167  cat README.md
  168  git add .
  169  git commit -m "first change"
  170  date >> README.md
  171  git add .
  172  git commit -m "second change"
  173  git reset
  174  git status
  175  git log
  176  git reset soft
  177  git reset -h
  178  git reset --soft
  179  git log
  180  git reset --soft e7e8ec92364c72e9ceb00a1015b98de3b5e1ab93
  181  git log
  182  git show e7e8ec92364c72e9ceb00a1015b98de3b5e1ab93
  183  cat README.md
  184  git log
  185  git reset f1a5cafe9ce5e837282baf33e69fa850d326f5cc
  186  git log
  187  git reset --soft HEAD~
  188  git log
  189  cat README.md
  190  git status
  191  git log
  192  git reset --mixed HEAD~
  193  git log
```

# HA6
```bash
  196  git checkout master
  197  git status
  198  git restore README.md
  199  git status
  200  git checkout master
  201  git branch experimental-feature
  202  git ckeckout experimental-feature
  203  git checkout experimental-feature
  204  date >> README.md
  205  git stash
  206  git branch
  207  git switch feature-branch
  208  git status
  209  git stash list
  210  date >> README.md
  211  git status
  212  git add .
  213  git commit -m "change befor stashing"
  214  git stash apply stash@{0}
  215  git status
  216  git restore
  217  git restore --staged README.md
  218  git status
  219  git log
  220  git restore README.md
  221  git stash list
  222  git status
  223  git stash apply stash@{0}
  224  git add .
  225  git status
  226  git commit -m "stashing"
  227  git status
  228  git log
  229  git show 42f40144ca1a9cffda7e96ef847fab28a67fb6dc
  230  cat README.md
```

# HA7
```bash
  233  git config --global --user.email "surgelandrey@gmail.com"
  234  git config --global user.email "surgelandrey@gmail.com"
  235  git config --global user.name "Andrey Surgel"
  236  git config --global alias.fullcommit "add --all && commit -m"
  237  git config
  238  git config show
  239  git config --get-all
  240  git config -l
  241  date >> README.md
  242  git fullcomit "add alias"
  243  git fullcommit "add alias"
  244  git config --global alias.list "log --oneline"
  245  git list
```