# 04 Vagrant

Ubuntu
```
Vagrant.configure("2") do |config|
  config.vm.define "Centos" do |centos|
  config.vm.box = "centos/7"
  centos.vm.network "private_network", ip: "192.168.56.10"
  centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "2048"
       vb.cpus = "4"
  end
centos.vm.provision "shell", inline: <<-SHELL
yum install epel-release -y
yum install nano git wget curl nginx -y
 #firewall-cmd --permanent --add-service=http
 #firewall-cmd --permanent --add-service=https
 #firewall-cmd --reload
systemctl start nginx
systemctl enable nginx
rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
SHELL
   end
  end
```

Centos

```
Vagrant.configure("2") do |config|
config.vm.define "Ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/focal64"
    ubuntu.vm.network "private_network", ip: "192.168.56.11"
    ubuntu.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "2048"
       vb.cpus = "4"
    end
    ubuntu.vm.provision "shell", inline: <<-SHELL
sudo apt-get update && apt-get upgrade
apt-get install  nano git wget curl nginx -y
systemctl start nginx
systemctl enable nginx
sudo rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
       sudo cat /dev/null > ~/.bash_history && history -c && exit
    SHELL
  end
end
```

MigelAlfa/myVB

```
Vagrant.configure("2") do |config|
  config.vm.box = "MigelAlfa/myVB"
  config.vm.box_version = "1.0.0"
end
```
