# 05. Ansible start
##task1.Setting Up Ansible
```bash
  531  ansible --version
  532  ll
  533  mkdir 05.Ansible
  534  cd 05.Ansible/
  535  git init
  536  cd ..
  537  mv 05.Ansible/ 05.Ansible.start
  538  cd 05.Ansible.start/
  539  git status
  540  git init
  541  mkdir ansible_playbooks
  542  cd ansible_playbooks
  543  nano hello_ansible.yml
  544  git add --all
  545  ll
  546  cat hello_ansible.yml
  547  ansible-playbook hello_ansible.yml
  548  history
```
##task2.Managing Remote Hosts
```bash
sudo apt install sshpass
ssh -p 32510 jump_sa@178.124.206.53
ssh -p 32510 jump_sa@178.124.206.53
ssh-copy-id root@192.168.202.3
ssh-copy-id root@192.168.202.4
nano inv.yml
nano install_packages.yml
 ansible-playbook -i inv.yml install_packages.yml
```
### console output
```

PLAY [Install packages mc and htop] ******************************************************************

TASK [Gathering Facts] *******************************************************************************
ok: [host3]
ok: [host4]

TASK [mc install] ************************************************************************************
ok: [host4]
ok: [host3]

TASK [vim installed] *********************************************************************************
ok: [host3]
ok: [host4]

PLAY RECAP *******************************************************************************************
host3                      : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host4                      : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
##task3.Managing Users and Groups

```
 nano manage_user_group.yml
ansible-vault create secret.yml
   ansible-vault decrypt secret.yml
   nano secret.yml
      ansible-vault encrypt secret.yml
ansible-playbook -i inv.yml manage_user_group.yml --extra-vars @secret.yml --extra-vars "username=bugaenko groupname=users" --ask-vault-pass

```
### console output
```
ss@deb1:~/git/sa.it-academy.by/bugaenko/05.Ansible.start/ansible_playbooks$ ansible-playbook -i inv.yml manage_user_group.yml --extra-vars @secret.yml --extra-vars "username=bugaenko groupname=users" --ask-vault-pass
Vault password:

PLAY [Manage users and groups] ***********************************************************************

TASK [Gathering Facts] *******************************************************************************
ok: [host3]
ok: [host4]

TASK [Create user] ***********************************************************************************
changed: [host4]
changed: [host3]

PLAY RECAP *******************************************************************************************
host3                      : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host4                      : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```
