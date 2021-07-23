

```bash
   92  sudo cp  -r /etc/ansible/ ./
   93  ls
   94  cd ansible/
   95  ls
   96  ls -l
   97  cd ../
   98  sudo chown vagrant:vagrant -R ansible
   99  ls -l
  100  ls -lR
  101  cd ansible/
  102  ls
  103  vim ansible.cfg 
  104  sed -e '/^[ \t]*#/d'
  105  sed -e '/^[ \t]*#/d' ansible.cfg 
  106  vim ansible.cfg 
  107  sed -i -e '/^[ \t]*#/d' ansible.cfg 
  108  vim ansible.cfg 
  109  sed "/^$/d" ansible.cfg 
  110  sed -i "/^$/d" ansible.cfg 
  111  vim ansible.cfg 
  112  ls -l 
  113  mv hosts inv.yaml
  114  vim inv.yaml 
  115  ansible-inventory -i inv.yaml --graph
  116  ansible-inventory -i inv.yaml --graph --ask-vault-pass
  117  ansible-inventory -i inv.yaml --host work_01 --ask-vault-pass
  118  ansible -i inv.yaml -m ping all --ask-vault-pass
  119  vim play.yaml
  120  vim inv.yaml 
  121  vim play.yaml
  122  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  123  vim play.yaml
  124  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  125  vim play.yaml
  126  vim ansible.cfg 
  127  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  128  vim ansible.cfg 
  129  vim play.yaml
  130  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  131  vim play.yaml
  132  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  133  vim play.yaml
  134  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  135  vim play.yaml
  136  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  137  vim inv.yaml 
  138  vim play.yaml
  139  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  140  vim play.yaml
  141  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  142  vim play.yaml
  143  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  144  vim play.yaml
  145  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass -t tag
  146  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass -t facts
  147  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass -t facts,tag
  148  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass --skip-tags facts
  149  vim play.yaml
  150  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  151  vim play.yaml
  152  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  153  vim play.yaml
  154  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  155  vim play.yaml
  156  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  157  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass -t never
  158  vim play.yaml
  159  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass -t facts
  160  vim user.yaml
  161  ansible-playbook -i inv.yaml user.yaml --ask-vault-pass
  162  ansible-playbook -i inv.yaml user.yaml -e group=work_hosts -e user_to_add=plu --ask-vault-pass
  163  vim user.yaml
  164  ansible-playbook -i inv.yaml user.yaml -e group=work_hosts -e user_to_add=plu --ask-vault-pass
  165  vim play.yaml
  166  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  167  vim play.yaml
  168  ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
  169  cd ./
  170  history | grep scp
  171  scp -r /tmp/ansible spishchyk@192.168.1.25://home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/06.Ansible
  172  scp -r ../ansible spishchyk@192.168.1.25://home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/06.Ansible
  173  history 
```
