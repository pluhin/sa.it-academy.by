# 04.Vagrant
## Basic commands
```sh
vagrant up #- create container
vagrant ssh #- enter the container
vagrant halt #- stop container
vagrant destroy -f #-remove all resurse
logout #-exit container
```
### debian
```sh
mkdir debian
cd debian
nano Vagrantfile
vagrant up #- create container
vagrant ssh #- enter the container
logout #-exit container
```
### Vagrantfile debian
```sh
Vagrant.configure("2") do |config|
  config.vm.box = "debian/jessie64"
end
```
### debian CMD
```sh
sudo apt-get -y update
sudo apt-get install -y vim git wget curl mc adduser
sudo adduser updater 
sudo visudo
updater ALL=(ALL) NOPASSWD:ALL
sudo usermod -aG sudo updater
logout
vagrant package --output debian.box
vagrant halt
vagrant destroy -f
vagrant cloud publish --release mrpihma/debianjessie64 1.1 virtualbox debian.box
```
### centos
```sh
mkdir centos
cd centos
nano Vagrantfile
vagrant up #- create container
vagrant ssh #- enter the container
logout #-exit container
```
### Vagrantfile centos
```sh
Vagrant.configure("2") do |config|
  config.vm.box = "centos/8"
end
```
### centos CMD
```sh
sudo yum -y update
sudo yum install -y vim git wget curl mc
sudo adduser updater
sudo passwd updater
sudo visudo
updater ALL=(ALL) NOPASSWD:ALL
sudo usermod -aG wheel updater

logout
vagrant package --output centos.box
vagrant halt
vagrant destroy -f
vagrant cloud publish --release mrpihma/centos 1.1 virtualbox centos.box
```
### Links
#### vagrantup [DEBIAN](https://app.vagrantup.com/mrpihma/boxes/debianjessie64) 
#### vagrantup [CENTOS](https://app.vagrantup.com/mrpihma/boxes/centos) 


