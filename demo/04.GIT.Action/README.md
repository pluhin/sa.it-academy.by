# Github Action

All workflow files you can find in current folder

```bash
1566  git clone git@github.com:pluhin/demo_github_action.git
 1567  cd demo_github_action
 1568  ls
 1569  mkdir -p .github/workflows/
 1570  ls -lr
 1571  ls -lra
 1572  ls -lra .github
 1573  clear
 1574  vim .github/workflows/main.yaml
 1575  git add --all
 1576  git commit -m "Add workflow"
 1577  git push
 1578  vim .github/workflows/main.yaml
 1579  git add --all
 1580  git commit -m "Add workflow matrix"
 1581  git push
 1582  vim .github/workflows/main.yaml
 1583  git commit --amend -a
 1584  git push origin -f
 1585  vim Vagrantfile
 1586  clear
 1587  vagrant up
 1588  vim Vagrantfile
 1589  rm .Vagrantfile.swp
 1590  vim Vagrantfile
 1591  vim .github/workflows/main.yaml
 1592  vim .github/workflows/main_home.yaml
 1593  git add --all
 1594  git commit -m "Add home runner"
 1595  vim .gitignore
 1596  git commit --amend -a
 1597  git push origin -f
 1598  vagrant ssh
 1599  vagrant halt && vagrant destroy -f
 1600  vim .github/workflows/notification.yaml
 1601  vim .github/workflows/main_home.yaml
 1602  git add --all
 1603  git commit -m "Add notification"
 1604  git push
```