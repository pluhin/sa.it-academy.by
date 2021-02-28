# How to run

```
vagrant up - run all OS in container

vagrant up host1 - run only Debian_10

vagrant up host2 - run only Centos_8

vagrant ssh host1 - enter in Debian_10 OS

vagrant ssh host2 - enter in Centos_8 OS

exit - logout

vagrant halt && destroy -f - stop and remove conteiner with two OS.

```
## host1 (debian_10)

### Vagrantfile

```
Vagrant.configure("2") do |config|
  config.vm.define "host1" do |debian|
    debian.vm.box = "debian/buster64"
    end
```

### history host1

```
sudo apt update

sudo apt install vim, git, wget, curl

sudo adduser updater

sudo usermod -aG sudo updater

sudo visudo

	updater ALL=(ALL) NOPASSWD:ALL

rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base

cat /dev/null > ~/.bash_history && history -c && exit

```

## Host2 (Centos_8)

### Vagrantfile

```
Vagrant.configure("2") do |config|
  config.vm.define "host2" do |centos|
    centos.vm.box = "centos/8"
    end

```
### history host2

```
sudo yum -y update

sudo yum install -y vim git wget curl

sudo adduser updater

sudo passwd updater

sudo usermod -aG wheel updater

sudo visudo

	updater ALL=(ALL) NOPASSWD:ALL

sudo rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base

cat /dev/null > ~/.bash_history && history -c && exit

```

## history host (my notebook)

```
vagrant package host1  --output debian.box

vagrant package host2  --output debian.box

vagrant cloud publish --release arkadzit/debian_10 0.1 virtualbox debian.box

vagrant cloud publish --release arkadzit/centos_8 0.1 virtualbox centos.box

vagrant halt && vagrant destroy -f
```

## Vagrant Cloud

### [Debian_10](https://app.vagrantup.com/arkadzit/boxes/debian_10)

### [Centos_8](https://app.vagrantup.com/arkadzit/boxes/centos_8)