ppa@sm-debian:~/_labs/04.Infra/lxc/centos$ sudo lxc-create -t centos -n cent7 -f cent7.conf -- --release=7 --arch=x86_64
Host CPE ID from /etc/os-release: 
Checking cache download in /var/cache/lxc/centos/x86_64/7/rootfs ... 
Cache found. Updating...
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
No packages marked for update
Loaded plugins: fastestmirror
Cleaning repos: base extras updates
0 package files removed
Update finished
Copy /var/cache/lxc/centos/x86_64/7/rootfs to /var/lib/lxc/cent7/rootfs ... 
Copying rootfs to /var/lib/lxc/cent7/rootfs ...
Storing root password in '/var/lib/lxc/cent7/tmp_root_pass'
Expiring password for user root.
passwd: Success
Note: Forwarding request to 'systemctl disable systemd-remount-fs.service'.

Container rootfs and config have been created.
Edit the config file to check/enable networking setup.

The temporary root password is stored in:

        '/var/lib/lxc/cent7/tmp_root_pass'


The root password is set up as expired and will require it to be changed
at first login, which you should do as soon as possible.  If you lose the
root password or wish to change it without starting the container, you
can change it from the host by running the following command (which will
also reset the expired flag):

        chroot /var/lib/lxc/cent7/rootfs passwd

ppa@sm-debian:~/_labs/04.Infra/lxc/centos$ sudo lxc-start cent7
ppa@sm-debian:~/_labs/04.Infra/lxc/centos$ sudo lxc-ls -f
NAME  STATE   AUTOSTART GROUPS IPV4           IPV6 UNPRIVILEGED 
cent7 RUNNING 0         -      192.168.122.69 -    false        
deb10 RUNNING 0         -      192.168.122.15 -    false        
ub18  STOPPED 0         -      -              -    false        
ppa@sm-debian:~/_labs/04.Infra/lxc/centos$ cat create_insider_cent.sh | sudo lxc-attach -n cent7 -- tee /root/insider.sh
yum check-update
yum -y -q install sudo
useradd insider
echo "insider:lxc" | chpasswd -m
echo "insider   ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/insider
ppa@sm-debian:~/_labs/04.Infra/lxc/centos$ sudo lxc-attach -n cent7 -- sh /root/insider.sh
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
warning: /var/cache/yum/x86_64/7/updates/packages/sudo-1.8.23-4.el7_7.2.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
Public key for sudo-1.8.23-4.el7_7.2.x86_64.rpm is not installed
Importing GPG key 0xF4A80EB5:
 Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
 Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
 Package    : centos-release-7-7.1908.0.el7.centos.x86_64 (@base)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
insider   ALL=(ALL) NOPASSWD:ALL
ppa@sm-debian:~/_labs/04.Infra/lxc/centos$ ssh insider@192.168.122.69
The authenticity of host '192.168.122.69 (192.168.122.69)' can't be established.
ECDSA key fingerprint is SHA256:e3Wze/enCq+8k8gFhWzVfd2z/oTMjkngBdNoAbC81oo.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '192.168.122.69' (ECDSA) to the list of known hosts.
insider@192.168.122.69's password: 
[insider@cent7 ~]$ whoami
insider
[insider@cent7 ~]$ sudo yum check-update
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
[insider@cent7 ~]$ exit
logout
Connection to 192.168.122.69 closed.
ppa@sm-debian:~/_labs/04.Infra/lxc/centos$ 
