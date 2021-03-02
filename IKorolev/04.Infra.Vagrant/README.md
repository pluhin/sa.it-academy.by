04. Vagrant
---

# Vagrant boxes

* [debian](https://app.vagrantup.com/Korolev731/debian_test)
* [centos8](https://app.vagrantup.com/Korolev731/centos8)


## Vagrantfile Debian

```
Vagrant.configure("2") do |config|
    config.vm.define "host1" do |debian|
    debian.vm.box = "debian/jessie64"
    debian.vm.network "forwarded_port", guest: 80, host: 8083
    debian.vm.network "private_network", ip: "100.104.146.213"
    debian.vm.synced_folder ".", "/vagrant_data"
    debian.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "512"
    end
    debian.vm.provision "shell", inline: <<-SHELL
        sudo su
		apt update
		sudo apt upgrade -y 
		sudo apt install vim git wget curl  -y 
    SHELL
  end
end

```
## Vagrantfile Centos

```
Vagrant.configure("2") do |config|
    config.vm.define "host3" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.network "forwarded_port", guest: 80, host: 8085
    centos.vm.network "private_network", ip: "100.104.146.215"
    #/config1.vm.synced_folder ".", "/vagrant_data"
    centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
	   vb.cpus = "2"
    end
    centos.vm.provision "shell", inline: <<-SHELL
        sudo yum install -y vim git wget curl mc
		sudo adduser updater
		sudo passwd updater
		sudo visudo
		added string `insider ALL=(ALL) NOPASSWD: ALL`
		    SHELL
  end
end
```


## Basic Vagrant Usage

> vagrant ssh 
* SSH into virtual machine.

> vagrant up
* Start virtual machine.

> vagrant share
* Share your virtual machine to the world via a temporary and unique url.

> vagrant halt
* Halt virtual machine.


















