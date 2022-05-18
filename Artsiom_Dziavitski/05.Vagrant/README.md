###### 05.Vagrant
### Vagrant Cloud Links

[Centos](https://app.vagrantup.com/adziavitski/boxes/VM-Centos)

[Debian](https://app.vagrantup.com/adziavitski/boxes/VM_debian)

###Vagrantfile
```bash
Vagrant.configure("2") do |config|
### Centos
config.vm.define "VM-Centos" do |centos|
    centos.vm.box = "generic/centos8"
    centos.vm.network "forwarded_port", guest: 80, host: 8080
    centos.vm.hostname = "www-centos"
    centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.cpus = "1"
       vb.memory = "1024"
    end
    centos.vm.provision "shell", inline: <<-SHELL
      sudo -i
      yum update -y
      yum install -y vim git wget curl nginx
      yum clean all
      firewall-cmd --permanent --add-service=http
      firewall-cmd --reload
      systemctl enable --now nginx
      echo "<html><header><title>CentOS8</title></header><body><h1>VM-Centos: $(cat /etc/*os-release)</h1>></body></html>"  > /usr/share/nginx/html/index.html
    SHELL
  end
  
  ### Debian

  config.vm.define "VM_debian" do |debian|
    debian.vm.box = "generic/debian11"
    debian.vm.network "forwarded_port", guest: 80, host: 9080
    debian.vm.hostname = "web-deb"
    debian.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.cpus = "1"
       vb.memory = "1024"
    end
    debian.vm.provision "shell", inline: <<-SHELL
      apt-get update -yqq
      apt install -yqq vim git wget curl nginx
      apt-get clean
      systemctl enable --now nginx
      echo "<html><header><title>Debian11</title></header><body><h1>VM_debian: $(cat /etc/*os-release)</h1>></body></html>"  > /var/www/html/index.html
    SHELL
    end
end
```
