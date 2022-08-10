## 05.Vagrant

### Urls to vagrant boxes in vagrant cloud:

[https://app.vagrantup.com/yurych/boxes/demo_vagrant_debian_nginx](https://app.vagrantup.com/yurych/boxes/demo_vagrant_debian_nginx)
[https://app.vagrantup.com/yurych/boxes/demo_vagrant_centos_nginx](https://app.vagrantup.com/yurych/boxes/demo_vagrant_centos_nginx)

### Commands how-to run:

```bash
vagrant init yurych/demo_vagrant_debian_nginx \
  --box-version 1.0.0
vagrant up

vagrant init yurych/demo_vagrant_centos_nginx \
  --box-version 1.0.0
vagrant up
```

### Vagrantfile:

```bash
Vagrant.configure("2") do |config|
    config.vm.define "host1" do |debian|
      debian.vm.box = "generic/debian11"
      debian.vm.network "forwarded_port", guest: 80, host: 8081
      debian.vm.network "private_network", ip: "192.168.56.11"
      debian.vm.provider "virtualbox" do |vb|
         vb.gui = false
         vb.memory = "2048"
         vb.cpus = "4"
      end
      debian.vm.provision "shell", inline: <<-SHELL
        apt update
        apt install -y vim git wget curl nginx
        echo "Yury Charnenkau (Debian)" > /var/www/html/index.html
      SHELL
    end
    config.vm.define "host2" do |centos|
      centos.vm.box = "generic/centos8"
      centos.vm.network "forwarded_port", guest: 80, host: 8082
      centos.vm.network "private_network", ip: "192.168.56.12"
      centos.vm.provider "virtualbox" do |vb|
         vb.gui = false
         vb.memory = "2048"
         vb.cpus = "4"
      end
      centos.vm.provision "shell", inline: <<-SHELL
        dnf update
        dnf install -y vim git wget curl nginx
        echo "Yury Charnenkau (CentOS)" > /usr/share/nginx/html/index.html
        systemctl enable nginx
        systemctl start nginx
        firewall-cmd --permanent --add-port=80/tcp
        firewall-cmd --reload
      SHELL
    end
  end
```
