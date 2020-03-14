```bash
2084* cd /tmp/sa.it-academy.by
 2085* git pull
 2086* cd demo
 2087* ls
 2088* mkdir 05.Ansible
 2089* cd 05.Ansible
 2090  cp sa/infra/AnsibleStart/Vagrantfile /tmp/sa.it-academy.by/demo/05.Ansible
 2091  vagrant global-status
 2092  vim sa/infra/AnsibleStart/Vagrantfile
 2093  ping 192.168.1.40
 2094  ssh 192.168.1.40
 2095  ssh vagrant@192.168.1.40
 2096  vim /etc/ansible/hosts
 2097  ansible -m ping bastion -u vagrant
 2098  sudo rm -rf /etc/ansible/host_vars
 2099  sudo rm -rf /etc/ansible/group_vars
 2100  ansible -m ping bastion -u vagrant
 2101  ansible -m ping bastion -u vagrantxgvx
 2102  vim .ssh/config
 2103* ssh plu@10.20.30.22
 2104* ssh vagant@10.20.30.22
 2105* ssh vagrant@10.20.30.22
 2106  vim sa/infra/AnsibleStart/Vagrantfile
 2107* ssh vagrant@10.20.30.21
 2108  vim .ssh/config
 2109* ssh 178.124.206.53
 2110* ssh root@178.124.206.53
 2111* ssh root@192.168.203.17
 2112  vim /etc/ansible/hosts
 2113  ansible -m ping -u root --ask-pass ec
 2114  ansible -m shell -a 'cat /etc/os-release' -u root --ask-pass ec
 2115  ansible -m shell -a 'cat /etc/os-release' -u plu --ask-pass ec -b
 2116  ansible -m shell -a 'cat /etc/yum.conf' -u plu --ask-pass ec -b
 2117  ansible -m shell -a 'cat /etc/yum.conf' -u root --ask-pass ec -b
 2118  data > file.txt
 2119  date > file.txt
 2120  cat file.txt
 2121  ansible -m copy -a "src=/home/plu/file.txt dest=/tmp/file.txt" -u root --ask-pass ec
 2122  sudo mkdir /etc/ansible/{host_vars,group_vars}
 2123  vim /etc/ansible/hosts
 2124  mkdir /etc/ansible/group_vars/internal/
 2125  sudo mkdir /etc/ansible/group_vars/internal/
 2126  sudo vim /etc/ansible/group_vars/internal/vars.yaml
 2127  ansible-inventory --graph
 2128  ansible-inventory --host host1
 2129  vim /etc/ansible/hosts
 2130  ansible host1 -m ping
 2131  sudo ansible-vault create /etc/ansible/group_vars/internal/vault.yaml
 2132  vim /etc/ansible/group_vars/internal/vault.yaml
 2133  sudo chmod a+w /etc/ansible/group_vars/internal/vault.yaml
 2134  sudo chmod a+r /etc/ansible/group_vars/internal/vault.yaml
 2135  vim /etc/ansible/group_vars/internal/vault.yaml
 2136  sudo ansible-vault edit /etc/ansible/group_vars/internal/vault.yaml
 2137  vim /etc/ansible/group_vars/internal/vault.yaml
 2138  ansible host1 -m ping
 2139  ansible host1 -m ping --ask-vault-pass
 2140  ansible-inventory --host host1 --ask-vault-pass
 2141  sudo cp -r /etc/ansible /tmp/sa.it-academy.by/demo/05.Ansible
 2142  sudo chown -R plu:plu /tmp/sa.it-academy.by/demo/05.Ansible/ansible
 2143  ls -l /tmp/sa.it-academy.by/demo/05.Ansible/ansible
 2144* cd ../
 2145* cd  05.Ansible

```
