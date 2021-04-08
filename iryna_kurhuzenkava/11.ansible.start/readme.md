
## MY HOST

```
/etc/sudoers
root    ALL=(ALL)       ALL
user01  ALL=(root)      NOPASSWD: /usr/bin/yum


[root@onlyoffice ~]# ansible localhost -m shell -a "sudo yum update docker -y" -u user01
localhost | CHANGED | rc=0 >>
Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-
              : manager

This system is not registered with an entitlement server. You can use subscription-manager to register.

Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * centos-sclo-rh: mirror.datacenter.by
 * centos-sclo-sclo: mirror.datacenter.by
 * epel: ftp.icm.edu.pl
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
Retrieving key from https://packages.cloud.google.com/yum/doc/yum-key.gpg
Retrieving key from https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
Resolving Dependencies
--> Running transaction check
..................
..................

Dependencies Resolved

================================================================================
 Package           Arch       Version                          Repository  Size
================================================================================
Updating:
 docker            x86_64     2:1.13.1-204.git0be3e21.el7      extras      18 M
Updating for dependencies:
 docker-client     x86_64     2:1.13.1-204.git0be3e21.el7      extras     3.9 M
 docker-common     x86_64     2:1.13.1-204.git0be3e21.el7      extras     100 k

Transaction Summary
================================================================================
Upgrade  1 Package (+2 Dependent packages)
.......................
.......................

Updated:
  docker.x86_64 2:1.13.1-204.git0be3e21.el7

Dependency Updated:
  docker-client.x86_64 2:1.13.1-204.git0be3e21.el7
  docker-common.x86_64 2:1.13.1-204.git0be3e21.el7

Complete!https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64/repodata/repomd.xml: [Errno -1] repomd.xml signature could not be verified for kubernetes
Trying other mirror.
```

## WORKER HOSTS

