# 05.Vagrant 

## Url's to vagrant boxes:
- [Debian](https://app.vagrantup.com/inemkovich/boxes/homework/versions/1.0.0)
- [CentOS](https://app.vagrantup.com/inemkovich/boxes/homework/versions/1.0.1)

## Vagrant file:
```ruby
Vagrant.configure("2") do |config|
  config.vm.define "deb" do |debian|
    debian.vm.box = "debian/bullseye64"
    debian.vm.network "forwarded_port", guest: 80, host: 8083
    debian.vm.network "private_network", ip: "192.168.2.101"
    debian.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "2048"
       vb.cpus = "2"
    end
    debian.vm.provision "file", source: "index.html", destination: "/tmp/"
    debian.vm.provision "shell", inline: <<-SHELL
      apt update
      apt-get install -yqq vim git wget curl nginx
      cp /tmp/index.html /var/www/html/index.nginx-debian.html
      systemctl restart nginx
    SHELL
  end
  config.vm.define "cent" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.network "forwarded_port", guest: 80, host: 8084
    centos.vm.network "private_network", ip: "192.168.2.102"
    centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "2048"
       vb.cpus = "2"
    end
    centos.vm.provision "file", source: "index.html", destination: "/tmp/"
    centos.vm.provision "shell", inline: <<-SHELL
      dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos -y
      dnf distro-sync -y
      dnf update -y
      dnf install -y vim git wget curl nginx
      cp /tmp/index.html /usr/share/nginx/html/index.html
      systemctl enable nginx
      systemctl start nginx
    SHELL
  end
end
```

## How to run:
### Debian:
``` ruby
Vagrant.configure("2") do |config|
  config.vm.box = "inemkovich/homework"
  config.vm.box_version = "1.0.0"
end
```
### CentOS:
```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "inemkovich/homework"
  config.vm.box_version = "1.0.1"
end
```

## Index.html:
```html
<!DOCTYPE html>
<html>
<head>
<title>05.Vagrant!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>05.Vagrant homework is done!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Main page is changed.</p>
</body>
</html>
```