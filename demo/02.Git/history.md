# History 
```bash
 1475  cd tmp
 1476  ls
 1477  mkdir project
 1478  cd project
 1479  ls
 1480  clear
 1481  git init
 1482  vim .git/config
 1483  ls
 1484  ls -a
 1485  git --version
 1486  git config --list
 1487  date > file.txt
 1488  git status
 1489  vim .gitignore
 1490  git status
 1491  mkdir .temp
 1492  git status
 1493  ls -l
 1494  ls -la
 1495  git add file.txt .gitignore
 1496  git status
 1497  git commit
 1498  git commit -m "second commit"
 1499  git log --oneline
 1500  git commit --amend -a
 1501  git log --oneline
 1502  vim file.txt
 1503  git status
 1504  git commit --amend -a
 1505  clear
 1506  git branch
 1507  git branch -a
 1508  git checkout -b second
 1509  git branch -a
 1510  git log --oneline
 1511  date > second.txt
 1512  date >> second.txt
 1513  cat second.txt
 1514  ls
 1515  git add --all
 1516  git commit -m "Second commit"
 1517  git log --oneline
 1518  git checkout master
 1519  git branch
 1520  git log --oneline
 1521  git merge second
 1522  git log --oneline
 1523  git log --graph --all --decorate
 1524  vim second.txt
 1525  git add --all
 1526  git commit -m "For rebase"
 1527  git log --oneline
 1528  git checkout second
 1529  git log --oneline
 1530  git rebase -i master
 1531  git log --oneline
 1532  ls
 1533  git checkout master
 1534  ls
 1535  vim file.txt
 1536  git add --all
 1537  git commit -m "for conflict 01. master"
 1538  git checkout second
 1539  vim file.txt
 1540  git add --all
 1541  git commit -m "for conflict 02. second"
 1542  git rebase -i master
 1543  vim file.txt
 1544  git add file.txt
 1545  git rebase --continue
 1546  ls
 1547  git rebase -i HEAD~3
 1548  git log --oneline
 1549  git rebase -i HEAD~3
 1550  git rebase -i HEAD~2
 1551  git rebase -i HEAD~1
```

- list
- list
  - list 
  - list
