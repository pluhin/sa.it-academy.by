```bash
547  cd sa.it-academy.by
  548  git pull
  549  cp /home/plu/projects/m-sa2-08-19/03.Ansible demo -r
  550  ls demo
  551  git add demo/03.Ansible
  552  git commit -m "Ansible02"
  553  history
  554  vim demo/03.Ansible/history.md
  555  cd demo/
  556  mv 03.Ansible 05.Ansible
  557  git add 05.Ansible/
  558  git add --all
  559  git commit -m "Add ansible history for Ansible Run"
  560  git push
  561  cd /tmp/sa.it-academy.by
  562  git pull
  563  cd demo/
  564  mkdir 06.Ansible
  565  cd 06.Ansible
  566  vim localplay.yaml
  567  ansible-playbook localplay.yaml
  568  vim localplay.yaml
  569  ansible-playbook localplay.yaml
  570  vim localplay.yaml
  571  ansible-playbook localplay.yaml
  572  vim localplay.yaml
  573  ansible-playbook localplay.yaml
  574  vim localplay.yaml
  575  mc
  576  vim web.yaml
  577  mkdir -p roles/web
  578  mkdir -p roles/web{tasks,templates,defaults,files}
  579  ls roles/web
  580  ls roles/web/
  581  mc
  582  mkdir -p roles/web/{tasks,templates,defaults,files}
  583  ls roles/web/
  584  vim roles/web/tasks
  585  vim roles/web/tasks/main.yaml
  586  vim roles/web/tasks/http_RedHat.yaml
  587  vim roles/web/defaults/main.yaml
  588  vim roles/web/tasks/http_RedHat.yaml
  589  vim roles/web/defaults/main.yaml
  590  vim roles/web/tasks/http_debian.yaml
  591  history | grep  ansible
  592  vim roles/web/tasks/main.yaml
  593  vim roles/web/files/index.html
  594  vim roles/web/tasks/main.yaml
  595  ansible-playbook web.yaml -i inventory/main.yaml --vault-password-file ~/.ansible_vault -t copy_files
  596  vim roles/web/tasks/main.yaml
  597  vim roles/web/templates/hosts.j2
  598  vim roles/web/defaults/main.yaml
  599  vim roles/web/tasks/main.yaml
  600  ansible-playbook web.yaml -i inventory/main.yaml --vault-password-file ~/.ansible_vault -t template
  601  ssh root@192.168.254.50
  602  vim roles/web/tasks/main.yaml
  603  vim web.yaml
  604  ansible-playbook web.yaml -i inventory/main.yaml --vault-password-file ~/.ansible_vault -t test
  605  wq
  606  git add --all
  607  git commit -m "06.Ansible"

```
