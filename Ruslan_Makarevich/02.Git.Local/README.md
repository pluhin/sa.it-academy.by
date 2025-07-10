    1  sudo su
    2  cat /etc/os-release
    3  free -h
    4  htop
    5  top
    6  clear
    7  git version
    8  mkdir 02.Git
    9  cd 02.Git/
   10  git init
   11  ls -la
   12  cat .git/config 
   13  git status
   14  git config --global user.name "Ruslan Makarevich"
   15  git config --global user.email "Makarevich.True@gmail.com"
   16  date > file.txt
   17  cat file.txt 
   18  git status
   19  git add --all
   20  git status
   21  git commit -m "Init commit"
   22  git log
   23  git log --oneline
   24  touch system.log
   25  git status
   26  nano .gitignore
   27  git status
   28  git add --all
   29  git commit -m "Add gitignore"
   30  nano .gitignore
   31  git status
   32  git commit --amend --all
   33  git log
   34  git commit --amend --all
   35  git log
   36  git checkout 0728e8d
   37  git log --oneline
   38  git checkout master
   39  git log --oneline
   40  git checkout 0728e8d
   41  date >> file.txt
   42  git status
   43  git add --all
   44  git commit -m "test"
   45  git log
   46  git checkout master
   47  git log
   48  git status
   49  git checkout 0728e8d
   50  git tag -a R1.0 -m "Release 1.0"
   51  git checkout master
   52  git log --oneline
   53  git checkout R1.0
   54  git checkout master
   55  git branch
   56  git checkout -b second2
   57  git branch -m second3
   58  git branch
   59  git checkout master
   60  git branch -D second3
   61  git branch
   62  git checkout -b second
   63  git branch
   64  git log --oneline
   65  date >> file.txt
   66  git add --all
   67  git commit -m "Add commit to second"
   68  git log --oneline
   69  git checkout master
   70  git log --oneline
   71  git checkout -
   72  git checkout master
   73  git merge second
   74  git branch
   75  git log --oneline
   76  nano file.txt 
   77  git add --all
   78  git commit -m "Prepare conflict for master"
   79  git chekout second
   80  git checkout second
   81  nano file.txt 
   82  git add --all
   83  git commit -m "Prepare conflict for second"
   84  git checkout master
   85  git log --oneline
   86  git checkout -
   87  git log --oneline
   88  git rebase master 
   89  nano file.txt 
   90  git add file.txt 
   91  git rebase --continue
   92  git log --oneline
   93  date >> file.txt
   94  git add --all && git commit -m "Add commit 01"
   95  date >> file.txt
   96  git add --all && git commit -m "Add commit 02"
   97  date >> file.txt
   98  git add --all && git commit -m "Add commit 02"
   99  git log --oneline
  100  git rebase -i HEAD ~3
  101  git rebase -i HEAD~3
  102  git log --oneline
  103  git reset --hard HEAD~2
  104  git log --oneline
  105  history >> history.txt
  106  nano history.txt 
  107  git status
  108  git add --all
  109  git commit -m "Add history"
  110  git log --oneline
  111  git checkout master
  112  git log --oneline
  113  git merge second
  114  git status 
  115  git log --oneline
  116  cd ../
  117  ls
  118  mkdir 02.Git_Homework
  119  git init
  120  git status
  121  ls -la
  122  cd 02.Git_Homework/
  123  git init
  124  git status
  125  nano README.md
  126  git add --all
  127  git commit -m "First commit for homework"
  128  git log --oneline
  129  git checkout feature-branch
  130  git log --oneline
  131  git branch
  132  git checkout feature-branch
  133  git branch -b feature-branch
  134  git branch
  135  git checkout -b feature-branch
  136  git log --oneline
  137  ls
  138  nano README.md 
  139  git add -all
  140  git add --all
  141  git commit -m "Created new branch"
  142  git checkout master
  143  git merge feature-branch
  144  git log --oneline
  145  git log
  146  git show
  147  git log --oneline
  148  git show 277e98c
  149  git branch
  150  git log --oneline
  151  git checkout c2853c2
  152  git log --oneline
  153  git log
  154  git tag -a v1.0
  155  git tag -a v1.0 -m "version 1.0"
  156  git checkout HEAD
  157  git log --oneline
  158  git checkout master
  159  git log --oneline
  160  nano README.md 
  161  git add --all
  162  git commit -m "Add new tag for commit"
  163  git log --oneline
  164  git tag -a v2.0 -m "version 2.0"
  165  git log --oneline
  166  git checkout -b bug-fix
  167  git branch
  168  nano README.md 
  169  git add --all
  170  git commit -m "Add bug-fix for version 2.1"
  171  nano README.md 
  172  git add --all
  173  git commit -m "Add bug-fix for version 2.2"
  174  git log --oneline
  175  git status
  176  git log --oneline
  177  git reset HEAD~1
  178  git status
  179  git log --oneline
  180  git commit -m "Add bug-fix for version 2.2"
  181  git add --all
  182  git commit -m "Add bug-fix for version 2.2"
  183  git log --oneline
  184  git checkout master
  185  git checkout -b experimental-feature
  186  bit branch
  187  git branch
  188  nano README.md 
  189  git status
  190  git stash save "Temp edit file README"
  191  git status
  192  git log --oneline
  193  ls
  194  nano README.md 
  195  history
  196  git checkout master
  197  git log --oneline
  198  nano README.md 
  199  git stash list
  200  git stash show
  201  git status
  202  git reset HEAD~1
  203  git status
  204  git stash branch master 
  205  git status
  206  nano README.md 
  207  git status
  208  git log --oneline
  209  git branch
  210  git add --all
  211  git commit -m "Used git stash TEST"
  212  git status
  213  git log --oneline
  214  git checkout -b other-branch
  215  ls
  216  git log --oneline
  217  nano README.md 
  218  git status
  219  git stash branch other-bruch
  220  nano README.md 
  221  git stash branch other-bruch
  222  git add --all
  223  git commit -m "Add 1 text"
  224  git stash branch other-bruch
  225  git add --all
  226  git commit -m "GIT STASH TEST MERGE"
  227  nano README.md 
  228  git log --oneline
  229  nano README.md 
  230  git log --oneline
  231  git add --all
  232  git commit -m "Add 2TEXT"
  233  nano README.md 
  234  git log --oneline
  235  git branch
  236  git checkout experimental-feature 
  237  git log --oneline
  238  nano README.md 
  239  git stash save "Add 3TEXT"
  240  nano README.md 
  241  git branch
  242  nano README.md 
  243  git checkout -b new-branch
  244  git log --oneline
  245  git branch
  246  nano README.md 
  247  git branch
  248  git stash branch new-branch
  249  git shash list
  250  git stash list
  251  nano README.md 
  252  git branch
  253  git checkout experimental-feature 
  254  nano README.md 
  255  git stash list
  256  git stash branch new-branch
  257  git stash branch new-branch1
  258  git add --all
  259  git commit - m "GIT STASH TEST V2.0
git status


da
clear
  260  git status 
  261  git commit - m "GIT STASH TEST V2.0"
  262  git commit -m "GIT STASH TEST V2.0"
  263  git status
  264  ls
  265  nano README.md 
  266  history
  267  git config
  268  ls -la
  269  cat .git/config 
  270  nano .git/config 
  271  git config --global user.name "Ruslan Makarevich"
  272  git config --global user.email "Makarevich.True@gmail.com"
  273  cat .git/config 
  274  git config --list --show-origin
  275  git config --global alias.mtrue status
  276  git config --list --show-origin
  277  mtrue
  278  git last
  279  git config --global alias.last 'log -1 HEAD'
  280  git config --list --show-origin
  281  git mtrue
  282  git checkout master
  283  git log --oneline
  284  history
  285  history >> 02.GIT.Local.md
