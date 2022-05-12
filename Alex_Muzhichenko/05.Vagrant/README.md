### 05.Vagrant_Alex_Muzhichenko

---

### Vagrant Cloud Links

[Centos](https://app.vagrantup.com/amuzhichenko/boxes/centos8)

[Debian](https://app.vagrantup.com/amuzhichenko/boxes/Debian_latest)

### Centos Vagrantfile

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
      echo "<html><header><title>CentOS :: Custom index.html </title></header><body><center><h1>Host system(amuzhichenko): $(cat /etc/centos-release)</h1></center></body></html>" > /usr/share/nginx/html/index.html
    SHELL
  end
end


```

### Debian Vagrantfile

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
      echo "<html><header><title>Debian :: Custom index.html </title></header><body><center><h1>AMuzhichenko_Host system: $(lsb_release -ds)</h1></center></body></html>" > /var/www/html/index.html
    SHELL
  end
end


```

