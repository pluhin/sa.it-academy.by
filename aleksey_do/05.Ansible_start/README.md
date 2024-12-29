## Ansible start

### Homework Assignment 1: Setting Up Ansible

```bash
sudo mkdir ansible-playbooks
cd ansible-playbooks
nano hello-ansible.yml
sudo nano hello-ansible.yml
ansible-playbook hello-ansible.yml
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'
PLAY [Print Hello, Ansible!] ****************************************************************************************************************
TASK [Gathering Facts] **********************************************************************************************************************
ok: [localhost]
TASK [Print message] ************************************************************************************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}
PLAY RECAP **********************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

### Homework Assignment 2: Managing Remote Hosts
```bash 
ansible-playbook -i inventory.ini install-htop.yml
PLAY [Install htop on remote host] **********************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************
[WARNING]: Platform linux on host sa-5 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another
Python interpreter could change the meaning of that path. See https://docs.ansible.com/ansible-
core/2.18/reference_appendices/interpreter_discovery.html for more information.
ok: [sa-5]

TASK [Ensure htop is installed] *************************************************************************************************************
changed: [sa-5]

PLAY RECAP **********************************************************************************************************************************
sa-5                       : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
root@192.168.202.5's password: 
Welcome to Ubuntu 22.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '24.04.1 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Sun Dec 29 12:53:28 2024 from 192.168.204.82
root@sa-5:~# htop --version
htop 3.0.5
```


### Homework Assignment 3: Managing Users and Groups
```bash 
ansible-playbook -i inv.yaml manage_users_and_groups.yml \
  -e "user_name=testuser" \
  -e "group_name=testgroup" \
  -e "user_password=testpassword123" \
  -u root --ask-pass

SSH password: 

PLAY [Manage users and groups on remote host] *********************************************************************************

TASK [Gathering Facts] ********************************************************************************************************
Sunday 29 December 2024  14:14:20 +0000 (0:00:00.011)       0:00:00.011 ******* 
ok: [host6]
ok: [host5]

TASK [Creating user: testuser] ************************************************************************************************
Sunday 29 December 2024  14:14:24 +0000 (0:00:04.624)       0:00:04.636 ******* 
[WARNING]: The input password appears not to have been hashed. The 'password' argument must be encrypted for this module to
work properly.
changed: [host6]
changed: [host5]

TASK [Check user] *************************************************************************************************************
Sunday 29 December 2024  14:14:28 +0000 (0:00:03.640)       0:00:08.276 ******* 
changed: [host5]
changed: [host6]

TASK [debug] ******************************************************************************************************************
Sunday 29 December 2024  14:14:31 +0000 (0:00:03.506)       0:00:11.783 ******* 
ok: [host5] => {
    "msg": [
        "testuser:x:1000:1000:Managed by Ansible:/home/testuser:/bin/sh",
        "testuser : testgroup",
        "testuser:testpassword123:20086:0:99999:7:::",
        "Sun Dec 29 14:14:31 UTC 2024"
    ]
}
ok: [host6] => {
    "msg": [
        "testuser:x:1000:1000:Managed by Ansible:/home/testuser:/bin/sh",
        "testuser : testgroup",
        "testuser:testpassword123:20086:0:99999:7:::",
        "Sun Dec 29 14:14:31 UTC 2024"
    ]
}

TASK [Removing user testuser] *************************************************************************************************
Sunday 29 December 2024  14:14:31 +0000 (0:00:00.042)       0:00:11.826 ******* 
changed: [host6]
changed: [host5]

