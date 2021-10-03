# 04 Vagrant

## Centos

```ruby
Vagrant.configure("2") do |config|
    config.vm.box = "centos/8"
    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = "1024"
    end
end

sudo useradd -p vagrant -s /bin/bash updater
echo "updater ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
sudo su updater
sudo yum -yq update
sudo yum install -yq vim git wget curl
```
## Debian

```ruby
Vagrant.configure("2") do |config|
    config.vm.box = "debian/jessie64"
    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = "1024"
    end
end

sudo useradd -p vagrant -s /bin/bash updater
echo "updater ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
sudo su updater
sudo apt-get update -yq
sudo apt-get install -yq vim git wget curl
```

## Vagrant cloud links

[Debian](https://app.vagrantup.com/este11o/boxes/Debian)
[Centos](https://app.vagrantup.com/este11o/boxes/CentOS)
