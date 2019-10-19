```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# Provisioning script

#$master_pub_key=""
$script = <<-SCRIPT
#sudo apt-get install git -y
#sudo apt-get install default-jdk -y
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install nginx -y
sudo apt-get install openjdk-8-jdk -y
sudo apt install jenkins -y
sudo runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
echo "------ Waiting secret password"
while [ ! -f /var/lib/jenkins/secrets/initialAdminPassword ]
do
    sleep 2
done
echo "-------- Secret password ---------"
sudo runuser -l jenkins -c 'cat /var/lib/jenkins/secrets/initialAdminPassword'
SCRIPT



Vagrant.configure("2") do |config|

config.vm.define "ubuntu" do |ubuntu|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  ubuntu.vm.box = "ubuntu/bionic64"
  ubuntu.vm.hostname = "jenkins"
  
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  # alpine.vm.network "forwarded_port", guest: 22, host: 2224
  # alpine.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true
  # alpine.vm.network :forwarded_port, guest: 22, host: 2224, auto_correct: true


  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # ubuntu.vm.network "private_network", type: "dhcp"
	ubuntu.vm.network "private_network", ip: "192.168.56.53"
  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  # config.vm.synced_folder "../data", "/vagrant_data", disabled: true
    ubuntu.vm.synced_folder '.', '/vagrant', disabled: true
	

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  ubuntu.vm.provider "virtualbox" do |vb|
      vb.name = "Jenkins"
      #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
      end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2:
  # SHELL
   config.vm.provision "shell", 
   inline: $script
   end

end

```
