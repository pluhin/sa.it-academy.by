Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
    config.ssh.insert_key = false
    config.vm.define "Jenkins"
    config.vm.network "public_network", ip: "192.168.0.4",  bridge: "ens192" ## TO CHANGE
    config.vm.network "forwarded_port", guest: 8080, host: 8080
    config.vm.network "forwarded_port", guest: 80, host: 8081
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "play.yaml"
    end
end

