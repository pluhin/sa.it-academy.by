```  186  ls
  187  mv README.md task_1/
  188  ls
  189  mkdir task_2
  190  cd task_
  191  cd task_2
  192  ssh-keygen -C "ansible"
  193  cd /home/lancaster/.ssh/
  194  ls
  195  nano id_ed25519
  196* 
  197  ssh lancaster@192.168.17.131
  198  cd /
  199  ls
  200  cd ~
  201  ls
  202  cd homework_4
  203  ls
  204  cd task_2
  205  ls
  206  mkdir inventory playbooks
  207  ls
  208  cd inventory/
  209  ls
  210  nano hosts.ini
  211  cd ..
  212  ls
  213  cat for_ansible
  214  cd inventory/
  215  ls
  216  nano hosts.ini 
  217  ansible -i inventory/hosts.ini remote -m ping
  218  cd ..
  219  ansible -i inventory/hosts.ini remote -m ping
  220  ssh lancaster@192.168.17.131
  221  cd inventory/
  222  cat hosts
  223  cat hosts.ini 
  224  cd ~/homework_4/task_2
  225  ls
  226  cat hosts.ini 
  227  ls
  228  cd inventory/
  229  ls
  230  nano hosts.ini 
  231  ansible -i inventory/hosts.ini remote -m ping
  232  ansible -i hosts.ini remote -m ping
  233  cd ..
  234  ls
  235  cd playbooks/
  236  nano install_package.yml
  237  cd ..
  238  ls
  239  ansible-playbook -i inventory/hosts.ini playbooks/install_package.yml 
  240  ansible-playbook -i inventory/hosts.ini playbooks/install_package.yml  --ask-become-pass
  241  history 
 
```
