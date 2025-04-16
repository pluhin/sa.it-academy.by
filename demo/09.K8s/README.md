```bash
 427  cd 09.K8s/
  428  curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
  429  sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
  430  minikube help
  431  minikube addons list
  432  minikube start help
  433  minikube start --help
  434  minikube start
  435  minikube kubectl -- get pods -A
  436  minikube addons enable dashboard
  437  minikube addons enable metrics-server
  438  minikube kubectl proxy --address='0.0.0.0' --disable-filter=true
  439  kubectl proxy --address='0.0.0.0' --disable-filter=true
  440  ps aux | grep proxy
  441  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  442  rm kubectl
  443  kubectl proxy --address='0.0.0.0' --disable-filter=true
  444  ps aux | grep proxy
  445  minikube stop
  446  minikube delete
  447  git clone git@github.com:kubernetes-sigs/kubespray.git
  448  cd kubespray/
  449  ls
  450  sudo pip install -U -r requirements.txt
  451  cp -rfp inventory/sample/ inventory/plu
  452  vim inventory/plu/inventory.ini
  453  ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-pass
  454  vim inventory/plu/inventory.ini
  455  ssh root@192.168.208.25
  456  ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-pass
  457  vim inventory/plu/inventory.ini
  458  ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-pass
  459  history

```



```
ssh -L 8001:127.0.0.1:8001 user@192.168.204.85 -f -N
```

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/kubernetes-dashboard:/proxy/#


## File inventory/plu/inventory.ini

```ini
# This inventory describe a HA typology with stacked etcd (== same nodes as control plane)
# and 3 worker nodes
# See https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html
# for tips on building your # inventory

# Configure 'ip' variable to bind kubernetes services on a different ip than the default iface
# We should set etcd_member_name for etcd cluster. The node that are not etcd members do not need to set the value,
# or can set the empty string value.
node1 ansible_host=192.168.208.XX ip=192.168.208.XX etcd_member_name=etcd1
node2 ansible_host=192.168.208.YY ip=192.168.208.YY
[kube_control_plane]
node1

[etcd:children]
kube_control_plane

[kube_node]
node1
node2
```


## Result

```

PLAY RECAP ***************************************************************************************************************
node1                      : ok=705  changed=145  unreachable=0    failed=0    skipped=1100 rescued=0    ignored=6
node2                      : ok=469  changed=88   unreachable=0    failed=0    skipped=686  rescued=0    ignored=1

Monday 14 April 2025  18:08:09 +0000 (0:00:00.078)       0:29:40.459 **********
===============================================================================
download : Download_file | Download item ------------------------------------------------------------------------ 133.66s
download : Download_file | Download item ------------------------------------------------------------------------ 124.87s
kubernetes/preinstall : Install packages requirements ----------------------------------------------------------- 114.50s
download : Download_file | Download item ------------------------------------------------------------------------ 101.43s
download : Download_file | Download item ------------------------------------------------------------------------- 95.58s
container-engine/containerd : Download_file | Download item ------------------------------------------------------ 86.63s
download : Download_file | Download item ------------------------------------------------------------------------- 86.08s
container-engine/crictl : Download_file | Download item ---------------------------------------------------------- 53.63s
download : Download_container | Download image if required ------------------------------------------------------- 46.86s
download : Download_container | Download image if required ------------------------------------------------------- 45.47s
download : Download_container | Download image if required ------------------------------------------------------- 44.33s
download : Download_container | Download image if required ------------------------------------------------------- 43.68s
download : Download_container | Download image if required ------------------------------------------------------- 41.12s
download : Download_container | Download image if required ------------------------------------------------------- 41.01s
download : Download_file | Download item ------------------------------------------------------------------------- 40.03s
download : Download_container | Download image if required ------------------------------------------------------- 36.99s
container-engine/runc : Download_file | Download item ------------------------------------------------------------ 30.10s
download : Download_container | Download image if required ------------------------------------------------------- 29.91s
download : Download_container | Download image if required ------------------------------------------------------- 26.78s
container-engine/nerdctl : Download_file | Download item --------------------------------------------------------- 25.01s
user@sa2-demo:~/09.K8s/kubespray$
```