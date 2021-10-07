```bash
   98  cd ../ansible.ws/
   99  ls
  100  vim group_vars/all_workers.yaml
  101  vim inv.yaml
  102  ansible -m ping redmine --ask-pass
  103  ansible -m ping redmine --ask-pass -i inv.yaml
  104  vim inv.yaml
  105  vim group_vars/all_workers.yaml
  106  vim inv.yaml
  107  ansible -m ping redmine --ask-pass -i inv.yaml
  108  vim inv.yaml
  109  vim group_vars/all_workers.yaml
  110  history
  111  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" redmine --ask-pass
  112  ansible -m ping redmine -i inv.yaml
  113  vim group_vars/all_workers.yaml
  114  ssh root@192.168.201.1 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  115  ls
  116  vim redmine.yaml
  117  mkdir -p roles/redmine/{defaults,handlers,tasks,templates}
  118  vim roles/redmine/tasks/main.yaml
  119  vim roles/redmine/defaults/main.yaml
  120  ansible-playbook redmine.yaml -i inv.yaml
  121  vim roles/redmine/tasks/main.yaml
  122  vim roles/redmine/defaults/main.yaml
  123  vim roles/redmine/tasks/main.yaml
  124  ansible-playbook redmine.yaml -i inv.yaml
  125  vim roles/redmine/tasks/main.yaml
  126  vim roles/redmine/defaults/main.yaml
  127  vim roles/redmine/tasks/main.yaml
  128  ansible-playbook redmine.yaml -i inv.yaml
  129  vim roles/redmine/tasks/main.yaml
  130  vim roles/redmine/templates/database.yml.j2
  131  vim roles/redmine/tasks/main.yaml
  132  ansible-playbook redmine.yaml -i inv.yaml
  133  vim roles/redmine/tasks/main.yaml
  134  vim roles/redmine/defaults/main.yaml
  135  vim roles/redmine/tasks/main.yaml
  136  ansible-playbook redmine.yaml -i inv.yaml
  137  vim roles/redmine/tasks/main.yaml
  138  rm roles/redmine/tasks/.main.yaml.swp
  139  vim roles/redmine/tasks/main.yaml
  140  vim roles/redmine/templates/redmine.site.conf.j2
  141  vim roles/redmine/defaults/main.yaml
  142  vim roles/redmine/handlers/main.yaml
  143  ansible-playbook redmine.yaml -i inv.yaml
  144  vim roles/redmine/tasks/main.yaml
  145  ansible-playbook redmine.yaml -i inv.yaml -t test
  146  cd ../
  147  cp -r ansible.ws /vagrant/
  148  history
  ```s