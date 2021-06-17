## Vagrant

History

```bash
10489  cd ../
10490  git pull
10491  mkdir 04.Infra.Vagrant/{1..6}
10492  mkdir 04.Infra.Vagrant/{1..6} -p
10493  cd 04.Infra.Vagrant
10494  ls
10495  cd 1
10496  vboxmanage --version
10497  vagrant --version
10498  vagrant init centos/8
10499  ls -l 
10500  vim Vagrantfile
10501  vagrant up
10502  vagrant ssh 
10503  vagrant status
10504  vagrant global-status
10505  vagrant halt 7016339
10506  vagrant halt 7016339 -f
10507  vagrant global-status --prune
10508  vagrant global-status
10509  ls -l
10510  ls -la
10511  cat .vagrant/machines/default/virtualbox/private_key
10512  q
10513  :q!
10514  vagrant ssh --help
10515  vagrant halt && vagrant destroy -f
10516  vagrant up
10517  cat .vagrant/machines/default/virtualbox/private_key
10518  vagrant halt
10519  cat .vagrant/machines/default/virtualbox/private_key
10520  vagrant up
10521  cat .vagrant/machines/default/virtualbox/private_key
10522  vagrant halt && vagrant destroy -f
10523  cd ../
10524  cd 2
10525  ls
10526  vim Vagrantfile
10527  vagrant up
10528  vagrant global-status
10529  vagrant ssh host1
10530  vagrant ssh host2
10531  vim Vagrantfile
10532  vagrant ssh host2
10533  vagrant halt && vagrant destroy -f
10534  cd ../
10535  cd 3
10536  vim Vagrantfile
10537  vagrant up
10538* ping 192.168.1.244
10539* ssh vagrant@192.168.1.244
10540  vagrant halt && vagrant destroy -f
10541  cd ../4
10542  ls
10543  vim Vagrantfile
10544  vagrant up
10545* cd ~/Documents/git_repos/home/sa.it-academy.by/demo/04.Infra.Vagrant
10546* cd 5
10547* cd ~
10548* ping 10.20.30.20
10549* ping 10.20.30.22
10550* ping 10.20.30.21
10551* home_connect_local
10552* htop
10553* cd ~/Documents/git_repos/home/sa.it-academy.by/demo/04.Infra.Vagrant
10554* cd 5
10555* free -h
10556* vagrant init bento/ubuntu-18.04
10557  vagrant up jump
10558  vagrant halt jump
10559  vagrant destroy jump
10560  vagrant up jump
10561  vim Vagrantfile
10562  vagrant halt && vagrant destroy -f
10563  cd ../5
10564  ls
10565  vim Vagrantfile
10566  vagrant up
10567  vagrant ssh
10568  vagrant package --output /tmp/test.box
10569  ls -lh /tmp/test.box
10570  vagrant cloud auth login
10571  vagrant cloud publish --release pluhin/test3 1.0.0 virtualbox /tmp/test.box
10572  vagrant global-status
```
---
## Use Jump server

```bash
ssh-copy-id vagrant@192.168.1.50
ssh vagrant@10.20.30.20 -o ProxyCommand="ssh -W %h:%p -q vagrant@192.168.1.50
```

(OR) Use settings in ssh config file:

```
Host home_jump
        User vagrant
        HostName 192.168.1.50
Host 10.20.30.*
        ProxyJump home_jump
```
---

## Publish new box. Preparation

```bash 
sudo -i
apt-get update && apt-get upgrade -yqq && apt-get install vim mc git wget -yqq
rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
```