```
2470  cd demo
 2471  ls
 2472  mkdir 08.Ansible
 2473  cd 08
 2474  cd 08.Ansible
 2475  mkdir 01
 2476  cd 01
 2477  mc
 2478  ls
 2479  vim 01.facts.yaml
 2480  ansible-playbook -i inv.yaml 01.facts.yaml
 2481  ansible-playbook -i inv.yaml 01.facts.yaml --ask-vault-pass
 2482  vim 01.facts.yaml
 2483  ansible-playbook -i inv.yaml 01.facts.yaml --ask-vault-pass
 2484  vim 01.facts.yaml
 2485  ansible-playbook -i inv.yaml 01.facts.yaml --ask-vault-pass
 2486  vim 01.facts.yaml
 2487  vim 02.local.yaml
 2488  ansible-playbook -i inv.yaml 02.local.yaml --ask-vault-pass
 2489  vim 02.local.yaml
 2490  ansible-playbook -i inv.yaml 02.local.yaml --ask-vault-pass
 2491  vim 02.local.yaml
 2492  ansible-playbook -i inv.yaml 02.local.yaml --ask-vault-pass
 2493  vim 02.local.yaml
 2494  ansible-playbook -i inv.yaml 02.local.yaml --ask-vault-pass
 2495  vim 02.local.yaml
 2496  ansible-playbook -i inv.yaml 02.local.yaml --ask-vault-pass
 2497  vim 02.local.yaml
 2498  vim 03.local_action.yaml
 2499  ansible-playbook -i inv.yaml 03.local_action.yaml --ask-vault-pass
 2500  hostname
 2501  vim 03.local_action.yaml
 2502  ansible-playbook -i inv.yaml 03.local_action.yaml --ask-vault-pass
 2503  vim 04.sequence.yaml
 2504  ls
 2505  cd ../
 2506  mc
 2507  cd 02
 2508  ls
 2509  vim web.yaml
 2510  pip3 install molecule
 2511  ansible-lint web.yaml
 2512  vim web.yaml
 2513  ansible-lint web.yaml
 2514  vim web.yaml
 2515  ansible-lint web.yaml
 2516  vim roles/web/tasks/main.yaml
 2517  ansible-lint web.yaml
 2518  vim roles/web/tasks/main.yaml
 2519  ansible-lint web.yaml
 2520  ls
 2521  cd roles/web
 2522  ls
 2523  molecule init scenario
 2524  molecule lint
 2525  molecule test
 2526  vim roles/web/tasks/main.yaml
 2527  vim tasks/main.yaml
 2528  molecule test
 2529  vim molecule/default/molecule.yml
 2530  molecule test
 2531  cd ../../
 2532  ls
 2533  cd ../
```
