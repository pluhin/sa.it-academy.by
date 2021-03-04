# 04.Vagrant
## Basic usage
```sh
vagrant up #-start container
vagrant ssh #-enter container
vagrant halt #-stop container
vagrant destroy -f #-remove all
logout #-exit container
```
## debian vm
```sh
mkdir debian_sk
cd debian_sk
nano Vargantfile
```
### Vargantfile for debian
```sh
Vargant.configure("2") do |config|
  config.vm.define "host1" do |debian|
    debian.vm.box = "debian/buster64"
  end
end
```
### debian command history
```sh
sudo apt-get -y update
sudo apt-get install vim git wget curl mc adduser
sudo adduser updater
sudo visudo
updater ALL=(ALL) NOPASSWD:ALL
sudo usermod -aG sudo updater
logout
vagrant package --output debian_sk.box
vagrant halt
vagrant destroy -f
vagrant cloud publish --release sergeikoltochihin/debian_sk 1.1 virtualbox debian_sk.box
```
## centos vm
```sh
mkdir centos_sk
cd centos_sk
nano Vagrantfile
```
### Vagrantfile for centos
```sh
Vagrant.configure("2") do |config|
  config.vm.define "host2" do |centos|
    centos.vm.box = "centos/8"
  end
end
```
### centos command history
```sh
sudo yum -y update
sudo yum install -y vim git wget curl mc
sudo adduser updater
sudo passwd updater
sudo visudo
updater ALL=(ALL) NOPASSWD:ALL
sudo usermod -aG wheel updater
logout
vagrant package --output centos_sk.box
vagrant halt
vagrant destroy -f
vagrant cloud publish --release sergeikoltochihin/centos_sk 1.1 virtualbox centos_sk.box
```
## Cloud links
### [DEBIAN image](https://app.vagrantup.com/sergeikoltochihin/boxes/debian_sk)
### [CENTOS image](https://app.vagrantup.com/sergeikoltochihin/boxes/centos_sk)
