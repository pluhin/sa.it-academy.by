## Git hosting

```bash
1427  cd demo_git_repo
 1428  ls
 1429  git status
 1430  git checkout master
 1431  git log --oneline
 1432  ls -l ~/.ssh/
 1433  vim  ~/.ssh/id_rsa.pub
 1434  clear
 1435  git remote add origin git@github.com:pluhin/git_demo.git
 1436  vim .git/config
 1437  git branch -m master main
 1438  git push origin --all
 1439  vim first.txt
 1440  git add --all
 1441  git commit -m "Commit in local repo"
 1442  git push
 1443  git push --set-upstream origin main
 1444  git branch -a
 1445  cd /tmp
 1446  ls -l
 1447  git clone git@github.com:redman27/sa.it-academy.by.git
 1448  cd ~
 1449  cd git_repos/sa.it-academy.by/
 1450  ls
 1451  git pull
 1452  lL
 1453  ll
 1454  ll Dmitry_Boyko
 1455  ll Dmitry_Boyko/02.GIT.Local
 1456  cd /tmp/sa.it-academy.by
 1457  git checkout md-sa2-19-22
 1458  git pull
 1459  git log --oneline
 1460  ls -l
 1461  git remote add up git@github.com:pluhin/sa.it-academy.by.git
 1462  git fetch --all
 1463  git rebase up/md-sa2-19-22
 1464  vim Maxim_Radaman/02.Git.Local/02.GIT.Local.md
 1465  git rebase --continue
 1466  git add --all
 1467  git rebase --continue
 1468  ls -l
 1469  git push origin -f\ndrwxr-xr-x  3 plu  wheel   96 Jan 17 19:09 Ivan_Usti
 1470  cd ~
 1471  cd git_repos/demo_git_repo
 1472  vim first.txt
 1473  git add --all
 1474  git commit -m "Commit for notification"
 1475  git push
 1476  git remote rename origin origin_github
 1477  git remote add origin git@bitbucket.org:pluhin/git_demo_bit.git
 1478  git push origin --all
 1479  git remote rename origin origin_bit
 1480  git remote add origin git@gitlab.com:pluhin/git_demo_lab.git
 1481  git push origin --all
```