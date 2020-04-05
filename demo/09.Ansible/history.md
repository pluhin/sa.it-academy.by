```bash
2437  cd /tmp/sa.it-academy.by
 2438  ls
 2439  git pull
 2440  cd demo
 2441  l
 2442  mkdir 09.Ansible
 2443  cd 09.Ansible
 2444  vim ~/.ssh/config
 2445  vim inv.yaml
 2446  ansible -m ping all -i inv.yaml --ask-pass
 2447  ansible redmine -m ping -i inv.yaml --ask-pass
 2448  vim inv.yaml
 2449  ansible redmine -m ping -i inv.yaml --ask-pass
 2450  vim ~/.ssh/known_hosts
 2451  ansible redmine -m ping -i inv.yaml --ask-pass
 2452  cat inv.yaml
 2453  ssh-copy-id roo@192.168.31.22
 2454  ssh-copy-id root@192.168.31.22
 2455  ansible redmine -m ping -i inv.yaml
 2456  vim paly.yaml
 2457  mv paly.yaml play.yaml
 2458  vim play.yaml
 2459  mkdir roles/redmine/{defaults,files,templates,tasks,handlers}
 2460  mkdir -p roles/redmine/{defaults,files,templates,tasks,handlers}
 2461  cat play.yaml
 2462  vim roles/redmine/tasks/main.yaml
 2463  vim roles/redmine/defaults/main.yaml
 2464  ansible-playbook play.yaml -i inv.yaml 
 2465  cat play.yaml
 2466  vim  play.yaml
 2467  hostname
 2468  hostname -a
 2469  vim  play.yaml
 2470  ansible-playbook play.yaml -i inv.yaml 
 2471  vim  play.yaml
 2472  ansible-playbook play.yaml -i inv.yaml 
 2473  vim  play.yaml
 2474  ansible-playbook play.yaml -i inv.yaml 
 2475  vim roles/redmine/tasks/main.yaml
 2476  vim roles/redmine/templates/my.cnf.j2
 2477  vim roles/redmine/tasks/main.yaml
 2478  vim roles/redmine/handlers/main.yaml
 2479  cat roles/redmine/tasks/main.yaml
 2480  cat roles/redmine/handlers/main.yaml
 2481  cat roles/redmine/tasks/main.yaml
 2482  vim  roles/redmine/tasks/main.yaml
 2483  ansible-playbook play.yaml -i inv.yaml 
 2484  cd /tmp/sa.it-academy.by/demo/09.Ansible
 2485  vim roles/redmine/templates/my.cnf.j2
 2486  vim  roles/redmine/tasks/main.yaml
 2487  vim roles/redmine/defaults/main.yaml
 2488  vim  roles/redmine/tasks/main.yaml
 2489  ansible-playbook play.yaml -i inv.yaml 
 2490  vim  roles/redmine/tasks/main.yaml
 2491  ansible-playbook play.yaml -i inv.yaml 
 2492* vim roles/redmine/tasks/main.yaml
 2493* vim roles/redmine/defaults/main.yaml
 2494* vim roles/redmine/tasks/main.yaml
 2495* ansible-playbook play.yaml -i inv.yaml 
 2496* vim roles/redmine/tasks/main.yaml
 2497* vim roles/redmine/defaults/main.yaml
 2498* vim roles/redmine/templates/database.yml.j2
 2499* vim roles/redmine/tasks/main.yaml
 2500* ansible-playbook play.yaml -i inv.yaml  -t db::config
 2501* vim roles/redmine/tasks/main.yaml
 2502* ansible-playbook play.yaml -i inv.yaml  -t setup
 2503  vim  roles/redmine/tasks/main.yaml
 2504  top
 2505* vim roles/redmine/defaults/main.yaml
 2506* ansible-playbook play.yaml -i inv.yaml  -t setup
 2507  vim /etc/ansible/ansible.cfg
 2508  vim  roles/redmine/tasks/main.yaml
 2509* vim roles/redmine/defaults/main.yaml
 2510  vim roles/redmine/templates/redmine.site.conf.j2
 2511  vim roles/redmine/defaults/main.yaml
 2512* vim  roles/redmine/tasks/main.yaml
 2513  ansible-playbook play.yaml -i inv.yaml  -t apache::setup
 2514* vim play.yaml
 2515  vim  roles/redmine/tasks/main.yaml
 2516  vim roles/redmine/handlers/main.yaml
 2517  ansible-playbook play.yaml -i inv.yaml  -t apache::setup
 2518  vim  roles/redmine/tasks/main.yaml
 2519  ansible-playbook play.yaml -i inv.yaml  -t test
 2520  vim  roles/redmine/tasks/main.yaml
 2521  ansible-playbook play.yaml -i inv.yaml  -t apache::setup,test
 2522* vim  roles/redmine/tasks/main.yaml
 2523  ansible all -i inv.yaml -m shell -a "cat /etc/apache2/sites-enabled/redmine.site.conf"
 2524  ansible all -i inv.yaml -m shell -a "systemctl status apache2.service"
 2525* vim roles/redmine/templates/redmine.site.conf.j2
 2526  ansible-playbook play.yaml -i inv.yaml  -t apache::setup,test
 2527  history
 2528* vim roles/redmine/templates/redmine.site.conf.j2
 2529  vim roles/redmine/defaults/main.yaml
 2530  ssh root@192.168.31.22
```
