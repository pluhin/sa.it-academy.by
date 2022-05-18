## My vagrant cloud

- [Debian](https://app.vagrantup.com/nikkun/boxes/debian)
- [Centos](https://app.vagrantup.com/nikkun/boxes/centos)


## Vagrant file

```
Vagrant.configure("2") do |config|
config.vm.define "Debian_11" do |debian|
    debian.vm.box = "debian/bullseye64"
    debian.vm.network "forwarded_port", guest: 80, host: 8083
    debian.vm.network "private_network", ip: "192.168.56.50"
    debian.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
       vb.cpus = "1"
    end
    debian.vm.provision "file", source: "index1.html", destination: "~/"
    debian.vm.provision "shell", inline: <<-SHELL
      sudo apt update
      sudo apt install -yqq vim git wget curl nginx
	  sudo systemctl start nginx
	  sudo systemctl enable nginx
      sudo cp index1.html /var/www/html/index.html
      sudo systemctl reload nginx
    SHELL
  end
  config.vm.define "Centos_8" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.network "forwarded_port", guest: 80, host: 8084
    centos.vm.network "private_network", ip: "192.168.56.51"
    centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
	   vb.cpus = "1"
    end
    centos.vm.provision "file", source: "index2.html", destination: "~/"
    centos.vm.provision "shell", inline: <<-SHELL
	  cd /etc/yum.repos.d/
	  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
	  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
      sudo yum update -y
	  sudo yum install -y vim git wget curl nginx
	  sudo systemctl start nginx
	  sudo systemctl enable nginx
      sudo cp /home/vagrant/index2.html /usr/share/nginx/html/index.html
      sudo systemctl reload nginx
    SHELL
  end
end
```

### Index1.html:

```
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>My test page</title>
  </head>
  <body>
    <h1>This page was created by Kunai Nikolai from Debian</h1>
  </body>
</html>
```
### Index2.html:
```
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>My test page</title>
  </head>
  <body>
    <h1>This page was created by Kunai Nikolai from Centos</h1>
  </body>
</html>
```
