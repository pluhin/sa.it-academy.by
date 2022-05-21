# homework 06.Ansible  


## check content of file/etc/hosts
```bash
ansible -i inventory.yaml -m shell -a "cat /etc/hosts"  all_workers

host6 | CHANGED | rc=0 >>
127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
# --- BEGIN PVE ---
192.168.201.29 ws-29.it-academy.local ws-29
# --- END PVE ---
```

## install nginx service
```bash
vagrant@vagrant:~/ansible$ ansible -i inventory.yaml -m package -a "name=nginx state=present"  all_workers
host6 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "cache_update_time": 1653062292,
    "cache_updated": false,
    "changed": true,
    "stderr": "",
    "stderr_lines": [],
    "stdout": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nnginx is already the newest version (1.10.3-0ubuntu0.16.04.5).\n0 upgraded, 0 newly installed, 0 to remove and 141 not upgraded.\n2 not fully installed or removed.\nAfter this operation, 0 B of additional disk space will be used.\nSetting up nginx-core (1.10.3-0ubuntu0.16.04.5) ...\r\nSetting up nginx (1.10.3-0ubuntu0.16.04.5) ...\r\n",
    "stdout_lines": [
        "Reading package lists...",
        "Building dependency tree...",
        "Reading state information...",
        "nginx is already the newest version (1.10.3-0ubuntu0.16.04.5).",
        "0 upgraded, 0 newly installed, 0 to remove and 141 not upgraded.",
        "2 not fully installed or removed.",
        "After this operation, 0 B of additional disk space will be used.",
        "Setting up nginx-core (1.10.3-0ubuntu0.16.04.5) ...",
        "Setting up nginx (1.10.3-0ubuntu0.16.04.5) ..."
    ]
}
```

## upload nginx config for virtual host
```bash
vagrant@vagrant:~/ansible$ ansible -i inventory.yaml -m copy -a "src=index.html dest=/usr/share/nginx/html/index.html" all_workers
host6 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "checksum": "14f05b30621daed9cbba229589771fade8c202ac",
    "dest": "/usr/share/nginx/html/index.html",
    "gid": 0,
    "group": "root",
    "md5sum": "b14a48c8eab3152bf8756ab3f94c0358",
    "mode": "0644",
    "owner": "root",
    "size": 110,
    "src": "/root/.ansible/tmp/ansible-tmp-1653064458.648249-3650-75008386227448/source",
    "state": "file",
    "uid": 0
}
```

