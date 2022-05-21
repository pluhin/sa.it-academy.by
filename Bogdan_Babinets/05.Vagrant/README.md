# 05.Vagrant

## Published test boxes
Centos 8: https://app.vagrantup.com/BB8312/boxes/cen8nginx
Debian 9: https://app.vagrantup.com/BB8312/boxes/deb9nginx


## Vagrant files

### Centos 8
```bash
Vagrant.configure("2") do |config|
  config.vm.define "Centos" do |centos|
    centos.vm.box = "generic/centos8"
    config.vm.network "forwarded_port", guest: 80, host: 8082
    centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "512"
       vb.cpus = "2"
    end
    centos.vm.provision "shell", inline: <<-SHELL
     sudo -i
     yum update -y && yum upgrade -yqq && yum install vim git wget curl mc nginx -yqq
     systemctl start nginx
     systemctl enable nginx
     echo "<html><body>Test Index file</body></html>" > /usr/share/nginx/html/index.html
    SHELL
   end
end
```

### Debian 9
```bash
Vagrant.configure("2") do |config|
  config.vm.define "Debian" do |debian|
    config.vm.box = "generic/debian9"
    debian.vm.network "forwarded_port", guest: 80, host: 8081
    debian.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "512"
      vb.cpus = "2"
    end
    debian.vm.provision "shell", inline: <<-SHELL
     sudo -i
     apt-get update && apt-get upgrade -yqq && apt-get install vim git wget curl mc nginx -yqq
     systemctl start nginx     
     systemctl enable nginx
     echo "<html><body>Test Index file</body></html>" > /var/www/html/index.html
     SHELL
  end
end
```

## How to run

### Centos 8
```bash
Start with:
vagrant init BB8312/cen8nginx \
  --box-version 1.0.0
vagrant up

Vagrantfile:
Vagrant.configure("2") do |config|
  config.vm.box = "BB8312/cen8nginx"
  config.vm.box_version = "1.0.0"
end
```

### Debian 9
```bash
Start with:
vagrant init BB8312/deb9nginx \
  --box-version 1.0.0
vagrant up

Vagrantfile:
Vagrant.configure("2") do |config|
  config.vm.box = "BB8312/deb9nginx"
  config.vm.box_version = "1.0.0"
end
```
