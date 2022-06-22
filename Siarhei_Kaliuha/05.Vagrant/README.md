# Homework report for 05.Vagrant by Siarhei Kaliuha

---

## Vagrant cloud repository URLs:

* [Debian latest](https://app.vagrantup.com/s-kalyuga/boxes/nginx_debian) with nginx.
* [Centos latest](https://app.vagrantup.com/s-kalyuga/boxes/nginx_centos) with nginx.


## How to run:

* Debian latest with nginx:
```
Vagrant.configure("2") do |config|
  config.vm.box = "s-kalyuga/nginx_debian"
  config.vm.box_version = "1.0.0"
end
```
* Centos latest with nginx:
```
Vagrant.configure("2") do |config|
  config.vm.box = "s-kalyuga/nginx_centos"
  config.vm.box_version = "1.0.0"
end
```


## Vagrantfile:
```
Vagrant.configure("2") do |config|

  config.vm.define "host1" do |debian|
    debian.vm.box = "debian/bullseye64"
    debian.vm.network "forwarded_port", guest: 80, host: 8083
    debian.vm.network "public_network", ip: "192.168.0.51", bridge: "Intel(R) Ethernet Connection (2) I218-V"
    debian.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "2048"
       vb.cpus = "2"
    end
    debian.vm.provision "shell", inline: <<-SHELL
       sudo -i
       apt-get update && apt-get upgrade -yqq   
       apt-get install -y vim git wget curl nginx
       systemctl enable nginx
       systemctl start nginx
    SHELL
    debian.vm.provision "file", source: "index.html", destination: "/tmp/"
    debian.vm.provision "shell", inline: <<-SHELL
       sudo -i 
       cp /tmp/index.html /var/www/html/index.html
       systemctl restart nginx
       rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
       cat /dev/null > ~/.bash_history && history -c && exit
    SHELL
  end

  config.vm.define "host2" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.network "forwarded_port", guest: 80, host: 8084
    centos.vm.network "public_network", ip: "192.168.0.52", bridge: "Intel(R) Ethernet Connection (2) I218-V"
    centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "2048"
       vb.cpus = "2"
    end
    centos.vm.provision "shell", inline: <<-SHELL
       sudo -i
       sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
       sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
       yum update -y
       yum install -y vim git wget curl nginx
       systemctl enable nginx
       systemctl start nginx
    SHELL
    centos.vm.provision "file", source: "index.html", destination: "/tmp/"
    centos.vm.provision "shell", inline: <<-SHELL
       sudo -i 
       cp /tmp/index.html /usr/share/nginx/html/index.html
       systemctl restart nginx
       rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
       cat /dev/null > ~/.bash_history && history -c && exit
    SHELL
  end
  
end
```


## Index.html:

```
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body bgcolor="yellow">
<h1>Welcome to nginx test page by Siarhei Kaliuha!</h1>
<p>This page created in scope of DevOps training course at
<a href="https://www.it-academy.by/">IT Academy</a>.</p>

<p>For nginx online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
<p><em>Join IT Academy!</em></p>

</body>
</html>
```