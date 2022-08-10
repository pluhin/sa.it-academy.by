# 05.Vagrant

## Repository
* [vagrant_centos](https://app.vagrantup.com/agbusko/boxes/centos8)
* [vagrant_debian](https://app.vagrantup.com/agbusko/boxes/debian11)

## Vagrantfile
```bash
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.define "vagrantvm-01" do |config|
		config.vm.box = "debian11"
		config.vm.provider "hyperv" do |h|
			h.vm_integration_services = {
				guest_service_interface: true,
				CustomVMSRV: true
			}
			h.vmname = "vagrantvm-01"
			h.memory = "2048"
			h.cpus = 1 
		end 

		config.vm.hostname = "vagrantvm-01"
		config.vm.network "forwarded_port", guest: 80, host: 8000
		config.vm.network "public_network", bridge: "BridgeSwitch"

		config.vm.provision "shell", path: "provision_debian.sh"
	end
end

Vagrant.configure("2") do |config|
	config.vm.define "vagrantvm-02" do |config|
		config.vm.box = "centos8"
		config.vm.provider "hyperv" do |h|
			h.vm_integration_services = {
				guest_service_interface: true,
				CustomVMSRV: true
			}
			h.vmname = "vagrantvm-02"
			h.memory = "2048"
			h.cpus = 1 
		end 

		config.vm.hostname = "vagrantvm-02"
		config.vm.network "forwarded_port", guest: 80, host: 8000
		config.vm.network "public_network", bridge: "BridgeSwitch"

		config.vm.provision "shell", path: "provision_centos.sh"
	end
end
```

### Debian provision_debian.sh
```bash
sudo -i
apt-get update
apt-get -y upgrade
apt-get -y install vim git wget curl nginx

echo '<h1>Hello, World!</h1>' >/var/www/html/index.html

service nginx restart

rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
```

### Centos provision_centos.sh
```bash
sudo -i
yum update
yum -y upgrade
yum -y install vim git wget curl nginx

firewall-cmd --permanent --add-service=http
firewall-cmd --reload

echo '<h1>Hello, World!</h1>' >/usr/share/nginx/html/index.html

service nginx restart

rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
```