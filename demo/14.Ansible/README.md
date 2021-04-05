
```
chown www-data:www-data repo
git clone --bare https://github.com/pluhin/sa.it-academy.by.git
```



```
 254  mkdir ansible_ws
  255  mc
  256  vim inv.yaml
  257  mv inv.yaml ansible_ws/
  258  cd ansible_ws/
  259  vim ../ansible/group_vars/ec_all.yaml 
  260  vim inv.yaml 
  261  ansible -i inv.yaml all_hosts -m ping --ask-pass
  262  cp ../ansible/ansible.cfg ./
  263  vim ansible.cfg 
  264  ansible -i inv.yaml all_hosts -m ping --ask-pass
  265  ls -l 
  266  cat ansible.cfg 
  267  vim inv.yaml 
  268  ssh-copy-id root@192.168.201.13
  269  cd ../
  270  cd  ansible/
  271  vim local.yaml 
  272  vim play.yaml 
  273  cd ../ansible_ws/
  274  ls -l
  275  vim inv.yaml 
  276  ssh-copy-id root@192.168.201.13 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  277  ansible -i inv.yaml all_hosts -m ping
  278  cat ansible.cfg 
  279  vim ansible.cfg 
  280  ansible -i inv.yaml all_hosts -m ping
  281  vim start.yaml
  282  vim inv.yaml 
  283  vim start.yaml
  284  mkdir -p roles/redmine/{tasks,files,templates,defaults,handlers}
  285  vim roles/redmine/tasks/main.yaml
  286  vim roles/redmine/defaults/main.yaml
  287  vim roles/redmine/tasks/main.yaml
  288  ansible-playbook -i inv.yaml start.yaml 
  289  vim roles/redmine/tasks/main.yaml
  290  ansible-playbook -i inv.yaml start.yaml 
  291  vim roles/redmine/tasks/main.yaml
  292  vim roles/redmine/defaults/main.yaml
  293  ansible-playbook -i inv.yaml start.yaml -e ap_db_pass=redmine
  294  ansible-playbook -i inv.yaml start.yaml -e app_db_pass=redmine
  295  vim roles/redmine/tasks/main.yaml
  296  ansible-playbook -i inv.yaml start.yaml -e app_db_pass=redmine
  297  vim roles/redmine/tasks/main.yaml
  298  ansible-playbook -i inv.yaml start.yaml -e app_db_pass=redmine
  299  vim roles/redmine/tasks/main.yaml
  300  ansible-playbook -i inv.yaml start.yaml -e app_db_pass=redmine
  301  vim roles/redmine/tasks/main.yaml
  302  vim roles/redmine/defaults/main.yaml
  303  ansible-playbook -i inv.yaml start.yaml -e app_db_pass=redmine
  304  vim roles/redmine/tasks/main.yaml
  305  vim roles/redmine/templates/database.yml.j2
  306  ansible-playbook -i inv.yaml start.yaml -e app_db_pass=redmine
  307  vim roles/redmine/tasks/main.yaml
  308  vim roles/redmine/templates/database.yml.j2
  309  vim roles/redmine/tasks/main.yaml
  310  vim roles/redmine/defaults/main.yaml
  311  ansible-playbook -i inv.yaml start.yaml -e app_db_pass=redmine
  312  vim roles/redmine/tasks/main.yaml
  313  vim roles/redmine/templates/- name: Configuration files for virtualhost
  314  vim roles/redmine/templates/redmine.site.conf.j2
  315  vim roles/redmine/defaults/main.yaml
  316  vim roles/redmine/tasks/main.yaml
  317  vim roles/redmine/templates/redmine.site.conf.j2
  318  vim roles/redmine/defaults/main.yaml
  319  vim roles/redmine/tasks/main.yaml
  320  vim roles/redmine/handlers/main.yaml
  321  vim roles/redmine/tasks/main.yaml
  322  ansible-playbook -i inv.yaml start.yaml -e app_db_pass=redmine
  323  vim roles/redmine/tasks/main.yaml
  324  ansible-playbook -i inv.yaml start.yaml -e app_db_pass=redmine
  325  ansible -i inv.yaml redmine -m shell -a "service apache2 restart"
  326  vim roles/redmine/templates/redmine.site.conf.j2
  327  vim roles/redmine/defaults/main.yaml
  328  vim roles/redmine/templates/database.yml.j2 
  329  vim start.yaml 
  330  history scp
  331  history | grep  scp
  332  scp -r ../../../ansible spishchyk@192.168.1.25:/home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/13.Ansible
  333  scp -r ../ansible_ws spishchyk@192.168.1.25:/home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/14.Ansible
  334  history 

```