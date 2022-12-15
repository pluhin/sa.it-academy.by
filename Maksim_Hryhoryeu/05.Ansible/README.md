### Ansible version
```
maksim@maksim:~/devops-hw/sa.it-academy.by/Maksim_Hryhoryeu/05.Ansible$ ansible --version
ansible [core 2.14.0]
  config file = /home/maksim/devops-hw/sa.it-academy.by/Maksim_Hryhoryeu/05.Ansible/ansible.cfg
  configured module search path = ['/home/maksim/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/maksim/.local/lib/python3.10/site-packages/ansible
  ansible collection location = /home/maksim/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/maksim/.local/bin/ansible
  python version = 3.10.6 (main, Nov  2 2022, 18:53:38) [GCC 11.3.0] (/usr/bin/python3)
  jinja version = 3.0.3
  libyaml = True
```

### Playbook
```yaml
- hosts: all_workers
  gather_facts: False
  strategy: free
  tasks:
    - name: OS version
      shell: lsb_release -a
      register: os_info
    - debug:
        msg: "{{os_info.stdout_lines}}"

    - name: Disk
      shell: df -h
      register: disk_info
    - debug:
        msg: "{{disk_info.stdout_lines}}"

    - name: RAM
      shell: cat /proc/meminfo | grep "Mem"
      register: ram_info
    - debug:
        msg: "{{ram_info.stdout_lines}}"
```

### Result
```
maksim@maksim:~/devops-hw/sa.it-academy.by/Maksim_Hryhoryeu/05.Ansible$ ansible-playbook -i inv.yaml playbook1.yaml -u root
[WARNING]: Collection ansible.posix does not support Ansible version 2.14.0

PLAY [all_workers] ***********************************************************************************************************************************************************
Thursday 15 December 2022  01:26:28 +0000 (0:00:00.018)       0:00:00.018 *****
Thursday 15 December 2022  01:26:28 +0000 (0:00:00.006)       0:00:00.025 *****

TASK [OS version] ************************************************************************************************************************************************************
changed: [host11]
Thursday 15 December 2022  01:26:29 +0000 (0:00:01.223)       0:00:01.248 *****
changed: [host12]
Thursday 15 December 2022  01:26:29 +0000 (0:00:00.016)       0:00:01.265 *****

TASK [debug] *****************************************************************************************************************************************************************
ok: [host11] => {
    "msg": [
        "Distributor ID:\tUbuntu",
        "Description:\tUbuntu 20.04 LTS",
        "Release:\t20.04",
        "Codename:\tfocal"
    ]
}
Thursday 15 December 2022  01:26:29 +0000 (0:00:00.019)       0:00:01.284 *****
ok: [host12] => {
    "msg": [
        "Distributor ID:\tUbuntu",
        "Description:\tUbuntu 20.04 LTS",
        "Release:\t20.04",
        "Codename:\tfocal"
    ]
}
Thursday 15 December 2022  01:26:29 +0000 (0:00:00.010)       0:00:01.295 *****

TASK [Disk] ******************************************************************************************************************************************************************
changed: [host11]
Thursday 15 December 2022  01:26:30 +0000 (0:00:00.552)       0:00:01.848 *****

TASK [debug] *****************************************************************************************************************************************************************
ok: [host11] => {
    "msg": [
        "Filesystem      Size  Used Avail Use% Mounted on",
        "/dev/loop11      12G  921M   11G   9% /",
        "none            492K  4.0K  488K   1% /dev",
        "tmpfs           126G     0  126G   0% /dev/shm",
        "tmpfs            26G   92K   26G   1% /run",
        "tmpfs           5.0M     0  5.0M   0% /run/lock",
        "tmpfs            26G     0   26G   0% /run/user/0"
    ]
}
Thursday 15 December 2022  01:26:30 +0000 (0:00:00.022)       0:00:01.870 *****

TASK [Disk] ******************************************************************************************************************************************************************
changed: [host12]
Thursday 15 December 2022  01:26:30 +0000 (0:00:00.008)       0:00:01.879 *****

TASK [debug] *****************************************************************************************************************************************************************
ok: [host12] => {
    "msg": [
        "Filesystem      Size  Used Avail Use% Mounted on",
        "/dev/loop12      12G  919M   11G   9% /",
        "none            492K  4.0K  488K   1% /dev",
        "tmpfs           126G     0  126G   0% /dev/shm",
        "tmpfs            26G   92K   26G   1% /run",
        "tmpfs           5.0M     0  5.0M   0% /run/lock",
        "tmpfs            26G     0   26G   0% /run/user/0"
    ]
}
Thursday 15 December 2022  01:26:30 +0000 (0:00:00.021)       0:00:01.901 *****

TASK [RAM] *******************************************************************************************************************************************************************
changed: [host11]
Thursday 15 December 2022  01:26:30 +0000 (0:00:00.557)       0:00:02.459 *****

TASK [debug] *****************************************************************************************************************************************************************
ok: [host11] => {
    "msg": [
        "MemTotal:        2097152 kB",
        "MemFree:         1865884 kB",
        "MemAvailable:    2037880 kB"
    ]
}

TASK [RAM] *******************************************************************************************************************************************************************
changed: [host12]
Thursday 15 December 2022  01:26:30 +0000 (0:00:00.026)       0:00:02.485 *****

TASK [debug] *****************************************************************************************************************************************************************
ok: [host12] => {
    "msg": [
        "MemTotal:        2097152 kB",
        "MemFree:         1869460 kB",
        "MemAvailable:    2036692 kB"
    ]
}

PLAY RECAP *******************************************************************************************************************************************************************
host11                     : ok=6    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host12                     : ok=6    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Thursday 15 December 2022  01:26:30 +0000 (0:00:00.034)       0:00:02.520 *****
===============================================================================
OS version ------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.22s
RAM ------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.56s
Disk ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.55s
debug ----------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.03s
debug ----------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.02s
debug ----------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.02s
Playbook run took 0 days, 0 hours, 0 minutes, 2 seconds
```
