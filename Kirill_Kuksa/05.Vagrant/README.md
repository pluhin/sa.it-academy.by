### Centos
[https://app.vagrantup.com/kirill_kuksa/boxes/my_centos](https://app.vagrantup.com/kirill_kuksa/boxes/my_centos)

### Debian
[https://app.vagrantup.com/kirill_kuksa/boxes/my_centos](https://app.vagrantup.com/kirill_kuksa/boxes/my_centos)

### Vagrant file
``` ruby
Vagrant.configure("2") do |config|
  config.vm.define "debian" do |debian|
    debian.vm.box = "debian/buster64"
    debian.vm.network "forwarded_port", guest: 80, host: 8089
    debian.vm.provision "file", source: "index_tmp.html", destination: "~/"
    debian.vm.provision "shell", inline: <<-SHELL
      apt-get install -yqq vim git wget curl nginx
      sed 's/$os/debian/g' index_tmp.html > index.html 
      sudo cp /home/vagrant/index.html /var/www/html
    SHELL
  end

  config.vm.define "centos" do |centos|
    centos.vm.box = "centos/8"
    centos.vm.network "forwarded_port", guest: 80, host: 8088
    centos.vm.provision "file", source: "index_tmp.html", destination: "~/"
    centos.vm.provision "shell", inline: <<-SHELL
      cd /etc/yum.repos.d/
      sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
      sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
      sudo yum install -yq vim git wget curl nginx
      sudo systemctl enable nginx
      sudo systemctl start nginx
      sed 's/$os/centos/g' /home/vagrant/index_tmp.html > /home/vagrant/index.html
      sudo cp /home/vagrant/index.html /usr/share/nginx/html
    SHELL
  end
end
```

#### index_tmp.html
``` html
<h2 style="text-align: center;">Hello World from $os</h2>
<p style="text-align: center;">Create by Kirill Kuksa</p>
<p style="text-align: center;">02.05.2022</p>
```