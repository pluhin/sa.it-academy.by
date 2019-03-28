 ##04 _ansible_Home_task


```bash 
 1449  sudo ansible etc_jump_host -m ping
 1450  cd /etc/ansible/
 1451  sudo ansible etc_jump_host -m ping
 1452  vim ansible.cfg 
 1453  sudo ansible etc_jump_host -m ping
 1454  vim ansible.cfg 
 1455  sudo ansible etc_jump_host -m ping
 1456  ssh jump@178.124.206.48
 1457  exit
 1458  sudo ansible etc_jump_host -m ping
 1459  sudo ansible etc_jump_host -m jump
 1460  sudo ansible etc_jump_host -u jump
 1461  sudo ansible etc_jump_host -u jump --ask-sudo-pass
 1462  sudo ansible etc_jump_host -u jump --ask-pass
 1463  nano /etc/ssh/ssh_config
 1464  ssh user@192.168.253.10
 1465  QwertY_13
 1466  ssh user@192.168.253.10
 1467  ssh-copy-id -i ~/.ssh/id_rsa.pub user@192.168.253.10
 1468  ssh user@192.168.253.10
 1469  exit
 1470  "msg": "Failed to connect to the host via ssh: jump@178.124.206.48: Permission denied (publickey,gssapi-keyex,gssapi-with-mic,password).", 
 1471  ssh-copy-id jump@178.124.206.48
 1472  ssh jump@178.124.206.48
 1473  sudo ansible etc_jump_host -m ping -u jump
 1474  ansible etc_jump_host -m ping -u jump
 1475  code
 1476  code sudo ansible etc_jump_host -m ping -u jump
 1477  code --user-data-dir argument
 1478  vim /etc/ssh/ssh_config
 1479  ssh user@192.168.254.51
 1480  ssh user@192.168.254.50
 1481  ssh root@192.168.254.50
 1482  ssh-copy-id root@192.168.254.50
 1483  ssh-copy-id user@192.168.254.50
 1484  ssh-copy-id user@192.168.254.51
 1485  vim /etc/ansible/hosts
 1486  ansible etc -m ping
 1487  visudo
 1488  sudo visudo
 1489  ansible etc -m ping
 1490  apt  update
 1491  ansible-inventory --graph
 1492  ansible-inventory --host 192.168.254.50
 1493  exit
 1494  sudo mkdir /etc/ansible/group_vars
 1495  vim /etc/ansible/group_vars/etc
 1496  ansible-inventory --graph
 1497  ansible-inventory --host 192.168.254.50
 1498  sudo vim /etc/ansible/hosts
 1499  ansible etc -m ping
 1500  sudo mkdir /etc/ansible/hosts_vars
 1501  sudo vim /etc/ansible/hosts_vars/ub
 1502  ansible etc -m ping
 1503  sudo vim /etc/ansible/hosts
 1504  sudo mv /etc/ansible/hosts_vars/ub /etc/ansible/host_vars/ubuntu
 1505  sudo mv /etc/ansible/hosts_vars /etc/ansible/host_vars
 1506  sudo mv /etc/ansible/hosts_vars/ub /etc/ansible/host_vars/ubuntu
 1507  sudo vim /etc/ansible/hosts_vars/ubuntu_01
 1508  sudo vim /etc/ansible/host_vars/ubuntu_01
 1509  ansible etc -m ping
 1510  sudo vim /etc/ansible/host_vars/ubuntu_01
 1511  ansible etc -m ping
 1512  sudo vim /etc/ansible/host_vars/ubuntu_01
 1513  ansible etc -m ping
 1514  sudo vim /etc/ansible/hosts
 1515  ansible etc -m ping
 1516  cd ansible
 1517  ls
 1518  cd  unit4/
 1519  ls
 1520  cd ..
 1521  sudo rm /etc/ansible/host_vars/ubuntu_01
 1522  sudo ansible-vault create /etc/ansible/host_vars/ubuntu_01
 1523  ansible etc -m ping
 1524  sudo ansible-inventory --host ubuntu_01 ask-vault-pass
 1525  ansible-inventory --host ubuntu_01 ask-vault-pass
 1526  sudo ansible-vault edit /etc/ansible/host_vars/ubuntu_01
 1527  sudo ansibl all-m ping ask-vault-pass
 1528  sudo ansible all-m ping ask-vault-pass
 1529  sudo ansible all -m ping ask-vault-pass
 1530  ansible all -m ping ask-vault-pass
 1531  cd ..
 1532  ansible all -m ping ask-vault-pass
 1533  ansible all -m ping --ask-vault-pass
 1534  ansible etc -m ping --ask-vault-pass
 1535  ansible-vault create /etc/ansible/host_vars/ubuntu_01
 1536  ansible-vault edit /etc/ansible/host_vars/ubuntu_01
 1537  ansible etc -m ping --ask-vault-pass
 1538  ansible etc -m shell -a "cat /etc/os-release"--ask-vault-pass
 1539  ansible etc -m shell -a "cat /etc/os-release"  --ask-vault-pass
 1540  ansible etc -m shell -a "cat /etc/os-release"  --ask-vault-pass -b
 1541  history
 1542  history > 04_ansible.md
```
