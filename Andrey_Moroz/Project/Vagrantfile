Vagrant.configure("2") do |config|

  $script = <<-SCRIPT
    cat /tmp/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
    chmod 600 /home/vagrant/.ssh/authorized_keys
  SCRIPT


  config.vm.define "srv-wordpress-1" do |nodecent|
     nodecent.vm.box = "centos/7"
     nodecent.vm.network "private_network", ip: "192.168.56.180"
     nodecent.vm.hostname = "srv-wordpress-1"
     nodecent.vm.provider "virtualbox" do |vb|
         vb.name = "srv-wordpress-1"
         vb.gui = false
         vb.memory = 2048
         vb.cpus = 2
     end
     nodecent.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/id_rsa.pub"
     nodecent.vm.provision "shell", inline: $script
   end
end
