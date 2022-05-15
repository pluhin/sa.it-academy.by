# 07. Ansible

```bash
  165  clear
  166  ls
  167  vim inventory.yaml
  168  hvim first.yaml
  169  vim first.yaml
  170  ansible-playbook -i inventory.yaml first.yaml -l "host*" --ask-pass --ask-vault-pass
  171  vim first.yaml
  172  ansible-playbook -i inventory.yaml first.yaml -l "host*" --ask-pass --ask-vault-pass -t never
  173  vim web.yaml
  174  ls
  175  mkdir -p roles/webserver/{tasks,handlers,files,defaults,templates}
  176  ls -l roles/webserver/
  177  vim roles/webserver/tasks/main.yaml
  178  vim roles/webserver/tasks/http_deb.yaml
  179  vim roles/webserver/tasks/http_rh.yaml
  180  vim roles/webserver/defaults/main.yaml
  181  ansible-playbook -i inventory.yaml web.yaml -l "all_workers" --ask-vault-pass
  182  vim roles/webserver/tasks/main.yaml
  183  vim roles/webserver/defaults/main.yaml
  184  vim roles/webserver/handlers/main.yaml
  185  vim roles/webserver/files/index.html
  186  ansible-playbook -i inventory.yaml web.yaml -l "all_workers" --ask-vault-pass
  187  vim roles/webserver/tasks/main.yaml
  188  vim roles/webserver/tasks/http_rh.yaml
  189  vim roles/webserver/handlers/main.yaml
  190  ansible-playbook -i inventory.yaml web.yaml -l "all_workers" --ask-vault-pass
  191  vim roles/webserver/tasks/main.yaml
  192  ansible-playbook -i inventory.yaml web.yaml -l "all_workers" --ask-vault-pass
  193  vim roles/webserver/tasks/main.yaml
  194  vim roles/webserver/templates/hosts.j2
  195  vim inventory.yaml
  196  ansible-playbook -i inventory.yaml web.yaml -l "all_workers" --ask-vault-pass
  197  vim inventory.yaml
  198  history | grep cat
  199  ansible -i inventory.yaml -m shell -a "cat /etc/hosts" all_workers --ask-vault-pass
  200  vim roles/webserver/tasks/main.yaml
  201  ansible -i inventory.yaml -m shell -a "cat /etc/hosts" all_workers --ask-vault-pass
  202  ansible-playbook -i inventory.yaml web.yaml -l "all_workers" --ask-vault-pass
  203  vim roles/webserver/tasks/main.yaml
  204  vim local.yaml
  205  ansible-playbook local.yaml
  206  vim local.yaml
  207  ansible-playbook local.yaml
  208  vim local.yaml
  209  ansible-playbook local.yaml -e slack_token="XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  210  mc
  211  history
```

## Include tasks in loop

```yaml
- name: Create VM
  include_tasks: "10.create_vm.yaml"
  loop: "{{ range(start_counter|int, finish_counter|int + 1 )|list }}"
  tags:
    - create
    - set_ip
```

