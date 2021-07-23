```bash

  281  cd ansible/
  282  ls
  283  vim inv.yaml 
  284  ansible-inventory -i inv.yaml --host work_shop_01
  285  ansible -i inv.yaml work_shop_01 -m ping
  286  vim inv.yaml 
  287  vim redmine.yaml
  288  vim inv.yaml 
  289  vim redmine.yaml
  290  mkdir roles/redmine/{defaults,handlers,tasks,templates}
  291  mkdir -p roles/redmine/{defaults,handlers,tasks,templates}
  292  vim roles/redmine/tasks/main.yaml
  293  vim roles/redmine/defaults/main.yaml
  294  ansible-playbook -i inv.yaml web.yaml 
  295  ansible-playbook -i inv.yaml redmine.yaml 
  296  ssh root@192.168.201.16
  297  ssh root@192.168.201.15
  298  history | grep ssh
  299  vim group_vars/ec_all.yaml 
  300  ssh root@192.168.201.15 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  301  ssh root@192.168.201.16 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  302  ssh root@192.168.201.1 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  303  vim group_vars/ec_all.yaml 
  304  vim inv.yaml 
  305  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" ec_all --ask-pass
  306  vim tests.yaml
  307  vim redmine.yaml 
  308  vim tests.yaml
  309  ansible-playbook -i inv.yaml redmine.yaml 
  310  vim roles/redmine/tasks/main.yaml 
  311  vim roles/redmine/defaults/main.yaml 
  312  vim roles/redmine/tasks/main.yaml 
  313  ansible-playbook -i inv.yaml redmine.yaml 
  314  vim roles/redmine/tasks/main.yaml 
  315* 
  316  vim tests.yaml 
  317  ansible-playbook -i inv.yaml tests.yaml 
  318  vim tests.yaml 
  319  ansible-playbook -i inv.yaml tests.yaml 
  320  vim tests.yaml 
  321  ansible-playbook -i inv.yaml tests.yaml 
  322  vim tests.yaml 
  323  ansible-playbook -i inv.yaml tests.yaml 
  324  vim tests.yaml 
  325  vim roles/redmine/tasks/main.yaml 
  326  vim roles/redmine/defaults/main.yaml 
  327  vim roles/redmine/tasks/main.yaml 
  328  vim roles/redmine/templates/database.yml.j2
  329  ansible-playbook -i inv.yaml redmine.yaml 
  330  vim roles/redmine/tasks/main.yaml 
  331  vim roles/redmine/defaults/main.yaml 
  332  vim roles/redmine/tasks/main.yaml 
  333  vim roles/redmine/defaults/main.yaml 
  334  ansible-playbook -i inv.yaml redmine.yaml 
  335  vim roles/redmine/tasks/main.yaml 
  336  vim roles/redmine/defaults/main.yaml 
  337  ansible-playbook -i inv.yaml redmine.yaml 
  338  vim roles/redmine/defaults/main.yaml 
  339  vim roles/redmine/templates/redmine.site.conf.j2
  340  vim roles/redmine/tasks/main.yaml 
  341  vim roles/redmine/handlers/main.yaml
  342  vim roles/redmine/tasks/main.yaml 
  343  ansible-playbook -i inv.yaml redmine.yaml 
  344  vim roles/redmine/tasks/main.yaml 
  345  ansible-playbook -i inv.yaml redmine.yaml 
  346  vim roles/redmine/tasks/main.yaml 
  347  ansible-playbook -i inv.yaml redmine.yaml -t never
  348  ansible-playbook -i inv.yaml redmine.yaml 
  349  vim roles/redmine/tasks/main.yaml 
  350  vim inv.yaml 
  351  vim tests.yaml 
  352  history | grep test
  353  ansible-playbook -i inv.yaml tests.yaml 
  354  ansible-playbook -i inv.yaml tests.yaml  -t test::url
  355  vim tests.yaml 
  356  ansible-playbook -i inv.yaml tests.yaml  -t test::url
  357  vim tests.yaml 
  358  ansible-playbook -i inv.yaml tests.yaml  -t test::url
  359  vim tests.yaml 
  360  ansible-playbook -i inv.yaml tests.yaml  -t test::url
  361  vim tests.yaml 
  362  ansible-playbook -i inv.yaml tests.yaml  -t test::url
  363  vim tests.yaml 
  364  ansible-playbook -i inv.yaml tests.yaml  -t test::url
  365  vim tests.yaml 
  366  vim local.yaml 
  367  vim tests.yaml 
  368  ansible-playbook -i inv.yaml tests.yaml  -t test::url
  369  vim tests.yaml 
  370  ansible-playbook -i inv.yaml tests.yaml  -t test::url
  371  vim tests.yaml 
  372  ansible-playbook -i inv.yaml tests.yaml  -t test::url
  373  vim tests.yaml 
  374  vim roles/redmine/tasks/main.yaml 
  375  history | grep scp
  376  vim local.yaml 
  377  history
```
