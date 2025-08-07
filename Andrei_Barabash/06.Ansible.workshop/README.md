## 1 Run command

```bash
ansible-playbook -i inventory.yaml nginx.yml
```


## 2 Login to remote host1

```bash
ssh root@192.168.202.1 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32511"
```


## 3 Check nginx works properly on host1

```bash
curl myhost1.loc
```


## 4 Login to remote host2
```bash
ssh root@192.168.202.2 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32511"
```

## 3 Check nginx works properly on host2
```bash
curl myhost2.loc
```