## restart nginx service
```bash
vagrant@vagrant:~/ansible$ ansible -i inventory.yaml -m service -a "name=nginx state=restarted" all_workers
host6 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": {
        "ActiveEnterTimestamp": "Fri 2022-05-20 16:39:12 UTC",
        "ActiveEnterTimestampMonotonic": "2015791636223",
        "ActiveExitTimestampMonotonic": "0",
        "ActiveState": "active",
        "After": "sysinit.target network.target systemd-journald.socket basic.target system.slice",
        "AllowIsolate": "no",
        "AmbientCapabilities": "0",
        "AssertResult": "yes",
        "AssertTimestamp": "Fri 2022-05-20 16:39:12 UTC",
        "AssertTimestampMonotonic": "2015791611163",
        "Before": "multi-user.target shutdown.target",
        "BlockIOAccounting": "no",
        "BlockIOWeight": "18446744073709551615",
        "CPUAccounting": "no",
        "CPUQuotaPerSecUSec": "infinity",
        "CPUSchedulingPolicy": "0",
        "CPUSchedulingPriority": "0",
        "CPUSchedulingResetOnFork": "no",
        "CPUShares": "18446744073709551615",
        "CPUUsageNSec": "18446744073709551615",
        "CanIsolate": "no",
        "CanReload": "yes",
        "CanStart": "yes",
        "CanStop": "yes",
        "CapabilityBoundingSet": "18446744073709551615",
        "ConditionResult": "yes",
        "ConditionTimestamp": "Fri 2022-05-20 16:39:12 UTC",
        "ConditionTimestampMonotonic": "2015791611163",
        "Conflicts": "shutdown.target",
        "ControlGroup": "/system.slice/nginx.service",
        "ControlPID": "0",
        "DefaultDependencies": "yes",
        "Delegate": "no",
        "Description": "A high performance web server and a reverse proxy server",
        "DevicePolicy": "auto",
        "ExecMainCode": "0",
        "ExecMainExitTimestampMonotonic": "0",
        "ExecMainPID": "5545",
        "ExecMainStartTimestamp": "Fri 2022-05-20 16:39:12 UTC",
        "ExecMainStartTimestampMonotonic": "2015791636212",
        "ExecMainStatus": "0",
        "ExecReload": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; -s reload ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "ExecStart": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -g daemon on; master_process on; ; ignore_errors=no ; start_time=[Fri 2022-05-20 16:39:12 UTC] ; stop_time=[Fri 2022-05-20 16:39:12 UTC] ; pid=5544 ; code=exited ; status=0 }",
        "ExecStartPre": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t -q -g daemon on; master_process on; ; ignore_errors=no ; start_time=[Fri 2022-05-20 16:39:12 UTC] ; stop_time=[Fri 2022-05-20 16:39:12 UTC] ; pid=5543 ; code=exited ; status=0 }",
        "ExecStop": "{ path=/sbin/start-stop-daemon ; argv[]=/sbin/start-stop-daemon --quiet --stop --retry QUIT/5 --pidfile /run/nginx.pid ; ignore_errors=yes ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }",
        "FailureAction": "none",
        "FileDescriptorStoreMax": "0",
        "FragmentPath": "/lib/systemd/system/nginx.service",
        "GuessMainPID": "yes",
        "IOScheduling": "0",
        "Id": "nginx.service",
        "IgnoreOnIsolate": "no",
        "IgnoreSIGPIPE": "yes",
        "InactiveEnterTimestamp": "Fri 2022-05-20 16:21:54 UTC",
        "InactiveEnterTimestampMonotonic": "2014753736429",
        "InactiveExitTimestamp": "Fri 2022-05-20 16:39:12 UTC",
        "InactiveExitTimestampMonotonic": "2015791612114",
        "JobTimeoutAction": "none",
        "JobTimeoutUSec": "infinity",
        "KillMode": "mixed",
        "KillSignal": "15",
        "LimitAS": "18446744073709551615",
        "LimitASSoft": "18446744073709551615",
        "LimitCORE": "18446744073709551615",
        "LimitCORESoft": "0",
        "LimitCPU": "18446744073709551615",
        "LimitCPUSoft": "18446744073709551615",
        "LimitDATA": "18446744073709551615",
        "LimitDATASoft": "18446744073709551615",
        "LimitFSIZE": "18446744073709551615",
        "LimitFSIZESoft": "18446744073709551615",
        "LimitLOCKS": "18446744073709551615",
        "LimitLOCKSSoft": "18446744073709551615",
        "LimitMEMLOCK": "65536",
        "LimitMEMLOCKSoft": "65536",
        "LimitMSGQUEUE": "819200",
        "LimitMSGQUEUESoft": "819200",
        "LimitNICE": "0",
        "LimitNICESoft": "0",
        "LimitNOFILE": "524288",
        "LimitNOFILESoft": "1024",
        "LimitNPROC": "1030188",
        "LimitNPROCSoft": "1030188",
        "LimitRSS": "18446744073709551615",
        "LimitRSSSoft": "18446744073709551615",
        "LimitRTPRIO": "0",
        "LimitRTPRIOSoft": "0",
        "LimitRTTIME": "18446744073709551615",
        "LimitRTTIMESoft": "18446744073709551615",
        "LimitSIGPENDING": "1030188",
        "LimitSIGPENDINGSoft": "1030188",
        "LimitSTACK": "18446744073709551615",
        "LimitSTACKSoft": "8388608",
        "LoadState": "loaded",
        "MainPID": "5545",
        "MemoryAccounting": "no",
        "MemoryCurrent": "18446744073709551615",
        "MemoryLimit": "18446744073709551615",
        "MountFlags": "0",
        "NFileDescriptorStore": "0",
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
        "PrivateTmp": "no",
        "ProtectHome": "no",
        "ProtectSystem": "no",
        "RefuseManualStart": "no",
        "RefuseManualStop": "no",
        "RemainAfterExit": "no",
        "Requires": "sysinit.target system.slice",
        "Restart": "no",
        "RestartUSec": "100ms",
        "Result": "success",
        "RootDirectoryStartOnly": "no",
        "RuntimeDirectoryMode": "0755",
        "RuntimeMaxUSec": "infinity",
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
        "StateChangeTimestamp": "Fri 2022-05-20 16:39:12 UTC",
        "StateChangeTimestampMonotonic": "2015791636223",
        "StatusErrno": "0",
        "StopWhenUnneeded": "no",
        "SubState": "running",
        "SyslogFacility": "3",
        "SyslogLevel": "6",
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
        "UnitFilePreset": "enabled",
        "UnitFileState": "enabled",
        "UtmpMode": "init",
        "WantedBy": "multi-user.target",
        "WatchdogTimestamp": "Fri 2022-05-20 16:39:12 UTC",
        "WatchdogTimestampMonotonic": "2015791636222",
        "WatchdogUSec": "0"
    }
}
```

