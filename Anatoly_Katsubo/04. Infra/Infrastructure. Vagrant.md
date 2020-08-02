# 04.Infra

### Debian
link: [Debian](https://app.vagrantup.com/jintolia/boxes/Debian10)
vagrantfile:

``` ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

   Vagrant.configure("2") do |config|
       config.vm.box = "debian/buster64"
       config.vm.provision "shell", inline: <<-SHELL
  	       useradd -m -p vagrant updater
           echo 'updater ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/updater
           apt install -y vim git wget curl 
       SHELL
end

```
### CentOS

link: [CentOS](https://app.vagrantup.com/jintolia/boxes/CentOS8)
vagrantfile:
``` ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/8"
  config.vm.provision "shell", inline: <<-SHELL
    useradd -m -p vargant updater
    yum install -y git curl vim wget
  SHELL
end

```
