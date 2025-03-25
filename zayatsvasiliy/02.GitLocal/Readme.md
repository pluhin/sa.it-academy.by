## 02.GitLocal

```bash
Task1
  178  mkdir /home/v/homework
  179  cd /home/v/homework
  180  mkdir 02.GitLocal
  181  cd 02.GitLocal/
  182  git config --global user.name "Vasiliy Zayats"
  183  git config --global user.email "zayats.vasiliy.v@gmail.com"
  184  git init 
  185  touch readme.md
  186  vim readme.md 
  187  git status
  188  git add readme.md 
  189  git commit "Create readme MD"
  190  git commit -m "Create readme MD"
  191  git status
Task2
  192  git branch feature-branch
  193  git switch feature-branch
  194  vim readme.md 
  195  git add readme.md 
  196  git commit -m "Change readme.md"
  197  more readme.md 
  198  clear
  199  git switch master
  200  more readme.md 
  201  git merge feature-branch 
  202  more readme.md 
  203  git status 
  204  history
Task3
  205  clear
  206  git log
  207  git log --oneline 
  208  git log --stat
  209  git log --p
  210  git log --path
  211  git log -path
  212  git log -p
  213  git log %an
  214  git log -p %an
  215  clear
  216  git show commit-hash
  217  git commit
  218  git log
  219  git log --online
  220  git log --oneline
  221  git show commit-hash c116a32
  222  git show c116a32
  223  git show 95e4b1e
  224  clear
  225  history
Task4
  226  clear
  227  git log --oneline
  228  git checkout 95e4b1e
  229  git tag -a C1 -m "Commit one the branch master"
  230  git log --oneline
  231  git checkout master
  232  git log --oneline
  233  git checkout 95e4b1e
  234  git tag -a V1 -m "V1 Commit"
  235  git log --oneline
  236  git tag -d C1
  237  git log --oneline
  238  git sttus
  239  git status
  240  git checkout master
  241  git status
  242  git log --oneline
  243  git checkout 95e4b1e
  244  vim readme.md 
  245  git sttus
  246  git staus
  247  git status
  248  git add readme.md 
  249  vim readme.md 
  250  git status
  251  git checkout master
  252  git status
  253  git commit 
  254  git commit -m "task 4.3"
  255  git checkout master
  256  git log --oneline
  257  git checkout 95e4b1e
  258  git log --oneline
  259  vim readme.md 
  260  git checkout master
  261  git tag -a V2 -m "V2 Commit"
  262  git log --oneline
  263  git tag lightweightTags
  264  git log --oneline
  265  history
Task5
  266  clear
  267  git branch
  268  git checkout -b bug-fix
  269  more readme.md 
  270  clear
  271  vim readme.md 
  272  git sttus
  273  git status
  274  git add readme.md 
  275  git commit -m "task 5.2"
  276  vim readme.md 
  277  git checkout master 
  278  vim readme.md 
  279  git switch bug-fix
  280  vim readme.md 
  281  git commit -m "task 5.3"
  282  git add readme.md 
  283  git commit -m "task 5.3"
  284  clear
  285  git log --oneline
  286  git status
  287  more readme.md 
  288  clear
  289  git log --oneline
  290  git reset --soft 905af7e
  291  git status
  292  more readme.md 
  293  clear
  294  git status
  295  git log --oneline
  296  git commit
  297  git log
  298  git commit -m "Task 5.4"
  299  git status
  300  git log oneline
  301  git log --oneline
  302  git reset --mixed 905af7e
  303  cat readme.md 
  304  git status
  305  git add readme.md 
  306  git commit -m "Task 5.5"
  307  git reset --hard 905af7e
  308  cat readme.md 
  309  git status
  310  git log --oneline
  311  history
Task6
  312  clear
  313  git branch
  314  git branch -a experimental-feature
  315  git branch experimental-feature
  316  git branch
  317  git switch experimental-feature 
  318  vim readme.md 
  319  git status
  320  git stash
  321  git stash list
  322  git switch feature-branch 
  323  cat readme.md 
  324  git stash list
  325  git stash apply
  326  vim readme.md 
  327  git status
  328  git add readme.md 
  329  git commit -m "task6"
  330  git log --oneline
  331  history
Task7
  332  clear
  333  git config --global user.name 
  334  git config --global user.name "Vasiliy zayats"
  335  git config --global user.email "zayats.vasiliy.v@gmail.com"
  336  git config --global alias.ll 'log --oneline'
  337  git ll
  338  git config --list
  339  history


```