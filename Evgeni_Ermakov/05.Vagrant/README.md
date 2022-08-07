## Vagrant cloud

* [Centos 8](https://app.vagrantup.com/evgeniermakov/boxes/centos8-homework)

* [Debian 11](https://app.vagrantup.com/evgeniermakov/boxes/debian11-homework)

## Vagrantfiles

### Debian 11

```bash
Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.network "forwarded_port", guest: 80, host: 8211
  config.vm.network "private_network", ip: "192.168.56.211"
  config.vm.provision "file", source: "index.html", destination: "~/"
  config.vm.boot_timeout = 1200      
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "4096"
    vb.cpus = "1"
  end
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update && apt-get upgrade -yqq
    sudo apt-get install vim git wget curl nginx -y
    sudo systemctl enable nginx
    sudo systemctl start nginx
    sudo cp index.html /usr/share/nginx/html
    sudo systemctl restart nginx
    sudo rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
    sudo cat /dev/null > ~/.bash_history && history -c && exit
  SHELL
end
````

### Centos 8

```bash
Vagrant.configure("2") do |config|
  config.vm.box = "centos/8"
  config.vm.network "forwarded_port", guest: 80, host: 8212
  config.vm.network "private_network", ip: "192.168.56.212"
  config.vm.provision "file", source: "index.html", destination: "~/"
  config.vm.boot_timeout = 1200
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "4096"
    vb.cpus = "1"
  end
  config.vm.provision "shell", inline: <<-SHELL
    sudo dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos -y
    sudo dnf distro-sync -y
    sudo dnf install -y vim git wget curl nginx
    sudo systemctl enable nginx
    sudo systemctl start nginx
    sudo cp index.html /usr/share/nginx/html
    sudo systemctl restart nginx
    sudo rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
    sudo cat /dev/null > ~/.bash_history && history -c && exit
  SHELL
end	
```

## How to run

### Debian 11

```bash
vagrant init evgeniermakov/debian11-homework \
  --box-version 1.0.0
vagrant up
```

### Centos 8

```bash
vagrant init evgeniermakov/centos8-homework \
  --box-version 1.0.0
vagrant up
```
