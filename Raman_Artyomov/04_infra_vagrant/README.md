# Vagrant

## Vagrant boxes:
###  [CentOS8](https://app.vagrantup.com/vasily_pupkin/boxes/centos8)
###  [Debian11](https://app.vagrantup.com/vasily_pupkin/boxes/debian11)

---

## Vagrantfiles:

### For Centos8
```bash
Vagrant.configure("2") do |config|
  config.vm.define "centos8" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "512"
      vb.cpus = "1"
    end
    centos.vm.provision "shell", inline: <<-SHELL
      useradd -m updater -s /bin/bash
      echo "updater:vagrant" | chpasswd
      echo 'updater ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/updater
      yum install -y git mc tmux vim wget curl
      yum clean all
    SHELL
  end
end
```

### For Debian11
```bash
Vagrant.configure("2") do |config|
  config.vm.define "debian11" do |debian|
    debian.vm.box = "debian/bullseye64"
    debian.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "512"
      vb.cpus = "1"
    end
    debian.vm.provision "shell", inline: <<-SHELL
      useradd -m updater -s /bin/bash
      echo "updater:vagrant" | chpasswd
      echo 'updater ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/updater
      apt-get update
      apt-get install -yqq git mc tmux vim wget curl
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
    SHELL
  end
end
```
---

## Bash History

### For Centos8
```bash
mkdir centos8 && cd centos8
vim Vagrantfile
vagrant up && vagrant halt
vagrant package centos8 --output centos8.box
vagrant cloud publish --release vasily_pupkin/centos8 0.01 virtualbox centos8.box
```

### For Debian11
```bash
mkdir debian11 && cd debian11
vim Vagrantfile
vagrant up && vagrant halt
vagrant package debian11 --output debian11.box
vagrant cloud publish --release vasily_pupkin/debian11 0.01 virtualbox debian11.box
```

