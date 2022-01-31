# 06.Ansible.Start

## Ad hoc commands

### Output checking /etc/hosts
```bash
ansible -i inv.yaml -m shell -a "cat /etc/hosts" all_workers

host02 | CHANGED | rc=0 >>
127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
# --- BEGIN PVE ---
192.168.202.2 sa-ubuntu-2.it-academy.local sa-ubuntu-2
# --- END PVE ---
host01 | CHANGED | rc=0 >>
127.0.1.1       LXC_NAME
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
# --- BEGIN PVE ---
192.168.202.1 sa-centos-1.it-academy.local sa-centos-1
# --- END PVE ---
```

### Install nginx service
```bash
ansible -i inv.yaml -m package -a "name=nginx state=latest" all_workers

host02 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "cache_update_time": 1643564267,
    "cache_updated": false,
    "changed": true,
    "stderr": "",
    "stderr_lines": [],
    "stdout": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nThe following NEW packages will be installed:\n  nginx\n0 upgraded, 1 newly installed, 0 to remove and 201 not upgraded.\nNeed to get 0 B/3596 B of archives.\nAfter this operation, 44.0 kB of additional disk space will be used.\nSelecting previously unselected package nginx.\r\n(Reading database ... \r(Reading database ... 5%\r(Reading database ... 10%\r(Reading database ... 15%\r(Reading database ... 20%\r(Reading database ... 25%\r(Reading database ... 30%\r(Reading database ... 35%\r(Reading database ... 40%\r(Reading database ... 45%\r(Reading database ... 50%\r(Reading database ... 55%\r(Reading database ... 60%\r(Reading database ... 65%\r(Reading database ... 70%\r(Reading database ... 75%\r(Reading database ... 80%\r(Reading database ... 85%\r(Reading database ... 90%\r(Reading database ... 95%\r(Reading database ... 100%\r(Reading database ... 22118 files and directories currently installed.)\r\nPreparing to unpack .../nginx_1.14.0-0ubuntu1.9_all.deb ...\r\nUnpacking nginx (1.14.0-0ubuntu1.9) ...\r\nSetting up nginx (1.14.0-0ubuntu1.9) ...\r\n",
    "stdout_lines": [
        "Reading package lists...",
        "Building dependency tree...",
        "Reading state information...",
        "The following NEW packages will be installed:",
        "  nginx",
        "0 upgraded, 1 newly installed, 0 to remove and 201 not upgraded.",
        "Need to get 0 B/3596 B of archives.",
        "After this operation, 44.0 kB of additional disk space will be used.",
        "Selecting previously unselected package nginx.",
        "(Reading database ... ",
        "(Reading database ... 5%",
        "(Reading database ... 10%",
        "(Reading database ... 15%",
        "(Reading database ... 20%",
        "(Reading database ... 25%",
        "(Reading database ... 30%",
        "(Reading database ... 35%",
        "(Reading database ... 40%",
        "(Reading database ... 45%",
        "(Reading database ... 50%",
        "(Reading database ... 55%",
        "(Reading database ... 60%",
        "(Reading database ... 65%",
        "(Reading database ... 70%",
        "(Reading database ... 75%",
        "(Reading database ... 80%",
        "(Reading database ... 85%",
        "(Reading database ... 90%",
        "(Reading database ... 95%",
        "(Reading database ... 100%",
        "(Reading database ... 22118 files and directories currently installed.)",
        "Preparing to unpack .../nginx_1.14.0-0ubuntu1.9_all.deb ...",
        "Unpacking nginx (1.14.0-0ubuntu1.9) ...",
        "Setting up nginx (1.14.0-0ubuntu1.9) ..."
    ]
}
host01 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "changes": {
        "installed": [
            "nginx"
        ],
        "updated": []
    },
    "msg": "warning: /var/cache/yum/x86_64/7/epel/packages/nginx-1.20.1-9.el7.x86_64.rpm: Header V4 RSA/SHA256 Signature, key ID 352c64e5: NOKEY\nImporting GPG key 0x352C64E5:\n Userid     : \"Fedora EPEL (7) <epel@fedoraproject.org>\"\n Fingerprint: 91e9 7d7c 4a5e 96f1 7f3e 888f 6a2f aea2 352c 64e5\n Package    : epel-release-7-11.noarch (@extras)\n From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7\n",
    "rc": 0,
    "results": [
        "Loaded plugins: fastestmirror\nLoading mirror speeds from cached hostfile\n * base: ftp.byfly.by\n * epel: mirror.imt-systems.com\n * extras: ftp.byfly.by\n * updates: ftp.man.poznan.pl\nResolving Dependencies\n--> Running transaction check\n---> Package nginx.x86_64 1:1.20.1-9.el7 will be installed\n--> Processing Dependency: nginx-filesystem = 1:1.20.1-9.el7 for package: 1:nginx-1.20.1-9.el7.x86_64\n--> Processing Dependency: libcrypto.so.1.1(OPENSSL_1_1_0)(64bit) for package: 1:nginx-1.20.1-9.el7.x86_64\n--> Processing Dependency: libssl.so.1.1(OPENSSL_1_1_0)(64bit) for package: 1:nginx-1.20.1-9.el7.x86_64\n--> Processing Dependency: libssl.so.1.1(OPENSSL_1_1_1)(64bit) for package: 1:nginx-1.20.1-9.el7.x86_64\n--> Processing Dependency: nginx-filesystem for package: 1:nginx-1.20.1-9.el7.x86_64\n--> Processing Dependency: openssl for package: 1:nginx-1.20.1-9.el7.x86_64\n--> Processing Dependency: redhat-indexhtml for package: 1:nginx-1.20.1-9.el7.x86_64\n--> Processing Dependency: system-logos for package: 1:nginx-1.20.1-9.el7.x86_64\n--> Processing Dependency: libcrypto.so.1.1()(64bit) for package: 1:nginx-1.20.1-9.el7.x86_64\n--> Processing Dependency: libprofiler.so.0()(64bit) for package: 1:nginx-1.20.1-9.el7.x86_64\n--> Processing Dependency: libssl.so.1.1()(64bit) for package: 1:nginx-1.20.1-9.el7.x86_64\n--> Running transaction check\n---> Package centos-indexhtml.noarch 0:7-9.el7.centos will be installed\n---> Package centos-logos.noarch 0:70.0.6-3.el7.centos will be installed\n---> Package gperftools-libs.x86_64 0:2.6.1-1.el7 will be installed\n---> Package nginx-filesystem.noarch 1:1.20.1-9.el7 will be installed\n---> Package openssl.x86_64 1:1.0.2k-24.el7_9 will be installed\n--> Processing Dependency: openssl-libs(x86-64) = 1:1.0.2k-24.el7_9 for package: 1:openssl-1.0.2k-24.el7_9.x86_64\n--> Processing Dependency: make for package: 1:openssl-1.0.2k-24.el7_9.x86_64\n---> Package openssl11-libs.x86_64 1:1.1.1k-2.el7 will be installed\n--> Running transaction check\n---> Package make.x86_64 1:3.82-24.el7 will be installed\n---> Package openssl-libs.x86_64 1:1.0.2k-19.el7 will be updated\n---> Package openssl-libs.x86_64 1:1.0.2k-24.el7_9 will be an update\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package               Arch        Version                   Repository    Size\n================================================================================\nInstalling:\n nginx                 x86_64      1:1.20.1-9.el7            epel         587 k\nInstalling for dependencies:\n centos-indexhtml      noarch      7-9.el7.centos            base          92 k\n centos-logos          noarch      70.0.6-3.el7.centos       base          21 M\n gperftools-libs       x86_64      2.6.1-1.el7               base         272 k\n make                  x86_64      1:3.82-24.el7             base         421 k\n nginx-filesystem      noarch      1:1.20.1-9.el7            epel          24 k\n openssl               x86_64      1:1.0.2k-24.el7_9         updates      494 k\n openssl11-libs        x86_64      1:1.1.1k-2.el7            epel         1.5 M\nUpdating for dependencies:\n openssl-libs          x86_64      1:1.0.2k-24.el7_9         updates      1.2 M\n\nTransaction Summary\n================================================================================\nInstall  1 Package  (+7 Dependent packages)\nUpgrade             ( 1 Dependent package)\n\nTotal download size: 26 M\nDownloading packages:\nDelta RPMs disabled because /usr/bin/applydeltarpm not installed.\nPublic key for nginx-1.20.1-9.el7.x86_64.rpm is not installed\n--------------------------------------------------------------------------------\nTotal                                              8.7 MB/s |  26 MB  00:02     \nRetrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7\nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : centos-logos-70.0.6-3.el7.centos.noarch                     1/10 \n  Installing : centos-indexhtml-7-9.el7.centos.noarch                      2/10 \n  Installing : 1:make-3.82-24.el7.x86_64                                   3/10 \n  Installing : gperftools-libs-2.6.1-1.el7.x86_64                          4/10 \n  Installing : 1:openssl11-libs-1.1.1k-2.el7.x86_64                        5/10 \n  Updating   : 1:openssl-libs-1.0.2k-24.el7_9.x86_64                       6/10 \n  Installing : 1:openssl-1.0.2k-24.el7_9.x86_64                            7/10 \n  Installing : 1:nginx-filesystem-1.20.1-9.el7.noarch                      8/10 \n  Installing : 1:nginx-1.20.1-9.el7.x86_64                                 9/10 \n  Cleanup    : 1:openssl-libs-1.0.2k-19.el7.x86_64                        10/10 \n  Verifying  : 1:nginx-filesystem-1.20.1-9.el7.noarch                      1/10 \n  Verifying  : 1:nginx-1.20.1-9.el7.x86_64                                 2/10 \n  Verifying  : 1:openssl-libs-1.0.2k-24.el7_9.x86_64                       3/10 \n  Verifying  : 1:openssl11-libs-1.1.1k-2.el7.x86_64                        4/10 \n  Verifying  : gperftools-libs-2.6.1-1.el7.x86_64                          5/10 \n  Verifying  : 1:make-3.82-24.el7.x86_64                                   6/10 \n  Verifying  : 1:openssl-1.0.2k-24.el7_9.x86_64                            7/10 \n  Verifying  : centos-indexhtml-7-9.el7.centos.noarch                      8/10 \n  Verifying  : centos-logos-70.0.6-3.el7.centos.noarch                     9/10 \n  Verifying  : 1:openssl-libs-1.0.2k-19.el7.x86_64                        10/10 \n\nInstalled:\n  nginx.x86_64 1:1.20.1-9.el7                                                   \n\nDependency Installed:\n  centos-indexhtml.noarch 0:7-9.el7.centos
   \n  centos-logos.noarch 0:70.0.6-3.el7.centos                                     \n  gperftools-libs.x86_64 0:2.6.1-1.el7
    \n  make.x86_64 1:3.82-24.el7                                                     \n  nginx-filesystem.noarch 1:1.20.1-9.el7
     \n  openssl.x86_64 1:1.0.2k-24.el7_9                                              \n  openssl11-libs.x86_64 1:1.1.1k-2.el7
      \n\nDependency Updated:\n  openssl-libs.x86_64 1:1.0.2k-24.el7_9                                         \n\nComplete!\n"
    ]
}
```


