# 05.Vagrant by Igor Golubovich

## Vagrant cloud:

- [debian_image](https://app.vagrantup.com/igor_golubovich/boxes/web_debian)
- [centos_image](https://app.vagrantup.com/igor_golubovich/boxes/web_centos)


## Vagrant files:

### debian:
```ruby
Vagrant.configure("2") do |config|
  config.vm.define "Debian" do |web_debian|
    config.vm.box = "debian/bullseye64"
    web_debian.vm.network "forwarded_port", guest: 80, host: 8088
    web_debian.vm.network "public_network", ip: "192.168.0.10", netmask:"255.255.255.0", bridge: "Intel(R) Ethernet Connection (7) I219-V"
    web_debian.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
       vb.cpus = "1"
    end
    web_debian.vm.provision "shell", inline: <<-SHELL
      sudo -i
      apt-get update && apt-get upgrade -yqq && apt-get install vim mc git wget nginx -yqq
      rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
      cat /dev/null > ~/.bash_history && history -c && exit
      systemctl enable nginx
      systemctl start nginx
      SHELL
    web_debian.vm.provision "file", source: "index.html", destination: "/tmp/"
    web_debian.vm.provision "shell", inline: <<-SHELL
      mv /tmp/index.html /var/www/html/index.html
      systemctl restart nginx
      SHELL
  end
end
```

### centos:
```ruby
Vagrant.configure("2") do |config|
  config.vm.define "centos" do |web_centos|
    config.vm.box = "generic/centos8"
    web_centos.vm.network "forwarded_port", guest: 80, host: 8089
    web_centos.vm.network "public_network", ip: "192.168.0.11", netmask:"255.255.255.0", bridge: "Intel(R) Ethernet Connection (7) I219-V"
    web_centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
       vb.cpus = "1"
    end
    web_centos.vm.provision "shell", inline: <<-SHELL
      sudo -i
      yum update && yum upgrade -yqq && yum install vim mc git wget nginx -yqq
      rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
      cat /dev/null > ~/.bash_history && history -c && exit
      systemctl enable nginx
      systemctl start nginx
      SHELL
    web_centos.vm.provision "shell", inline: <<-SHELL
      sudo firewall-cmd --permanent --add-service=http
      sudo firewall-cmd --reload
      SHELL
    web_centos.vm.provision "file", source: "index.html", destination: "/tmp/"
    web_centos.vm.provision "shell", inline: <<-SHELL
      mv /tmp/index.html /usr/share/nginx/html/index.html
      systemctl restart nginx
      SHELL
  end
end
```

### index.html:
```html
<html>
<body bgcolor="gray">
<h2><font color="gold"><div><center>05.Vagrant Homework</center></div></font></h2>
<b><font color="orange"><div><center>Create by Igor Golubovich for DevOps course</center></div></font></b>
</body>
</html>
```
