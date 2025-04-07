##task1
```bash
1	cd	homework/05.AnsibleStart/
2	clear
3	ssh-copy-id	-p	32510	jump_sa@178.124.206.53
4	ssh	-p	32510	jump_sa@178.124.206.53
5	vim	~/.ssh/config
6	ssh	root@192.168.201.6
7	vim	~/.ssh/config
8	ssh	root@192.168.201.6
9	ssh	root@192.168.202.11
10	vim	~/.ssh/config
11	ssh	root@192.168.202.11A
12	ssh	root@192.168.202.12
13	ssh	root@192.168.201.6
14	vim	~/.ssh/config
15	ssh	root@192.168.202.11
16	vim	ansible.cfg
17	sudo apt	install	sshpass
18	ssh-copy-id	root@192.168.202.11
19	ssh-copy-id	root@192.168.202.12
20	ssh	root@192.168.202.11
21	ssh	root@192.168.202.12
22	hello.yaml
23	vim	hello.yaml
24	ansible-playbook hello.yaml
25	vim	hello.yaml	
26	ansible-playbook hello.yaml
```
### task2
```bash
27	vim task2.3.yaml
28	ssh root@192.168.202.11
29	vim task2.3.yaml
30	ansible-playbook -i task2.3.yaml
31	clear
32	ls
33	vim inventoy.yaml
34	ansible-playbook -i inventoy.yaml task2.3.yaml
35	vim inventoy.yaml
36	vim task2.3.yaml
37	ansible-playbook -i inventoy.yaml task2.3.yaml
38	ssh root@192.168.202.11
39	im inventoy.yaml
40	ansible-playbook -i inventoy.yaml task2.3.yaml
41	vim task2.3.yaml
42	ansible-playbook -i inventoy.yaml task2.3.yaml
```
###task 3
```bash
44	task3.yaml
45	vim	task3.yaml
46	vim	inventoy.yaml
47	vim	task3.yaml
48	ansible-vault	create	secret_vars.yml
49	ansible-playbook -i	inventoy.yaml task3.yaml extra-vars	@secret_vars.yml extra-vars	user_name=zayatsVV user_group=users	--ask-vault-pass
50	ansible-playbook -i	inventoy.yaml task3.yaml --extra-vars	@secret_vars.yml extra-vars	user_name=zayatsVV user_group=users	--ask-vault-pass
51	ansible-playbook -i	inventoy.yaml task3.yaml --extra-vars	@secret_vars.yml --extra-vars	user_name=zayatsV user_group=users	--ask-vault-pass
52	ansible-playbook -i	inventoy.yaml task3.yaml --extra-vars	@secret_vars.yml --extra-vars	user_name=zayatsVV user_group=users	--ask-vault-pass
53	history
```