### Upload nginx config for virtual host


```bash
ansible -i inv.yaml host01 -m copy -a "src=index.html dest=/usr/share/nginx/html/index.html" && 
ansible -i inv.yaml host02 -m copy -a "src=index.html dest=/var/www/html/index.html"


host01 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "checksum": "c1cc783949566ead7dcdf27bbb60d71bcac9304c",
    "dest": "/usr/share/nginx/html/index.html",
    "gid": 0,
    "group": "root",
    "md5sum": "f7ccff8b42ef45ca561975d9dd6483de",
    "mode": "0644",
    "owner": "root",
    "size": 18,
    "src": "/root/.ansible/tmp/ansible-tmp-1643650151.411736-24087-54652309147763/source",
    "state": "file",
    "uid": 0
}
host02 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "checksum": "c1cc783949566ead7dcdf27bbb60d71bcac9304c",
    "dest": "/var/www/html/index.html",
    "gid": 0,
    "group": "root",
    "md5sum": "f7ccff8b42ef45ca561975d9dd6483de",
    "mode": "0644",
    "owner": "root",
    "size": 18,
    "src": "/root/.ansible/tmp/ansible-tmp-1643650155.0644667-24116-262228678334700/source",
    "state": "file",
    "uid": 0
}
```

### Restart nginx service

