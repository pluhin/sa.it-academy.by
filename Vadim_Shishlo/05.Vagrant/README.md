# 05.Vagrant

## [Debian Cloud](https://app.vagrantup.com/mnogosemok/boxes/debian11)
## [Centos Cloud](https://app.vagrantup.com/mnogosemok/boxes/centos8)

## Debian
```bash
Vagrant.configure("2") do |config|

  config.vm.box = "Debian11"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.10"
 
  config.vm.provider "virtualbox" do |vb|
   vb.cpus = "1"
   vb.memory = "1024"
  end
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt install vim git wget curl
    apt-get install -y nginx
    systemctl start nginx
    systemctl enable nginx
    echo "<center><H1>debian11 server2</H1></center>" > /var/www/html/index.nginx-debian.html
   SHELL
end
```
## Centos
```bash
Vagrant.configure("2") do |config|

  config.vm.box = "Centos8"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip:"192.168.19.175"
   
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "1"
    vb.memory = "1024"
  end
  config.vm.provision "shell", inline: <<-SHELL
     yum update 
     yum install -y vim git wget curl
     yum install epel-release
     yum install -y nginx
     systemctl start nginx
     systemctl enable nginx
     firewall-cmd --zone=public --permanent --add-service=http
     firewall-cmd --zone=public --permanent --add-service=https
     firewall-cmd --reload
     echo "<center><H1>centos8 server1</H1></center>" > /usr/share/nginx/html/index.html
   SHELL
end
```
