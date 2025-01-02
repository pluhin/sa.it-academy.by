## Ansible start

### Homework Assignment 1: Setting Up Ansible

```bash
burpee@burpee:~/ansible/playbook$ ansible-playbook hello.yml
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [localhost] ***********************************************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************************************
ok: [localhost]

TASK [Print hello] *********************************************************************************************************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP *****************************************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

### Homework Assignment 2: Managing Remote Hosts

```bash
burpee@burpee:~/ansible/playbook$ ansible-playbook -i ../config/inv.yml install.yml

PLAY [other] ***************************************************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************************************
Вторник 31 декабря 2024  16:35:15 +0300 (0:00:00.008)       0:00:00.008 ******* 
ok: [host23]
ok: [host24]

TASK [Install vim] *********************************************************************************************************************************************
Вторник 31 декабря 2024  16:35:18 +0300 (0:00:02.610)       0:00:02.618 ******* 
ok: [host23]
ok: [host24]

TASK [Check installation] **************************************************************************************************************************************
Вторник 31 декабря 2024  16:35:20 +0300 (0:00:01.783)       0:00:04.402 ******* 
changed: [host23]
changed: [host24]

TASK [Print result] ********************************************************************************************************************************************
Вторник 31 декабря 2024  16:35:20 +0300 (0:00:00.953)       0:00:05.356 ******* 
ok: [host23] => {
    "msg": "  Installed: 2:8.2.3995-1ubuntu2.21"
}
ok: [host24] => {
    "msg": "  Installed: 2:8.2.3995-1ubuntu2.21"
}

PLAY RECAP *****************************************************************************************************************************************************
host23                     : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host24                     : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Вторник 31 декабря 2024  16:35:21 +0300 (0:00:00.143)       0:00:05.500 ******* 
=============================================================================== 
Gathering Facts ----------------------------------------------------------------------------------------------------------------------------------------- 2.61s
Install vim --------------------------------------------------------------------------------------------------------------------------------------------- 1.78s
Check installation -------------------------------------------------------------------------------------------------------------------------------------- 0.95s
Print result -------------------------------------------------------------------------------------------------------------------------------------------- 0.14s
Playbook run took 0 days, 0 hours, 0 minutes, 5 seconds
```

### Homework Assignment 3: Managing Users and Groups

```bash
burpee@burpee:~/ansible/playbook$ ansible-playbook -i ../config/inv.yml manage.yml 

PLAY [other] ***************************************************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************************************
Вторник 31 декабря 2024  16:46:27 +0300 (0:00:00.009)       0:00:00.009 ******* 
ok: [host24]
ok: [host23]

TASK [Create group] ********************************************************************************************************************************************
Вторник 31 декабря 2024  16:46:29 +0300 (0:00:02.571)       0:00:02.580 ******* 
changed: [host23]
changed: [host24]

TASK [Create user] *********************************************************************************************************************************************
Вторник 31 декабря 2024  16:46:30 +0300 (0:00:00.938)       0:00:03.518 ******* 
changed: [host23]
changed: [host24]

