# Vagrant

## Debian Vagrantfile
```bash
$script = <<-SCRIPT
useradd -m -p vagrant updater
echo "updater ALL=(ALL:ALL) NOPASSWD: ALL">>/etc/sudoers
apt-get update -y
apt install -y vim git wget curl
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"
  config.vm.provider "virtualbox" do |vb|
          vb.gui = false
          vb.memory = "256"
          vb.name = "debian-vagrant"
  end
  config.vm.provision "shell", inline: $script
end
```
[Link to Vagrant box](https://app.vagrantup.com/YBelyagov/boxes/debian10) Debian 10


## CentOS Vagrantfile
```bash
$script = <<-SCRIPT
useradd -m -p vagrant updater
echo "updater ALL=(ALL:ALL) NOPASSWD: ALL">>/etc/sudoers
yum update -y
yum install -y vim git wget curl
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "centos/8"
  config.vm.provider "virtualbox" do |vb|
          vb.gui = false
          vb.memory = "128"
          vb.name = "centos-vagrant"
  end
  config.vm.provision "shell", inline: $script
end
```
[Link to Vagrant box](https://app.vagrantup.com/YBelyagov/boxes/centos8) CentOS 8

# LXC

## Debian
**Config**
```bash
lxc.uts.name = debian_9
lxc.arch = amd64
lxc.cgroup.cpuset.cpus = 0,1
lxc.cgroup.cpu.shares = 100
lxc.cgroup.memory.limit_in_bytes = 128mb
```
**Install and start**
```bash
sudo lxc-create --config config.conf --template download --name debian_9 -- --dist debian --release stretch --arch amd64
sudo lxc-start --name debian_9
```
**Create user**
```bash
sudo lxc-attach --name debian_9
useradd -m insider
echo -e 'superstrongpassword\nsuperstrongpassword\n' | passwd insider
echo "insider ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
```

## CentOS
**Config**
```bash
lxc.uts.name = centos_7
lxc.arch = amd64
lxc.cgroup.cpuset.cpus = 0,1
lxc.cgroup.cpu.shares = 100
lxc.cgroup.memory.limit_in_bytes = 128mb
```
**Install and start**
```bash
sudo lxc-create --config config.conf --template download --name centos_7 -- --dist centos --release 7 --arch amd64
sudo lxc-start --name centos_7
```
**Create user**
```bash
sudo lxc-attach --name centos_7
useradd -m insider
echo -e 'superstrongpassword\nsuperstrongpassword\n' | passwd insider
echo "insider ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers