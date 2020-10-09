```bash
82  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data /mnt/test/
83  mkdir /mnt/test/sa2-14-20/demo/jenkins
```


```bash
10583  ssh -L 6443:localhost:6443 root@192.168.201.22 -f -N; export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config_ec_ws
10584  kubectl get pods
10585  kubectl get pods -n ci-cd
10586* ssh root@192.168.201.22
10587  kubectl get pods -n ci-cd
10588  kubectl apply -f jenkins.yaml
10589  kubectl get pods -n ci-cd
10590  kubectl get pods -n kube-system
10591  history| grep nodes
10592  kubectl get pods -n ci-cd
10593* docker logout
10594  curl https://index.docker.io/v1/
10595  kubectl get pods -n ci-cd
10596  kubectl delete pod jenkins-bbbc84589-lhgtm -n ci-cd
10597  kubectl delete pod jenkins-65b876d76f-279x4 -n ci-cd
10598  kubectl get pods -n ci-cd
10599  kubectl delete -f jenkins.yaml
10600  kubectl get pods -n ci-cd
10601  kubectl create -f jenkins.yaml
10602  kubectl get pods -n ci-cd
10603  k9s
10604  kubectl create -f jenkins.yaml
10605  kubectl apply -f jenkins.yaml
10606  k9s
10607  cd ../
10608  ls
10609  mkdir 11.Ansible
10610  cd 11.Ansible
10611  vim /etc/ansible/ansible.cfg
10612  sudo vim /etc/ansible/ansible.cfg
10613  ansible --version
10614  env | grep ansible
10615  env | grep ANSIB
10616  vim   /home/spishchyk/.ansible.cfg
10617  sudo vim /etc/ansible/hosts
10618  vim ~/.ssh/config
10619  sudo vim /etc/ansible/hosts
10620  ansible-inventory --graph
10621  ansible-inventory --host 192.168.203.44
10622  sudo vim /etc/ansible/hosts
10623  ansible-inventory --host 192.168.203.44
10624  ssh root@192.168.203.34
10625  ssh root@192.168.203.24
10626  clear
10627  ansible ec -m ping
10628* vim /home/spishchyk/.ssh/known_hosts
10629  ansible ec -m ping
10630  sudo vim /etc/ansible/hosts
10631  ansible ec -m ping
10632  id
10633  ansible ec -m ping -u root --ask-pass
10634  sudo vim /etc/ansible/hosts
10635  ansible jump -m ping
10636  sudo vim /etc/ansible/hosts
10637  ansible jump -m ping
10638  vim ~/.ssh/config
10639  sudo vim /etc/ansible/hosts
10640  ansible jump -m ping
10641  sudo vim /etc/ansible/hosts
10642  ansible-inventory --host 192.168.203.`
10643  ansible-inventory --host 192.168.203.1
10644  ansible-inventory --host 192.168.203.2
10645  sudo vim /etc/ansible/hosts
10646  ansible-inventory --host 192.168.203.2
10647  history
10648  ansible-inventory --host 192.168.203.44
10649  ansible-inventory --graph
10650  sudo vim /etc/ansible/hosts
10651  ansible-inventory --graph
10652  sudo vim /etc/ansible/hosts
10653  ansible-inventory --graph
10654  ansible-inventory --host 192.168.203.44
10655  ansible-inventory --host 192.168.201.22
10656  ansible-inventory --graph
10657  ansible-inventory --host 192.168.31.10
10658  ansible ec -m shell -a "cat /etc/os-release"
10659  ansible ec -m shell -a "service sshd restart"  -d
10660  ansible ec -m shell -a "service sshd restart"  -b
10661  ls
10662  date > file.txt
10663  cat file.txt
10664  ansible ec -m copy -a "src=file.txt dest=/tmp/"
10665  ssh root@192.168.203.10
10666  ssh-keygen -f "/home/spishchyk/.ssh/known_hosts" -R "192.168.203.10"
10667  ssh root@192.168.203.10
10668  ansible ec -m shell -a "ls -l /tmp/file.txt"
10669  sudo mkdir /etc/ansible/{host_vars,group_vars}
10670  sudo vim /etc/ansible/hosts
10671  sudo vim /etc/ansible/group_vars/all.yaml
10672  ansible 192.168.203.11, -m shell -a "ls -l /tmp/file.txt"
10673  ansible 192.168.31.11, -m shell -a "ls -l /tmp/file.txt"
10674  sudo vim /etc/ansible/group_vars/all.yaml
10675  ansible-inventory --host 192.168.203.1
10676  sudo vim /etc/ansible/hosts
10677  sudo vim /etc/ansible/host_vars/jump_sa.yaml
10678  ansible-inventory --host jump_sa
10679  ansible -m ping jump_sa
10680  sudo vim /etc/ansible/group_vars/all.yaml
10681  sudo mkdir /etc/ansible/group_vars/all
10682  sudo mv /etc/ansible/group_vars/all.yaml /etc/ansible/group_vars/all/
10683  sudo ls  /etc/ansible/group_vars/all
10684  sudo cat  /etc/ansible/group_vars/all/all.yaml
10685  ansible-vault create  /etc/ansible/group_vars/all/vault.yaml
10686  sudo ansible-vault create  /etc/ansible/group_vars/all/vault.yaml
10687  sudo cat  /etc/ansible/group_vars/all/vault.yaml
10688  sudo ansible-vault edit  /etc/ansible/group_vars/all/vault.yaml
10689  sudo cat  /etc/ansible/group_vars/all/vault.yaml
10690  ansible -m ping 192.168.203.20
10691  ls -l /etc/ansible/group_vars/all/vault.yaml
10692  chmod 755 /etc/ansible/group_vars/all/vault.yaml
10693  sudo chmod 755 /etc/ansible/group_vars/all/vault.yaml
10694  ls -l /etc/ansible/group_vars/all/vault.yaml
10695  sudo chmod 744 /etc/ansible/group_vars/all/vault.yaml
10696  ls -l /etc/ansible/group_vars/all/vault.yaml
10697  ansible -m ping 192.168.203.20
10698  ansible -m ping 192.168.203.20 --ask-vault-pass
10699  cp -r /etc/ansible/group_vars
10700  cp -r /etc/ansible/group_vars ./
10701  cp -r /etc/ansible/host_vars ./
10702  cp -r /etc/ansible/hosts ./
10703  ls
10704  chown -R spishchyk:spishchyk ./ 
10705  ls -l
10706  ansible-inventory -i hosts.yaml --graph
10707  ansible-inventory -i hosts.yaml --graph --ask-vault-pass
10708  ansible-inventory -i hosts.yaml --host worker_01 --ask-vault-pass
10709  ansible -i hosts.yaml -m shell -a "uname -rv"  worker_01 --ask-vault-pass
10710  ansible -i hosts.yaml -m shell -a "free"  worker_01 --ask-vault-pass
```