```bash
ansible all_workers -i inv.yaml -m service -a "name=nginx state=restarted"

host02 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": {
        "ActiveEnterTimestamp": "Sun 2022-01-30 17:31:16 UTC",
        "ActiveEnterTimestampMonotonic": "11337561704423",
        "ActiveExitTimestampMonotonic": "0",
        "ActiveState": "active",
        "After": "system.slice network.target basic.target systemd-journald.socket sysinit.target",
        "AllowIsolate": "no",
        "AmbientCapabilities": "",
        "AssertResult": "yes",
        "AssertTimestamp": "Sun 2022-01-30 17:31:16 UTC",
        "AssertTimestampMonotonic": "11337561564609",
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
        "ConditionTimestamp": "Sun 2022-01-30 17:31:16 UTC",
        "ConditionTimestampMonotonic": "11337561564608",
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
        "ExecMainPID": "35390",
        "ExecMainStartTimestamp": "Sun 2022-01-30 17:31:16 UTC",
        "ExecMainStartTimestampMonotonic": "11337561704410",
        "ExecMainStatus": "0",
        "ExecReload": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; -s reload ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStart": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; ; ignore_errors=no ; start_time=[Sun 2022-01-30 17:31:16 UTC] ; stop_time=[Sun 2022-01-30 17:31:16 UTC] ; pid=35389 ; code=exited ; status=0 }",
        "ExecStartPre": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t -q -g daemon on; master_process on; ; ignore_errors=no ; start_time=[Sun 2022-01-30 17:31:16 UTC] ; stop_time=[Sun 2022-01-30 17:31:16 UTC] ; pid=35388 ; code=exited ; status=0 }",
        "ExecStop": "{ path=/sbin/start-stop-daemon ; argv[]=/sbin/start-stop-daemon --quiet --stop --retry QUIT/5 --pidfile /run/nginx.pid ; ignore_errors=yes ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
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
        "InactiveEnterTimestampMonotonic": "0",
        "InactiveExitTimestamp": "Sun 2022-01-30 17:31:16 UTC",
        "InactiveExitTimestampMonotonic": "11337561565426",
        "InvocationID": "c16e2f43790f485aaa9d57fcc29a7854",
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
        "MainPID": "35390",
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
        "StateChangeTimestamp": "Sun 2022-01-30 17:31:16 UTC",
        "StateChangeTimestampMonotonic": "11337561704423",
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
        "WatchdogTimestamp": "Sun 2022-01-30 17:31:16 UTC",
        "WatchdogTimestampMonotonic": "11337561704422",
        "WatchdogUSec": "0"
    }
}
host01 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": {
        "ActiveEnterTimestampMonotonic": "0",
        "ActiveExitTimestampMonotonic": "0",
        "ActiveState": "inactive",
        "After": "remote-fs.target systemd-journald.socket tmp.mount basic.target system.slice -.mount network-online.target nss-lookup.target",
        "AllowIsolate": "no",
        "AmbientCapabilities": "0",
        "AssertResult": "no",
        "AssertTimestampMonotonic": "0",
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
        "ConditionResult": "no",
        "ConditionTimestampMonotonic": "0",
        "Conflicts": "shutdown.target",
        "ControlPID": "0",
        "DefaultDependencies": "yes",
        "Delegate": "no",
        "Description": "The nginx HTTP and reverse proxy server",
        "DevicePolicy": "auto",
        "ExecMainCode": "0",
        "ExecMainExitTimestampMonotonic": "0",
        "ExecMainPID": "0",
        "ExecMainStartTimestampMonotonic": "0",
        "ExecMainStatus": "0",
        "ExecReload": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -s reload ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStart": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStartPre": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "FailureAction": "none",
        "FileDescriptorStoreMax": "0",
        "FragmentPath": "/usr/lib/systemd/system/nginx.service",
        "GuessMainPID": "yes",
        "IOScheduling": "0",
        "Id": "nginx.service",
        "IgnoreOnIsolate": "no",
        "IgnoreOnSnapshot": "no",
        "IgnoreSIGPIPE": "yes",
        "InactiveEnterTimestampMonotonic": "0",
        "InactiveExitTimestampMonotonic": "0",
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
        "MainPID": "0",
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
        "SubState": "dead",
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
        "WatchdogTimestampMonotonic": "0",
        "WatchdogUSec": "0"
    }
}
```

