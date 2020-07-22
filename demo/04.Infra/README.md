
```bash

 3674  cd /tmp
 3675  mkdir vagrant/{01,02,03,04} -p
 3676  cd vagrant
 3677  ls
 3678  vagrant --version
 3679  VBoxManage -h
 3680  vbox-img --version
 3681  cd 01
 3682  vagrant init centos/7
 3683  ls -l
 3684  vim Vagrantfile
 3685  vagrant up
 3686  ls -l /var/run/libvirt/libvirt-sock
 3687  vagrant status
 3688  vagrant global-status 
 3689  vagrant status
 3690  vagrant global-status 
 3691  vagrant ssh
 3692  vagrant halt && vagrant destroy -f
 3693  cd ../02
 3694  vim Vagrantfile
 3695  vagrant up
 3696  links http://127.0.0.1:8082
 3697  curl -I http://127.0.0.1:8082
 3698  vagrant ssh
 3699  vagrant halt && vagrant destroy -f
 3700  cd ../
 3701  cd  03
 3702  vim Vagrantfile
 3703  ifconfig| grep "inet "
 3704  ifconfig| grep "inet " -A2
 3705  ifconfig| grep "inet " -B2
 3706  vim Vagrantfile
 3707  vagrant up
 3708  vim Vagrantfile
 3709  ping 192.168.1.244
 3710  ssh 192.168.1.244
 3711  ssh vagrnat@192.168.1.244
 3712  ssh vagrant@192.168.1.244
 3713  vagrant halt && vagrant destroy -f
 3714  cd ../04
 3715  vim Vagrantfile
 3716  cd ../
 3717  mkdir 05
 3718  vagrant init hashicorp/precise64
 3719  vim Vagrantfile
 3720  vagrant up
 3721  vagrant ssh
 3722  vagrant package --output /tmp/test.box
 3723  ls -l  /tmp/test.box
 3724  ls -l  /tmp/test.box -h
 3725  vagrant cloud publish --release pluhin/test 1.0 virtualbox /tmp/temp.box
 3726  vagrant cloud publish --release pluhin/test 1.0 virtualbox /tmp/test.box
 3727  lxc-config
 3728  lxc-checkconfig
 3729  /usr/share/lxc/templates/lxc-download -l
 3730  sudo lxc-create -t ubuntu -n ub18 -- -r bionic -a amd64
 3731  sudo lxc-start -n ub18 -d
 3732  ssh ubuntu@192.168.122.93
 3733  sudo lxc-attach -n ub18
 3734  sudo lxc-attach -n ub18 -- apt update && apt install vim
 3735  sudo lxc-attach -n ub18 -- apt install vim
 3736  sudo lxc-attach -n ub18 -- apt install gi
 3737  sudo lxc-attach -n ub18 -- apt install git
 3738  sudo lxc-stop -n ub18
 3739  sudo lxc-destroy -n ub18
 3740  vim lxc.conf
 3741  ifconfig
 3742  sudo lxc-create -t ubuntu -f lxc.conf -n ub18 -- -r bionic -a amd64
 3743  sudo lxc-start -n ub18 -d
 3744  sudo lxc-ls -f
 3745  ssh ubuntu@192.168.122.100
 3746  ssh-keygen -f "/home/plu/.ssh/known_hosts" -R "192.168.122.100"
 3747  ssh ubuntu@192.168.122.100
 3748  sudo lxc-attach -n ub18 -- mkdir -p  /root/.ssh
 3749  sudo cat  ~/.ssh/id_rsa.pub | sudo lxc-attach -n ub18 -- /bin/sh -c "/bin/cat >> /root/.ssh/authorized_keys"
 3750  ssh ubuntu@192.168.122.100
 3751  sudo lxc-attach -n ub18 -- mkdir -p  /home/ubuntu/.ssh
 3752  sudo cat  ~/.ssh/id_rsa.pub | sudo lxc-attach -n ub18 -- /bin/sh -c "/bin/cat >> /home/ubuntu/.ssh/authorized_keys"
 3753  ssh ubuntu@192.168.122.100
 3754  sudo lxc-stop -n ub18 && sudo lxc-destroy -n ub18
 3755  vagrant global-status
 3756  vagrant halt && vagrant destroy -f

```
