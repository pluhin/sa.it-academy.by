# GIT

```bash
1717  cd /tmp
 1718  mkdir project
 1719  cd project
 1720  ls
 1721  ls -a
 1722  git --version
 1723  git init
 1724  ls -l .git/config
 1725  vim .git/config
 1726  git config user.name "Siarhei Pishchyk"
 1727  git config user.email "pluhin@gmail.com"
 1728  vim .git/config
 1729  git config --list
 1730  date > file.txt
 1731  vim .git/config
 1732  git status
 1733  vim .gitignore
 1734  git status
 1735  mkdir .temp
 1736  date > .temp/second.txt
 1737  git status
 1738  git add --all
 1739  git status
 1740  git commit -m "Add first file"
 1741  git log --oneline
 1742  cat file.txt
 1743  vim file.txt
 1744  cat file.txt
 1745  git commit --amend -a
 1746  clear
 1747  git branch -a
 1748  git checkout -b "second"
 1749  git branch -a
 1750  date > second.txt
 1751  git add --all
 1752  git commit -m "frst commit in second branch"
 1753  git log --oneline
 1754  git checkout master
 1755  git log --oneline
 1756  git checkout second
 1757  git checkout master
 1758  git merge second
 1759  git log --oneline
 1760  vim second.txt
 1761  git add second.txt
 1762  git commit -m "Second changes in master"
 1763  git checkout  second
 1764  git log --oneline
 1765  git rebase -i master
 1766  git log --oneline
 1767  git  checkout master
 1768  vim second.txt
 1769  git add --all
 1770  git commit -m "Conflict in master"
 1771  git checkout second
 1772  vim second.txt
 1773  git add --all
 1774  git commit -m "Conflict in second"
 1775  git rebase master
 1776  vim second.txt
 1777  git rebase --continue
 1778  git add --all
 1779  git rebase --continue
 1780  git log --oneline
 1781  git rebase -i HEAD~2
 1782  git log --oneline
 1783  git tag
 1784  git tag -a R1.0
 1785  git tag
 1786  ls
 1787  vim file.txt
 1788  git add --all
 1789  git commit -m "Next"
 1790  git tag -a R2.0 -m "Revision 2.0"
 1791  git tag
 1792  git show R1.0
 1793  git show R2.0
 1794  git tag -a R3.0 -m "Revision 3.0"
 1795  git tag
 1796  git tag -d R3.0
 1797  git log --oneline
 1798  cd ../sa.it-academy.by
 1799  git pull
 1800  mkdir demo/02.GIT -p
 ```
