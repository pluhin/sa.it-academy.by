## 07. Ansible

```bash
197  ls -l
  198  vim web.yaml
  199  mkdir -p roles/webserver/{tasks,handlers,files,defaults,templates}
  200  ls -lR roles/
  201  vim roles/webserver/tasks/main.yaml
  202  vim roles/webserver/tasks/http_deb.yaml
  203  vim roles/webserver/tasks/http_rh.yaml
  204  vim roles/webserver/defaults/main.yaml
  205  vim roles/webserver/tasks/http_rh.yaml
  206  vim roles/webserver/defaults/main.yaml
  207  vim roles/webserver/tasks/http_rh.yaml
  208  vim roles/webserver/handlers/main.yaml
  209  vim roles/webserver/tasks/http_rh.yaml
  210  ansible-playbook -i inventory.yaml web.yaml
  211  ansible-playbook -i inventory.yaml web.yaml --ask-vault-pass
  212  vim roles/webserver/defaults/main.yaml
  213  ansible-playbook -i inventory.yaml web.yaml --ask-vault-pass
  214  vim roles/webserver/tasks/main.yaml
  215  vim roles/webserver/defaults/main.yaml
  216  vim roles/webserver/tasks/main.yaml
  217  vim roles/webserver/files/index.html
  218  vim roles/webserver/handlers/main.yaml
  219  vim roles/webserver/tasks/main.yaml
  220  ansible-playbook -i inventory.yaml web.yaml --ask-vault-pass
  221  Wednesday 10 August 2022  16:44:54 +0000 (0:00:04.251)       0:00:32.627 ******
  222  ===============================================================================
  223  webserver : Copy first page -------------------------------------------------------------------------------------------------------------- 6.93s
  224  Gathering Facts -------------------------------------------------------------------------------------------------------------------------- 4.52s
  225  webserver : HTTPD. Enable firewall port -------------------------------------------------------------------------------------------------- 4.43s
  226  webserver : restart apache ---------------------------------------------------------------------------------------------------------------
 4.25s
  227  webserver : Apache2. Install packages ---------------------------------------------------------------------------------------------------- 3.36s
  228  webserver : HTTPD. Install packages ------------------------------------------------------------------------------------------------------ 2.61s
  229  webserver : HTTPD. Enable and start service ---------------------------------------------------------------------------------------------- 2.14s
  230  webserver : HTTPD. Remove welcome file --------------------------------------------------------------------------------------------------- 2.11s
  231  webserver : Apache2. Enable and start service -------------------------------------------------------------------------------------------- 2.07s
  232  webserver : Include deploy for Debian systems -------------------------------------------------------------------------------------------- 0.10s
  233  clear
  234  ansible-playbook -i inventory.yaml web.yaml --ask-vault-pass
  235  vim roles/webserver/tasks/main.yaml
  236  ansible-playbook -i inventory.yaml web.yaml --ask-vault-pass
  237  vim roles/webserver/tasks/main.yaml
  238  ansible-playbook -i inventory.yaml web.yaml --ask-vault-pass
  239  vim roles/webserver/tasks/main.yaml
  240  vim roles/webserver/templates/"hosts.j2"
  241  vim roles/webserver/templates/hosts.j2
  242  vim inventory.yaml
  243  vim roles/webserver/templates/hosts.j2
  244  vim roles/webserver/tasks/main.yaml
  245  ansible-playbook -i inventory.yaml web.yaml --ask-vault-pass -t tests
  246  vim roles/webserver/tasks/main.yaml
  247  ansible-playbook -i inventory.yaml web.yaml --ask-vault-pass -t tests
  248  vim local.yaml
  249  ansible-playbook local.yaml -e slack_token="XXXXXXXXX"
  250  vim roles/webserver/templates/hosts.j2
  251  history

```