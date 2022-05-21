### 05.Vagrant

---

### My Vagrant Cloud Links

[Centos8](https://app.vagrantup.com/yvygovskiy/boxes/CentOs8)

[Debian11](https://app.vagrantup.com/yvygovskiy/boxes/Debian11)

### Vagrantfile for CentOs8

```bash

Vagrant.configure("2") do |config|
  config.vm.define "VM-Centos" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.network "forwarded_port", guest: 80, host: 3023
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
      echo "<html><header><title>CentOS :: Custom index.html </title></header><body><center><h1>Centos host system: $(cat /etc/centos-release)</h1></center></body></html>" > /usr/share/nginx/html/index.html
    SHELL
  end
end


```

### Vagrantfile for latest Debian

```bash

Vagrant.configure("2") do |config|
  config.vm.define "WM_debian" do |debian|
    debian.vm.box = "debian/bullseye64"
    debian.vm.network "forwarded_port", guest: 80, host: 3093
    debian.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
    end
    debian.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
      apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade
      apt-get install -yqq vim git wget curl nginx
      echo "<html><header><title>Debian :: Custom index.html </title></header><body><center><h1>Debian11_Host system: $(lsb_release -ds)</h1></center></body></html>" > /var/www/html/index.html
    SHELL
  end
end


```


