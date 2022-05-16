# homework 05.Vagrant  

## Links:

- [Debian](https://app.vagrantup.com/Ulasik_Henadzi/boxes/Debian)
- [Centos](https://app.vagrantup.com/Ulasik_Henadzi/boxes/VM-Centos)



##Debian script
```go
Vagrant.configure("2") do |config|
  config.vm.define "Debian" do |debian|
    config.vm.box = "debian/bullseye64"
    debian.vm.network "forwarded_port", guest: 80, host: 8082
    debian.vm.network "private_network", ip: "192.168.2.1"
    debian.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
    end
    debian.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y vim git wget curl nginx
      systemctl enable nginx
      systemctl start nginx
      echo "<html><head><title>Debian</title></head><body><h3>Custom Ulasik index for Debian with version: $(grep VERSION= /etc/os-release)</h3></body></html>" > /var/www/html/index.html
    SHELL
  end
end
```

##Centos script
```go
Vagrant.configure("2") do |config|
  config.vm.define "VM-Centos" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.network "forwarded_port", guest: 80, host: 8083
    centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
    end
    centos.vm.provision "shell", inline: <<-SHELL
	  cd /etc/yum.repos.d/
	  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
	  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
      yum update -y
      yum install vim git wget curl nginx -y
      systemctl enable nginx
      systemctl start nginx
      echo "<html><head><title>Debian</title></head><body><h3>Custom index for Centos with version: $(grep VERSION= /etc/centos-release)</h3></body></html>" > /usr/share/nginx/html/index.html
    SHELL
  end
end
```