# Ansible workshop

```bash
132  cd ansible/
  133  ls
  134  vim inv.yaml
  135  vim group_vars/all_workers/vars.yaml
  136  ansible -i inv.yaml redmine -m ping --ask-pass
  137  ansible -i inv.yaml redmine -m ping --ask-pass --ask-vault-pas
  138  ansible -i inv.yaml redmine -m ping --ask-pass --ask-vault-pass
  139  vim inv.yaml
  140  cat inv.yaml
  141  vim group_vars/all_workers/vault.yaml
  142  ansible-vault edit group_vars/all_workers/vault.yaml
  143  rm group_vars/all_workers/vault.yaml
  144  history | auth
  145  vim ansible.cfg
  146  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" redmine --ask-pass
  147  ansible -i inv.yaml redmine -m ping
  148  cat inv.yaml
  149  ls
  150  vim redmine.yaml
  151  history | grep mkdir
  152  mkdir -p roles/webserver/{defaults,filees,handlers,tasks,templates}
  153  mkdir -p roles/redmine/{defaults,filees,handlers,tasks,templates}
  154  mv roles/redmine/filees/ roles/redmine/files/
  155  vim roles/redmine/tasks/main.yaml
  156  clear
  157  cd ansible/
  158  vim roles/redmine/tasks/main.yaml
  159  rm roles/redmine/tasks/.main.yaml.swp
  160  vim roles/redmine/tasks/main.yaml
  161  vim roles/redmine/defaults/main.yaml
  162  vim roles/redmine/tasks/main.yaml
  163  ansible-playbook -i inv.yaml redmine.yaml
  164  vim inv.yaml
  165  vim roles/redmine/tasks/main.yaml
  166  vim roles/redmine/defaults/main.yaml
  167  ansible-playbook -i inv.yaml redmine.yaml
  168  vim roles/redmine/defaults/main.yaml
  169  ansible-playbook -i inv.yaml redmine.yaml
  170  vim roles/redmine/defaults/main.yaml
  171  vim roles/redmine/tasks/main.yaml
  172  ansible-playbook -i inv.yaml redmine.yaml
  173  vim roles/redmine/tasks/main.yaml
  174  ansible-playbook -i inv.yaml redmine.yaml
  175  vim roles/redmine/tasks/main.yaml
  176  ansible-playbook -i inv.yaml redmine.yaml
  177  vim roles/redmine/defaults/main.yaml
  178  vim roles/redmine/tasks/main.yaml
  179  ansible-playbook -i inv.yaml redmine.yaml
  180  vim ansible.cfg
  181  ansible --ansible
  182  ansible --version
  183  vim roles/redmine/tasks/main.yaml
  184  ansible-playbook -i inv.yaml redmine.yaml
  185  vim roles/redmine/tasks/main.yaml
  186  vim roles/redmine/defaults/main.yaml
  187  ansible-playbook -i inv.yaml redmine.yaml
  188  vim roles/redmine/tasks/main.yaml
  189  vim roles/redmine/templates/database.yml.j2
  190  cd ansible/
  191  vim roles/redmine/templates/database.yml.j2
  192  vim roles/redmine/tasks/main.yaml
  193  ansible-playbook -i inv.yaml redmine.yaml
  194  vim roles/redmine/tasks/main.yaml
  195  vim roles/redmine/defaults/main.yaml
  196  vim roles/redmine/tasks/main.yaml
  197  ansible-playbook -i inv.yaml redmine.yaml
  198  vim roles/redmine/tasks/main.yaml
  199  vim roles/redmine/handlers/main.yaml
  200  vim roles/redmine/tasks/main.yaml
  201  vim roles/redmine/templates/redmine.site.conf.j2
  202  vim roles/redmine/defaults/main.yaml
  203  ansible-playbook -i inv.yaml redmine.yaml
  204  vim roles/redmine/tasks/main.yaml
  205  ansible-playbook -i inv.yaml redmine.yaml -t test
  206  vim redmine.yaml
  207  cp -r ../ansible/ /vagrant/
  208  history
```