## test it
```bash
vagrant@vagrant:~/ansible$ ansible -i inventory.yaml -m shell -a "curl -I http://127.0.0.1:80" all_workers
host6 | CHANGED | rc=0 >>
HTTP/1.1 200 OK
Server: nginx/1.10.3 (Ubuntu)
Date: Fri, 20 May 2022 16:59:25 GMT
Content-Type: text/html
Content-Length: 11321
Last-Modified: Wed, 27 Apr 2022 13:59:39 GMT
Connection: keep-alive
ETag: "62694c4b-2c39"
Accept-Ranges: bytes  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0 11321    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
```

## Playbook to display parameters from remote hosts
* OS/version
* Mount point/capacity/used
* RAM/capacity/free


```bash
vagrant@vagrant:~/ansible$ ansible-playbook -i inventory.yaml first.yaml

PLAY [all_workers] *******************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************
ok: [host6]

TASK [OS/version] ********************************************************************************************************************
ok: [host6] => {
    "msg": [
        "OS     : Ubuntu",
        "Version: 16.04"
    ]
}

TASK [Mount point/capacity/used] *****************************************************************************************************
ok: [host6] => (item={'device': '/dev/mapper/d01-vm--20029--disk--0', 'block_used': 651379, 'options': 'rw,relatime', 'fstype': 'ext4', 'mount': '/', 'inode_total': 524288, 'inode_used': 72274, 'block_total': 2047854, 'size_available': 5719961600, 'inode_available': 452014, 'size_total': 8388009984, 'uuid': 'N/A', 'block_size': 4096, 'block_available': 1396475}) => {
    "msg": [
        "Mount   : /",
        "Capacity: 7999 MB",
        "Used    : 2544 MB"
    ]
}

TASK [RAM/capacity/free] *************************************************************************************************************
ok: [host6] => {
    "msg": [
        "RAM total: 2048 MB",
        "RAM free : 895 MB"
    ]
}

PLAY RECAP ***************************************************************************************************************************
host6                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```


