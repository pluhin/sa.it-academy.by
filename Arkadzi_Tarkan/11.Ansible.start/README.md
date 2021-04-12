## localhost

```
root@ubuntu-bionic:~# adduser ansible

root@ubuntu-bionic:~# echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ansible@ubuntu-bionic:~$ ansible localhost -m shell -a "sudo apt upgrade -y" -u ansible

    [WARNING]: No inventory was parsed, only implicit localhost is available
    [WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
    localhost | CHANGED | rc=0 >>
    Reading package lists...
    Building dependency tree...
    Reading state information...
    Calculating upgrade...
    >>>
    <<<
    Processing triggers for initramfs-tools (0.130ubuntu3.11) ...
    update-initramfs: Generating /boot/initrd.img-4.15.0-140-generic
    WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
```

ansible@ubuntu-bionic:~$ ssh-keygen
ansible@ubuntu-bionic:~$ ssh-copy-id jump_sa@178.124.206.53
ansible@ubuntu-bionic:~$ ssh-copy-id root@192.168.202.21
ansible@ubuntu-bionic:~$ ssh-copy-id root@192.168.202.22

ansible@ubuntu-bionic:~/ansible$ ansible-inventory -i hosts.yaml --graph

```
    @all:
  |--@ec_all:
  |  |--@ec:
  |  |  |--worker_01
  |  |  |--worker_02
  |--@jump:
  |  |--jump_sa
  |--@ungrouped:

```

ansible@ubuntu-bionic:/home/ansible/ansible$ ansible -i hosts.yaml ec_all -m shell -a 'hostname -I && hostname' -u ansible

``` 
    worker_02 | CHANGED | rc=0 >>
    192.168.202.22 
    sa-ubuntu-22
    worker_01 | CHANGED | rc=0 >>
    192.168.202.21 
    sa-centos-21
```

ansible@ubuntu-bionic:/home/ansible/ansible$ ansible -i hosts.yaml worker_02 -m shell -a 'sudo apt upgrade -y' -u ansible 

```
    Installing new version of config file /etc/update-manager/release-upgrades ...
    Setting up update-manager-core (1:18.04.11.13) ...
    Processing triggers for mime-support (3.60ubuntu1) ...
    Processing triggers for install-info (6.5.0.dfsg.1-2) ...
    Processing triggers for libc-bin (2.27-3ubuntu1.4) ...
    Processing triggers for systemd (237-3ubuntu10.45) ...
    Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
    Processing triggers for rsyslog (8.32.0-1ubuntu4) ...
    Processing triggers for ca-certificates (20210119~18.04.1) ...
    Updating certificates in /etc/ssl/certs...
    0 added, 0 removed; done.
    Running hooks in /etc/ca-certificates/update.d...
    done.
    Processing triggers for initramfs-tools (0.130ubuntu3.11) ...
    WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

```

ansible@ubuntu-bionic:/home/ansible/ansible$ ansible -i hosts.yaml worker_01 -m shell -a 'yum upgrade -y' -u ansible

```
    systemd.x86_64 0:219-78.el7_9.3                                               
    systemd-libs.x86_64 0:219-78.el7_9.3                                          
    tzdata.noarch 0:2021a-1.el7                                                   
    util-linux.x86_64 0:2.23.2-65.el7_9.1                                         
    vim-minimal.x86_64 2:7.4.629-8.el7_9                                          
    yum.noarch 0:3.4.3-168.el7.centos                                             
    yum-plugin-fastestmirror.noarch 0:1.1.31-54.el7_8                             
    zlib.x86_64 0:1.2.7-19.el7_9                                                  

    Complete!

```

## Work_hosts (192.168.203.21 - CentOS, 192.168.202.22 - Ubuntu)

[root@sa-centos-21 ~]# adduser ansible

[root@sa-centos-21 ~]# passwd ansible

[root@sa-centos-21 ~]# echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

root@sa-ubuntu-22:~# adduser ansible

root@sa-ubuntu-22:~# echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