### testing 

```bash
ansible all_workers -i inv.yaml -m shell -a "wget -q -O- localhost"
host02 | CHANGED | rc=0 >>
Custom index.html
host01 | CHANGED | rc=0 >>
Custom index.html
```


## Ansible playbook


```bash
ansible-playbook  -i inv.yaml playbook.yaml

PLAY [all_workers] *****************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
ok: [host02]
ok: [host01]

TASK [OS Information] **************************************************************************************************
ok: [host01] => {
    "msg": [
        "OS Name = CentOS",
        "Version = 7.7"
    ]
}
ok: [host02] => {
    "msg": [
        "OS Name = Ubuntu",
        "Version = 18.04"
    ]
}

TASK [Mounts Information] **********************************************************************************************
ok: [host01] => (item={'block_used': 477455, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4650373, 'size_available': 19047927808, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop0', 'inode_used': 23504, 'block_size': 4096, 'inode_available': 1287216}) => {
    "msg": [
        "Mount point     = /",
        "Device name     = /dev/loop0",
        "FileSystem type = ext4",
        "Capacity        = 20030MB",
        "Used space      = 1865MB"
    ]
}
ok: [host02] => (item={'mount': '/', 'device': '/dev/loop1', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18815340544, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4593589, 'block_used': 534239, 'inode_total': 1310720, 'inode_available': 1283930, 'inode_used': 26790, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point     = /",
        "Device name     = /dev/loop1",
        "FileSystem type = ext4",
        "Capacity        = 20030MB",
        "Used space      = 2086MB"
    ]
}

TASK [RAM Memory Information] ******************************************************************************************
ok: [host01] => {
    "msg": [
        "Total memory = 4096MB",
        "Free memory  = 3675MB"
    ]
}
ok: [host02] => {
    "msg": [
        "Total memory = 4096MB",
        "Free memory  = 3552MB"
    ]
}

PLAY RECAP *************************************************************************************************************
host01                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host02                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