PLAY RECAP ********************************************************************************************************************
host5                      : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host6                      : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Sunday 29 December 2024  14:14:35 +0000 (0:00:03.562)       0:00:15.388 ******* 
=============================================================================== 
Gathering Facts -------------------------------------------------------------------------------------------------------- 4.62s
Creating user: testuser ------------------------------------------------------------------------------------------------ 3.64s
Removing user testuser ------------------------------------------------------------------------------------------------- 3.56s
Check user ------------------------------------------------------------------------------------------------------------- 3.51s
debug ------------------------------------------------------------------------------------------------------------------ 0.04s
Playbook run took 0 days, 0 hours, 0 minutes, 15 seconds
```


#### History
```bash
history
    1  nano .zshrc
    2  ls -la
    3  ls
    4  cd ../
    5  nano .zshrc
    6  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    7  nano .zshrc
    8  ls -la
    9  cd /home
   10  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   11  nano .zshrc
   12  cd ../
   13  nano .zshrc
   14  cd ../
   15  nano ~/.zshrc
   16  nano ~/.zshrcgit clone https://github.com/zsh-users/zsh-syntax-highlighting.git\necho "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
   17  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git\necho "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
   18  sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git\necho "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
   19  nano ~/.zshrc
   20  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git\necho "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
   21  zsh
   22  nano ~/.zshrc
   23  source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
   24  nano ~/.zshrc
   25  exit
   26  ssh-keygen -t rsa -b 4096 -C "aliaksei.dalhapolau@gmail.com"\n
   27  ^[[200~cat ~/.ssh/id_rsa.pub
   28  cat ~/.ssh/id_rsa.pub\n
   29  eval "$(ssh-agent -s)"\nssh-add ~/.ssh/id_rsa
   30  ssh -T git@github.com\n
   31  matix
   32  cd /home
   33  mkdir ansible
   34  sudo su
   35  cd /home
   36  sudo mkdir ansible
   37  ls -la
   38  ls
   39  cd /home/ansible
   40  ls
   41  nano inv.yaml
   42  sudo nano inv.yaml
   43  ssh-copy-id -p 32510 jump_sa@178.124.206.53
   44  ssh -p 32510 'jump_sa@178.124.206.53
   45  ssh -p 32510 'jump_sa@178.124.206.53'
   46  sudo apt install pythin3-pip
   47  sudo apt install python3-pip
   48  sudi pip3 install ansible
   49  sudo pip3 install ansible
   50  cd ../
   51  sudo pip3 install ansible
   52  python3 -m venv ~/ansible-env
   53  sudo python3 -m venv ~/ansible-env
   54  sudo apt install python3.12-venv\n
   55  python3 -m venv ~/ansible-env
   56  source ~/ansible-env/bin/activate
   57  pip install ansible
   58  cd /home/ansible
   59  ansible-inventory -i inv.yaml ==graph
   60  ansible-inventory -i inv.yaml --graph
   61  nano inv.yaml
   62  ansible-inventory -i inv.yaml --graph
   63  ansible-inventory -i inv.yaml --host host5
   64  ansible-inventory -i inv.yaml --host host bastion
   65  ansible-inventory -i inv.yaml --host bastion
   66  sudo nano ~/.ssh/config
   67  ssh root@192.168.202.25
   68  ssh root@192.168.202.5
   69  sudo nano ~/.ssh/config
   70  ssh root@192.168.202.5
   71  sudo nano ansible.cfg
   72  ssh apt install sshpass
   73  sudo apt install sshpass
   74  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
   75  sudo mkdir -p group_vars/all_workers
   76  sudo nano group_vars/all_workers/var.yaml
   77  history
   78  ansible-vault create group_vars/all_workers/vault.yaml
   79  ansible-vault nano create group_vars/all_workers/vault.yaml
   80  ansible-vault nano edit group_vars/all_workers/vault.yaml
   81  ansible-vaultedit group_vars/all_workers/vault.yaml
   82  ansible-vault edit group_vars/all_workers/vault.yaml
   83  ansible-vault nano create group_vars/all_workers/vault.yaml
   84  ansible-vault create group_vars/all_workers/vault.yaml
   85  history
   86  ssh root@192.168.202.5
   87  ansible-vault
   88  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
   89  reboot
   90  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
   91  source ~/ansible-env/bin/activate
   92  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
   93  cd /home/ansible
   94  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
   95  ansible-vault create group_vars/all_workers/vault.yaml
   96  sudo ansible-vault create group_vars/all_workers/vault.yaml
   97  123
   98  sudo ansible-vault create group_vars/all_workers/vault.yaml
   99  ansible-vault create group_vars/all_workers/vault.yaml
  100  sudo ansible-vault create group_vars/all_workers/vault.yaml
  101  ls -ld group_vars/all_workers
  102  sudo chmod -R 755 group_vars/all_workers
  103  sudo ansible-vault create group_vars/all_workers/vault.yaml
  104  ansible-vault create group_vars/all_workers/vault.yaml
  105  clear
  106  nano inv.yaml
  107  sudo nano inv.yaml
  108  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
  109  sudo nano inv.yaml
  110  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
  111  sudo nano inv.yaml
  112  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
  113  sudo nano inv.yaml
  114  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
  115  sudo nano inv.yaml
  116  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
  117  sudo nano inv.yaml
  118  ansible-inventory -i inv.yaml --graph
  119  ansible-inventory -i inv.yaml --host host5
  120  nano ~/.ssh/config
  121  sudo nano ~/.ssh/config
  122  nano ~/.ssh/config
  123  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
  124  ^[[200~ansible --version
  125  ansible --version\n
  126  sudo mkdir ansible-playbooks\n
  127  cd ansible-playbooks
  128  nano hello-ansible.yml\n
  129  sudo nano hello-ansible.yml\n
  130  ansible-playbook hello-ansible.yml\n
  131  ssh root@192.168.202.5
  132  sudo nano inventory.ini
  133  ssh root@192.168.202.5
  134  sudo nano install-htop.yml
  135  ansible-playbook -i inventory.ini install-vim.yml\n
  136  ansible-playbook -i inventory.ini install-htop.yml\n
  137  nano ~/.ssh/config
  138  ansible-inventory -i inv.yaml --host host5
  139  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
  140  cd ../
  141  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
  142  ansible-inventory -i inv.yaml --graph
  143  nano ansible.cfg
  144  nano inv.yaml
  145  ansible -i inv.yaml -m ping -u root all-workers --ask-pass
  146  nano inv.yaml
  147  ansible -i inv.yaml -m ping -u root all_workers --ask-pass\n
  148  sudo nano inv.yaml
  149  ansible -i inv.yaml -m ping -u root all_workers --ask-pass\n
  150  sudo nano inv.yaml
  151  ansible -i inv.yaml -m ping -u root all_workers --ask-pass\n
  152  sudo nano inv.yaml
  153  ansible -i inv.yaml -m ping -u root all_workers --ask-pass -vvv\n
  154  sudo nano inv.yaml
  155  ansible -i inv.yaml -m ping -u root all_workers --ask-pass\n
  156  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root all_workers --ask-pass
  157  ansible -i inv.yaml -m ping -u root all_workers --ask-pass -vvv\n
  158  ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510
  159  sudo nano inv.yaml
  160  sudo mkdir -p group_vars/all_workers
  161  cd group_vars/all_workers
  162  ls
  163  sudo nano var.yaml
  164  cd ../
  165  ansible -i inv.yaml -m ping -u root all_workers --ask-pass\n
  166  cd ../
  167  ansible -i inv.yaml -m ping -u root all_workers --ask-pass\n
  168  clear
  169  ansible -i inv.yaml -m ping -u root all_workers --ask-pass\n
  170  cd /home/ansible/ansible-playbooks
  171  cd ../
  172  sudo nano ansible-playbooks/manage_users_and_groups.yml 
  173  ansible-playbook manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123"\n
  174  cd ansible-playbooks
  175  ansible-playbook manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123"\n
  176  sudo nano manage_users_and_groups.yml 
  177  cd ../
  178  sudo nano manage_users_and_groups.yml 
  179  ansible-playbook manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123"\n
  180  ansible-playbook -i inv.yaml manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123"\n
  181  ansible-playbook -i inv.yaml --ask-pass manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123"\n
  182  ansible -i inv.yaml -m ping -u root all_workers --ask-pass\n
  183  ansible-playbook -i inv.yaml manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123" \\n  -u root --ask-pass\n
  184  sudo nano install_passlib.yml 
  185  ansible-playbook -i inv.yaml install_passlib.yml -u root --ask-pass
  186  ansible-playbook -i inv.yaml manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123" \\n  -u root --ask-pass\n
  187  sudo nano inv.yaml
  188  ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510
  189  ssh ssh -p 32510 'jump_sa@178.124.206.53'
  190  ssh -p 32510 'jump_sa@178.124.206.53'
  191  sudo nano manage_users_and_groups.yml 
  192  [200~ansible all -i inv.yaml -m setup -a 'filter=ansible_python_interpreter' -u root --ask-pass
  193  ansible all -i inv.yaml -m setup -a 'filter=ansible_python_interpreter' -u root --ask-pass\n
  194  ansible all -i inv.yaml -m command -a "python3 -m pip show passlib" -u root --ask-pass\n
  195  ansible-playbook -i inv.yaml manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123" \\n  -u root --ask-pass\n
  196  sudo nano install_passlib.yml 
  197  ssh -p 32510 'jump_sa@178.124.206.53'
  198  sudo nano install_passlib.yml 
  199  ansible all -i inv.yaml -m command -a "python3 -m pip show passlib" -u root --ask-pass\n
  200  ansible-playbook -i inv.yaml install_passlib.yml -u root --ask-pass
  201  ansible-playbook -i inv.yaml manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123" \\n  -u root --ask-pass\n
  202  sudo nano inv.yaml
  203  sudo nano var.yaml
  204  sudo nano ansible-playbooks/manage_users_and_groups.yml 
  205  nano ~/.ssh/config
  206  ansible-playbook -i inv.yaml manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123" \\n  -u root --ask-pass\n
  207  clear
  208  ls
  209  cd ansible-playbooks
  210  ls
  211  cat inventory.ini
  212  cd ../
  213  sudo nano manage_users_and_groups.yml 
  214  ansible-playbook -i inv.yaml manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123" \\n  -u root --ask-pass\n
  215  sudo nano manage_users_and_groups.yml 
  216  ansible-playbook -i inv.yaml manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123" \\n  -u root --ask-pass\n
  217  sudo nano manage_users_and_groups.yml 
  218  ansible-playbook -i inv.yaml manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123" \\n  -u root --ask-pass\n
  219  sudo nano manage_users_and_groups.yml 
  220  ansible-playbook -i inv.yaml manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123" \\n  -u root --ask-pass\n
  221  sudo nano manage_users_and_groups.yml 
  222  ansible-playbook -i inv.yaml manage_users_and_groups.yml \\n  -e "user_name=testuser" \\n  -e "group_name=testgroup" \\n  -e "user_password=testpassword123" \\n  -u root --ask-pass\n
  223  ssh -p 32510 'jump_sa@178.124.206.53'
  224  sudo nano manage_users_and_groups.yml 
```