# Centos
``` bash
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "192.168.55.2"
   config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.memory = "1024"
   end
   config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/pub_key.pub"
   config.vm.provision "shell", inline: <<-SHELL
     yum  update
     yum install vim
     yum install git 
     yum install wget
     yum install curl
     useradd -d  /home/updater -s /bin/bash -p vagrant updater
     echo "updater ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers
     mkdir /home/updater/.ssh && cd /home/updater/.ssh &&  touch authorized_keys
     chown  -R updater:updater /home/updater/.ssh  
     cat /tmp/pub_key.pub >> /home/updater/.ssh/authorized_keys
     chmod 600   /home/updater/.ssh/authorized_keys
   SHELL
end
```

# Debian
```bash
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.55.3"
   config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
   end
 
   config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/pub_key.pub"
  
   config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install vim && apt-get install git && apt-get install curl && apt-get install curl
     useradd -d  /home/updater -m -s /bin/bash -p vagrant updater
     echo "updater ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers
     mkdir /home/updater/.ssh && cd /home/updater/.ssh &&  touch authorized_keys
     chown  -R updater:updater /home/updater/.ssh
     cat /tmp/pub_key.pub >> /home/updater/.ssh/authorized_keys
     chmod 600   /home/updater/.ssh/authorized_keys
   SHELL
end
```
