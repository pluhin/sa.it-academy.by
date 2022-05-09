## 05.Vagrant HOMEWORK
### Link my debian box
```bash
https://app.vagrantup.com/ilya_hladki/boxes/my_debian_box
```
### Link my centos box
```bash
https://app.vagrantup.com/ilya_hladki/boxes/my_centos_box
```
### My Vagrantfile
```bash
Vagrant.configure("2") do |config|
  config.vm.define "host1" do |debian|
    debian.vm.box = "debian/bullseye64"
    debian.vm.network "forwarded_port", guest: 80, host: 8083    
    debian.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
    end
    debian.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y vim git wget curl
      apt-get install -y nginx
      sudo cp /vagrant/index.html /var/www/html
      systemctl enable nginx
      systemctl start nginx
    SHELL
  end
  config.vm.define "host2" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.network "forwarded_port", guest: 80, host: 8084
       centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
    end
    centos.vm.provision "shell", inline: <<-SHELL
      cd /etc/yum.repos.d/
      sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
     sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
      yum update -y
      yum install -y vim git wget curl
      yum install -y nginx
      sudo cp /vagrant/index.html /usr/share/nginx/html
      systemctl enable nginx
      systemctl start nginx
    SHELL
  end
end
```