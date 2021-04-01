

## Install ansible lint and molecule

```bash
   4  pip3 install molecule
    5  pip3 install --upgrade pip setuptools
    6  pip3 install molecule
    7  apt search PyYAML
    8  pip3 install PyYAML
    9  pip3 install PyYAML --ignore-installed 
   10  pip3 install molecule
   11  history 
    pip3 install molecule-docker
   15  apt-get install     apt-transport-https     ca-certificates     curl     gnupg     lsb-release
   16  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   17  echo   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   18  apt-get update
   19  apt-get install docker-ce docker-ce-cli containerd.io
   20  usermod -aG docker user

```

```
128  cd ansible/
  129  ls
  130  vim web.yaml
  131  vim hosts.yaml 
  132  vim web.yaml
  133  mkdir -p roles/webserver/{tasks,handlers,defaults,files,templates}
  134  ls -l 
  135  ls -l roles/
  136  ls -l roles/webserver/
  137  vim roles/webserver/tasks/main.yaml
  138  vim roles/webserver/tasks/http_debian.yaml
  139  vim roles/webserver/tasks/http_RedHat.yaml
  140  vim roles/webserver/defaults/main.yaml
  141  vim roles/webserver/tasks/http_RedHat.yaml
  142  vim roles/webserver/defaults/main.yaml
  143  ansible web.yaml -i hosts.yaml -u root --ask-vault-pass
  144  ansible-playbook web.yaml -i hosts.yaml -u root --ask-vault-pass
  145  vim roles/webserver/defaults/main.yaml
  146  vim roles/webserver/tasks/main.yaml
  147  vim roles/webserver/files/index.html
  148  vim roles/webserver/tasks/main.yaml
  149  vim roles/webserver/defaults/main.yaml
  150  vim roles/webserver/handlers/main.yaml
  151  vim roles/webserver/tasks/main.yaml
  152  vim roles/webserver/handlers/main.yaml
  153  ansible-playbook web.yaml -i hosts.yaml -u root --ask-vault-pass
  154  vim roles/webserver/tasks/main.yaml
  155  ansible-playbook web.yaml -i hosts.yaml -u root --ask-vault-pass
  156  vim roles/webserver/tasks/main.yaml
  157  vim roles/webserver/templates/name: print out
  158  vim roles/webserver/templates/hosts.j2
  159  vim roles/webserver/defaults/main.yaml
  160  vim hosts.yaml 
  161  vim roles/webserver/defaults/main.yaml
  162  vim roles/webserver/tasks/main.yaml
  163  ansible-playbook web.yaml -i hosts.yaml -u root --ask-vault-pass
  164  vim roles/webserver/tasks/main.yaml
  165  vim roles/webserver/defaults/main.yaml
  166  vim roles/webserver/tasks/main.yaml
  167  ansible-playbook web.yaml -i hosts.yaml -u root --ask-vault-pass -t test
  168  ansible-playbook web.yaml -i hosts.yaml -u root --ask-vault-pass -t tests
  169  vim local.yaml
  170  ansible-vault edit group_vars/ec_all.yaml 
  171  mkdir group_vars/ec2/
  172  ansible-vault create group_vars/ec2/vault.yaml
  173  ansible-playbook -i hosts.yaml local.yaml --ask-vault-pass
  174  vim local.yaml
  175  ansible-playbook -i hosts.yaml local.yaml --ask-vault-pass
  176  vim local.yaml
  177  ansible-playbook -i hosts.yaml local.yaml --ask-vault-pass
  178  mkdir group_vars/all 
  179  mv group_vars/ec2/vault.yaml group_vars/all/
  180  ansible-playbook -i hosts.yaml local.yaml --ask-vault-pass
  181  vim local.yaml
  182  wq
  183  vim local.yaml
  184  ansible-playbook -i hosts.yaml local.yaml --ask-vault-pass
  185  vim local.yaml
  186  vim roles/webserver/defaults/main.yaml
  187  pip3 install ansible-lint
  188  ansible-lint
  189  find / -name "ansible-lint"
  190  pip3 install ansible-lint --upgrade --force-reinstall 
  191  ansible-lint 
  192  cd ansible/
  193  ansible-lint web.yaml 
  194  vim roles/webserver/tasks/main.yaml 
  195  ansible-lint web.yaml 
  196  vim roles/webserver/tasks/main.yaml 
  197  ansible-lint web.yaml 
  198  vim roles/webserver/tasks/main.yaml 
  199  ansible-lint web.yaml 
  200  cd ansible/roles/webserver/
  201  ls
  202  molecule init scenario
  203  ls -la
  204  vim molecule/default/molecule.yml 
  205  molecule test
  206  cd ansible/roles/webserver/
  207  molecule test
  208  docker run hello-world
  209  cd ansible/roles/webserver/
  210  molecule test
  211  molecule lint
  212  molecule destroy
  213  molecule test
  214  vim molecule/default/converge.yml 
  215  history 
```