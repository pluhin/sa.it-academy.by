# Ansible

```bash
   81  cd ansible/
   82  ls
   83  vim inv.yaml
   84  history
   85  vim web.yaml
   86  mkdir -p roles/webserver/{defaults,filees,handlers,tasks,templates}
   87  ls -l roles/webserver/
   88  mv roles/webserver/filees/ roles/webserver/files
   89  vim roles/webserver/tasks/main.yaml
   90  vim roles/webserver/tasks/http_deb.yaml
   91  vim roles/webserver/tasks/main.yaml
   92  vim roles/webserver/tasks/http_rh.yaml
   93  vim roles/webserver/defaults/main.yaml
   94  ansible-playbook -i inv.yaml web.yaml
   95  ansible-playbook -i inv.yaml web.yaml  --ask-vault-pass
   96  vim ansible.cfg
   97  ansible-playbook -i inv.yaml web.yaml  --ask-vault-pass
   98  vim web.yaml
   99  ansible-playbook -i inv.yaml web.yaml  --ask-vault-pass
  100  vim web.yaml
  101  ansible-playbook -i inv.yaml web.yaml  --ask-vault-pass
  102  vim web.yaml
  103  vim roles/webserver/tasks/main.yaml
  104  vim roles/webserver/files/index.html
  105  vim roles/webserver/defaults/main.yaml
  106  vim roles/webserver/handlers/main.yaml
  107  vim roles/webserver/tasks/main.yaml
  108  vim roles/webserver/handlers/main.yaml
  109  ansible-playbook -i inv.yaml web.yaml  --ask-vault-pass
  110  vim roles/webserver/tasks/main.yaml
  111  ansible-playbook -i inv.yaml web.yaml  --ask-vault-pass
  112  vim roles/webserver/tasks/main.yaml
  113  ansible-playbook -i inv.yaml web.yaml  --ask-vault-pass -t tests
  114  vim roles/webserver/tasks/main.yaml
  115  vim roles/webserver/defaults/main.yaml
  116  vim roles/webserver/tasks/main.yaml
  117  vim roles/webserver/templates/hosts.j2
  118  ansible-playbook -i inv.yaml web.yaml  --ask-vault-pass
  119  vim roles/webserver/tasks/main.yaml
  120  vim roles/webserver/defaults/main.yaml
  121  vim roles/webserver/tasks/main.yaml
  122  ansible-playbook -i inv.yaml web.yaml  --ask-vault-pass -t tests
  123  history
  124  vim local.yaml
  125  ansible-playbook local.yaml
  126  ansible-playbook local.yaml -e slack_token=XXXXXXXXXXXX
  127  vim local.yaml
  128  ansible-playbook local.yaml -e slack_token=XXXXXXXXXXXX
  129  history
```