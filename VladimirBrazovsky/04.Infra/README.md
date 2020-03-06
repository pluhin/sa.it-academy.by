<<<<<<< HEAD
# History
=======
#History
>>>>>>> a1b0ac8b4fb0c53ac7a1d54c96b51f30c708f545

  559.  history > README.md
  560.  cd Vagrant
  561.  cd Debian
  566.  cd Centos
  567.  vagrant up
  568.  vagrant ssh
  569.  vagrant halt
  571.  sudo lxc-start -n cent7
  573.  ssh insider@10.0.3.205
  574.  sudo lxc-stop -n cent7
  577.  sudo lxc-ls -f
  578.  ssh insider@10.0.3.35
  580.  sudo lxc-start -n mydebian
  581.  cat /sys/fs/cgroup/memory/lxc/mydebian/memory.limit_in_bytes
  582.  sudo lxc-stop -n mydebian
  583.  cd ..

<<<<<<< HEAD
# Debian_VagrantFile
=======
#Debian_VagrantFile
>>>>>>> a1b0ac8b4fb0c53ac7a1d54c96b51f30c708f545

* Vagrant.configure("2") do |config|
* config.vm.box = "debian/buster64"
* end

<<<<<<< HEAD
# Centos_VagrantFile
=======
#Centos_VagrantFile
>>>>>>> a1b0ac8b4fb0c53ac7a1d54c96b51f30c708f545

* Vagrant.configure("2") do |config|
* config.vm.box = "centos/8"
* config.vm.box_version = "1905.1"
* end

<<<<<<< HEAD
# LXC.conf
=======
#LXC.conf
>>>>>>> a1b0ac8b4fb0c53ac7a1d54c96b51f30c708f545

lxc.cgroup.memory.limit_in_bytes = 53687091
lxc.net.0.type = veth
lxc.net.0.link = lxcbr0
lxc.net.0.flags = up
lxc.net.0.hwaddr = 00:16:3e:xx:xx:xx

<<<<<<< HEAD
# Vagrant_Link_Box
=======
#Vagrant_Link_Box
>>>>>>> a1b0ac8b4fb0c53ac7a1d54c96b51f30c708f545

[Vagrant Box Brazovsky](https://app.vagrantup.com/brazovsky/)

