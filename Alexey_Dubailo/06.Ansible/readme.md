# 06. Ansible.start

## Ansible ad-hoc

### check content of /etc/hosts file
```bash 
ansible -i inv.yaml work_sa -a 'cat /etc/hosts' -u root
host_8_it-a | CHANGED | rc=0 >>
127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
# --- BEGIN PVE ---
192.168.202.8 sa-ubuntu-8.it-academy.local sa-ubuntu-8
# --- END PVE ---
host_7_it-a | CHANGED | rc=0 >>
127.0.1.1       LXC_NAME
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
# --- BEGIN PVE ---
192.168.202.7 sa-centos-7.it-academy.local sa-centos-7
# --- END PVE ---
```
### install nginx service
```bash 
ansible -i inv.yaml work_sa -m ansible.builtin.package -a "name=nginx state=latest" -u root

host_7_it-a | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "msg": "Nothing to do",
    "rc": 0,
    "results": []
}
host_8_it-a | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "cache_update_time": 1658613569,
    "cache_updated": false,
    "changed": false
}
```
### upload nginx config for virtual host

```bash
##### Debian systems
ansible -i inv.yaml host_8_it-a -m ansible.builtin.copy -a "src=index.html dest=/var/www/html/index.html" -u root
host_8_it-a | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "checksum": "9f4d67794cf7b0571f2b3ce82024093196c1b112",
    "dest": "/var/www/html/index.html",
    "gid": 0,
    "group": "root",
    "md5sum": "f9e48042dfa629c3323cd2189e8e8613",
    "mode": "0644",
    "owner": "root",
    "size": 174,
    "src": "/root/.ansible/tmp/ansible-tmp-1660145166.8607771-13709-237354954950854/source",
    "state": "file",
    "uid": 0
}

##### RHAT systems
ansible -i inv.yaml host_7_it-a -m ansible.builtin.copy -a "src=index.html dest=/usr/share/nginx/html/index.html" -u root
host_7_it-a | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": true,
    "checksum": "9f4d67794cf7b0571f2b3ce82024093196c1b112",
    "dest": "/usr/share/nginx/html/index.html",
    "gid": 0,
    "group": "root",
    "md5sum": "f9e48042dfa629c3323cd2189e8e8613",
    "mode": "0644",
    "owner": "root",
    "size": 174,
    "src": "/root/.ansible/tmp/ansible-tmp-1660145290.801586-13933-88844281813110/source",
    "state": "file",
    "uid": 0
}

```
### restart nginx service
```bash
ansible -i inv.yaml work_sa -m ansible.builtin.service -a "name=nginx state=restarted" -u root
host_8_it-a | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": {
        "ActiveState": "active",
        "AllowedCPUs": "",
        "AllowedMemoryNodes": "",
        "BlockIOAccounting": "no",
        "BlockIOWeight": "[not set]",
        "CPUAccounting": "yes",
        "CPUAffinity": "",
        "CPUAffinityFromNUMA": "no",
        "CPUQuotaPerSecUSec": "infinity",
        "CPUQuotaPeriodUSec": "infinity",
        "CPUSchedulingPolicy": "0",
        "CPUSchedulingPriority": "0",
        "CPUSchedulingResetOnFork": "no",
        "CPUShares": "[not set]",
        "CPUUsageNSec": "26444000",
        "CPUWeight": "[not set]",
        "CleanResult": "success",
        "ControlGroup": "/system.slice/nginx.service",
        "ControlPID": "0",
        "DefaultMemoryLow": "0",
        "DefaultMemoryMin": "0",
        "Delegate": "no",
        "DevicePolicy": "auto",
        "EffectiveCPUs": "",
        "EffectiveMemoryNodes": "",
        "ExecMainCode": "0",
        "ExecMainExitTimestampMonotonic": "0",
        "ExecMainPID": "8037",
        "ExecMainStartTimestamp": "Wed 2022-08-10 14:42:09 UTC",
        "ExecMainStartTimestampMonotonic": "2147531012880",
        "ExecMainStatus": "0",
        "ExecReload": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; -s reload ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecReloadEx": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; -s reload ; flags= ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStart": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStartEx": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; ; flags= ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStartPre": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t -q -g daemon on; master_process on; ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStartPreEx": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t -q -g daemon on; master_process on; ; flags= ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStop": "{ path=/sbin/start-stop-daemon ; argv[]=/sbin/start-stop-daemon --quiet --stop --retry QUIT/5 --pidfile /run/nginx.pid ; ignore_errors=yes ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStopEx": "{ path=/sbin/start-stop-daemon ; argv[]=/sbin/start-stop-daemon --quiet --stop --retry QUIT/5 --pidfile /run/nginx.pid ; flags=ignore-failure ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "FileDescriptorStoreMax": "0",
        "GID": "[not set]",
        "GuessMainPID": "yes",
        "IOAccounting": "no",
        "IOReadBytes": "18446744073709551615",
        "IOReadOperations": "18446744073709551615",
        "IOSchedulingClass": "0",
        "IOSchedulingPriority": "0",
        "IOWeight": "[not set]",
        "IOWriteBytes": "18446744073709551615",
        "IOWriteOperations": "18446744073709551615",
        "IPAccounting": "no",
        "IPEgressBytes": "[no data]",
        "IPEgressPackets": "[no data]",
        "IPIngressBytes": "[no data]",
        "IPIngressPackets": "[no data]",
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
        "LimitMEMLOCK": "65536",
        "LimitMEMLOCKSoft": "65536",
        "LimitMSGQUEUE": "819200",
        "LimitMSGQUEUESoft": "819200",
        "LimitNICE": "0",
        "LimitNICESoft": "0",
        "LimitNOFILE": "524288",
        "LimitNOFILESoft": "1024",
        "LimitNPROC": "1030062",
        "LimitNPROCSoft": "1030062",
        "LimitRSS": "infinity",
        "LimitRSSSoft": "infinity",
        "LimitRTPRIO": "0",
        "LimitRTPRIOSoft": "0",
        "LimitRTTIME": "infinity",
        "LimitRTTIMESoft": "infinity",
        "LimitSIGPENDING": "1030062",
        "LimitSIGPENDINGSoft": "1030062",
        "LimitSTACK": "infinity",
        "LimitSTACKSoft": "8388608",
        "LogLevelMax": "-1",
        "LogRateLimitBurst": "0",
        "LogRateLimitIntervalUSec": "0",
        "MainPID": "8037",
        "MemoryAccounting": "yes",
        "MemoryCurrent": "6316032",
        "MemoryHigh": "infinity",
        "MemoryLimit": "infinity",
        "MemoryLow": "0",
        "MemoryMax": "infinity",
        "MemoryMin": "0",
        "MemorySwapMax": "infinity",
        "NFileDescriptorStore": "0",
        "NRestarts": "0",
        "NUMAMask": "",
        "NUMAPolicy": "n/a",
        "Nice": "0",
        "NonBlocking": "no",
        "NotifyAccess": "none",
        "OOMPolicy": "stop",
        "OOMScoreAdjust": "0",
        "PIDFile": "/run/nginx.pid",
        "ReloadResult": "success",
        "RemainAfterExit": "no",
        "Restart": "no",
        "RestartUSec": "100ms",
        "Result": "success",
        "RootDirectoryStartOnly": "no",
        "RuntimeMaxUSec": "infinity",
        "SecureBits": "0",
        "Slice": "system.slice",
        "StandardError": "inherit",
        "StandardInput": "null",
        "StandardInputData": "",
        "StandardOutput": "journal",
        "StartupBlockIOWeight": "[not set]",
        "StartupCPUShares": "[not set]",
        "StartupCPUWeight": "[not set]",
        "StartupIOWeight": "[not set]",
        "StatusErrno": "0",
        "SyslogFacility": "3",
        "SyslogLevel": "6",
        "SyslogLevelPrefix": "yes",
        "SyslogPriority": "30",
        "TTYReset": "no",
        "TTYVHangup": "no",
        "TTYVTDisallocate": "no",
        "TasksAccounting": "yes",
        "TasksCurrent": "3",
        "TasksMax": "309018",
        "TimeoutAbortUSec": "5s",
        "TimeoutStartUSec": "1min 30s",
        "TimeoutStopUSec": "5s",
        "TimerSlackNSec": "50000",
        "Type": "forking",
        "UID": "[not set]",
        "UMask": "0022",
        "WatchdogTimestampMonotonic": "0",
        "WatchdogUSec": "0"
    }
}
host_7_it-a | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": {
        "ActiveEnterTimestampMonotonic": "0",
        "ActiveExitTimestampMonotonic": "0",
        "ActiveState": "inactive",
        "After": "network.target system.slice sysinit.target tmp.mount nss-lookup.target systemd-journald.socket systemd-tmpfiles-setup.service remote-fs.target -.mount basic.target",
        "AllowIsolate": "no",
        "AllowedCPUs": "",
        "AllowedMemoryNodes": "",
        "AmbientCapabilities": "",
        "AssertResult": "no",
        "AssertTimestampMonotonic": "0",
        "Before": "shutdown.target",
        "BlockIOAccounting": "no",
        "BlockIOWeight": "[not set]",
        "CPUAccounting": "no",
        "CPUAffinity": "",
        "CPUAffinityFromNUMA": "no",
        "CPUQuotaPerSecUSec": "infinity",
        "CPUQuotaPeriodUSec": "infinity",
        "CPUSchedulingPolicy": "0",
        "CPUSchedulingPriority": "0",
        "CPUSchedulingResetOnFork": "no",
        "CPUShares": "[not set]",
        "CPUUsageNSec": "[not set]",
        "CPUWeight": "[not set]",
        "CacheDirectoryMode": "0755",
        "CanFreeze": "yes",
        "CanIsolate": "no",
        "CanReload": "yes",
        "CanStart": "yes",
        "CanStop": "yes",
        "CapabilityBoundingSet": "cap_chown cap_dac_override cap_dac_read_search cap_fowner cap_fsetid cap_kill cap_setgid cap_setuid cap_setpcap cap_linux_immutable cap_net_bind_service cap_net_broadcast cap_net_admin cap_net_raw cap_ipc_lock cap_ipc_owner cap_sys_module cap_sys_rawio cap_sys_chroot cap_sys_ptrace cap_sys_pacct cap_sys_admin cap_sys_boot cap_sys_nice cap_sys_resource cap_sys_time cap_sys_tty_config cap_mknod cap_lease cap_audit_write cap_audit_control cap_setfcap cap_mac_override cap_mac_admin cap_syslog cap_wake_alarm cap_block_suspend cap_audit_read cap_perfmon cap_bpf",
        "CollectMode": "inactive",
        "ConditionResult": "no",
        "ConditionTimestampMonotonic": "0",
        "ConfigurationDirectoryMode": "0755",
        "Conflicts": "shutdown.target",
        "ControlPID": "0",
        "DefaultDependencies": "yes",
        "DefaultMemoryLow": "0",
        "DefaultMemoryMin": "0",
        "Delegate": "no",
        "Description": "The nginx HTTP and reverse proxy server",
        "DevicePolicy": "auto",
        "DynamicUser": "no",
        "EffectiveCPUs": "",
        "EffectiveMemoryNodes": "",
        "ExecMainCode": "0",
        "ExecMainExitTimestampMonotonic": "0",
        "ExecMainPID": "0",
        "ExecMainStartTimestampMonotonic": "0",
        "ExecMainStatus": "0",
        "ExecReload": "{ path=/bin/kill ; argv[]=/bin/kill -s HUP $MAINPID ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStart": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStartPre": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "FailureAction": "none",
        "FileDescriptorStoreMax": "0",
        "FragmentPath": "/usr/lib/systemd/system/nginx.service",
        "FreezerState": "running",
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
        "InactiveExitTimestampMonotonic": "0",
        "JobRunningTimeoutUSec": "infinity",
        "JobTimeoutAction": "none",
        "JobTimeoutUSec": "infinity",
        "KeyringMode": "private",
        "KillMode": "mixed",
        "KillSignal": "3",
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
        "LimitMEMLOCK": "65536",
        "LimitMEMLOCKSoft": "65536",
        "LimitMSGQUEUE": "819200",
        "LimitMSGQUEUESoft": "819200",
        "LimitNICE": "0",
        "LimitNICESoft": "0",
        "LimitNOFILE": "524288",
        "LimitNOFILESoft": "1024",
        "LimitNPROC": "1030062",
        "LimitNPROCSoft": "1030062",
        "LimitRSS": "infinity",
        "LimitRSSSoft": "infinity",
        "LimitRTPRIO": "0",
        "LimitRTPRIOSoft": "0",
        "LimitRTTIME": "infinity",
        "LimitRTTIMESoft": "infinity",
        "LimitSIGPENDING": "1030062",
        "LimitSIGPENDINGSoft": "1030062",
        "LimitSTACK": "infinity",
        "LimitSTACKSoft": "8388608",
        "LoadState": "loaded",
        "LockPersonality": "no",
        "LogLevelMax": "-1",
        "LogRateLimitBurst": "0",
        "LogRateLimitIntervalUSec": "0",
        "LogsDirectoryMode": "0755",
        "MainPID": "0",
        "MemoryAccounting": "yes",
        "MemoryCurrent": "[not set]",
        "MemoryDenyWriteExecute": "no",
        "MemoryHigh": "infinity",
        "MemoryLimit": "infinity",
        "MemoryLow": "0",
        "MemoryMax": "infinity",
        "MemoryMin": "0",
        "MemorySwapMax": "infinity",
        "MountAPIVFS": "no",
        "MountFlags": "",
        "NFileDescriptorStore": "0",
        "NRestarts": "0",
        "NUMAMask": "",
        "NUMAPolicy": "n/a",
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
        "PrivateMounts": "no",
        "PrivateNetwork": "no",
        "PrivateTmp": "yes",
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
        "RequiresMountsFor": "/var/tmp",
        "Restart": "no",
        "RestartUSec": "100ms",
        "RestrictNamespaces": "no",
        "RestrictRealtime": "no",
        "RestrictSUIDSGID": "no",
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
        "StateChangeTimestampMonotonic": "0",
        "StateDirectoryMode": "0755",
        "StatusErrno": "0",
        "StopWhenUnneeded": "no",
        "SubState": "dead",
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
        "TasksCurrent": "[not set]",
        "TasksMax": "1648100",
        "TimeoutStartUSec": "1min 30s",
        "TimeoutStopUSec": "5s",
        "TimerSlackNSec": "50000",
        "Transient": "no",
        "Type": "forking",
        "UID": "[not set]",
        "UMask": "0022",
        "UnitFilePreset": "disabled",
        "UnitFileState": "disabled",
        "UtmpMode": "init",
        "WatchdogTimestampMonotonic": "0",
        "WatchdogUSec": "0"
    }
}
```
### test it
```bash
ansible -i inv.yaml work_sa -m ansible.builtin.uri -a "url=http://localhost" -u root
host_7_it-a | SUCCESS => {
    "accept_ranges": "bytes",
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": false,
    "connection": "close",
    "content_length": "174",
    "content_type": "text/html",
    "cookies": {},
    "cookies_string": "",
    "date": "Wed, 10 Aug 2022 15:33:49 GMT",
    "elapsed": 0,
    "etag": "\"62f3ce8d-ae\"",
    "last_modified": "Wed, 10 Aug 2022 15:28:13 GMT",
    "msg": "OK (174 bytes)",
    "redirected": false,
    "server": "nginx/1.14.1",
    "status": 200,
    "url": "http://localhost"
}
host_8_it-a | SUCCESS => {
    "accept_ranges": "bytes",
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "connection": "close",
    "content_length": "174",
    "content_type": "text/html",
    "cookies": {},
    "cookies_string": "",
    "date": "Wed, 10 Aug 2022 15:33:49 GMT",
    "elapsed": 0,
    "etag": "\"62f3ce11-ae\"",
    "last_modified": "Wed, 10 Aug 2022 15:26:09 GMT",
    "msg": "OK (174 bytes)",
    "redirected": false,
    "server": "nginx/1.18.0 (Ubuntu)",
    "status": 200,
    "url": "http://localhost"
}
```
## Ansible playbook
```bash
ansible-playbook -i inv.yaml playbook.yaml -u root

PLAY [work_sa] **************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************
Wednesday 10 August 2022  18:39:34 +0300 (0:00:00.032)       0:00:00.033 ****** 
ok: [host_7_it-a]
ok: [host_8_it-a]

TASK [Show OS | Version] ****************************************************************************************
Wednesday 10 August 2022  18:39:41 +0300 (0:00:07.110)       0:00:07.143 ****** 
ok: [host_7_it-a] => {
    "msg": "OS: CentOS | Version: 8.5"
}
ok: [host_8_it-a] => {
    "msg": "OS: Ubuntu | Version: 20.04"
}

TASK [Show Mount point | capacity | used] ***********************************************************************
Wednesday 10 August 2022  18:39:41 +0300 (0:00:00.169)       0:00:07.313 ****** 
ok: [host_7_it-a] => (item={'mount': '/', 'device': '/dev/loop6', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 20957446144, 'size_available': 18935812096, 'block_size': 4096, 'block_total': 5116564, 'block_available': 4623001, 'block_used': 493563, 'inode_total': 1310720, 'inode_available': 1284495, 'inode_used': 26225, 'uuid': 'N/A'}) => {
    "msg": "Mount point: / | Capacity: 20957 MB | Used space: 2021 MB"
}
ok: [host_8_it-a] => (item={'mount': '/', 'device': '/dev/loop7', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 20957446144, 'size_available': 18770599936, 'block_size': 4096, 'block_total': 5116564, 'block_available': 4582666, 'block_used': 533898, 'inode_total': 1310720, 'inode_available': 1282543, 'inode_used': 28177, 'uuid': 'N/A'}) => {
    "msg": "Mount point: / | Capacity: 20957 MB | Used space: 2186 MB"
}

TASK [Show memory | free] ***************************************************************************************
Wednesday 10 August 2022  18:39:41 +0300 (0:00:00.227)       0:00:07.540 ****** 
ok: [host_7_it-a] => {
    "msg": "Total memory: 2048 MB | Free memory: 1542 MB"
}
ok: [host_8_it-a] => {
    "msg": "Total memory: 2048 MB | Free memory: 1483 MB"
}

PLAY RECAP ******************************************************************************************************
host_7_it-a                : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host_8_it-a                : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Wednesday 10 August 2022  18:39:42 +0300 (0:00:00.202)       0:00:07.743 ****** 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------ 7.11s
Show Mount point | capacity | used ----------------------------------------------------------------------- 0.23s
Show memory | free --------------------------------------------------------------------------------------- 0.20s
Show OS | Version ---------------------------------------------------------------------------------------- 0.17s
Playbook run took 0 days, 0 hours, 0 minutes, 7 seconds
```