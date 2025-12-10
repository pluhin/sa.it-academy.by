```  394  cat hosts.ini 
  395  cd ..
  396  ls
  397  cd playbooks/
  398  ls
  399  nano manage_users.yml 
  400  ls
  401  cat manage_users.yml 
  402  cd ..
  403  ls
  404  cd inventory/
  405  ls
  406  cat hosts.ini 
  407  mv hosts.ini inventory.ini
  408  nano inventory.ini 
  409  cd ..
  410  ls
  411  cd playbooks/
  412  ls
  413  nano manage_users.yml 
  414  ansible-playbook -i inventory.ini playbook.yml
  415  cd ..
  416  cd task_3
  417  ansible-playbook -i inventory.ini playbook.yml
  418  ansible-playbook -i inventory/inventory.ini playbooks/playbook.yml
  419  ansible-playbook -i inventory/inventory.ini playbooks/manage_users.yml
  420  ansible-playbook -i inventory/inventory.ini playbooks/manage_users.yml --ask-become-pass 
  421* ansible-playbook -i inventory.ini playbook.yml   -e "user_name=john group_name=vasya user_pass=password123"
  422  ansible-playbook -i inventory/inventory.ini playbooks/manage_users.yml --ask-become-pass -e "user_name=john group_name=vasy user_pass=pass123
"
  423  ansible remote -i inventory/inventory.ini  -b -a "gatent group vasya"
  424  ansible remote -i inventory/inventory.ini  -b -a "gatent group vasya" --ask-become-pass 
  425  ansible remote -i inventory/inventory.ini  -b -a "getent group vasya" --ask-become-pass 
  426  ansible remote -i inventory/inventory.ini  -b -a "getent group vasy" --ask-become-pass 
  427  ansible remote -i inventory/inventory.ini  -b -a "id john" --ask-become-pass 
  428  ansible remote -i inventory/inventory.ini  -b -a "getent passwd john" --ask-become-pass 
  432  history | tail -n 40 >> README.md
```
