#02.GIT.Local

'''
 1635 git init
 1636  git config user.name "Artem Labin" && git config user.email "artsiomlabin@gmail.com"
 1637  cat .git/config 
 1638  vim .gitignore
 1639  date >> file_master.txt
 1640  git add . && git status
 1641  git commit -m "Init commit"
 1642  date > file_master.txt 
 1643  git add . && git commit -m "second commit"
 1644  git log --oneline
 1645  git checkout -b "dev"
 1646  git branch
 1647  date > file_dev.txt 
 1648  git add . && git commit -m "First commit in dev"
 1649  git status
 1650  date >> file_dev.txt 
 1651  git add . && git commit -m "Second commit in dev"
 1652  git log --oneline 
 1653  git checkout -b features/do_one
 1654  git branch
 1655  date > file_features/do_one.txt 
 1656  date > file_features.txt 
 1657  git add . && git commit -m "First commit in features/do_one"
 1658  git status
 1659  git checkout master 
 1660  git branch hotfix/we_gonna_die
 1661  git checkout hotfix/we_gonna_die
 1662  git branch
 1663  date > hotfix.txt 
 1664  git add . && git commit -m "First commit in hotfix"
 1665  git status
 1666  git branch
 1667  git checkout dev 
 1668  git merge features/do_one
 1669  git checkout master 
 1670  git merge dev 
 1671  git merge hotfix/we_gonna_die 
 1672  git merge hotfix/we_gonna_die
 1673  git checkout features/do_one 
 1674  git merge dev 
 1675  git log --oneline
 1676  git branch 
 1677  git checkout master 
 1678  git log --oneline
 1679  history 
'''


## Master
'''
*   7217690 (HEAD -> master) Merge branch 'hotfix/we_gonna_die'
|\  
| * 9a14cdc (hotfix/we_gonna_die) First commit in hotfix
* | 03651f9 First commit in features/do_one
* | c77d7dd Second commit in dev
* | 72baca9 First commit in dev
|/  
* 0aabe7e second commit
* 3b1048f Init commit
'''

## dev
'''
*   8b4e806 (HEAD -> dev, features/do_one) Merge branch 'hotfix/we_gonna_die' into dev
|\  
| * 9a14cdc (hotfix/we_gonna_die) First commit in hotfix
* | 03651f9 First commit in features/do_one
* | c77d7dd Second commit in dev
* | 72baca9 First commit in dev
|/  
* 0aabe7e second commit
* 3b1048f Init commit
'''

## features/do_one
'''
*   8b4e806 (HEAD -> features/do_one, dev) Merge branch 'hotfix/we_gonna_die' into dev
|\  
| * 9a14cdc (hotfix/we_gonna_die) First commit in hotfix
* | 03651f9 First commit in features/do_one
* | c77d7dd Second commit in dev
* | 72baca9 First commit in dev
|/  
* 0aabe7e second commit
* 3b1048f Init commit
'''

## hotfix/we_gonna_die
'''
* 9a14cdc (HEAD -> hotfix/we_gonna_die) First commit in hotfix
* 0aabe7e second commit
* 3b1048f Init commit
'''