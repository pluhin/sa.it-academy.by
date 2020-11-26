## Vagrant

Hisotry

```bash
10602  clear
10603  vboxmanage --version
10604  cd demo
10605  ls
10606  mkdir -p 04.Vagrant/{1..6}
10607  cd 04.Vagrant
10608  ls
10609  cd 1
10610  ls
10611  vagrant init centos/8
10612  vim Vagrantfile
10613  vagrant up
10614  vagrant ssh
10615  vagrant status
10616  vagrant ssh
10617  vagrant halt 
10618  vagrant start
10619  vagrant up
10620  vagrant halt && vagrant destroy -f
10621  cd ./.
10622  cd ../
10623  ls
10624  cd 2
10625  vim Vagrantfile
10626  vagrant up
10627  vagrant halt && vagrant destroy -f
10628  vagrant up
10629  vagrant halt && vagrant destroy -f
10630  vagrant up
10631  vagrant ssh host1
10632  vagrant ssh host2
10633  vagrant halt && vagrant destroy -f
10634  cd ../3
10635  vim Vagrantfile
10636  ifconfig
10637  ping 192.168.1.244
10638  cat Vagrantfile
10639  vagrant up
10640  ssh vagrant@192.168.1.244
10641  vagrant halt && vagrant destroy -f
10642  cd ../4
10643  vim Vagrantfile
10644  vagrant up
10645  vagrant ssh host1
10646  vagrant ssh jump
10647  vagrant halt && vagrant destroy -f
10648  home_connect_local
```

```bash
10511  vagrant box list\n
10512  clear
10513  vagrant box list
10514  vagrant status
10515  vagrant global-status
10516  cd ~/Documents/git_repos/home/sa.it-academy.by/demo
10517  d 04.Vagrant
10518  cd 04.Vagrant
10519  cd 5
10520  vagrant init bento/ubuntu-18.04
10521  vagrant up
10522  vagrant ssh
10523  vagrant cloud auth login
10524  vagrant package --output /tmp/test.box
10525  ls -l /tmp/test.box
10526  ls -l /tmp/test.box -h
10527  vagrant cloud publish --release pluhin/test 1.1.2 virtualbox /tmp/test.box
10528  ls -l /etc/ssl/certs
10529  export SSL_CERT_DIR=/etc/ssl/certs
10530  export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
10531  vagrant cloud publish --release pluhin/test 1.1.2 virtualbox /tmp/test.box
10538  vagrant halt && vagrant destroy -f
10539  vagrant global-status
10540  vagrant global-status --help
10541  vagrant global-status --prune
10542  vagrant global-status

```

### Vagrant cloud 

```bash 
sudo -i
apt-get update && apt-get install vim mc git wget -yqq
rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
```