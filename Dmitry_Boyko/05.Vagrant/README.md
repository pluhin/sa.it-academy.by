# 05.Vagrant

## Url for Debian image box

```
https://app.vagrantup.com/develone/boxes/debian-nginx
```

## Url for CentOS image box

```
https://app.vagrantup.com/develone/boxes/centos-nginx
```

## Vagrantfile for Debian

```ruby
Vagrant.configure("2") do |config|
  config.vm.define "host-debian" do |debian|
    debian.vm.box = "debian/bullseye64"
    debian.vm.network "forwarded_port", guest: 80, host: 8088
    debian.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "512"
    end
    debian.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
      apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade
      apt-get install -yqq vim git wget curl nginx
      echo "<html><header><title>Debian :: Custom index.html </title></header><body><center><h1>Host system: $(lsb_release -ds)</h1></center></body></html>" > /var/www/html/index.html
    SHELL
  end
end
```

## Vagrantfile for CentOS

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
      yum update -y
      yum install vim git wget curl nginx -y
      systemctl enable nginx
      systemctl start nginx
      echo "<html><header><title>CentOS :: Custom index.html </title></header><body><center><h1>Host system: $(cat /etc/centos-release)</h1></center></body></html>" > /usr/share/nginx/html/index.html
    SHELL
  end
end

```

