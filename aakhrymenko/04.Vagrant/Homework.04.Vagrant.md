# 04.Vagrant
## Vagrant Boxes 
https://app.vagrantup.com/andreymailmail/boxes/test1-debian
https://app.vagrantup.com/andreymailmail/boxes/test2-centos

## Vagrantfile

```ruby

Vagrant.configure("2") do |config|
  config.vm.define "Debian10" do |debian|
    debian.vm.box = "generic/debian10"
    end
    debian.vm.provision "shell", inline: <<-SHELL
      useradd -m -g vagrant updater
      echo updater:vagrant | chpasswd
      apt-get install vim git wget curl -yqq
    SHELL
  end
  config.vm.define "Centos8" do |centos|
    centos.vm.box = "centos/8"
    end
    centos.vm.provision "shell", inline: <<-SHELL
      useradd -g vagrant updater
      echo vagrant | passwd --stdin updater
      yum install vim git wget curl -yqq
    SHELL
  end
end

```
