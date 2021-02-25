# Vagrant

```bash
10312* vboxmanage --version
10313* vagrant --version
10314  git pull
10315  cd demo
10316  ls
10317  mkdir 04.Infra.Vagrant
10318  cd 04.Infra.Vagrant
10319  mkdir {1..6}
10320  ls
10321  cd 01
10322  cd 1
10323  vagrant int
10324  vagrant init centos/8
10325  vagrant up
10326  vagrant ssh
10327  vagrant status
10328* vagrant global-status
10329  vagrant halt
10330  vagrant start
10331  vagrant up
10332  vagrant ssh
10333  vagrant halt && vagrant destroy -f
10334  cd ../2
10335  vagrant box list
10336  vagrant up
10337  vagrant halt
10338  vagrant up
10339  vagrant ss
10340  vagrant ssh
10341  vagrant up
10342  vagrant ssh host1
10343  vagrant ssh host2
10344  vagrant halt && vagrant destroy -f
10345  cd ../3
10346  ifconfig
10347  vagrant up
10348  ssh vagrant@192.168.1.244
10349  vagrant halt && vagrant destroy -f
10350  cd  ../04
10351  cd  ../4
10352* ping DEBIAN_FRONTEND=noninteractive
10353* ping 192.168.1.50
10354  vagrant up 
10355* home_connect_local
10356  ping 10.20.30.20
10357  vagrant halt && vagrant destroy -f
10358  cd ../5
10359  vagrant init bento/ubuntu-18.04
10360  vagrant up
10361  vagrant ssh 
10362  vagrant package --output /tmp/test.box
10363  ls -l /tmp/test.box
10364  ls -l /tmp/test.box -h
10365  vagrant cloud publish --release pluhin/test2 1.1.2 virtualbox /tmp/test.box
10369* vagrant cloud auth login
10370  rm /tmp/test.box
10371  vagrant global-status
10372  vagrant halt && vagrant destroy -f
```



## SSH jump settings

```bash
 6402  ping 192.168.1.50
 6403  ping 10.20.30.20
 6404  ssh vagrant@192.168.1.50
 6405  ssh-copy-id -i vagrnat@192.168.1.50
 6406  ssh-copy-id -i vagrant@192.168.1.50
 6407  vim .ssh/config
 6408  ssh vagrant@10.20.30.20
 6409  ssh-keygen -f "/home/plu/.ssh/known_hosts" -R "10.20.30.20"
 6410  ssh vagrant@10.20.30.20
 6411  ssh-copy-id vagrant@10.20.30.20
 6412  ssh vagrant@10.20.30.20
```

Configuration file for ssh client `~/.ssh/config`

```
Host home_jump
        User vagrant
        HostName 192.168.1.50
Host 10.20.30.*
        ProxyJump home_jump
```


> REFERENCE: *Vagrantfile 4*


## Vagrant cloud. Public new image

New box. Commands inside:

```bash
sudo -i
apt-get update && apt-get upgrade -yqq && apt-get install vim mc git wget -yqq
rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
```