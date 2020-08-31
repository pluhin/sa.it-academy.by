Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
    config.vm.define "Jenkins"
    config.vm.network "public_network", ip: "192.168.56.100",  bridge: "eno1"
    config.vm.network "forwarded_port", guest: 8080, host: 8080
    config.vm.network "forwarded_port", guest: 80, host: 80
    config.vm.provision "file", source: "nginx.conf", destination: "/tmp/nginx.conf"
    config.vm.provision "file", source: "jenkins.conf", destination: "/tmp/jenkins.conf"
    config.vm.provision :shell, :path => "bootstrap.sh"
    
end
