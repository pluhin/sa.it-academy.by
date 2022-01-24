# Vagrant

```bash
 1613  git pull
 1614  cd demo
 1615  ls
 1616  mkdir 05.Vagrant
 1617  cd 05.Vagrant
 1618  mkdir {1..6}
 1619  ls
 1620  ls -la
 1621  cd
 1622  vagrant --version
 1623  VBoxManage --version
 1624  vagrant init cnetos/8
 1625  vim Vagrantfile
 1626  rm Vagrantfile
 1627  vagrant init centos/8
 1628  ls -l
 1629  pwd
 1630  cd -
 1631  mv ~/Vagrantfile ./1
 1632  cd
 1633  cd -
 1634  cd 1
 1635  ls
 1636  ls -l ~
 1637  ls -la
 1638  vagrant up
 1639  ls -la
 1640  vim ../../../.gitignore
 1641  git status
 1642  vagrant ssh
 1643  vagrant status
 1644  cd ~
 1645  vagrant status
 1646  vagrant global-status
 1647  vagrant global-status --prune
 1648  vagrant global-status
 1649  cd -
 1650  vagrant halt && vagrant destroy -f
 1651  cd ../2
 1652  cat ../../04.GIT.Action/Vagrantfile
 1653  vim Vagrantfile
 1654  vagrant up
 1655  sudo vim /etc/vbox/networks.conf
 1656  vagrant halt && vagrant destroy -f
 1657  vagrant up
 1658  vagrant halt && vagrant destroy -f
 1659  vagrant up
 1660  vagrant ssh host1
 1661  vagrant halt && vagrant destroy -f
 1662  ls -la
 1663  rm ubuntu-bionic-18.04-cloudimg-console.log
 1664  cd ../3
 1665  ls
 1666  vim Vagrantfile
 1667  ifconfig
 1668  ls -l
 1669  vagrant up
 1670* cd git_repos/sa.it-academy.by/demo/05.Vagrant/4
 1671* ls
 1672* vim Vagrantfile
 1673* vagrant up
 1674  vagrant halt && vagrant destroy -f
 1675  vagrant up
 1676  ssh vagrant@192.168.1.244
 1677  vagrant sh
 1678  vagrant ssh
 1679  vagrant halt && vagrant destroy -f
 1680* vagrant ssh
 1681* vagrant halt && vagrant destroy -f
 1682* vagrant up
 1683  cd ../5
 1684  vim Vagrantfile
 1685* vagrant ssh
 1686* vagrant halt && vagrant destroy -f
 1687  vagrant up
 1688* cd ../06
 1689* cd ../6
 1690* ls
 1691* vagrant init bento/ubuntu-20.04
 1692* vagrant up
 1693  vagrant halt && vagrant destroy -f
 1694  vagrant up
 1695* vagrant ssh
 1696  vagrant status
 1697  vagrant ssh jump
 1698  vagrant halt && vagrant destroy -f
 1699* vagrant package --output /tmp/my_image.box
 1700* ls -lh /tmp/my_image.box
 1701* vagrant cloud publish --release pluhin/vagrant_demo 1.0.0 virtualbox /tmp/my_image.box
```

## Inside publish box

```bash
sudo -i
apt-get update && apt-get upgrade -yqq && apt-get install vim mc git wget -yqq
rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
```