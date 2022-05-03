# 05.Vagrant

## My location Vagrant boxes: [Vagrant Cloud](https://app.vagrantup.com/)

***

# Vagrantfile  
## Two virtual machines will start here.

```ruby
Vagrant.configure("2") do |config|
   config.vm.box_check_update = false
   
   config.vm.define "server1" do |server1|
     server1.vm.box = "generic/centos8"
	 server1.vm.network "forwarded_port", guest: 80, host: 8081
     server1.vm.network "public_network", ip: "192.168.0.32"
     server1.vm.hostname = "web-centos"  
     server1.vm.provider "virtualbox" do |vb|
	     vb.memory = "512"
		   #v.gui = true
	 server1.vm.provision "shell", inline: <<-SHELL
      sudo -i
      yum update -y
      yum install vim git wget curl nginx -y
      systemctl enable nginx
      systemctl start nginx 
     SHELL
	 server1.vm.provision "shell", inline: <<-SHELL 
	  sudo firewall-cmd --permanent --add-service=http  
	  sudo firewall-cmd --reload
     SHELL
	 server1.vm.provision "file", source: "index.html", destination: "/tmp/"
	 server1.vm.provision "shell",
      inline: "sudo mv -f /tmp/index.html /usr/share/nginx/html/index.html"
     end
 end
  
    config.vm.define "server2" do |server2|
     server2.vm.box = "generic/debian10"
	 server2.vm.network "forwarded_port", guest: 80, host: 8080
     server2.vm.network "public_network", ip: "192.168.0.33"
     server2.vm.hostname = "web-debian"  
     server2.vm.provider "virtualbox" do |vb|
	     vb.memory = "512"
		   #v.gui = true
    server2.vm.provision "shell", inline: <<-SHELL
      apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade
      apt-get install -y vim git wget curl nginx      
    SHELL
	server2.vm.provision "file", source: "index.html", destination: "/tmp/"
	server2.vm.provision "shell",
      inline: "mv /tmp/index.html /var/www/html/"
     end
 end
 
end

```
