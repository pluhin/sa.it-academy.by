## Ansible workshop

Browser (redmine-XX.sa) -> hosts (178.124.206.53 redmine-XX.sa) -> nginx -> 192.168.201.XX -> apapche2 (config) -> redmine-application

ansible -> ssh -> bastion -> 192.168.201.XX -> curl redmine-XX.sa -> 127.0.0.1  -- test by ansible

### History

```bash
254  mkdir 08.Ansible.WS
  255  cd 08.Ansible.WS/
  256  ls
  257  vim inventory.yaml
  258  ansible-inventory -i inventory.yaml --graph
  259  ansible-inventory -i inventory.yaml --host=redmine_18
  260  ansible -i inventory.yaml -m ping redmine_18
  261  ansible -i inventory.yaml -m ping redmine_18 --ask-pass
  262  cp ../06.Ansible/ansible.cfg ./
  263  ls
  264  vim redmine.yaml
  265  history | mdirr
  266  history | mkri
  267  history | grep mkdi
  268  mkdir -p roles/webserver/{tasks,handlers,files,defaults,templates}
  269  mkdir -p roles/redmine/{tasks,handlers,files,defaults,templates}
  270  rm -rf roles/webserver
  271  vim roles/redmine/tasks/main.yaml
  272  vim roles/redmine/defaults/main.yaml
  273  vim roles/redmine/tasks/main.yaml
  274  ansible-playbook -i inventory.yaml redmine.yaml
  275  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" redmine --ask-pass
  276  ansible-playbook -i inventory.yaml redmine.yaml
  277  vim roles/redmine/defaults/main.yaml
  278  vim roles/redmine/tasks/main.yaml
  279  vim roles/redmine/defaults/main.yaml
  280  ansible-playbook -i inventory.yaml redmine.yaml
  281  vim ansible.cfg
  282  ansible --version
  283  vim roles/redmine/tasks/main.yaml
  284  vim roles/redmine/defaults/main.yaml
  285  vim roles/redmine/tasks/main.yaml
  286  ansible-playbook -i inventory.yaml redmine.yaml
  287  vim roles/redmine/tasks/main.yaml
  288  vim roles/redmine/templates/database.yml.j2
  289  ansible-playbook -i inventory.yaml redmine.yaml
  290  vim inventory.yaml
  291  vim roles/redmine/tasks/main.yaml
  292  vim inventory.yaml
  293  ansible-playbook -i inventory.yaml redmine.yaml
  294  history | ssh
  295  history | grep ssh
  296  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" redmine --ask-pass
  297  ansible-playbook -i inventory.yaml redmine.yaml
  298  history | grep shell
  299  ansible-playbook -i inventory.yaml redmine.yaml
  300  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" redmine --ask-pass
  301  vim /home/vagrant/.ssh/known_hosts
  302  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" redmine --ask-pass
  303  ansible-playbook -i inventory.yaml redmine.yaml
  304  vim inventory.yaml
  305  vim ansible.cfg
  306  vim roles/redmine/tasks/main.yaml
  307  vim roles/redmine/defaults/main.yaml
  308  vim roles/redmine/tasks/main.yaml
  309  ansible-playbook -i inventory.yaml redmine.yaml
  310  vim roles/redmine/tasks/main.yaml
  311  vim roles/redmine/templates/redmine.site.conf.j2
  312  vim roles/redmine/handlers/main.yaml
  313  vim roles/redmine/tasks/main.yaml
  314  ansible-playbook -i inventory.yaml redmine.yaml
  315  vim roles/redmine/tasks/main.yaml
  316  ansible-playbook -i inventory.yaml redmine.yaml -t test
  317  vim roles/redmine/tasks/main.yaml
  318  mc
  319  history
```

### HOSTS

```
178.124.206.53 redmine-18.sa
```