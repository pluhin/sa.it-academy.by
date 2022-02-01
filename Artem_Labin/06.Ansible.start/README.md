

## Check content of /etc/hosts file
```bash
vagrant@vagrant:~/ansible$ ansible -i inv.yaml -m shell -a "cat /etc/hosts" all_workers --ask-vault-pass 
Vault password: 
host8 | CHANGED | rc=0 >>
127.0.0.1	localhost
::1		localhost ip6-localhost ip6-loopback
ff02::1		ip6-allnodes
ff02::2		ip6-allrouters
# --- BEGIN PVE ---
192.168.202.8 sa-ubuntu-8.it-academy.local sa-ubuntu-8
# --- END PVE ---
host7 | CHANGED | rc=0 >>
127.0.1.1	LXC_NAME
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
# --- BEGIN PVE ---
192.168.202.7 sa-centos-7.it-academy.local sa-centos-7
# --- END PVE ---
```
## Install nginx service
### Install nginx host7
```bash
ansible -i inv.yaml -m shell -a "yum install epel-release -y && yum install nginx -y" host7 --ask-vault-pass 


hvagrant@vagrant:~/ansible$ ansible -i inv.yaml -m shell -a "yum install epel-release -y && yum install nginx -y" host7 --ask-vault-pass 
Vault password: 
host7 | CHANGED | rc=0 >>
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * epel: mirror.yandex.ru
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
Package epel-release-7-14.noarch already installed and latest version
Nothing to do
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * epel: mirror.yandex.ru
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
Resolving Dependencies
--> Running transaction check
---> Package nginx.x86_64 1:1.20.1-9.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package         Arch             Version                  Repository      Size
================================================================================
Installing:
 nginx           x86_64           1:1.20.1-9.el7           epel           587 k

Transaction Summary
================================================================================
Install  1 Package

Total download size: 587 k
Installed size: 1.7 M
Downloading packages:
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : 1:nginx-1.20.1-9.el7.x86_64                                  1/1 
  Verifying  : 1:nginx-1.20.1-9.el7.x86_64                                  1/1 

Installed:
  nginx.x86_64 1:1.20.1-9.el7                                                   

Complete!
```

