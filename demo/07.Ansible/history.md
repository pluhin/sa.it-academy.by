```bash
 2380  vim web.yaml
 2381  ls
 2382  mkdir -p roles/web/{defaults,files,meta,tasks,templates}
 2383  ls roles/web
 2384  vim roles/web/tasks/main.yaml
 2385  touch roles/web/tasks/http_RedHat.yaml
 2386  touch roles/web/tasks/http_debian.yaml
 2387  vim roles/web/tasks/http_RedHat.yaml
 2388  vim roles/web/defaults/main.yaml
 2389  vim roles/web/tasks/http_debian.yaml
 2390  vim roles/web/defaults/main.yaml
 2391  ansible-playbook -i inv.yaml web.yaml --ask-vault-pass
 2392  vim roles/web/tasks/main.yaml
 2393  vim roles/web/files/index.html
 2394  vim roles/web/tasks/main.yaml
 2395  vim roles/web/defaults/main.yaml
 2396  vim roles/web/tasks/main.yaml
 2397  vim web.yaml
 2398  ansible-playbook -i inv.yaml web.yaml --ask-vault-pass -t copy::files
 2399  vim roles/web/tasks/main.yaml
 2400  ansible-playbook -i inv.yaml web.yaml --ask-vault-pass -t test
 2401  vim roles/web/tasks/main.yaml
 2402  ansible-playbook -i inv.yaml web.yaml --ask-vault-pass -t test
 2403  vim roles/web/tasks/main.yaml
 2404  ansible-playbook -i inv.yaml web.yaml --ask-vault-pass -t test
 2405  vim roles/web/tasks/main.yaml
 2406  ansible-playbook -i inv.yaml web.yaml --ask-vault-pass -t test
 2407  vim roles/web/tasks/main.yaml
 2408  ansible-playbook -i inv.yaml web.yaml --ask-vault-pass -t test2
 2409  vim roles/web/tasks/main.yaml
 2410  vim roles/web/templates/hosts.j2
 2411  vim roles/web/defaults/main.yaml
 2412  vim inv.yaml
 2413  vim roles/web/defaults/main.yaml
 2414  vim roles/web/tasks/main.yaml
 2415  ansible-playbook -i inv.yaml web.yaml --ask-vault-pass -t template
 2416  ansible webservers -i inv.yaml -m shell -a "cat /etc/hosts" --ask-vault-pass
 2417  vim roles/web/tasks/main.yaml
 2418  vim roles/web/templates/hosts.j2
 2419  ansible-playbook -i inv.yaml web.yaml --ask-vault-pass -t template
 2420  ansible webservers -i inv.yaml -m shell -a "cat /etc/hosts" --ask-vault-pass
```
