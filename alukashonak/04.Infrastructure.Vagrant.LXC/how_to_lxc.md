```
#### config.conf for centos7

# Common section
lxc.uts.name = andreilukashonak
lxc.arch = amd64
lxc.cgroup.cpuset.cpus = 0,1
lxc.cgroup.cpu.shares = 100
lxc.cgroup.memory.limit_in_bytes = 512M
# Network section
lxc.net.0.type = veth
lxc.net.0.flags = up
lxc.net.0.link = lxcbr0
lxc.net.0.hwaddr = 00:16:3e:xx:xx:xx


##### Creating and starting privileged centos7
sudo lxc-create -t download -f config.conf -n centos7-priv -- --dist centos --release 7 --arch amd64
sudo lxc-start -n centos7-priv -d
#Adding user "insider"
echo 'groupadd admin; useradd -G admin,wheel insider' | sudo chroot /var/lib/lxc/centos7-priv/rootfs /bin/bash
echo "insider:insider" | sudo chroot /var/lib/lxc/centos7-priv/rootfs  /usr/sbin/chpasswd
#Installing "sudo" into CentOS 7
echo 'y' | sudo lxc-attach -n centos7-priv yum install sudo 
#NOPASSWD for user "insider"
sudo sed -i '$ a \\ninsider  ALL=NOPASSWD:ALL' /var/lib/lxc/centos7-priv/rootfs/etc/sudoers
#Checking
sudo lxc-console -n centos7-priv
sudo -i

```

```
#### config.conf for debian

# Common section
lxc.uts.name = andreilukashonak
lxc.arch = amd64
lxc.cgroup.cpuset.cpus = 0,1
lxc.cgroup.cpu.shares = 100
lxc.cgroup.memory.limit_in_bytes = 512M
# Network section
lxc.net.0.type = veth
lxc.net.0.flags = up
lxc.net.0.link = lxcbr0
lxc.net.0.hwaddr = 00:16:3e:xx:xx:xx


##### Creating and starting privileged debian
sudo lxc-create -t download -f config.conf -n debian-priv -- --dist debian --release buster --arch amd64
sudo lxc-start -n debian-priv -d
#Adding user "insider"
echo 'groupadd admin; useradd -G admin insider' | sudo chroot /var/lib/lxc/debian-priv/rootfs /bin/bash
echo "insider:insider" | sudo chroot /var/lib/lxc/debian-priv/rootfs  /usr/sbin/chpasswd
#Installing "sudo" into debian
echo 'y' | sudo lxc-attach -n debian-priv apt install sudo
#NOPASSWD for user "insider"
sudo sed -i '$ a \\ninsider  ALL=NOPASSWD:ALL' /var/lib/lxc/debian-priv/rootfs/etc/sudoers
#Checking
sudo lxc-console -n debian-priv
sudo -i

```