### Install nginx host8
```bash
vagrant@vagrant:~/ansible$ ansible -i inv.yaml -m shell -a "apt-get install nginx -y" host8 --ask-vault-pass 
Vault password: 
host8 | CHANGED | rc=0 >>
Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libgd3 libjbig0 libjpeg-turbo8 libjpeg8 libnginx-mod-http-geoip
  libnginx-mod-http-image-filter libnginx-mod-http-xslt-filter
  libnginx-mod-mail libnginx-mod-stream libtiff5 libwebp6 libxslt1.1
  nginx-common nginx-core
Suggested packages:
  libgd-tools fcgiwrap nginx-doc
The following NEW packages will be installed:
  libgd3 libjbig0 libjpeg-turbo8 libjpeg8 libnginx-mod-http-geoip
  libnginx-mod-http-image-filter libnginx-mod-http-xslt-filter
  libnginx-mod-mail libnginx-mod-stream libtiff5 libwebp6 libxslt1.1 nginx
  nginx-common nginx-core
0 upgraded, 15 newly installed, 0 to remove and 197 not upgraded.
Need to get 1340 kB/1344 kB of archives.
After this operation, 4590 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libjpeg-turbo8 amd64 1.5.2-0ubuntu5.18.04.4 [110 kB]
Get:2 http://archive.ubuntu.com/ubuntu bionic/main amd64 libjpeg8 amd64 8c-2ubuntu8 [2194 B]
Get:3 http://archive.ubuntu.com/ubuntu bionic/main amd64 libjbig0 amd64 2.1-3.1build1 [26.7 kB]
Get:4 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libtiff5 amd64 4.0.9-5ubuntu0.4 [153 kB]
Get:5 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libwebp6 amd64 0.6.1-2ubuntu0.18.04.1 [186 kB]
Get:6 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libgd3 amd64 2.2.5-4ubuntu0.5 [119 kB]
Get:7 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 nginx-common all 1.14.0-0ubuntu1.9 [37.2 kB]
Get:8 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libnginx-mod-http-geoip amd64 1.14.0-0ubuntu1.9 [11.0 kB]
Get:9 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libnginx-mod-http-image-filter amd64 1.14.0-0ubuntu1.9 [14.3 kB]
Get:10 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libxslt1.1 amd64 1.1.29-5ubuntu0.2 [150 kB]
Get:11 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libnginx-mod-http-xslt-filter amd64 1.14.0-0ubuntu1.9 [12.7 kB]
Get:12 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libnginx-mod-mail amd64 1.14.0-0ubuntu1.9 [41.6 kB]
Get:13 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libnginx-mod-stream amd64 1.14.0-0ubuntu1.9 [63.5 kB]
Get:14 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 nginx-core amd64 1.14.0-0ubuntu1.9 [413 kB]
Preconfiguring packages ...
Fetched 1340 kB in 0s (3394 kB/s)
Selecting previously unselected package libjpeg-turbo8:amd64.
(Reading database ... 22017 files and directories currently installed.)
Preparing to unpack .../00-libjpeg-turbo8_1.5.2-0ubuntu5.18.04.4_amd64.deb ...
Unpacking libjpeg-turbo8:amd64 (1.5.2-0ubuntu5.18.04.4) ...
Selecting previously unselected package libjpeg8:amd64.
Preparing to unpack .../01-libjpeg8_8c-2ubuntu8_amd64.deb ...
Unpacking libjpeg8:amd64 (8c-2ubuntu8) ...
Selecting previously unselected package libjbig0:amd64.
Preparing to unpack .../02-libjbig0_2.1-3.1build1_amd64.deb ...
Unpacking libjbig0:amd64 (2.1-3.1build1) ...
Selecting previously unselected package libtiff5:amd64.
Preparing to unpack .../03-libtiff5_4.0.9-5ubuntu0.4_amd64.deb ...
Unpacking libtiff5:amd64 (4.0.9-5ubuntu0.4) ...
Selecting previously unselected package libwebp6:amd64.
Preparing to unpack .../04-libwebp6_0.6.1-2ubuntu0.18.04.1_amd64.deb ...
Unpacking libwebp6:amd64 (0.6.1-2ubuntu0.18.04.1) ...
Selecting previously unselected package libgd3:amd64.
Preparing to unpack .../05-libgd3_2.2.5-4ubuntu0.5_amd64.deb ...
Unpacking libgd3:amd64 (2.2.5-4ubuntu0.5) ...
Selecting previously unselected package nginx-common.
Preparing to unpack .../06-nginx-common_1.14.0-0ubuntu1.9_all.deb ...
Unpacking nginx-common (1.14.0-0ubuntu1.9) ...
Selecting previously unselected package libnginx-mod-http-geoip.
Preparing to unpack .../07-libnginx-mod-http-geoip_1.14.0-0ubuntu1.9_amd64.deb ...
Unpacking libnginx-mod-http-geoip (1.14.0-0ubuntu1.9) ...
Selecting previously unselected package libnginx-mod-http-image-filter.
Preparing to unpack .../08-libnginx-mod-http-image-filter_1.14.0-0ubuntu1.9_amd64.deb ...
Unpacking libnginx-mod-http-image-filter (1.14.0-0ubuntu1.9) ...
Selecting previously unselected package libxslt1.1:amd64.
Preparing to unpack .../09-libxslt1.1_1.1.29-5ubuntu0.2_amd64.deb ...
Unpacking libxslt1.1:amd64 (1.1.29-5ubuntu0.2) ...
Selecting previously unselected package libnginx-mod-http-xslt-filter.
Preparing to unpack .../10-libnginx-mod-http-xslt-filter_1.14.0-0ubuntu1.9_amd64.deb ...
Unpacking libnginx-mod-http-xslt-filter (1.14.0-0ubuntu1.9) ...
Selecting previously unselected package libnginx-mod-mail.
Preparing to unpack .../11-libnginx-mod-mail_1.14.0-0ubuntu1.9_amd64.deb ...
Unpacking libnginx-mod-mail (1.14.0-0ubuntu1.9) ...
Selecting previously unselected package libnginx-mod-stream.
Preparing to unpack .../12-libnginx-mod-stream_1.14.0-0ubuntu1.9_amd64.deb ...
Unpacking libnginx-mod-stream (1.14.0-0ubuntu1.9) ...
Selecting previously unselected package nginx-core.
Preparing to unpack .../13-nginx-core_1.14.0-0ubuntu1.9_amd64.deb ...
Unpacking nginx-core (1.14.0-0ubuntu1.9) ...
Selecting previously unselected package nginx.
Preparing to unpack .../14-nginx_1.14.0-0ubuntu1.9_all.deb ...
Unpacking nginx (1.14.0-0ubuntu1.9) ...
Processing triggers for ufw (0.35-5) ...
Processing triggers for ureadahead (0.100.0-20) ...
Setting up libjbig0:amd64 (2.1-3.1build1) ...
Setting up nginx-common (1.14.0-0ubuntu1.9) ...
Setting up libjpeg-turbo8:amd64 (1.5.2-0ubuntu5.18.04.4) ...
Setting up libxslt1.1:amd64 (1.1.29-5ubuntu0.2) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
Processing triggers for systemd (237-3ubuntu10.11) ...
Setting up libnginx-mod-mail (1.14.0-0ubuntu1.9) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
Setting up libnginx-mod-http-xslt-filter (1.14.0-0ubuntu1.9) ...
Setting up libnginx-mod-http-geoip (1.14.0-0ubuntu1.9) ...
Setting up libwebp6:amd64 (0.6.1-2ubuntu0.18.04.1) ...
Setting up libjpeg8:amd64 (8c-2ubuntu8) ...
Setting up libnginx-mod-stream (1.14.0-0ubuntu1.9) ...
Setting up libtiff5:amd64 (4.0.9-5ubuntu0.4) ...
Setting up libgd3:amd64 (2.2.5-4ubuntu0.5) ...
Setting up libnginx-mod-http-image-filter (1.14.0-0ubuntu1.9) ...
Setting up nginx-core (1.14.0-0ubuntu1.9) ...
Setting up nginx (1.14.0-0ubuntu1.9) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
```
### Upload nginx config for virtual host
```bash
vagrant@vagrant:~/ansible$ ansible -i inv.yaml -m copy -a "src=index.html dest=/usr/share/nginx/html/index.html" host7 --ask-vault-pass 
Vault password: 
host7 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "checksum": "f34a15f50842b390ad3181db944986b8c7956e98",
    "dest": "/usr/share/nginx/html/index.html",
    "gid": 0,
    "group": "root",
    "mode": "0644",
    "owner": "root",
    "path": "/usr/share/nginx/html/index.html",
    "size": 122,
    "state": "file",
    "uid": 0
}
vagrant@vagrant:~/ansible$ ansible -i inv.yaml -m copy -a "src=index.html dest=/var/www/html/index.nginx-debian.html " host8 --ask-vault-pass 
Vault password: 
host8 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "checksum": "f34a15f50842b390ad3181db944986b8c7956e98",
    "dest": "/var/www/html/index.nginx-debian.html",
    "gid": 0,
    "group": "root",
    "md5sum": "99af2df59bda81a82056c4bdd0403f9e",
    "mode": "0644",
    "owner": "root",
    "size": 122,
    "src": "/root/.ansible/tmp/ansible-tmp-1643720405.8597147-23013-244386262325932/source",
    "state": "file",
    "uid": 0
}
```
### Restart NGINX
```bash
vagrant@vagrant:~/ansible$ ansible -i inv.yaml -m service -a "name=nginx state=restarted" all_workers --ask-vault-pass
Vault password: 
host7 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": {
        "ActiveEnterTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "ActiveEnterTimestampMonotonic": "11493441900689",
        "ActiveExitTimestamp": "Tue 2022-02-01 12:49:16 UTC",
        "ActiveExitTimestampMonotonic": "11493441794392",
        "ActiveState": "active",
        "After": "tmp.mount -.mount basic.target nss-lookup.target systemd-journald.socket network-online.target remote-fs.target system.slice",
        "AllowIsolate": "no",
        "AmbientCapabilities": "0",
        "AssertResult": "yes",
        "AssertTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "AssertTimestampMonotonic": "11493441883210",
        "Before": "shutdown.target",
        "BlockIOAccounting": "no",
        "BlockIOWeight": "18446744073709551615",
        "CPUAccounting": "no",
        "CPUQuotaPerSecUSec": "infinity",
        "CPUSchedulingPolicy": "0",
        "CPUSchedulingPriority": "0",
        "CPUSchedulingResetOnFork": "no",
        "CPUShares": "18446744073709551615",
        "CanIsolate": "no",
        "CanReload": "yes",
        "CanStart": "yes",
        "CanStop": "yes",
        "CapabilityBoundingSet": "18446744073709551615",
        "ConditionResult": "yes",
        "ConditionTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "ConditionTimestampMonotonic": "11493441883209",
        "Conflicts": "shutdown.target",
        "ControlGroup": "/system.slice/nginx.service",
        "ControlPID": "0",
        "DefaultDependencies": "yes",
        "Delegate": "no",
        "Description": "The nginx HTTP and reverse proxy server",
        "DevicePolicy": "auto",
        "ExecMainCode": "0",
        "ExecMainExitTimestampMonotonic": "0",
        "ExecMainPID": "33394",
        "ExecMainStartTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "ExecMainStartTimestampMonotonic": "11493441900637",
        "ExecMainStatus": "0",
        "ExecReload": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -s reload ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStart": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx ; ignore_errors=no ; start_time=[Tue 2022-02-01 12:49:17 UTC] ; stop_time=[Tue 2022-02-01 12:49:17 UTC] ; pid=33393 ; code=exited ; status=0 }",
        "ExecStartPre": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t ; ignore_errors=no ; start_time=[Tue 2022-02-01 12:49:17 UTC] ; stop_time=[Tue 2022-02-01 12:49:17 UTC] ; pid=33392 ; code=exited ; status=0 }",
        "FailureAction": "none",
        "FileDescriptorStoreMax": "0",
        "FragmentPath": "/usr/lib/systemd/system/nginx.service",
        "GuessMainPID": "yes",
        "IOScheduling": "0",
        "Id": "nginx.service",
        "IgnoreOnIsolate": "no",
        "IgnoreOnSnapshot": "no",
        "IgnoreSIGPIPE": "yes",
        "InactiveEnterTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "InactiveEnterTimestampMonotonic": "11493441882774",
        "InactiveExitTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "InactiveExitTimestampMonotonic": "11493441883927",
        "JobTimeoutAction": "none",
        "JobTimeoutUSec": "0",
        "KillMode": "process",
        "KillSignal": "3",
        "LimitAS": "18446744073709551615",
        "LimitCORE": "18446744073709551615",
        "LimitCPU": "18446744073709551615",
        "LimitDATA": "18446744073709551615",
        "LimitFSIZE": "18446744073709551615",
        "LimitLOCKS": "18446744073709551615",
        "LimitMEMLOCK": "65536",
        "LimitMSGQUEUE": "819200",
        "LimitNICE": "0",
        "LimitNOFILE": "524288",
        "LimitNPROC": "1030188",
        "LimitRSS": "18446744073709551615",
        "LimitRTPRIO": "0",
        "LimitRTTIME": "18446744073709551615",
        "LimitSIGPENDING": "1030188",
        "LimitSTACK": "18446744073709551615",
        "LoadState": "loaded",
        "MainPID": "33394",
        "MemoryAccounting": "no",
        "MemoryCurrent": "18446744073709551615",
        "MemoryLimit": "18446744073709551615",
        "MountFlags": "0",
        "Names": "nginx.service",
        "NeedDaemonReload": "no",
        "Nice": "0",
        "NoNewPrivileges": "no",
        "NonBlocking": "no",
        "NotifyAccess": "none",
        "OOMScoreAdjust": "0",
        "OnFailureJobMode": "replace",
        "PIDFile": "/run/nginx.pid",
        "PermissionsStartOnly": "no",
        "PrivateDevices": "no",
        "PrivateNetwork": "no",
        "PrivateTmp": "yes",
        "ProtectHome": "no",
        "ProtectSystem": "no",
        "RefuseManualStart": "no",
        "RefuseManualStop": "no",
        "RemainAfterExit": "no",
        "Requires": "system.slice basic.target",
        "RequiresMountsFor": "/var/tmp",
        "Restart": "no",
        "RestartUSec": "100ms",
        "Result": "success",
        "RootDirectoryStartOnly": "no",
        "RuntimeDirectoryMode": "0755",
        "SameProcessGroup": "no",
        "SecureBits": "0",
        "SendSIGHUP": "no",
        "SendSIGKILL": "yes",
        "Slice": "system.slice",
        "StandardError": "inherit",
        "StandardInput": "null",
        "StandardOutput": "journal",
        "StartLimitAction": "none",
        "StartLimitBurst": "5",
        "StartLimitInterval": "10000000",
        "StartupBlockIOWeight": "18446744073709551615",
        "StartupCPUShares": "18446744073709551615",
        "StatusErrno": "0",
        "StopWhenUnneeded": "no",
        "SubState": "running",
        "SyslogLevelPrefix": "yes",
        "SyslogPriority": "30",
        "SystemCallErrorNumber": "0",
        "TTYReset": "no",
        "TTYVHangup": "no",
        "TTYVTDisallocate": "no",
        "TasksAccounting": "no",
        "TasksCurrent": "18446744073709551615",
        "TasksMax": "18446744073709551615",
        "TimeoutStartUSec": "1min 30s",
        "TimeoutStopUSec": "5s",
        "TimerSlackNSec": "50000",
        "Transient": "no",
        "Type": "forking",
        "UMask": "0022",
        "UnitFilePreset": "disabled",
        "UnitFileState": "disabled",
        "Wants": "network-online.target",
        "WatchdogTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "WatchdogTimestampMonotonic": "11493441900661",
        "WatchdogUSec": "0"
    }
}
host8 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": {
        "ActiveEnterTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "ActiveEnterTimestampMonotonic": "11493442011852",
        "ActiveExitTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "ActiveExitTimestampMonotonic": "11493441892444",
        "ActiveState": "active",
        "After": "system.slice network.target sysinit.target systemd-journald.socket basic.target",
        "AllowIsolate": "no",
        "AmbientCapabilities": "",
        "AssertResult": "yes",
        "AssertTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "AssertTimestampMonotonic": "11493441937878",
        "Before": "shutdown.target multi-user.target",
        "BlockIOAccounting": "no",
        "BlockIOWeight": "[not set]",
        "CPUAccounting": "no",
        "CPUQuotaPerSecUSec": "infinity",
        "CPUSchedulingPolicy": "0",
        "CPUSchedulingPriority": "0",
        "CPUSchedulingResetOnFork": "no",
        "CPUShares": "[not set]",
        "CPUUsageNSec": "[not set]",
        "CPUWeight": "[not set]",
        "CacheDirectoryMode": "0755",
        "CanIsolate": "no",
        "CanReload": "yes",
        "CanStart": "yes",
        "CanStop": "yes",
        "CapabilityBoundingSet": "cap_chown cap_dac_override cap_dac_read_search cap_fowner cap_fsetid cap_kill cap_setgid cap_setuid cap_setpcap cap_linux_immutable cap_net_bind_service cap_net_broadcast cap_net_admin cap_net_raw cap_ipc_lock cap_ipc_owner cap_sys_module cap_sys_rawio cap_sys_chroot cap_sys_ptrace cap_sys_pacct cap_sys_admin cap_sys_boot cap_sys_nice cap_sys_resource cap_sys_time cap_sys_tty_config cap_mknod cap_lease cap_audit_write cap_audit_control cap_setfcap cap_mac_override cap_mac_admin cap_syslog cap_wake_alarm cap_block_suspend",
        "CollectMode": "inactive",
        "ConditionResult": "yes",
        "ConditionTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "ConditionTimestampMonotonic": "11493441937878",
        "ConfigurationDirectoryMode": "0755",
        "Conflicts": "shutdown.target",
        "ControlGroup": "/system.slice/nginx.service",
        "ControlPID": "0",
        "DefaultDependencies": "yes",
        "Delegate": "no",
        "Description": "A high performance web server and a reverse proxy server",
        "DevicePolicy": "auto",
        "Documentation": "man:nginx(8)",
        "DynamicUser": "no",
        "ExecMainCode": "0",
        "ExecMainExitTimestampMonotonic": "0",
        "ExecMainPID": "42408",
        "ExecMainStartTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "ExecMainStartTimestampMonotonic": "11493442011833",
        "ExecMainStatus": "0",
        "ExecReload": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; -s reload ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStart": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; ; ignore_errors=no ; start_time=[Tue 2022-02-01 12:49:17 UTC] ; stop_time=[Tue 2022-02-01 12:49:17 UTC] ; pid=42407 ; code=exited ; status=0 }",
        "ExecStartPre": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t -q -g daemon on; master_process on; ; ignore_errors=no ; start_time=[Tue 2022-02-01 12:49:17 UTC] ; stop_time=[Tue 2022-02-01 12:49:17 UTC] ; pid=42406 ; code=exited ; status=0 }",
        "ExecStop": "{ path=/sbin/start-stop-daemon ; argv[]=/sbin/start-stop-daemon --quiet --stop --retry QUIT/5 --pidfile /run/nginx.pid ; ignore_errors=yes ; start_time=[Tue 2022-02-01 12:49:17 UTC] ; stop_time=[Tue 2022-02-01 12:49:17 UTC] ; pid=42405 ; code=exited ; status=0 }",
        "FailureAction": "none",
        "FileDescriptorStoreMax": "0",
        "FragmentPath": "/lib/systemd/system/nginx.service",
        "GID": "[not set]",
        "GuessMainPID": "yes",
        "IOAccounting": "no",
        "IOSchedulingClass": "0",
        "IOSchedulingPriority": "0",
        "IOWeight": "[not set]",
        "IPAccounting": "no",
        "IPEgressBytes": "18446744073709551615",
        "IPEgressPackets": "18446744073709551615",
        "IPIngressBytes": "18446744073709551615",
        "IPIngressPackets": "18446744073709551615",
        "Id": "nginx.service",
        "IgnoreOnIsolate": "no",
        "IgnoreSIGPIPE": "yes",
        "InactiveEnterTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "InactiveEnterTimestampMonotonic": "11493441937293",
        "InactiveExitTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "InactiveExitTimestampMonotonic": "11493441938718",
        "InvocationID": "23d5214e783c4adcace691af1f150ee1",
        "JobRunningTimeoutUSec": "infinity",
        "JobTimeoutAction": "none",
        "JobTimeoutUSec": "infinity",
        "KeyringMode": "private",
        "KillMode": "mixed",
        "KillSignal": "15",
        "LimitAS": "infinity",
        "LimitASSoft": "infinity",
        "LimitCORE": "infinity",
        "LimitCORESoft": "0",
        "LimitCPU": "infinity",
        "LimitCPUSoft": "infinity",
        "LimitDATA": "infinity",
        "LimitDATASoft": "infinity",
        "LimitFSIZE": "infinity",
        "LimitFSIZESoft": "infinity",
        "LimitLOCKS": "infinity",
        "LimitLOCKSSoft": "infinity",
        "LimitMEMLOCK": "16777216",
        "LimitMEMLOCKSoft": "16777216",
        "LimitMSGQUEUE": "819200",
        "LimitMSGQUEUESoft": "819200",
        "LimitNICE": "0",
        "LimitNICESoft": "0",
        "LimitNOFILE": "524288",
        "LimitNOFILESoft": "1024",
        "LimitNPROC": "1030188",
        "LimitNPROCSoft": "1030188",
        "LimitRSS": "infinity",
        "LimitRSSSoft": "infinity",
        "LimitRTPRIO": "0",
        "LimitRTPRIOSoft": "0",
        "LimitRTTIME": "infinity",
        "LimitRTTIMESoft": "infinity",
        "LimitSIGPENDING": "1030188",
        "LimitSIGPENDINGSoft": "1030188",
        "LimitSTACK": "infinity",
        "LimitSTACKSoft": "8388608",
        "LoadState": "loaded",
        "LockPersonality": "no",
        "LogLevelMax": "-1",
        "LogsDirectoryMode": "0755",
        "MainPID": "42408",
        "MemoryAccounting": "no",
        "MemoryCurrent": "[not set]",
        "MemoryDenyWriteExecute": "no",
        "MemoryHigh": "infinity",
        "MemoryLimit": "infinity",
        "MemoryLow": "0",
        "MemoryMax": "infinity",
        "MemorySwapMax": "infinity",
        "MountAPIVFS": "no",
        "MountFlags": "",
        "NFileDescriptorStore": "0",
        "NRestarts": "0",
        "Names": "nginx.service",
        "NeedDaemonReload": "no",
        "Nice": "0",
        "NoNewPrivileges": "no",
        "NonBlocking": "no",
        "NotifyAccess": "none",
        "OOMScoreAdjust": "0",
        "OnFailureJobMode": "replace",
        "PIDFile": "/run/nginx.pid",
        "PermissionsStartOnly": "no",
        "Perpetual": "no",
        "PrivateDevices": "no",
        "PrivateNetwork": "no",
        "PrivateTmp": "no",
        "PrivateUsers": "no",
        "ProtectControlGroups": "no",
        "ProtectHome": "no",
        "ProtectKernelModules": "no",
        "ProtectKernelTunables": "no",
        "ProtectSystem": "no",
        "RefuseManualStart": "no",
        "RefuseManualStop": "no",
        "RemainAfterExit": "no",
        "RemoveIPC": "no",
        "Requires": "sysinit.target system.slice",
        "Restart": "no",
        "RestartUSec": "100ms",
        "RestrictNamespaces": "no",
        "RestrictRealtime": "no",
        "Result": "success",
        "RootDirectoryStartOnly": "no",
        "RuntimeDirectoryMode": "0755",
        "RuntimeDirectoryPreserve": "no",
        "RuntimeMaxUSec": "infinity",
        "SameProcessGroup": "no",
        "SecureBits": "0",
        "SendSIGHUP": "no",
        "SendSIGKILL": "yes",
        "Slice": "system.slice",
        "StandardError": "inherit",
        "StandardInput": "null",
        "StandardInputData": "",
        "StandardOutput": "journal",
        "StartLimitAction": "none",
        "StartLimitBurst": "5",
        "StartLimitIntervalUSec": "10s",
        "StartupBlockIOWeight": "[not set]",
        "StartupCPUShares": "[not set]",
        "StartupCPUWeight": "[not set]",
        "StartupIOWeight": "[not set]",
        "StateChangeTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "StateChangeTimestampMonotonic": "11493442011852",
        "StateDirectoryMode": "0755",
        "StatusErrno": "0",
        "StopWhenUnneeded": "no",
        "SubState": "running",
        "SuccessAction": "none",
        "SyslogFacility": "3",
        "SyslogLevel": "6",
        "SyslogLevelPrefix": "yes",
        "SyslogPriority": "30",
        "SystemCallErrorNumber": "0",
        "TTYReset": "no",
        "TTYVHangup": "no",
        "TTYVTDisallocate": "no",
        "TasksAccounting": "yes",
        "TasksCurrent": "49",
        "TasksMax": "7372",
        "TimeoutStartUSec": "1min 30s",
        "TimeoutStopUSec": "5s",
        "TimerSlackNSec": "50000",
        "Transient": "no",
        "Type": "forking",
        "UID": "[not set]",
        "UMask": "0022",
        "UnitFilePreset": "enabled",
        "UnitFileState": "enabled",
        "UtmpMode": "init",
        "WantedBy": "multi-user.target",
        "WatchdogTimestamp": "Tue 2022-02-01 12:49:17 UTC",
        "WatchdogTimestampMonotonic": "11493442011851",
        "WatchdogUSec": "0"
    }
}
```
### test it
```bash
vagrant@vagrant:~/ansible$ ansible -i inv.yaml -m shell -a "wget -q -O- localhost" all_workers --ask-vault-pass 
Vault password: 
host7 | CHANGED | rc=0 >>
<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>TEST</h1>
<p>Some config</p>

</body>
</html>
host8 | CHANGED | rc=0 >>
<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>TEST</h1>
<p>Some config</p>

</body>
</html>
```

