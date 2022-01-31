## 05.Vagrant

### Debian
https://app.vagrantup.com/artsiomlabin/boxes/debian
### CentOS
https://app.vagrantup.com/artsiomlabin/boxes/centos

### Debian Vagrantfile
```ruby
Vagrant.configure("2") do |config|
  config.vm.define "debian" do |debian|
    debian.vm.box = "debian/bullseye64"
    debian.vm.network "forwarded_port", guest: 80, host: 8055
    debian.vm.network "private_network", ip: "192.168.52.25"
    debian.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
    end
    debian.vm.provision "shell", inline: <<-SHELL
      apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade
      apt-get install -y vim git wget curl nginx
      echo "<html><head><title>Debian</title></head><body><h1>Debian latest</h1></body></html>" > /var/www/html/index.html
    SHELL
  end
end
```

### CentOS Vagrantfile
```ruby
Vagrant.configure("2") do |config|
  config.vm.define "host-centos" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.network "forwarded_port", guest: 80, host: 8089
    centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
    end
    centos.vm.provision "shell", inline: <<-SHELL
      sudo -i
      yum update -y
      yum install vim git wget curl nginx -y
      systemctl enable nginx
      systemctl start nginx
      echo "<html><head><title>Centos</title></head><body><h1>Centos latest</h1></body></html>" > /var/www/html/index.html
    SHELL
  end
end
```
### screenshot
![alt text](screenshot.png)