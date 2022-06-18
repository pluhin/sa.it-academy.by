### 05.Vagrant

## Vagrantfile
~~~RUBY
PATH_INDEX = "~/vagrant/hw/index.html"

$script = <<-SCRIPT
 if [ `which yum` ]
 then
   cd /etc/yum.repos.d/
   sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
   sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
   yum update -y
   yum install vim git wget curl nginx
   yum install nginx -y
   sudo cp /tmp/index.html /usr/share/nginx/html/
 elif [ `which apt` ]
 then
   apt-get update
   apt-get install vim git wget curl
   apt-get install nginx -y
   sudo cp /tmp/index.html /var/www/html/
 fi
 systemctl restart nginx
 systemctl enable nginx
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.define "host1" do |debian|
    debian.vm.box = "generic/debian11"
    debian.vm.network "forwarded_port", guest: 80, host: 8083
    debian.vm.network "private_network", ip: "192.168.56.213"
    debian.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "2048"
       vb.cpus = "4"
    end
 	 debian.vm.provision "file", source: PATH_INDEX, destination: "/tmp/index.html"
	 debian.vm.provision "shell", inline: $script
  end
  config.vm.define "host2" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.network "forwarded_port", guest: 80, host: 8084
    centos.vm.network "private_network", ip: "192.168.56.214"
    centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
    end
   centos.vm.provision "file", source: PATH_INDEX, destination: "/tmp/index.html"
   centos.vm.provision "shell", inline: $script
   end
end
~~~

## Commands
~~~bash
vagrant package host1 --output /tmp/debian11.box
vagrant package host2 --output /tmp/centos8.box
cloud publish --release mnpimenov/debian11 1.0.0 virtualbox /tmp/debian11.box
cloud publish --release mnpimenov/centos8 1.0.0 virtualbox /tmp/centos8.box
~~~

## Vagrant boxes URLs
[Debian 11  Vagrant box](https://app.vagrantup.com/mnpimenov/boxes/debian11)
[CentOS 8  Vagrant box](https://app.vagrantup.com/mnpimenov/boxes/centos8)

~~~text
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
~~~