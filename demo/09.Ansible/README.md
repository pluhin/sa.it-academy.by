```bash
7304  ssh root@192.168.31.24
 7305  ssh-copy-id root@192.168.31.24
 7306  ssh root@192.168.31.24
 7307* ansible ec_ws -m ping
 7308  ansible --version
 7309  vim /home/spishchyk/.ansible.cfg
 7310* ansible ec_ws -m ping
 7311  vim .ssh/config
 7312  cd Documents/git_repos/sa.it-academy.by/demo/09.Ansible
 7313  ls
 7314  ansible-playbook -i inv.yaml play.yaml -t info
 7315  ansible --varsion
 7316  ansible --version
 7317* vim .ansible.cfg
 7318  ansible --version
 7319  ansible-playbook -i inv.yaml play.yaml -t info
 7320  ls
 7321  mv roles/redmine/tesks roles/redmine/tasks
 7322  ansible-playbook -i inv.yaml play.yaml -t info
 7323  ansible-playbook -i inv.yaml play.yaml
 7324  ls
 7325  ls -l roles -r
 7326  ls -l roles -R
 7327  ls -l roles
 7328  ls -l roles/redmine
 7329  ls -l roles/redmine/defaults
 7330  ls -l roles/redmine/tasks
 7331  ls -l roles/redmine/templates
 7332  ansible-playbook -i inv.yaml play.yaml
 7333  ansible-playbook -i inv.yaml play.yaml -e "hide_logs=Flase"
 7334  ansible-playbook -i inv.yaml play.yaml -e "hide_logs=False"
 7335  ansible-playbook -i inv.yaml play.yaml
 7336* ansible ec_ws -m shell -a "ls -l /root/.my.cfg" 
 7337* ansible ec_ws -m shell -a "ls -l /root/.my.cnf" 
 7338* sudo vim /etc/ansible/hosts
 7339* ansible ec_ws -m shell -a "ls -l /root/.my.cnf" 
 7340* vim .ansible
 7341* vim .ansible.cfg
 7342* ansible ec_ws -m shell -a "ls -l /root/.my.cnf" 
 7343* vim .ansible.cfg
 7344* ansible ec_ws -m shell -a "ls -l /root/.my.cnf" 
 7345  ansible-playbook -i inv.yaml play.yaml
 7346* ansible 192.168.31.24 -m shell -a "rm -rf /opt/redmine" 
 7347* ansible 192.168.31.24 -m shell -a "ls -l /opt/redmine" 
 7348  ansible-playbook -i inv.yaml play.yaml
 7349* ansible ec_ws -m shell -a "ls -l /root/.my.cnf" 
 7350* ansible 192.168.31.14 -m shell -a "cat /opt/redmine/config/database.yml" 
 7351* ansible 192.168.31.24 -m shell -a "cat /opt/redmine/config/database.yml" 
 7352* ansible 192.168.31.14 -m shell -a "cat /opt/redmine/config/database.yml" 
 7353  ansible-playbook -i inv.yaml play.yaml
 7354  history| grep ssh
 7355  ssh-copy-id root@192.168.31.14
 7356  ansible-playbook -i inv.yaml play.yaml
 7357* ansible 192.168.31.14 -m shell -a "cat /opt/redmine/config/database.yml" 
 7358  ansible-playbook -i inv.yaml play.yaml
 7359  ansible-playbook -i inv.yaml play.yaml -t test
 7360  ec_ssh_jump
 7361* cd ~
 7362* vim .autostart/vpn_tunnel.sh
 7363  ssh -L 8081:localhost:80 root@192.168.31.24 -f -N
 7364  ps aux | grep localhost
 7365  curl --header "Host: redmine.plu.by" http://localhost:8081 
```