## History
```bash
vagrant@vagrant:~/ansible$ history
    1  pip version
    2  pip --version
    3  sudo pip3 install ansible
    4  ansible --version
    5  vim ansible.cfg
    6  vim inventory.yaml
    7  ansible-inventory -i inventory.yaml --graph
    8  vim ~/
    9  vim ~/.ssh/
   10  ssh-copi-id jump_sa@178.124.206.53
   11  ssh-copy-id jump_sa@178.124.206.53
   12  cd ansible
   13  ssh-copy-id jump_sa@178.124.206.53
   14  vim ~/.ssh/
   15  ssh-copy-id jump_sa@178.124.206.53
   16  cd ~/.ssh
   17  ls -la
   18  ssh-copy-id -i id_rsa.pub jump_sa@178.124.206.53
   19  ssh-keygen -t rsa
   20  ls -la
   21  ssh-keygen
   22  sudo service ssh restart
   23  ssh-copy-id jump_sa@178.124.206.53
   24  ssh-copy-id -i /home/hduser/.ssh/id_ras.pub jump_sa@178.124.206.53
   25  ssh-copy-id jump_sa@178.124.206.53
   26  ps aux | grep ssh-agent
   27  ssh-agent
   28  ps aux | grep ssh-agent
   29  ssh-copy-id jump_sa@178.124.206.53
   30  ls -la
   31  ssh-copy-id -i y.pub jump_sa@178.124.206.53
   32  cd ~/ansible
   33  ssh jump_sa@178.124.206.53
   34  ssh-copy-id -i y.pub jump_sa@178.124.206.53
   35  ssh 'jump_sa@178.124.206.53'
   36  ssh-copy-id -i /home/vagrant/.ssh/y.pub jump_sa@178.124.206.53
   37  ssh 'jump_sa@178.124.206.53'
   38  cd ~/ssh/
   39  cd ~/.ssh
   40  ls -la
   41  vim known)hosts
   42  vim known_hosts
   43  ls -la
   44  rm Y
   45  re Y.pub
   46  rm Y.pub
   47  rm y.pub
   48  rm known_hosts
   49  ls -la
   50  ps aux | grep ssh-agent
   51  kill 1355
   52  ps aux | grep ssh-agent
   53  ssh-keygen -b 4096
   54  ls -la
   55  cd ~/ansible
   56  ssh-copy-id jump_sa@178.124.206.53
   57  ssh 'jump_sa@178.124.206.53
   58  ssh 'jump_sa@178.124.206.53'
   59  ssh -v
   60  ssh -v localhost
   61  clean
   62  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
   63  ls -la
   64  ls -l
   65  ls -la
   66  vim inventory.yaml
   67  ls -la
   68  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
   69  sudo apt install sshpass
   70  sudo dpkg --configure -a
   71  sudo apt install sshpass
   72  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
   73  vim ~/.ssh/config
   74  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
   75  pass: $F|BoF4+JK
   76  user: root
   77  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
   78  cd ~/.ssh/
   79  ls -la
   80  cd ~/ansible
   81  ls -la
   82  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
   83  vim ansible.cfg
   84  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
   85  cd ~/.ssh/
   86  ls -la
   87  vim config
   88  cd ~/ansible
   89  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
   90  vim inventory.yaml
   91  mkdir group_vars/all_workers -p
   92  ls -la
   93  ll group_vars/
   94  vim group_vars/all_workers/vars.yaml
   95  ssh root@192.168.201.6 # ansible_user: root
   96  ssh root@192.168.201.6 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
   97  ansible-inventory -i inventory.yaml --graph
   98  ansible-inventory -i inventory.yaml --host=host6
   99  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
  100  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-pass
  101  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
  102  ansible -i inventory.yaml -m ping all_workers root --ask-pass
  103  ansible -i inventory.yaml -m ping all_workers
  104  ansible -i inventory.yaml -m shell -a "cat root/.ssh/autorized_keys"  all_workers
  105  ansible -i inventory.yaml -m shell -a "cat /root/.ssh/autorized_keys"  all_workers
  106  ansible -i inventory.yaml -m shell -a "cat /root/.ssh/authorized_keys"  all_workers
  107  ansible -i inventory.yaml -m shell -a "cat /etc/hosts"  all_workers
  108  ansible -i inventory.yaml -m shell -a "sudo apt install nginx"  all_workers
  109  ls -la
  110  vim ansible.cfg
  111  vim group_vars/all_workers/vars.yaml
  112  ansible -i inventory.yaml -m shell -a "cat /etc/hosts"  all_workers
  113  ansible-vault create group_vars/all_workers/vault.yaml
  114  ansible -i inventory.yaml -m shell -a "cat /etc/hosts"  all_workers --ask-vault-pass
  115  ansible -i inventory.yaml -m shell -a "sudo apt install nginx"  all_workers --ask-vault-pass
  116  vim first.yaml
  117  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  118  vim first.yaml
  119  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  120  vim first.yaml
  121  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  122  vim first.yaml
  123  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  124  vim first.yaml
  125  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  126  vim first.yaml
  127  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  128  vim first.yaml
  129  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  130  ansible -i inventory.yaml -m shell -a "yum install epel-release -y && yum install nginx -y"
  131  ansible -i inventory.yaml -m shell -a "yum install epel-release -y && yum install nginx -y" host6
  132  ansible -i inventory.yaml -m shell -a "yum install epel-release -y && yum install nginx -y" host6  --ask-vault-pass
  133  ansible -i inventory.yaml -m shell -a "yum install epel-release -y && yum install nginx -y" --ask-vault-pass
  134  vim inventory.yaml
  135  ansible -i inventory.yaml -m shell -a "yum install epel-release -y && yum install nginx -y" --ask-vault-pass
  136  ansible -i inventory.yaml -m shell -a "yum install epel-release -y && yum install nginx -y" all_workers --ask-vault-pass
  137  ansible -i inventory.yaml -m apt -a "name=nginx state=latest" all_workers --ask-vault-pass
  138  ansible -i inventory.yaml -m shell -a "curl localhost:80" all_workers --ask-vault-pass
  139  ansible -i inventory.yaml -m shell -a "sudo apt install curl" all_workers --ask-vault-pass
  140  ansible -i inventory.yaml -m apt -a "name=nginx state=latest" all_workers --ask-vault-pass
  141  ansible -i inventory.yaml -m shell -a "apt install curl" all_workers --ask-vault-pass
  142  ls -la
  143  vim ansible.cfg
  144  vim group_vars/all_workers/vars
  145  vim group_vars/all_workers/vars.yaml
  146  ansible -i inventory.yaml -m shell -a "apt install curl" all_workers
  147  ansible -i inventory.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers
  148  history
  149  ansible -i inventory.yaml -m shell -a "cat /etc/hosts"  all_workers --ask-vault-pass
  150  ansible -i inventory.yaml -m yum -a "name=epel-release state=present"  all_workers --ask-vault-pass
  151  gpasswd-a ansible wheel
  152  ansible -i inventory.yaml -m yum3 -a "name=epel-release state=present"  all_workers --ask-vault-pass
  153  ansible -i inventory.yaml -m yum -a "name=epel-release state=present"  all_workers --ask-vault-pass
  154  ssh root@192.168.201.6 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  155  ansible localhost -m setup -a "filter=ansible_pkg_mgr"
  156  ansible -i inventory.yaml -m yum -a "name=epel-release state=present"  all_workers --ask-vault-pass
  157  ssh root@192.168.201.6 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  158  ansible -i inventory.yaml -m yum -a "name=epel-release state=present"  all_workers --ask-vault-pass
  159  ansible -i inventory.yaml -m apt -a "name=nginx state=latest" -b  all_workers --ask-vault-pass
  160  ansible -i  inventory.yaml -m yum -a "name=nginx state=latest" redhat -b  all_workers --ask-vault-pass
  161  ansible -i inventory.yaml -m yum -a "name=nginx state=latest" -b  all_workers --ask-vault-pass
  162  ansible -i inventory.yaml -m yum -a "name=nginx state=latest" all_workers --ask-vault-pass
  163  ssh root@192.168.201.6 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  164  vim inventory.yaml
  165  ansible -i inventory.yaml -m shell -a "cat /etc/hosts"  all_workers --ask-vault-pass
  166  vim inventory.yaml
  167  ls -la
  168  vim ansible.cfg
  169  vim group_vars/all_workers/vars.yaml
  170  vim group_vars/all_workers/vault.yaml
  171  ssh root@192.168.201.29 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  172  ansible -i inventory.yaml -m shell -a "cat /etc/hosts"  all_workers --ask-vault-pass
  173  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  174  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-pass
  175  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" all_workers --ask-pass
  176  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root all_workers --ask-pass
  177  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" all_workers --ask-vault-pass
  178  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  179  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root all_workers --ask-pass
ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-passc
  180  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-pass
  181  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-vault-pass
  182  ls -la
  183  vim inventory.yaml
  184*
  185  vim group_vars/all_workers/vault.yaml
  186  rm group_vars/all_workers/vault.yaml
  187  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-pass
  188  ansible -i inventory.yaml -m shell -a "cat /etc/hosts"  all_workers
  189  ansible -i inventory.yaml -m yum -a "name=epel-release state=present"  all_workers
  190  ansible --version
  191  ansible -i inventory.yaml -m yum -a "name=epel-release state=present" -b  all_workers
  192  ansible localhost -m setup -a "filter=ansible_pkg_mgr"
  193  ansible -i inventory.yaml -m yum -a "name=epel-release state=present use_backend=yum"  all_workers
  194  ansible -i inventory.yaml -m yum -a "name=epel-release state=present use_backend=yum3"  all_workers
  195*
  196  ssh root@192.168.201.29 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  197  ansible -i inventory.yaml -m yum -a "name=epel-release state=present use_backend=yum3"  all_workers
  198  ansible -i inventory.yaml -m yum -a "name=epel-release state=present use_backend=yum"  all_workers
  199  ansible -i inventory.yaml -m yum -a "name=epel-release state=present use_backend=dnf"  all_workers
  200  ansible -i inventory.yaml -m yum -a "name=epel-release state=present"  all_workers
  201  ssh root@192.168.201.29 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  202  ansible -i inventory.yaml -m yum -a "name=epel-release state=present"  all_workers
  203  ansible -i inventory.yaml -m yum -a "name=epel-release state=present use_backend=yum"  all_workers
  204  ssh root@192.168.201.29 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  205  ansible -i inventory.yaml -m yum -a "name=epel-release state=present use_backend=yum"  all_workers
  206  ansible -i inventory.yaml -m package -a "name=nginx state=present"  all_workers
  207  ssh root@192.168.201.29 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  208  lsb_release -a
  209  ansible -i inventory.yaml -m apt -a "name=nginx state=present"  all_workers
  210  ssh root@192.168.201.29 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  211  ansible -i inventory.yaml -m package -a "name=nginx state=present"  all_workers
  212  vim index.html
  213  ansible -i inventory.yaml -m copy -a "src=index.html dest=/usr/share/nginx/html/index.html" all_workers
  214  ansible -i inventory.yaml -m service -a "name=nginx state=restarted" all_workers
  215  ansible -i inventory.yaml -m shell -a "curl -I http://127.0.0.1:80" all_workers
  216  ssh root@192.168.201.29 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  217  ansible -i inventory.yaml -m shell -a "curl -I http://127.0.0.1:80" all_workers
  218  ls -ls
  219  vim first.yaml
  220  ansible-playbook -i inventory.yaml first.yaml all_workers
  221  ansible-playbook -i inventory.yaml first.yaml
  222  history
```