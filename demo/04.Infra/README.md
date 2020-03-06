
```bash
1939  cd /tmp/sa.it-academy.by/
 1940  git pull
 1941  cd demo
 1942  ls
 1943  mkdir 04.Infra
 1944  cd 04.Infra
 1945  mkdir {1..5}
 1946  ls
 1947  cd 1
 1948  ls
 1949  clear
 1950  vagrant init
 1951  ls -l
 1952  vim Vagrantfile
 1953  cd ../2
 1954  vim Vagrantfile
 1955  vagrant up
 1956  vagrant ssh 
 1957  vagrant ststus
 1958  vagrant status
 1959  vagrant ssh 
 1960  vagrant status
 1961  vagrant global-status
 1962  history| grep vagrant
 1963  vagrant --help
 1964  vagrant global-status --prune
 1965  vagrant halt
 1966  vagrant destroy -f
 1967  vagrant halt &&  vagrant destroy -f
 1968  cd ../3
 1969  ls -l ../
 1970  vim Vagrantfile
 1971  vagrant up
 1972  vagrant ssh
 1973  vagrant halt &&  vagrant destroy -f
 1974  cd ../4
 1975  ls
 1976  vim Vagrantfile
 1977  ifconfig
 1978  vim Vagrantfile
 1979  vagrant up
 1980* ping 192.168.1.244
 1981* telnet 192.168.1.244 22
 1982* ssh 192.168.1.244
 1983* ssh vagrant@192.168.1.244
 1984  vagrant halt &&  vagrant destroy -f
 1985  cd ../
 1986  ls
 1987  cd 5
 1988  \tvagrant init bento/ubuntu-18.04
 1989  vim Vagrantfile
 1990  vagrant up
 1991  vagrant ssh
 1992  vagrant package --output /tmp/test.box
 1993  rm /tmp/test.box
 1994  vagrant package --output /tmp/test.box
 1995* top
 1996  ls /tmp/test.box
 1997  ls /tmp/test.box -l 
 1998  ls /tmp/test.box -lh
 1999  vagrant cloud publish --release pluhin/test 1.0 virtualbox /tmp/test.box
 2000  cd ../
 2001  ls
 2002  sudo apt-get install lxc lxc-templates
 2003  lxc-config
 2004  lxc-checkconfig 
 2005  /usr/share/lxc/templates/lxc-download -l
 2006  sudo lxc-create -t ubuntu -n ub18 -- -r bionic -a amd64
 2007  sudo lxc-start -n ub18 -d
 2008  sudo lxc-ls -f
 2009  ssh ubuntu@192.168.122.175
 2010  sudo lxc-attach -n ub18
 2011  sudo lxc-attach -n ub18 -- apt update && apt install vim
 2012  sudo lxc-attach -n ub18 -- apt update
 2013  sudo lxc-attach -n ub18 -- apt install vim
 2014  sudo lxc-attach -n ub18 -- apt install git
 2015  sudo lxc-attach -n ub18
 2016  sudo lxc-stop -n ub18
 2017  sudo lxc-destroy -n ub18
 2018  vim lxc.conf
 2019  sudo lxc-create -t ubuntu -f lxc.conf -n ub18 -- -r bionic -a amd64
 2020  sudo lxc-start -n ub18 -d
 2021  sudo lxc-ls -f
 2022  sudo lxc-attach -n ub18
 2023  sudo lxc-attach -n ub18 -- mkdir -p  /root/.ssh
 2024  sudo cat  ~/.ssh/id_rsa.pub | sudo lxc-attach -n ub18 -- /bin/sh -c "/bin/cat >> /root/.ssh/authorized_keys"
 2025  ssh root@192.168.122.100
 2026  ssh-keygen -f "/home/plu/.ssh/known_hosts" -R "192.168.122.100"
 2027  ssh root@192.168.122.100
 2028  sudo lxc-stop -n ub18 && sudo lxc-destroy -n ub18
```

```bash
apt-get update && apt-get upgrade -yqq && apt-get install vim mc git wget -yqq
apt-get purge --auto-remove -yqq && apt-get clean
rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
```
