```bash
10040  mkdir 13.Ansible
10041  cd 13.Ansible
10042  mc
10043  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass 
10044* ssh -L 8081:localhost:80 192.168.202.21 -f -N
10045* ssh -L 8081:localhost:80 root@192.168.202.21 -f -N
10046* ssh -L 8082:localhost:80 root@192.168.202.22 -f -N
10047  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass 
10048* cd ~/Documents/git_repos/
10049* grep -rn "set_fact" ./
10050* vim ./LG/icinga2/icinga2-ansible/i2_test.yml
10051* vim ./LG/icinga2/icinga2-ansible/i2_conn_gen.yaml
10052* vim ./LG/icinga2/icinga2-ansible/i2_config_generate.yml
10053  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass -t tests
10054* vim ./LG/icinga2/icinga2-ansible/roles/api_port_check/tasks/main.yaml
10055  ssh root@192.168.203.22
10056  ssh root@192.168.202.22
10057* ssh root@192.168.202.21
10058  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass -t tests
10059  ls -l
10060  ls -l roles
10061  ls -l roles/webserver
10062* ansible-vault create group_vars/all/vault.yml
10063* ansible-vault edit group_vars/all/vault.yml
10064* ansible-vault edit demo/13.Ansible/group_vars/ec_all/vault.yaml
10065  ansible-playbook local.yaml 
10066  ansible-playbook local.yaml  -i hosts.yaml
10067  ansible-playbook local.yaml
10068* vim ./LG/icinga2/icinga2-ansible/dr_cluster.yml
10069  ansible-playbook local.yaml
10070  ansible-playbook local.yaml --ask-vault-pass
10071  ansible-playbook local.yaml --ask-vault-pass --skip-tags=always
10072  ansible-playbook local.yaml --ask-vault-pass
10073  ansible-playbook local.yaml --ask-vault-pass -t never
10074  ls
10075  ansible-lint play.yaml
10076  sudo pip3 install molecule
10077  cd roles/webserver
10078  molecule test
10079  molecule init scenario
10080  ls -l
10081  ls -la
10082  vim molecule/default/molecule.yml
10083  molecule test
10084* top
10085  vim molecule/default/molecule.yml
10086  molecule test
10087* top
10088* docker ps
10089* watch docker ps

```
