# 05.Vagrant homework

## Vagrant cloud links:
* [Debian demo](https://app.vagrantup.com/ibombel/boxes/demo_debian)
* [Centos demo](https://app.vagrantup.com/ibombel/boxes/demo_centos)

## Vagrant files:
### Debian:
```bash
Vagrant.configure("2") do |config|
  config.vm.define "Debian" do |debian|
    config.vm.box = "debian/bullseye64"
    debian.vm.network "forwarded_port", guest: 80, host: 8082
    debian.vm.network "private_network", ip: "192.168.1.5"
    debian.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "1024"
      vb.cpus = "1"
    end
    debian.vm.provision "shell", inline: <<-SHELL
     sudo -i
     apt-get update && apt-get upgrade -yqq && apt-get install vim mc git wget nginx -yqq
     rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
     cat /dev/null > ~/.bash_history && history -c && exit
     systemctl enable nginx
     systemctl start nginx
     echo "<html><body><h3>Custom index for Debian: $(grep VERSION= /etc/os-release)</h3></body></html>" > /usr/share/nginx/html/index.html
     SHELL
  end
end
```

### Centos:
```bash
Vagrant.configure("2") do |config|
  config.vm.define "Centos" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.network "forwarded_port", guest: 80, host: 8082
    centos.vm.network "private_network", ip: "192.168.1.5"
    centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
       vb.cpus = "1"
    end
    centos.vm.provision "shell", inline: <<-SHELL
	   sudo -i
     yum update && yum upgrade -yqq && yum install vim mc git wget nginx -yqq
     rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
     cat /dev/null > ~/.bash_history && history -c && exit
     systemctl enable nginx
     systemctl start nginx
     echo "<html><body><h3>Custom index for Centos: $(grep VERSION= /etc/centos-release)</h3></body></html>" > /usr/share/nginx/html/index.html
    SHELL
   end
end
```