## Ansible playbook
```bash
PLAY [all_workers] **********************************************************************************************

TASK [Gathering Facts] ******************************************************************************************
Tuesday 01 February 2022  20:39:42 +0000 (0:00:00.023)       0:00:00.023 ****** 
ok: [host8]
ok: [host7]

TASK [OS | version] *********************************************************************************************
Tuesday 01 February 2022  20:39:45 +0000 (0:00:02.849)       0:00:02.872 ****** 
ok: [host7] => (item=CentOS) => {
    "msg": "CentOS"
}
ok: [host7] => (item=7.7) => {
    "msg": "7.7"
}
ok: [host7] => (item=7) => {
    "msg": "7"
}
ok: [host8] => (item=Ubuntu) => {
    "msg": "Ubuntu"
}
ok: [host8] => (item=18.04) => {
    "msg": "18.04"
}
ok: [host8] => (item=18) => {
    "msg": "18"
}

TASK [Mount point | capacity | used] ****************************************************************************
Tuesday 01 February 2022  20:39:45 +0000 (0:00:00.044)       0:00:02.916 ****** 
ok: [host7] => (item={'block_used': 471413, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4656415, 'size_available': 19072675840, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop6', 'inode_used': 23199, 'block_size': 4096, 'inode_available': 1287521}) => {
    "msg": {
        "block_available": 4656415,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 471413,
        "device": "/dev/loop6",
        "fstype": "ext4",
        "inode_available": 1287521,
        "inode_total": 1310720,
        "inode_used": 23199,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19072675840,
        "size_total": 21003583488,
        "uuid": "N/A"
    }
}
ok: [host8] => (item={'mount': '/', 'device': '/dev/loop7', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18815782912, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4593697, 'block_used': 534131, 'inode_total': 1310720, 'inode_available': 1283921, 'inode_used': 26799, 'uuid': 'N/A'}) => {
    "msg": {
        "block_available": 4593697,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 534131,
        "device": "/dev/loop7",
        "fstype": "ext4",
        "inode_available": 1283921,
        "inode_total": 1310720,
        "inode_used": 26799,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18815782912,
        "size_total": 21003583488,
        "uuid": "N/A"
    }
}

TASK [RAM | capacity | free] ************************************************************************************
Tuesday 01 February 2022  20:39:45 +0000 (0:00:00.041)       0:00:02.957 ****** 
ok: [host7] => (item=Total memory = 4096MB) => {
    "msg": "Total memory = 4096MB"
}
ok: [host7] => (item=Free memory  = 3676MB) => {
    "msg": "Free memory  = 3676MB"
}
ok: [host8] => (item=Total memory = 4096MB) => {
    "msg": "Total memory = 4096MB"
}
ok: [host8] => (item=Free memory  = 3704MB) => {
    "msg": "Free memory  = 3704MB"
}

PLAY RECAP ******************************************************************************************************
host7                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host8                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Tuesday 01 February 2022  20:39:45 +0000 (0:00:00.071)       0:00:03.029 ****** 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------ 2.85s
RAM | capacity | free ------------------------------------------------------------------------------------ 0.07s
OS | version --------------------------------------------------------------------------------------------- 0.04s
Mount point | capacity | used ---------------------------------------------------------------------------- 0.04s
Playbook run took 0 days, 0 hours, 0 minutes, 3 seconds

```