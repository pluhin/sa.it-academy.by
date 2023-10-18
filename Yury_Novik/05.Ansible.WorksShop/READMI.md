
# Ansible Workshop

```
05.Ansible.WorksShop$ find
.
./inv.yaml
./READMI.md
./files
./files/apache.conf.j2
./files/index.html.j2
./websrv.yaml
./vars
./vars/default.yaml


ansible-playbook -i inv.yaml websrv.yaml --ask-vault-pass
```
