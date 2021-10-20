# Vagrant 

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
    config.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
    end
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update && apt upgrade -y
    # Create a folder
    runuser -l vagrant -c 'mkdir actions-runner && cd actions-runner'
    # Download the latest runner package
    runuser -l vagrant -c 'curl -o actions-runner-linux-x64-2.278.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.278.0/actions-runner-linux-x64-2.278.0.tar.gz'
    # Extract the installer
    runuser -l vagrant -c 'tar xzf ./actions-runner-linux-x64-2.278.0.tar.gz'
    # Create the runner and start the configuration experience
    runuser -l vagrant -c './config.sh --url https://github.com/XXXXXXXX --token XXXXXXXXXXXXXXXX'
    # Last step, run it!
    runuser -l vagrant -c './run.sh'
  SHELL
end
```

```ruby
Vagrant.configure("2") do |config|
  config.vm.define "host1" do |ubuntu|
    ubuntu.vm.box = "ubuntu/bionic64"
    ubuntu.vm.network "forwarded_port", guest: 80, host: 8083
    ubuntu.vm.network "private_network", ip: "100.104.146.213"
    #ubuntu.vm.synced_folder ".", "/vagrant_data"
    ubuntu.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "2048"
    end
    ubuntu.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -yqq apache2
    SHELL
  end
  config.vm.define "host2" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.network "forwarded_port", guest: 80, host: 8084
    centos.vm.network "private_network", ip: "100.104.146.214"
    #/config1.vm.synced_folder ".", "/vagrant_data"
    centos.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "1024"
    end
    centos.vm.provision "shell", inline: <<-SHELL
      yum install -y httpd
      systemctl enable httpd
      systemctl start httpd
    SHELL
  end
end
```
---
```ruby
$script = <<-SCRIPT
apt-get update
cat /tmp/pub_key.pub >> /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
echo "Client done!"
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.define "node1" do |node|
    node.vm.box = "bento/ubuntu-18.04"
    node.vm.define "nodelab_test"
    node.vm.network "public_network", ip: "192.168.100.244",  bridge: "eno1" # <- need to change
    node.vm.provider "virtualbox" do |vb|
       vb.gui = false
       vb.memory = "512"
       vb.cpus = "4"
    end
    node.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/pub_key.pub"
    node.vm.provision "shell",
        inline: $script
  end
end
```
---
```ruby
$script = <<-SCRIPT
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -yqq vim mc net-tools
cat /tmp/pub_key.pub >> /home/vagrant/.ssh/authorized_keys
chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
SCRIPT

PUB_KEY_PATH = "~/.ssh/id_rsa.pub"

MACHINES = {
  'host1'  =>  { vcpu: '1', ram: '512', ip: '10.20.30.20'},
  'host2' =>  { vcpu: '1', ram: '512', ip: '10.20.30.21'},
  'jump' =>  { vcpu: '1', ram: '512', ip: '10.20.30.22'},
}

INSTANCES = MACHINES.flat_map do |server_name, server|
    server.merge({
      :vagrant_name => "#{server_name}",
    })
end

Vagrant.configure("2") do |config|
  INSTANCES.each do |instance|
    config.vm.define instance[:vagrant_name] do |node|
      node.vm.box = "bento/debian-10"
      node.vm.hostname = instance[:vagrant_name]
      node.vm.network "private_network", ip: instance[:ip]
      if instance[:vagrant_name] == "jump"
        node.vm.network "public_network", ip: "192.168.1.50", bridge: "eno1" #<- change
      end
      node.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = instance[:ram]
        vb.cpus = instance[:vcpu]
      end
      node.vm.provision "file", source: PUB_KEY_PATH, destination: "/tmp/pub_key.pub"
      node.vm.provision "shell", inline: $script
    end
  end
end
```

https://github.com/pluhin/sa.it-academy.by/issues/1033

```bash
579  sudo apt install virtualbox
  580  sudo apt install virtualbox-ext-pack -y
  581  VBoxManage --version
  582  curl -O https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.deb
  583  sudo apt install ./vagrant_2.2.9_x86_64.deb
  584  vagrant --version
  585  mkdir sa
  586  cd sa
  587  mkdir {1..6}
  588  ls
  589  cd 1
  590  vagrant init cnetos/8
  591  vagrant up
  592  vim Vagrantfile
  593  vagrant up
  594  gress: 66% (Rate: 5814k/s, Es
  595  vagrant ssh
  596  vagrant stauts
  597  vagrant status
  598  vagrant global-status
  599  cd ../2
  600  vagrant halt && vagrant destroy -f
  601  ls -l
  602  cd ../1
  603  vagrant halt && vagrant destroy -f
  604  cd ../3
  605  vim Vagrantfile
  606  vagrant up
  607  vagrant ssh host1
  608  vagrant ssh host2
  609  vagrant halt && vagrant destroy -f
  610  cd ../4/
  611  ls
  612  vim Vagrantfile
  613  ifconfig
  614  vim Vagrantfile
  615  vagrant up
  616  ssh-keygen
  617  vagrant halt && vagrant destroy -f
  618  vagrant up
  619  ssh vagrant@192.168.100.244
  620  vagrant halt && vagrant destroy -f
  621  cd ../5
  622  vim Vagrantfile
  623  vagrant up
  624  vim Vagrantfile
  625  vagrant global-status
  626  vagrant ssh jump
  627  vagrant halt && vagrant destroy -f
  628  cd ../6
  629  vim Vagrantfile
  630  vagrant init bento/ubuntu-18.04
  631  vagrant up
  632  vagrant ssh
  633  vagrant package --output /tmp/test.box
  634  vagrant cloud auth login
  635  vagrant cloud publish --release pluhin/vagrant_demo 1080 virtualbox /tmp/test.box
  636  sudo vim /etc/ssl/openssl.cnf
  637  openssl version -d
  638  vagrant cloud publish --release pluhin/vagrant_demo 1080 virtualbox /tmp/test.box
  639  sudo vim /etc/ssl/openssl.cnf
  640  vim /mnt/int_st01/bk/server/etc/ssl/openssl.cnf
  641  tail /mnt/int_st01/bk/server/etc/ssl/openssl.cnf
  642  sudo vim /etc/ssl/openssl.cnf
  643  vagrant cloud publish --release pluhin/vagrant_demo 1080 virtualbox /tmp/test.box
  644  history
  ```

---
```bsh
sudo -i
apt-get update && apt-get upgrade -yqq && apt-get install vim mc git wget -yqq
rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
```