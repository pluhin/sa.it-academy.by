# Homework Assignment 1: Setting Up Ansible

```
 sudo apt update && sudo apt upgrade -y
```

```
sudo apt install python3-pip
```

```
 sudo pip3 install ansible
 ```

 ```
 ansible --version
 ```

![alt text](image-99-1.png)

```
ansible -i inv.yaml -m ping -u root all_workers --ask-pass
```

 ![alt text](image.png)

 ```
 ansible-playbook hello-ansible.yaml
 ```

 ![alt text](<image-66.png>)


# Homework Assignment 2: Managing Remote Hosts

```
sudo apt install sshpass
```

```
ansible-playbook -i inv.yaml playbook-1.yaml --ask-vault-pass
```

![alt text](image-1.png)

# Homework Assignment 3: Managing Users and Groups

```
ansible-playbook -i inv.yaml playbook-2.yaml --ask-vault-pass
```

```
cat /etc/passwd
```
![alt text](image-3.png)


```
cat /etc/group
```

![alt text](image-2.png)