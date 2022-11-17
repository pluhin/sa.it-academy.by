#02.GIT.Local
[Hometask](https://github.com/pluhin/sa.it-academy.by/wiki/02.-GIT.-Local)
>From the task, i created a local repository in which i placed folders and subfolder whithin files according to the branches.
```bash  
 1432  cd local_repository/
 1433  git init
 1434  mkdir master
 1435  cd master/
 1436  nano .gitkeep
 1437  cd ../
 1438  nano .gitignore
 1439  git status
 1440  git add --all
 1441  git commit -m "Create repository to dev"
 1442  git commit --ammend
 1443  git commit --amend
 1444  cd master/
 1445  nano project.json
 1446  cd ../
 1447  git status
 1448  git add --all
 1449  git commit -m "Create project"
 1450  git log --oneline 
```
>After this steps we created main repository and main app in prod, now we have 2 commits in master

```bash
 1451  git checkout -b dev
 1452  mkdir dev
 1453  cd dev
 1454  nano .gitkeep
 1455  git add --all
 1456  git commit -m "Create repository for developers"
 1457  nano project_dev.json
 1458  git add --all
 1459  git commit -m "Create additional services for dev"
 1460  git log --oneline 
```
> After this steps we created new branch from master and  created additional 2 commits and created folder to devz, now we have 2 commits from master+2commits from dev
 
```bash
 1461  git checkout -b feature/do_one
 1462  mkdir feature
 1463  cd feature/
 1464  mkdir do_one
 1465  cd do_one/
 1466  nano .gitkeep
 1467  git add --all
 1468  git commit -m "Create repository for features updates"
 1469  git log --oneline 
 1470  git checkout master
 1471  git log --oneline 
```

>After this steps we created from dev new branch and initialized new repository to feature development, now we have 2 commits from master
>2 commits from dev and +1 commit in current branch and switch to master branch 

```bash
 1472  cd /home/dkeldanovich/local_repository/
 1473  git log --oneline 
 1474  git checkout -b hotfix/we_gonna_die
 1475  mkdir hotfix
 1476  cd hotfix/
 1477  mkdir we_gonna_die
 1478  cd we_gonna_die/
 1479  nano fix.json
 1480  git status
 1481  git add --all
 1482  git commit -m "Added fixes for master"
```

>After this steps we add from master new branc hotfix with directory "we_gonna_die" and fix.json file. Now we have 2 commits from master
> and additional commit from current branch

#Try to play first task
```bash
 1483  git log --oneline 
 1484  git checkout master 
 1485  cd ../
 1486  git merge feature/do_one 
 1487  git log --oneline 
 1488  git log --oneline >log_after_first_play.txt

 1489  mv log_after_first_play.txt > /home/dkeldanovich/
 1490  mc
 1491  mv log_after_first_play.txt > /home/dkeldanovich/remote_repo/sa.it-academy.by/Denis_Keldanovich/02.GIT.Local/
 1492  mc
```
>Now we merged master branch with feature/do_one
>We have that logs
```bash
e0f3d1e Create repository for features updates
7eeed18 Create additional services for dev
d8267f7 Create repository for developers
88c4811 Added fixes for master
8707f4f Create project
6e2364f Create repository to master

```

#Try to play the second play
```bash
 1493  git branch 
 1494  git log --oneline 
 1495  git reset --hard HEAD~1
 1496  git log --oneline 
 1497  git branch 
 1498* 
 1499  git reset --hard HEAD~1
 1500  git log --oneline 
 1501  git checkout dev 
 1502  git log --oneline 
 1503  git checkout feature/do_one 
 1504  git log --oneline 
 1505  git checkout master 
 1506  git log --oneline 
 1507  git merge hotfix/we_gonna_die -m "Deploy hotfix"
 1508  git log --oneline 
 1509  git checkout dev
 1510  git merge master 
 1511  git log --oneline 
 1512* 
 1513  git log --oneline 
 1514  git checkout master 
 1515  git log --oneline 
 1516  git checkout feature/do_one 
 1517  git log --oneline 
 1518  git checkout dev
 1519  git log --oneline 
 1520* git 
 1521  git log --oneline 
 1522  git checkout master 
 1523  git log --oneline 
 1524  git reset --hard HEAD~1
 1525  git log --oneline 
 1526  git checkout hotfix/we_gonna_die 
 1527  git log --oneline 
 1528  git rebase master 
 1529  git log --oneline 
 1530  git checkout master 
 1531  git log --oneline 
 1532  git checkout hotfix/we_gonna_die 
 1533  git log --oneline 
 1534  git checkout master
 1535  git merge hotfix/we_gonna_die 
 1536  git rebase master 
 1537  git log --oneline 
 1538  git log --oneline --all --graph 
 1539  git checkout dev 
 1540  git log --oneline
 1541  git rebase master dev
 1542  git log --oneline
 1543  git checkout feature/do_one 
 1544  git log --oneline
 1545  git rebase master feature/do_one 
 1546  git log --oneline
 1547  git checkout master 
 1548  git log --oneline
```
>Now we reset some commit positions to bring the branck back to original state
>And apply hotfix to master and rebase branch
 
```bash
 1549  git log --oneline >log_master_after_second_play.txt
 1550  git checkout hotfix/we_gonna_die 
 1551  git log --oneline
 1552  git log --oneline > log_hotfix_after_second_play.txt

```

>Logs from hotfix branch

```bash
88c4811 Added fixes for master
8707f4f Create project
6e2364f Create repository to master
 
```
 
>Following logs

```bash
 1553  git checkout dev 
 1554  git log --oneline
 1555  git log --oneline> log_dev_after_second_play.txt
```

>Logs from devz branch

```bash
18f8f8d Create additional services for dev
d248892 Create repository for developers
88c4811 Added fixes for master
8707f4f Create project
6e2364f Create repository to master
```
>Following logs
 
```bash
 1556  git checkout feature/do_one 
 1557  git log --oneline
 1558  git log --oneline> log_feature_after_second_play.txt
 1559  exit
```

>last log from feature/do_one

```bash
e0f3d1e Create repository for features updates
7eeed18 Create additional services for dev
d8267f7 Create repository for developers
88c4811 Added fixes for master
8707f4f Create project
6e2364f Create repository to master
```

