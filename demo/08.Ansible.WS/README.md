# Ansible WS

```bash
217  mkdir ansible_ws
  218  cd ansible
  219  mkdir roles
  220  cd ../ansible_ws/
  221  mkdir roles
  222  ls
  223  vim inventory.yaml
  224  vim ../ansible/group_vars/all_workers/vars.yaml
  225  vim inventory.yaml
  226  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" redmine --ask-pass
  227  vim inventory.yaml
  228  ansible-inventory -i inventory.yaml --grapg
  229  ansible-inventory -i inventory.yaml --graph
  230  history
  231  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" redmine --ask-pass
  232  vim ../ansible/ansible.cfg
  233  cp ../ansible/ansible.cfg ./
  234  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" redmine --ask-pass
  235  vim redmine.yaml
  236  mkdir roles/redmine/{files,templates,tasks,defaults,handlers}
  237  mkdir roles/redmine/{files,templates,tasks,defaults,handlers} -p
  238  ls -l roles/redmine/
  239  vim roles/redmine/tasks/main.yaml
  240  vim roles/redmine/defaults/main.yaml
  241  vim roles/redmine/tasks/main.yaml
  242  ansible-playbook -i inventory.yaml redmine.yaml
  243  vim roles/redmine/tasks/main.yaml
  244  vim roles/redmine/defaults/main.yaml
  245  vim roles/redmine/tasks/main.yaml
  246  ansible-playbook -i inventory.yaml redmine.yaml
  247  vim roles/redmine/tasks/main.yaml
  248  vim roles/redmine/defaults/main.yaml
  249  ansible-playbook -i inventory.yaml redmine.yaml
  250  vim roles/redmine/defaults/main.yaml
  251  vim roles/redmine/tasks/main.yaml
  252  vim roles/redmine/templates/database.yml.j2
  253  vim roles/redmine/tasks/main.yaml
  254  ansible-playbook -i inventory.yaml redmine.yaml
  255  vim roles/redmine/tasks/main.yaml
  256  vim roles/redmine/defaults/main.yaml
  257  ansible-playbook -i inventory.yaml redmine.yaml
  258  vim roles/redmine/tasks/main.yaml
  259  vim roles/redmine/templates/redmine.site.conf.j2
  260  vim roles/redmine/defaults/main.yaml
  261  vim roles/redmine/handlers/main.yaml
  262  vim roles/redmine/tasks/main.yaml
  263  ansible-playbook -i inventory.yaml redmine.yaml
  264  vim roles/redmine/tasks/main.yaml
  265  ansible-playbook -i inventory.yaml redmine.yaml
  266  vim roles/redmine/defaults/main.yaml
  267  mc
  268  history
```



```
browser (redmine-21.sa) -> hosts (178.124.206.53 redmine-21.sa) ->

-> 178.124.206.53 (nginx)

server {
  listen 80;
  listen [::]:80;

  server_name "~^redmine-21\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.201.21;
  }
}

-> 192.168.201.21 -> apache2 -> config -> redmine


```