```
root    ALL=(ALL)       ALL
ans_user  ALL=(root)      NOPASSWD: ALL

________________________________________________________________________________

[root@onlyoffice ansible]# ansible-inventory -i hosts.yaml --graph
@all:
  |--@ec_all:
  |  |--@ec:
  |  |  |--worker_01
  |  |  |--worker_02
  |--@jump:
  |  |--jump_sa
  |--@ungrouped:
[root@onlyoffice ansible]#

_________________________________________________________________________________________

[root@onlyoffice ansible]# ansible -i hosts.yaml ec -m ping -u ans_user
worker_01 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
worker_02 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
[root@onlyoffice ansible]#

______________________________________________________________________________________________

[root@onlyoffice ansible]# ansible -i hosts.yaml ec -m shell -a "hostname && hostname -i" -u ans_user
worker_01 | CHANGED | rc=0 >>
sa-centos-13
192.168.202.13
worker_02 | CHANGED | rc=0 >>
sa-ubuntu-14
192.168.202.14

_____________________________________________________________________________________________


[root@onlyoffice ansible]# ansible -i hosts.yaml worker_02 -m shell -a "sudo apt full-upgrade -y" -u ans_user
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
worker_02 | CHANGED | rc=0 >>
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
The following NEW packages will be installed:
  libllvm10 libnetplan0
The following packages will be upgraded:
  accountsservice apt apt-utils base-files bash bind9-host bsdutils
........
........
196 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 13.8 MB/92.4 MB of archives.
After this operation, 188 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libnss-systemd amd64 237-3ubuntu10.45 [105 kB]
Get:2 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libudev1 amd64 237-3ubuntu10.45 [59.0 kB]
Get:3 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 udev amd64 237-3ubuntu10.45 [1101 kB]

.......
.......

Setting up python3-distupgrade (1:18.04.42) ...
Setting up ubuntu-release-upgrader-core (1:18.04.42) ...
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
_____________________________________________________________________________________________________

[root@onlyoffice ansible]# ansible -i hosts.yaml worker_01 -m shell -a "sudo yum upgrade -y --skip-broken" -u ans_user
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
worker_01 | CHANGED | rc=0 >>
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
Resolving Dependencies
--> Running transaction check
---> Package acl.x86_64 0:2.2.51-14.el7 will be updated
---> Package acl.x86_64 0:2.2.51-15.el7 will be an update
---> Package bind-export-libs.x86_64 32:9.11.4-9.P2.el7 will be updated

.......
.......

---> Package zlib.x86_64 0:1.2.7-19.el7_9 will be an update
--> Finished Dependency Resolution

Packages skipped because of dependency problems:
    glibc-2.17-323.el7_9.x86_64 from updates

Dependencies Resolved

================================================================================
 Package                      Arch    Version                    Repository
                                                                           Size
================================================================================
Updating:
 acl                          x86_64  2.2.51-15.el7              base      81 k
 bind-export-libs             x86_64  32:9.11.4-26.P2.el7_9.4    updates  1.1 M
 binutils                     x86_64  2.27-44.base.el7           base     5.9 M
 ca-certificates              noarch  2020.2.41-70.0.el7_8       base     382 k
 chkconfig                    x86_64  1.7.6-1.el7                base     182 k
..........
..........
 systemd-libs                 x86_64  219-78.el7_9.3             updates  418 k
 util-linux                   x86_64  2.23.2-65.el7_9.1          updates  2.0 M
 vim-minimal                  x86_64  2:7.4.629-8.el7_9          updates  443 k
 yum                          noarch  3.4.3-168.el7.centos       base     1.2 M
 yum-plugin-fastestmirror     noarch  1.1.31-54.el7_8            base      34 k
 zlib                         x86_64  1.2.7-19.el7_9             updates   90 k
Installing for dependencies:
 bc                           x86_64  1.06.95-13.el7             base     115 k
Skipped (dependency problems):
 glibc                        x86_64  2.17-323.el7_9             updates  3.6 M

Transaction Summary
================================================================================
Install                                    ( 1 Dependent package)
Upgrade                        76 Packages
Skipped (dependency problems)   1 Package

Total download size: 46 M
Downloading packages:
Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
--------------------------------------------------------------------------------
Total                                               26 MB/s |  46 MB  00:01
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Updating   : zlib-1.2.7-19.el7_9.x86_64                                 1/153
..........
..........
  Cleanup    : hostname-3.13-3.el7.x86_64                               152/153
  Cleanup    : libstdc++-4.8.5-39.el7.x86_64                            153/153
  Verifying  : rpm-4.11.3-45.el7.x86_64                                   1/153
..........
..........
  Verifying  : elfutils-libelf-0.176-2.el7.x86_64                       151/153
  Verifying  : 1:dbus-1.10.24-13.el7_6.x86_64                           152/153
  Verifying  : 12:dhclient-4.2.5-77.el7.centos.x86_64                   153/153

Dependency Installed:
  bc.x86_64 0:1.06.95-13.el7

Updated:
  acl.x86_64 0:2.2.51-15.el7
  bind-export-libs.x86_64 32:9.11.4-26.P2.el7_9.4

.........
.........

  systemd.x86_64 0:219-78.el7_9.3
  systemd-libs.x86_64 0:219-78.el7_9.3
  util-linux.x86_64 0:2.23.2-65.el7_9.1
  vim-minimal.x86_64 2:7.4.629-8.el7_9
  yum.noarch 0:3.4.3-168.el7.centos
  yum-plugin-fastestmirror.noarch 0:1.1.31-54.el7_8
  zlib.x86_64 0:1.2.7-19.el7_9

Skipped (dependency problems):
  glibc.x86_64 0:2.17-323.el7_9

Complete!There are unfinished transactions remaining. You might consider running yum-complete-transaction, or "yum-complete-transaction --cleanup-only" and "yum history redo last", first to finish them. If those don't work you'll have to try removing/installing packages by hand (maybe package-cleanup can help).
The program yum-complete-transaction is found in the yum-utils package.
Warning: RPMDB altered outside of yum.
** Found 9 pre-existing rpmdb problem(s), 'yum check' output follows:
bash-4.2.46-34.el7.x86_64 is a duplicate with bash-4.2.46-33.el7.x86_64
centos-release-7-9.2009.1.el7.centos.x86_64 is a duplicate with centos-release-7-7.1908.0.el7.centos.x86_64
glibc-common-2.17-323.el7_9.x86_64 is a duplicate with glibc-common-2.17-292.el7.x86_64
glibc-common-2.17-323.el7_9.x86_64 has missing requires of glibc = ('0', '2.17', '323.el7_9')
libgcc-4.8.5-44.el7.x86_64 is a duplicate with libgcc-4.8.5-39.el7.x86_64
nss-softokn-freebl-3.53.1-6.el7_9.x86_64 is a duplicate with nss-softokn-freebl-3.44.0-5.el7.x86_64
nss-softokn-freebl-3.53.1-6.el7_9.x86_64 has missing requires of nspr >= ('0', '4.25.0', None)
nss-softokn-freebl-3.53.1-6.el7_9.x86_64 has missing requires of nss-util >= ('0', '3.53.1', '1')
tzdata-2021a-1.el7.noarch is a duplicate with tzdata-2019b-1.el7.noarch


```




