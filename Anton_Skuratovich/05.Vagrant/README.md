# Vagrant

## Links
#### Debian
[https://app.vagrantup.com/Tony-BY/boxes/debian11](https://app.vagrantup.com/Tony-BY/boxes/debian11)
#### CentOS
[https://app.vagrantup.com/Tony-BY/boxes/centos8](https://app.vagrantup.com/Tony-BY/boxes/centos8)
#### Vagrantfile link
[Vagrantfile](Vagrantfile)
### Vagrantfile
```ruby
Vagrant.configure("2") do |config|
    config.vm.define "debian-11" do |debian|
      debian.vm.box = "debian/bullseye64"
      debian.vm.network "private_network", ip: "192.168.56.101"
      debian.vm.provider "virtualbox" do |vb|
         vb.gui = false
         vb.memory = "1024"
         vb.cpus = "2"
      end
      debian.vm.provision "shell", inline: <<-SHELL
        apt-get update
        apt-get install -y vim git wget curl nginx
        cp /vagrant/debian.html /var/www/html/index.html
        systemctl restart nginx

      SHELL
    end
    config.vm.define "centos-8" do |centos|
      centos.vm.box = "centos/8"
      centos.vm.network "private_network", ip: "192.168.56.102"
      centos.vm.provider "virtualbox" do |vb|
         vb.gui = false
         vb.memory = "1024"
         vb.cpus = "2"
      end
      centos.vm.provision "shell", inline: <<-SHELL
        dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos -y
        dnf distro-sync
        dnf install -y vim git wget curl nginx
        cp /vagrant/centos.html /usr/share/nginx/html/index.html 
        systemctl enable nginx
        systemctl start nginx
      SHELL
    end
  end
```

### History
```powershell
 Id     Duration CommandLine
  --     -------- -----------
   1       13.779 vagrant up
   2     1:46.768 vagrant up
   3     4:00.885 vagrant up
   4        4.559 vagrant ssh debian--11
   5     7:25.080 vagrant ssh debian-11
   6     6:21.128 vagrant ssh centos-8
   7       37.241 vagrant halt && vagrant destroy
   8     2:25.568 vagrant up
   9     2:18.347 vagrant ssh debian-11
  10       52.766 vagrant ssh centos-8
  11       50.122 vagrant halt && vagrant destroy
  12     3:20.752 vagrant up
  13        2.550 ping 192.168.56.102
  14     2:58.012 vagrant ssh centos-8
  15       22.985 vagrant halt && vagrant destroy -y
  16       23.727 vagrant halt && vagrant destroy -f
  17    13:33.891 vagrant up
  18        7.579 vagrant halt && vagrant destroy -f
  19        7.535 vagrant destroy -f
  20        9.969 vagrant destroy -f
  21     3:08.617 vagrant up
  22    14:10.012 vagrant ssh centos-8
  23    13:00.131 vagrant ssh debian-11
  24       31.048 vagrant halt && vagrant destroy -f
  25     3:02.243 vagrant up
  26       32.556 vagrant halt && vagrant destroy -f
  27     3:06.515 vagrant up
  28       59.900 vagrant ssh debian-11
  29       48.058 vagrant ssh centos-8
  30     1:16.926 vagrant package debian-11 --output D:\Projects\05.Vagrant\debian.box
  31     1:42.959 vagrant package centos-8 --output D:\Projects\05.Vagrant\centos.box
  32        4.436 vagrant publish --release Tony-BY/debian11 1.0.0 virtualbox D:\Projects\05.Vagrant\debian.box
  33       47.190 vagrant login
  34        4.241 vagrant publish --release Tony-BY/debian11 1.0.0 virtualbox D:\Projects\05.Vagrant\debian.box
  35       57.839 vagrant cloud publish --release Tony-BY/debian11 1.0.0 virtualbox D:\Projects\05.Vagrant\debian.box
  36     1:36.307 vagrant cloud publish --release Tony-BY/centos8 1.0.0 virtualbox D:\Projects\05.Vagrant\centos.box
```