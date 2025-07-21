# 1 Run command
```bash
ansible-playbook -i inventory.yaml nginx.yml
```

# 2 Login to remote host
```bash
ssh root@192.168.202.1 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32511"
```

# 3 Check nginx works properly
```bash
curl myhost1.loc
```

