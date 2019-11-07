```bash 
 624  git clone git@github.com:pluhin/sa.it-academy.by.git
  625  cd  sa.it-academy.by/
  626  ls
  627  git checkout m-sa2-10-19
  628  git branch
  629  cd demo/
  630  ls
  631  mkdir 06.Ansible
  632  cd 06.Ansible/
  633  mkdir infra
  634  cp ~/sa/infra/Vagrantfile ./
  635  ls
  636  mv Vagrantfile infra/
  637  cd infra/
  638  vim Vagrantfile
  639  vagrant up
  640  ping 192.168.1.203
  641  vim inv.yaml
  642  ansible -m ping -i inv.yaml --ask-pass
  643  ansible all -m ping -i inv.yaml --ask-pass
  644  vim Vagrantfile
  645  vim ~/.ssh/known_hosts
  646  vim Vagrantfile
  647  ssh 192.168.1.201
  648  ssh 192.168.1.202
  649  ssh 192.168.1.203
  650  sudo vim /etc/ansible/ansible.cfg
  651  ansible all -m ping -i inv.yaml --ask-pass
  652  ansible-inventory -i inv.yaml --graph
  653  ansible-inventory -i inv.yaml --host ub_01
  654  vim inv.yaml
  655  ansible-inventory -i inv.yaml --host ub_01
  656  ansible-inventory -i inv.yaml --host cent_01
  657  ansible-inventory -i inv.yaml --host cent_02
  658  ansible all -m ping -i inv.yaml --ask-pass
  659  clear
  660  vim inv.yaml
  661  ansible-inventory -i inv.yaml --graph
  662  ls
  663  vim first.yaml
  664  ansible-playbook first.yaml -i inv.yaml --ask-pass
  665  vim first.yaml
  666  ansible-playbook first.yaml -i inv.yaml --ask-pass
  667  vim first.yaml
  668  ansible-playbook first.yaml -i inv.yaml --ask-pass
  669  vim first.yaml
  670* ansible-playbook first.yaml -i inv.yaml --ask-pass --tags
  671  ansible-playbook first.yaml -i inv.yaml --ask-pass --skip-tags inv::check
  672  vim first.yaml
  673  ansible-playbook first.yaml -i inv.yaml --ask-pass
  674  vim first.yaml
  675  ansible-playbook first.yaml -i inv.yaml --ask-pass
  676  vim first.yaml
  677  ansible-playbook first.yaml -i inv.yaml --ask-pass
  678  vim first.yaml
  679  ansible-playbook first.yaml -i inv.yaml --ask-pass
  680  vim first.yaml
  681  ansible-playbook first.yaml -i inv.yaml --ask-pass
  682  vim first.yaml
  683  ansible-playbook first.yaml -i inv.yaml --ask-pass -t invnetory
  684  ansible-playbook first.yaml -i inv.yaml --ask-pass -t inventory
  685  vim first.yaml
  686  ansible-playbook first.yaml -i inv.yaml --ask-pass -t inventory
  687  vim first.yaml
  688  ansible-playbook first.yaml -i inv.yaml --ask-pass -t inventory
  689  ansible-playbook first.yaml -i inv.yaml --ask-pass
  690  vim first.yaml
  691  ansible-playbook first.yaml -i inv.yaml --ask-pass -t facts
  692  vim inv.yaml
  693  vim first.yaml
  694  ansible-playbook first.yaml -i inv.yaml --ask-pass -t facts -e "group=all"
  695  ssh vagrnat@192.168.1.201
  696  ssh vagrant@192.168.1.201
  697  vim Vagrantfile
  698  vagrant global-status
  699  vagrant halt
  700  vagrant destroy -f
  701  vim Vagrantfile
  702  vagrant up
  703  vim Vagrantfile
  704  vagrant halt && vagrant destroy -f
  705  vim Vagrantfile
  706  vagrant up
  707  vagrant halt && vagrant destroy -f
  708  vim Vagrantfile
  709  vagrant up
  710  ansible-playbook first.yaml -i inv.yaml --ask-pass -t facts -e "group=all"
  711  vim ~/.ssh/known_hosts
  712  ansible-playbook first.yaml -i inv.yaml --ask-pass -t facts -e "group=all"
  713  vim Vagrantfile
  714  ssh vagrant@192.168.1.201
  715  vagrant halt && vagrant destroy -f
  716  vim Vagrantfile
  717  cat ~/.ssh/id_rsa.pub > authorized_keys
  718  vagrant up
  719  vim Vagrantfile
  720  vagrant up
  721  ansible-playbook first.yaml -i inv.yaml -t facts -e "group=all"
  722  vagrant up
  723  vagrant halt && vagrant destroy -f
  724  echo authorized_keys
  725  cat authorized_keys
  726  echo > authorized_keys
  727  cat authorized_keys
  728  history
```