PLAY RECAP *****************************************************************************************************************************************************
host23                     : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host24                     : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Вторник 31 декабря 2024  16:46:31 +0300 (0:00:00.912)       0:00:04.431 ******* 
=============================================================================== 
Gathering Facts ----------------------------------------------------------------------------------------------------------------------------------------- 2.57s
Create group -------------------------------------------------------------------------------------------------------------------------------------------- 0.94s
Create user --------------------------------------------------------------------------------------------------------------------------------------------- 0.91s
Playbook run took 0 days, 0 hours, 0 minutes, 4 seconds
```


#### History

```bash
 388  mkdir Homework
  389  cd Homework/
  390  git clone git@github.com:Gorilbl4/sa.it-academy.by.git
  391  cd sa.it-academy.by/
  392  git checkout md-sa2-30-24 
  393  cd Daniil_Lukashchyk/
  394  ls -la
  395  git log
  396  git log --oneline 
  397  cd ..
  398  sudo apt install ansible
  399  ansible --version
  400  sudo apt install python3
  401  apt-get update ansible
  402  apt-get update
  403  sudo apt-get update
  404  sudo apt install pythin3-pip
  405  sudo apt install python3-pip
  406  sudo pip3 install ansible
  407  ansible --version
  408  mkdir ansible
  409  cd  ansible/
  410  ls -la
  411  mkdir playbook
  412  cd playbook/
  413  touch hello.yml
  414  nano hello.yml 
  415  cat hello.yml 
  416  ansible-playbook hello.yml
  417  touch inv.yml
  418  sudo apt install sshpass
  419  cd ..
  420  cd playbook/
  421  rm -rf inv.yml 
  422  cd ..
  423  mkdir config
  424  cd config/
  425  touch ansible.cfg
  426  nano ansible.cfg 
  427  touch inv.yml
  428  nano inv.yml 
  429  ansible-inventory -i inv.yml --graph
  430  nano ansible.cfg 
  431  ansible-inventory -i inv.yml --graph
  432  nano ansible.cfg 
  433  ssh-copy-id -i /home/burpee/.ssh/id_rsa.pub -p 32510 jump_sa@178.124.206.53
  434  ssh -p 32510 'jump_sa@178.124.206.53'
  435  nano ~/.ssh/config
  436  ssh root@192.168.202.23
  437  nano ansible.cfg 
  438  cd ..
  439  cd playbook/
  440  touch install.yml
  441  nano install.yml 
  442  ansible -i ../config/inv.yml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root other --ask-pass
  443  cd ..
  444  cd config/
  445  nano inv.yml 
  446  ssh root@192.168.202.24
  447  ansible -i ../config/inv.yml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root other --ask-pass
  448  cd ..
  449  ansible -i ../config/inv.yml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root other --ask-pass
  450  cd config/
  451  ansible -i ../config/inv.yml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root other --ask-pass
  452  nano ansible.cfg 
  453  ansible -i ../config/inv.yml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root other --ask-pass
  454  cd ..
  455  cd playbook/
  456  ansible-playbook ../config/inv.yml install.yml 
  457  ansible-playbook ../config/inv.yml install.yml --ask-pass
  458  cd ..
  459  cd config/
  460  rm -rf ansible.cfg 
  461  cd ..
  462  cd /etc/ansible/
  463  cd /etc/
  464  mkdir ansible
  465  sudo mkdir ansible
  466  cd ansible/
  467  touch ansible.cfg
  468  sudo touch ansible.cfg
  469  sudo nano ansible.cfg 
  470  touch hosts.yml
  471  sudo touch hosts.yml
  472  sudo nano hosts.yml 
  473  cd ..
  474  cd ~/ansible/
  475  ansible-playbook ../config/inv.yml install.yml
  476  cd config/
  477  ls -la
  478  ansible-playbook inv.yml install.yml
  479  cd ..
  480  cd playbook/
  481  ansible-playbook ../config/inv.yml install.yml
  482  ansible-playbook hosts.yml install.yml
  483  ansible-playbook /etc/ansible/hosts.yml install.yml
  484  ansible -i ../config/inv.yml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root other --ask-pass
  485  ansible -i ../config/inv.yml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root other
  486  ansible-playbook /etc/ansible/hosts.yml install.yml
  487  nano ~/ansible/config/inv.yml 
  488  ssh root@192.168.202.23
  489  ansible -i ../config/inv.yml -m ping -u root all-workers
  490  ansible-playbook -i ../config/inv.yml install.yml
  491  touch manage.yml
  492  nano manage.yml 
  493  ansible-inventory -i ../config/inv.yml 
  494  ansible-inventory -i ../config/inv.yml --graph
  495  nano manage.yml 
  496  ansible-playbook -i ../config/inv.yml manage.yml 
  497  nano manage.yml 
  498  ansible-playbook -i ../config/inv.yml manage.yml 
  499  cd ..
  500  cd Homework/sa.it-academy.by/Daniil_Lukashchyk/
  501  ls -la
  502  mkdir 05.Ansible.Start
  503  cd 05
  504  cd 05.Ansible.Start/
  505  git branch 
  506  touch README.md
  507  nano README.md 
  508  history 
```
