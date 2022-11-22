02.GIT.Local
======
CLI History
------
    1  git init
    2  mkdir 02.Git.Local
    3  cd 02.Git.Local/
    4  cd /home/e_solovey/test-repository/
    5  git config user.name "Eugene Solovey"
    6  git config user.email "evgeniy.colovey@gmail.com"
    7  git remote add origin git@github.com:Eugene-Solovey/sa.it-academy.by.git
    8  vi .git/config 
    09 vi .gitignore
    10 ls -la
    11 git add 02.Git.Local/
    12 git commit -m "added folder"
    13 git add --all
    14 git log --oneline
    15 git log --oneline 
    16 git branch 
    17 git checkout -b master
    18 git log --oneline 
    19 git add --all
    20 git commit -m "added folder"
    21 git log --oneline 
    22 echo test01 >> /home/e_solovey/test-repository/02.Git.Local/master_data01.txt
    23 git commit -m "added data"
    24 git add --all
    25 git commit -m "added datafile"
    26 git log --oneline 
    27 git checkout -d dev
    28 git checkout -b dev
    29 git branch 
    30 git log --oneline 
    31 echo test01 >> /home/e_solovey/test-repository/02.Git.Local/dev_data01.txt
    32 echo test02 >> /home/e_solovey/test-repository/02.Git.Local/dev_data01.txt
    33 git add --all
    34 git commit -m "added dev_datafile"
    35 echo test01 >> /home/e_solovey/test-repository/02.Git.Local/dev_data02.txt
    36 echo test02 >> /home/e_solovey/test-repository/02.Git.Local/dev_data02.txt
    37 git add --all
    38 git commit -m "added dev_datafile02"
    39 git add --all
    40 git log --oneline 
    41 git checkout -b features/do_one
    42 echo test01 >> /home/e_solovey/test-repository/02.Git.Local/features_data01.txt
    43 git add --all                          
    44 git commit -m "added features_datafile"
    45 git branch 
    46 git checkout master 
    47 git checkout -b hotfix/we_gonna_die
    48 git branch 
    49 git log --oneline 
    50 echo test01 >> /home/e_solovey/test-repository/02.Git.Local/hotfix_data01.txt
    51 git add --all
    52 git commit -m "added hotfix_datafile"
    53 git branch 
    54 git log --oneline               
    55 git branch                      
    56 git checkout hotfix/we_gonna_die
    57 git log --oneline
    58 echo hotfix-test >> /home/e_solovey/test-repository/02.Git.Local/hotfix_data.txt
    59 git add --all
    60 git commit -m "added hotfix_data"
    
Release phase
------
### Merge phase

    1  git branch 
    2  git merge dev
    3  git branch 
    4  git log --oneline 
    5  git merge features/do_one 
    6  git status
 
### Hotfix phase

    1 git branch 
    2 git log --oneline 
    3 git checkout master 
    4 git cherry-pick 43240f9
    5 git log --oneline 
    6 git checkout dev 
    7 git cherry-pick 43240f9
    8 git checkout features/do_one 
    9 git cherry-pick 43240f9
    10 git log --oneline
    
logs
------
### cli

    1  git branch 
    2  git checkout master 
    3  git log --oneline 
    4  git checkout dev 
    5  git log --oneline 
    6  git checkout features/do_one 
    7  git log --oneline 
    8  git checkout hotfix/we_gonna_die 
    9  git log --oneline 

### list commits
    e_solovey@nss:~/test-repository$ git branch
    dev
    features/do_one
    hotfix/we_gonna_die
    * master

### master

    e_solovey@nss:~/test-repository$ git log --oneline
    68ee0f6 (HEAD -> master) report 02.GIT.Local.md
    2d81aac end work
    1619119 added hotfix_data
    b61a669 added features_datafile
    6da1210 added dev_datafile02
    8b6e1bc added dev_datafile
    ce44bbe added datafile
    c516ec6 added folder

### dev

    e_solovey@nss:~/test-repository$ git checkout dev
    Switched to branch 'dev'
    e_solovey@nss:~/test-repository$ git log --oneline
    ada577e (HEAD -> dev) added hotfix_data
    6da1210 added dev_datafile02
    8b6e1bc added dev_datafile
    ce44bbe added datafile
    c516ec6 added folder

### features/do_one

    e_solovey@nss:~/test-repository$ git checkout features/do_one
    Switched to branch 'features/do_one'
    e_solovey@nss:~/test-repository$ git log --oneline
    e5561eb (HEAD -> features/do_one) added hotfix_data
    b61a669 added features_datafile
    6da1210 added dev_datafile02
    8b6e1bc added dev_datafile
    ce44bbe added datafile
    c516ec6 added folder

### hotfix/we_gonna_die

    e_solovey@nss:~/test-repository$ git checkout hotfix/we_gonna_die
    Switched to branch 'hotfix/we_gonna_die'
    e_solovey@nss:~/test-repository$ git log --oneline
    36e44cd (HEAD -> hotfix/we_gonna_die) end work
    43240f9 added hotfix_data
    6da1210 added dev_datafile02
    8b6e1bc added dev_datafile
    ce44bbe added datafile
    c516ec6 added folder
    e_solovey@nss:~/test-repository$
