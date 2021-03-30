### Local update
```sh
sergei@sergei-VirtualBox:~/vebinar11$ ansible all -i '127.0.0.1,' -c local -m shell -a 'sudo apt upgrade -y'
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
127.0.0.1 | CHANGED | rc=0 >>
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
The following packages were automatically installed and are no longer required:
  bridge-utils linux-headers-5.8.0-44-generic linux-hwe-5.8-headers-5.8.0-44
  linux-image-5.8.0-44-generic linux-modules-5.8.0-44-generic
  linux-modules-extra-5.8.0-44-generic ubuntu-fan
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
```
### Remote hosts
#### ip/hostname output
```
sergei@sergei-VirtualBox:~/vebinar11$ ansible -i hosts.yaml all_hosts -m shell -a "hostname && hostname -I" --ask-pass
SSH password: 
worker1 | CHANGED | rc=0 >>
sa-centos-7
192.168.202.7 
worker2 | CHANGED | rc=0 >>
sa-ubuntu-8
192.168.202.8 
```
#### update output
```
ansible -i hosts.yaml worker1 -m shell -a "sudo yum upgrade -y" --ask-pass
SSH password: 
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
worker1 | CHANGED | rc=0 >>
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * extras: centos1.hti.pl
 * updates: mirror.datacenter.by
No packages marked for update
```
```
ansible -i hosts.yaml worker2 -m shell -a "sudo apt upgrade -y" --ask-pass
SSH password: 
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
worker2 | CHANGED | rc=0 >>
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
```
