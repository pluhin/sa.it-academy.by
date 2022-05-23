Vagrant.configure("2") do |config|
### Centos
config.vm.define "VM-CentosKube" do |centos|
    centos.vm.box = "generic/centos8"
    centos.vm.network "forwarded_port", guest: 80, host: 8080
    centos.vm.hostname = "Kube-centos"
    centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.cpus = "2"
       vb.memory = "2100"
    end
    centos.vm.provision "shell", inline: <<-SHELL
      sudo -i
      yum update -y
      yum clean all
      firewall-cmd --permanent --add-service=http
      firewall-cmd --reload
    SHELL
  end
config.vm.synced_folder ".", "/srv",owner: "vagrant", group: "vagrant"
config.vm.provision :docker
#config.vm.provision :docker_compose
#config.vm.provision :docker_compose, yml: "/app_files/docker-compose.yml", rebuild: true, run: "always"

end
