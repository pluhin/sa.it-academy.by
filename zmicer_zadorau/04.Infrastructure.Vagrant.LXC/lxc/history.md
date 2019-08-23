04. Infrastructure. Vagrant. LXC

=====================================

* sudo apt-get install lxc lxc-templates
* cd ~/project/sa.it-academy.by/zmicer_zadorau/04.Infrastructure.Vagrant.LXC/
* mkdir lxc
* vim lxc.conf
```conf
#Common section
lxc.cgroup.memory.limit_in_bytes = 512M
```
* sudo lxc-create  -t download -f lxc.conf -n lxc_centos -- --dist centos --release 7 --arch amd64
* sudo lxc-create  -t download -f lxc.conf -n lxc_debian -- --dist debian --release buster --arch amd64
* sudo lxc-start lxc_centos
* sudo lxc-attach lxc_centos
```bash
sudo useradd -G wheel -p 123test test
sudo visudo
%wheel ALL=(ALL) NOPASSWD: ALL
exit
```
* sudo lxc-start lxc_debian
* sudo lxc-attach lxc_debian
```bash
sudo useradd -G sudo -p 123test test
sudo visudo
%sudo ALL=(ALL) NOPASSWD: ALL
exit
```




