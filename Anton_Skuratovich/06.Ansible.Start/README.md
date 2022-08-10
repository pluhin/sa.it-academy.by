# Ansible Start
### Inventory file
```yaml
all_workers:
   children:
      homelab:
        hosts:
           debian:
             ansible_host: 192.168.56.103
             ansible_user: vagrant
             ansible_ssh_private_key_file: /home/anton/debian_key
           centos:
             ansible_host: 192.168.56.104
             ansible_user: vagrant
             ansible_ssh_private_key_file: /home/anton/centos_key 
```
# Ansible ad-hoc
## Check content of /etc/hosts file
```bash
ansible -i inventory.yaml -m shell all_workers -a 'cat /etc/hosts'
```
Output
```bash
debian | CHANGED | rc=0 >>
127.0.0.1       localhost
127.0.0.2       bullseye
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
centos | CHANGED | rc=0 >>
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
```
## Install nginx service
```bash
ansible -i inventory.yaml -m apt debian -a "name=nginx state=latest" --become
```
```bash
ansible -i inventory.yaml -m dnf centos -a "name=nginx state=latest" --become
ansible -i inventory.yaml -m service centos -a "name=nginx state=started" --become
```
## Upload nginx config for virtual host
```bash
ansible -i inventory.yaml -m copy debian -a "src=/mnt/d/Projects/06.Ansible/index.html dest=/var/www/html/index.html" --become
```
Output
```bash
debian | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "checksum": "8ffaa42cf92ecf47afd01ae50f75ac56d2a10de3",
    "dest": "/var/www/html/index.html",
    "gid": 0,
    "group": "root",
    "md5sum": "573dca5893552bb50b4e591a2ca7c189",
    "mode": "0644",
    "owner": "root",
    "size": 48,
    "src": "/home/vagrant/.ansible/tmp/ansible-tmp-1660142211.4266117-3720-244972820129868/source",
    "state": "file",
    "uid": 0
}
```
```bash
ansible -i inventory.yaml -m copy centos -a "src=/mnt/d/Projects/06.Ansible/index.html dest=/usr/share/nginx/html/index.html" --become
```
Output
```bash
centos | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": true,
    "checksum": "8ffaa42cf92ecf47afd01ae50f75ac56d2a10de3",
    "dest": "/usr/share/nginx/html/index.html",
    "gid": 0,
    "group": "root",
    "md5sum": "573dca5893552bb50b4e591a2ca7c189",
    "mode": "0644",
    "owner": "root",
    "secontext": "system_u:object_r:httpd_sys_content_t:s0",
    "size": 48,
    "src": "/home/vagrant/.ansible/tmp/ansible-tmp-1660142342.8083-3747-175220608642313/source",
    "state": "file",
    "uid": 0
}
```
```bash
ansible -i inventory.yaml -m service all_workers -a "name=nginx state=restarted" --become
```
Output
```bash
debian | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": {
        "ActiveEnterTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "ActiveEnterTimestampMonotonic": "103331626084",
        "ActiveExitTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "ActiveExitTimestampMonotonic": "103331564595",
        "ActiveState": "active",
        "After": "network.target systemd-journald.socket sysinit.target system.slice basic.target nss-lookup.target",
        "AllowIsolate": "no",
        "AllowedCPUs": "",
        "AllowedMemoryNodes": "",
        "AmbientCapabilities": "",
        "AssertResult": "yes",
        "AssertTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "AssertTimestampMonotonic": "103331589168",
        "Before": "multi-user.target shutdown.target",
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
        "CPUUsageNSec": "38368000",
        "CPUWeight": "[not set]",
        "CacheDirectoryMode": "0755",
        "CanFreeze": "yes",
        "CanIsolate": "no",
        "CanReload": "yes",
        "CanStart": "yes",
        "CanStop": "yes",
        "CapabilityBoundingSet": "cap_chown cap_dac_override cap_dac_read_search cap_fowner cap_fsetid cap_kill cap_setgid cap_setuid cap_setpcap cap_linux_immutable cap_net_bind_service cap_net_broadcast cap_net_admin cap_net_raw cap_ipc_lock cap_ipc_owner cap_sys_module cap_sys_rawio cap_sys_chroot cap_sys_ptrace cap_sys_pacct cap_sys_admin cap_sys_boot cap_sys_nice cap_sys_resource cap_sys_time cap_sys_tty_config cap_mknod cap_lease cap_audit_write cap_audit_control cap_setfcap cap_mac_override cap_mac_admin cap_syslog cap_wake_alarm cap_block_suspend cap_audit_read cap_perfmon cap_bpf cap_checkpoint_restore",
        "CleanResult": "success",
        "CollectMode": "inactive",
        "ConditionResult": "yes",
        "ConditionTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "ConditionTimestampMonotonic": "103331589166",
        "ConfigurationDirectoryMode": "0755",
        "Conflicts": "shutdown.target",
        "ControlGroup": "/system.slice/nginx.service",
        "ControlPID": "0",
        "CoredumpFilter": "0x33",
        "DefaultDependencies": "yes",
        "DefaultMemoryLow": "0",
        "DefaultMemoryMin": "0",
        "Delegate": "no",
        "Description": "A high performance web server and a reverse proxy server",
        "DevicePolicy": "auto",
        "Documentation": "\"man:nginx(8)\"",
        "DynamicUser": "no",
        "EffectiveCPUs": "",
        "EffectiveMemoryNodes": "",
        "ExecMainCode": "0",
        "ExecMainExitTimestampMonotonic": "0",
        "ExecMainPID": "14207",
        "ExecMainStartTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "ExecMainStartTimestampMonotonic": "103331626066",
        "ExecMainStatus": "0",
        "ExecReload": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; -s reload ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecReloadEx": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; -s reload ; flags= ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStart": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; ; ignore_errors=no ; start_time=[Wed 2022-08-10 14:05:26 UTC] ; stop_time=[Wed 2022-08-10 14:05:26 UTC] ; pid=14206 ; code=exited ; status=0 }",
        "ExecStartEx": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; ; flags= ; start_time=[Wed 2022-08-10 14:05:26 UTC] ; stop_time=[Wed 2022-08-10 14:05:26 UTC] ; pid=14206 ; code=exited ; status=0 }",
        "ExecStartPre": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t -q -g daemon on; master_process on; ; ignore_errors=no ; start_time=[Wed 2022-08-10 14:05:26 UTC] ; stop_time=[Wed 2022-08-10 14:05:26 UTC] ; pid=14205 ; code=exited ; status=0 }",
        "ExecStartPreEx": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t -q -g daemon on; master_process on; ; flags= ; start_time=[Wed 2022-08-10 14:05:26 UTC] ; stop_time=[Wed 2022-08-10 14:05:26 UTC] ; pid=14205 ; code=exited ; status=0 }",
        "ExecStop": "{ path=/sbin/start-stop-daemon ; argv[]=/sbin/start-stop-daemon --quiet --stop --retry QUIT/5 --pidfile /run/nginx.pid ; ignore_errors=yes ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStopEx": "{ path=/sbin/start-stop-daemon ; argv[]=/sbin/start-stop-daemon --quiet --stop --retry QUIT/5 --pidfile /run/nginx.pid ; flags=ignore-failure ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "FailureAction": "none",
        "FileDescriptorStoreMax": "0",
        "FinalKillSignal": "9",
        "FragmentPath": "/lib/systemd/system/nginx.service",
        "FreezerState": "running",
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
        "Id": "nginx.service",
        "IgnoreOnIsolate": "no",
        "IgnoreSIGPIPE": "yes",
        "InactiveEnterTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "InactiveEnterTimestampMonotonic": "103331588547",
        "InactiveExitTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "InactiveExitTimestampMonotonic": "103331590849",
        "InvocationID": "1411cf9748fc49118f07128df2e88cdf",
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
        "LimitMEMLOCK": "65536",
        "LimitMEMLOCKSoft": "65536",
        "LimitMSGQUEUE": "819200",
        "LimitMSGQUEUESoft": "819200",
        "LimitNICE": "0",
        "LimitNICESoft": "0",
        "LimitNOFILE": "524288",
        "LimitNOFILESoft": "1024",
        "LimitNPROC": "3774",
        "LimitNPROCSoft": "3774",
        "LimitRSS": "infinity",
        "LimitRSSSoft": "infinity",
        "LimitRTPRIO": "0",
        "LimitRTPRIOSoft": "0",
        "LimitRTTIME": "infinity",
        "LimitRTTIMESoft": "infinity",
        "LimitSIGPENDING": "3774",
        "LimitSIGPENDINGSoft": "3774",
        "LimitSTACK": "infinity",
        "LimitSTACKSoft": "8388608",
        "LoadState": "loaded",
        "LockPersonality": "no",
        "LogLevelMax": "-1",
        "LogRateLimitBurst": "0",
        "LogRateLimitIntervalUSec": "0",
        "LogsDirectoryMode": "0755",
        "MainPID": "14207",
        "ManagedOOMMemoryPressure": "auto",
        "ManagedOOMMemoryPressureLimitPercent": "0%",
        "ManagedOOMSwap": "auto",
        "MemoryAccounting": "yes",
        "MemoryCurrent": "3444736",
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
        "OOMPolicy": "stop",
        "OOMScoreAdjust": "0",
        "OnFailureJobMode": "replace",
        "PIDFile": "/run/nginx.pid",
        "Perpetual": "no",
        "PrivateDevices": "no",
        "PrivateMounts": "no",
        "PrivateNetwork": "no",
        "PrivateTmp": "no",
        "PrivateUsers": "no",
        "ProcSubset": "all",
        "ProtectClock": "no",
        "ProtectControlGroups": "no",
        "ProtectHome": "no",
        "ProtectHostname": "no",
        "ProtectKernelLogs": "no",
        "ProtectKernelModules": "no",
        "ProtectKernelTunables": "no",
        "ProtectProc": "default",
        "ProtectSystem": "no",
        "RefuseManualStart": "no",
        "RefuseManualStop": "no",
        "ReloadResult": "success",
        "RemainAfterExit": "no",
        "RemoveIPC": "no",
        "Requires": "sysinit.target system.slice",
        "Restart": "no",
        "RestartKillSignal": "15",
        "RestartUSec": "100ms",
        "RestrictNamespaces": "no",
        "RestrictRealtime": "no",
        "RestrictSUIDSGID": "no",
        "Result": "success",
        "RootDirectoryStartOnly": "no",
        "RootHashSignature": "",
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
        "StateChangeTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "StateChangeTimestampMonotonic": "103331626084",
        "StateDirectoryMode": "0755",
        "StatusErrno": "0",
        "StopWhenUnneeded": "no",
        "SubState": "running",
        "SuccessAction": "none",
        "SyslogFacility": "3",
        "SyslogLevel": "6",
        "SyslogLevelPrefix": "yes",
        "SyslogPriority": "30",
        "SystemCallErrorNumber": "2147483646",
        "TTYReset": "no",
        "TTYVHangup": "no",
        "TTYVTDisallocate": "no",
        "TasksAccounting": "yes",
        "TasksCurrent": "3",
        "TasksMax": "1132",
        "TimeoutAbortUSec": "5s",
        "TimeoutCleanUSec": "infinity",
        "TimeoutStartFailureMode": "terminate",
        "TimeoutStartUSec": "1min 30s",
        "TimeoutStopFailureMode": "terminate",
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
        "WatchdogSignal": "6",
        "WatchdogTimestampMonotonic": "0",
        "WatchdogUSec": "0"
    }
}
centos | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": {
        "ActiveEnterTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "ActiveEnterTimestampMonotonic": "103274365042",
        "ActiveExitTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "ActiveExitTimestampMonotonic": "103274260908",
        "ActiveState": "active",
        "After": "systemd-journald.socket system.slice basic.target tmp.mount systemd-tmpfiles-setup.service sysinit.target -.mount nss-lookup.target network.target remote-fs.target",
        "AllowIsolate": "no",
        "AllowedCPUs": "",
        "AllowedMemoryNodes": "",
        "AmbientCapabilities": "",
        "AssertResult": "yes",
        "AssertTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "AssertTimestampMonotonic": "103274284080",
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
        "CapabilityBoundingSet": "cap_chown cap_dac_override cap_dac_read_search cap_fowner cap_fsetid cap_kill cap_setgid cap_setuid cap_setpcap cap_linux_immutable cap_net_bind_service cap_net_broadcast cap_net_admin cap_net_raw cap_ipc_lock cap_ipc_owner cap_sys_module cap_sys_rawio cap_sys_chroot cap_sys_ptrace cap_sys_pacct cap_sys_admin cap_sys_boot cap_sys_nice cap_sys_resource cap_sys_time cap_sys_tty_config cap_mknod cap_lease cap_audit_write cap_audit_control cap_setfcap cap_mac_override cap_mac_admin cap_syslog cap_wake_alarm cap_block_suspend",
        "CollectMode": "inactive",
        "ConditionResult": "yes",
        "ConditionTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "ConditionTimestampMonotonic": "103274284080",
        "ConfigurationDirectoryMode": "0755",
        "Conflicts": "shutdown.target",
        "ControlGroup": "/system.slice/nginx.service",
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
        "ExecMainPID": "45120",
        "ExecMainStartTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "ExecMainStartTimestampMonotonic": "103274365026",
        "ExecMainStatus": "0",
        "ExecReload": "{ path=/bin/kill ; argv[]=/bin/kill -s HUP $MAINPID ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStart": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx ; ignore_errors=no ; start_time=[Wed 2022-08-10 14:05:26 UTC] ; stop_time=[Wed 2022-08-10 14:05:26 UTC] ; pid=45119 ; code=exited ; status=0 }",
        "ExecStartPre": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t ; ignore_errors=no ; start_time=[Wed 2022-08-10 14:05:26 UTC] ; stop_time=[Wed 2022-08-10 14:05:26 UTC] ; pid=45116 ; code=exited ; status=0 }",
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
        "InactiveEnterTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "InactiveEnterTimestampMonotonic": "103274282723",
        "InactiveExitTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "InactiveExitTimestampMonotonic": "103274285445",
        "InvocationID": "55153ad362af44bdb4e2e2820cf69c6a",
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
        "LimitNOFILE": "262144",
        "LimitNOFILESoft": "1024",
        "LimitNPROC": "3731",
        "LimitNPROCSoft": "3731",
        "LimitRSS": "infinity",
        "LimitRSSSoft": "infinity",
        "LimitRTPRIO": "0",
        "LimitRTPRIOSoft": "0",
        "LimitRTTIME": "infinity",
        "LimitRTTIMESoft": "infinity",
        "LimitSIGPENDING": "3731",
        "LimitSIGPENDINGSoft": "3731",
        "LimitSTACK": "infinity",
        "LimitSTACKSoft": "8388608",
        "LoadState": "loaded",
        "LockPersonality": "no",
        "LogLevelMax": "-1",
        "LogRateLimitBurst": "0",
        "LogRateLimitIntervalUSec": "0",
        "LogsDirectoryMode": "0755",
        "MainPID": "45120",
        "MemoryAccounting": "yes",
        "MemoryCurrent": "5586944",
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
        "Requires": "sysinit.target system.slice -.mount",
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
        "StateChangeTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "StateChangeTimestampMonotonic": "103274365042",
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
        "TasksCurrent": "3",
        "TasksMax": "5970",
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
        "WatchdogTimestamp": "Wed 2022-08-10 14:05:26 UTC",
        "WatchdogTimestampMonotonic": "103274365041",
        "WatchdogUSec": "0"
    }
}
```
## Test
```bash
ansible -i inventory.yaml -m shell all_workers -a "nginx -t" --become
```
Output
```bash
debian | CHANGED | rc=0 >>
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
centos | CHANGED | rc=0 >>
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

## Ansible playbook

```bash
ansible-playbook -i inventory.yaml ansible-playbook.yml
```

Link [ansible-playbook.yml](ansible-playbook.yml)

```yaml
---
- hosts: all_workers
  tasks: 
    - name: Print OS/Version
      debug:
        msg: "OS family: {{ ansible_os_family }} | Distribution: {{ ansible_distribution }} | Version: {{ ansible_distribution_major_version }}"

    - name: Print mount point
      debug:
        msg: "Mount poin capacity: {{ (ansible_mounts[0].size_total /1024 /1024 /1024)|round(2) }} GB, used: {{ ((ansible_mounts[0].size_total - ansible_mounts[0].size_available) /1024 /1024 /1024)|round(2) }} GB"

    - name: Print RAM 
      debug:
        msg: "RAM capasity: {{ ansible_memory_mb.real.total }} MB, free: {{ ansible_memory_mb.real.free }} MB"
```
#### Output
```bash
PLAY [all_workers] ********************************************************************************************

TASK [Gathering Facts] ****************************************************************************************
ok: [debian]
ok: [centos]

TASK [Print OS/Version] ***************************************************************************************
ok: [debian] => {
    "msg": "OS family: Debian | Distribution: Debian | Version: 11"
}
ok: [centos] => {
    "msg": "OS family: RedHat | Distribution: CentOS | Version: 8"
}

TASK [Print mount point] **************************************************************************************
ok: [debian] => {
    "msg": "Mount poin capacity: 19.52 GB, used: 2.09 GB"
}
ok: [centos] => {
    "msg": "Mount poin capacity: 9.99 GB, used: 4.04 GB"
}

TASK [Print RAM] **********************************************************************************************
ok: [debian] => {
    "msg": "RAM capasity: 976 MB, free: 440 MB"
}
ok: [centos] => {
    "msg": "RAM capasity: 968 MB, free: 191 MB"
}

PLAY RECAP ****************************************************************************************************
centos                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
debian                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

anton@TONY-DESKTOP:/mnt/d/Projects/06.Ansible$ ansible-playbook -i inventory.yaml ansible-playbook.yml
```