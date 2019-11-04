    
H  H III  SSS  TTTTTT  OOO  RRRR  Y   Y 
H  H  I  S       TT   O   O R   R  Y Y  
HHHH  I   SSS    TT   O   O RRRR    Y   
H  H  I      S   TT   O   O R R     Y   
H  H III SSSS    TT    OOO  R  RR   Y   
                                        

  286  ab456@R415-ZB MINGW64 /c/work/git/sa.it-academy.by (master)
  287  $ git branch -a
  288  * master
  289    remotes/origin/HEAD -> origin/master
  290    remotes/origin/jenkins
  291    remotes/origin/m-sa2-06-19
  292    remotes/origin/m-sa2-07-19
  293    remotes/origin/m-sa2-08-19
  294    remotes/origin/m-sa2-09-19
  295    remotes/origin/m-sa2-10-19
  296    remotes/origin/master
  297  ab456@R415-ZB MINGW64 /c/work/git/sa.it-academy.by (master)
  298  $ git checkout m-sa2-10-19
  299  Switched to a new branch 'm-sa2-10-19'
  300  Branch 'm-sa2-10-19' set up to track remote branch 'm-sa2-10-19' from 'origin'.
  301  ab456@R415-ZB MINGW64 /c/work/git/sa.it-academy.by (m-sa2-10-19)
  302  $ mkdir dshevtsov
  303  ab456@R415-ZB MINGW64 /c/work/git/sa.it-academy.by (m-sa2-10-19)
  304  $ cd dshevtsov/
  305  ab456@R415-ZB MINGW64 /c/work/git/sa.it-academy.by/dshevtsov (m-sa2-10-19)
  306  $ mkdir '02.Git.Local'
  307  ab456@R415-ZB MINGW64 /c/work/git/sa.it-academy.by/dshevtsov (m-sa2-10-19)
  308  $ cd 02.Git.Local/
  309  ab456@R415-ZB MINGW64 /c/work/git/sa.it-academy.by/dshevtsov/02.Git.Local (m-sa2-10-19)
  310  $ git init
  311  Initialized empty Git repository in C:/work/git/sa.it-academy.by/dshevtsov/02.Git.Local/.git/
  312  ab456@R415-ZB MINGW64 /c/work/git/sa.it-academy.by/dshevtsov/02.Git.Local (master)
  313  $ date > date.txt
  314  ab456@R415-ZB MINGW64 /c/work/git/sa.it-academy.by/dshevtsov/02.Git.Local (master)
  315  $ vim .gitignore
  316  ab456@R415-ZB MINGW64 /c/work/git/sa.it-academy.by/dshevtsov/02.Git.Local (master)
  317  $ git status
  318  On branch master
  319  No commits yet
  320  Untracked files:
  321    (use "git add <file>..." to include in what will be committed)
  322          .gitignore
  323          date.txt
  324  nothing added to commit but untracked files present (use "git add" to track)
  325  ab456@R415-ZB MINGW64 /c/work/git/sa.it-academy.by/dshevtsov/02.Git.Local (master)
  326  $ git add --all
  327  warning: LF will be replaced by CRLF in .gitignore.
  328  The file will have its original line endings in your working directory
  329  warning: LF will be replaced by CRLF in date.txt.
  330  The file will have its original line endings in your working directory
  331  ab456@R415-ZB MINGW64 /c/work/git/sa.it-academy.by/dshevtsov/02.Git.Local (master)
  332  $ git status
  333  On branch master
  334  No commits yet
  335  Changes to be committed:
  336    (use "git rm --cached <file>..." to unstage)
  337          new file:   .gitignore
  338          new file:   date.txt
  339  ab456@R415-ZB MINGW64 /c/work/git/sa.it-academy.by/dshevtsov/02.Git.Local (master)
  340  git status 
  341  git add --all 
  342  git commit -m "mistakly added"
  343  git commit --amend
  344  git log --oneline 
  345  git reset --soft HEAD^
  346  git log --oneline 
  347  git checkout -b "dev"
  348  git status 
  349  history > history.md
  350  git status 
  351  git add --all 
  352  git commit -m "02.GIT. add some history"
  353  git log --oneline 
  354  vim history.md 
  355  git add --all 
  356  git commit -m "02.GIT. header added to file"
  357  git log --oneline 
  358  git checkout -b "features/do_one"
  359  git branch -a
  360  vim README.md
  361  git add --all 
  362  git commit -m "02.GIT. Readme file added"
  363  git log --oneline 
  364  git checkout master
  365  git checkout -b "hotfix/we_gonna_die"
  366  vim 02.GIT.Local.md
  367  git add --all 
  368  git commit -m "02.GIT. Added file for PR"
  369  git log --oneline 
  370  git checkout master
  371  git merge dev
  372  git merge features/do_one
  373  git log --oneline 
  374  git merge hotfix/we_gonna_die
  375  git log --oneline 
  376  git checkout dev
  377  git merge hotfix/we_gonna_die
  378  git checkout features/do_one 
  379  git merge hotfix/we_gonna_die
  380  git log --oneline 
  381  git checkout master 
  382  git status 
  383  git log --oneline 
  384  git log --graph --oneline 
  385  git log --all --decorate --oneline --graph
  386  history >> history.md 
 