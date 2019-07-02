```bash
642  mkdir 07.Ansible
  643  cd 07
  644  cd 07.Ansible
  645  mkdir {inventory,roles,group_vars}
  646  ls
  647  vim inventory/main.yaml
  648  mkdir group_vars/all
  649  ansible-vault create group_vars/all/vault.yaml
  650  ansible all -m ping -i inventory/main.yaml -u user --ask-pass
  651  ansible all -m ping -i inventory/main.yaml --ask-vault-pass
  652  vim inventory/main.yaml
  653  ssh 192.168.254.225
  654  ssh user@192.168.254.225
  655  vim /etc/ssh/ssh_config
  656  ssh-copy-id jump_sa@178
  657  ssh --varsion
  658  ssh --version
  659  ssh -v
  660  ssh
  661  ls -l
  662  ls group_vars/all/vault.yaml
  663  vim inventory/main.yaml
  664  ansible node13 -m ping
  665  ansible node013 -m ping --ask-vault-pass
  666  ansible node013 -m ping --ask-vault-pass -i inventory/main.yaml
  667  ansible node13 -m ping --ask-vault-pass -i inventory/main.yaml
  668  vim play.yaml
  669  ssh user@192.168.254.235
  670  mkdir -p roles/redmine/{defaults,files,handlers,tasks,templates}
  671  ls -l roles
  672  ls -l roles/redmine
  673  vim roles/redmine/tasks/main.yaml
  674  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass
  675  vim play.yaml
  676  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass
  677  sudo vim /etc/ansible/ansible.cfg
  678  git add --all
  679  git commit -m "Redmine01"
  680  git push
  681  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass
  682  history | ping
  683  history | grep ping
  684  vim roles/redmine/tasks/main.yaml
  685  vim roles/redmine/defaults/main.yaml
  686  ansible-vault edit group_vars/all/vault.yaml
  687  vim roles/redmine/defaults/main.yaml
  688  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass
  689  vim roles/redmine/tasks/main.yaml
  690  vim roles/redmine/templates/.my.cnf
  691  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass --skip-tags=done
  692* sudo yum search sshpass
  693  vim roles/redmine/tasks/main.yaml
  694  vim roles/redmine/defaults/main.yaml
  695  vim roles/redmine/tasks/main.yaml
  696  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass --skip-tags=done
  697  git add --all
  698  git commit -m "Redmine02"
  699  git push
  700  vim roles/redmine/defaults/main.yaml
  701  ansible-vault edit group_vars/all/vault.yaml
  702  vim roles/redmine/defaults/main.yaml
  703  vim roles/redmine/tasks/main.yaml
  704* sshpass -h
  705* sshpass user@192.168.254.235 -p QwertY_13
  706* ssh-copy-id -i user@192.168.254.235
  707* ssh user@192.168.254.235
  708* history
  709* ssh user@192.168.254.235
  710  vim roles/redmine/tasks/main.yaml
  711  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass --skip-tags=done
  712  vim roles/redmine/tasks/main.yaml
  713  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass --skip-tags=done
  714  vim roles/redmine/tasks/main.yaml
  715  vim roles/redmine/templates/database.yml.j2
  716  vim roles/redmine/tasks/main.yaml
  717  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass --skip-tags=done
  718  vim roles/redmine/tasks/main.yaml
  719  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass --skip-tags=done
  720* ssh user@192.168.254.235
  721* history
  722* ssh user@192.168.254.235
  723  vim roles/redmine/tasks/main.yaml
  724  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass --skip-tags=done
  725  git add --all
  726  git commit -m "Redmine03"
  727  git push
  728  vim roles/redmine/tasks/main.yaml
  729  vim roles/redmine/templates/redmine.site.conf.j2
  730  vim roles/redmine/tasks/main.yaml
  731  vim roles/redmine/templates/redmine.site.conf.j2
  732  vim roles/redmine/defaults/main.yaml
  733  vim roles/redmine/tasks/main.yaml
  734  vim roles/redmine/handlers/main.yaml
  735  vim roles/redmine/tasks/main.yaml
  736  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass --skip-tags=done
  737  vim roles/redmine/tasks/main.yaml
  738  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass -t test
  739* ssh user@192.168.254.225
  740  vim roles/redmine/tasks/main.yaml
  741  vim inventory/main.yaml
  742  ansible-playbook play.yaml -i inventory/main.yaml -l node03 --ask-vault-pass -t done_01
  743* ssh user@192.168.254.2235
  744* ssh user@192.168.254.235
  745  git add --all
  746  git commit -m "Redmine_final"
  747  git push
  748  ansible-playbook play.yaml -i inventory/main.yaml -l node13 --ask-vault-pass```
