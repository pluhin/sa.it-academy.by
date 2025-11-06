```bash
391  mkdir  09.K8s
  392  cd 09.K8s/
  393  ls
  394  curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
  395  sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
  396  minikube --help
  397  cd 09.K8s/
  398  ls
  399  minikube addons list
  400  minikube start -help
  401  minikube start --help
  402  minikube start
  403  minikube kubectl -- get pods -A
  404  minikube addons enable dashboard
  405  minikube addons enable metrics-server
  406  minikube kubectl -- proxy --address='0.0.0.0' --disable-filter=true
  407  minikube stop
  408  minikube delete
  409  git clone https://github.com/kubernetes-sigs/kubespray.git
  410  cd kubespray/
  411  sudo pip install -U -r requirements.txt
  412  cp -rfp inventory/sample/ inventory/plu
  413  vim inventory/plu/inventory.ini
  414  ansible-playbook -i inventory/plu cluster.yml -u root --ask-pass
  415  vim inventory/plu/inventory.ini
  416  ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-pass
  417  history
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
node1 ansible_host=192.168.208.XX ip=192.168.208.XX ansible_python_interpreter=/usr/bin/python3
node2 ansible_host=192.168.208.YY ip=192.168.208.YY ansible_python_interpreter=/usr/bin/python3
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
PLAY RECAP ***************************************************************************************************************************************
node1                      : ok=649  changed=144  unreachable=0    failed=0    skipped=997  rescued=0    ignored=5
node2                      : ok=431  changed=87   unreachable=0    failed=0    skipped=625  rescued=0    ignored=0

Thursday 30 October 2025  19:49:35 +0000 (0:00:00.082)       1:12:32.498 ******
===============================================================================
download : Download_file | Download item ------------------------------------------------------------------------------------------------ 610.12s
download : Download_file | Download item ------------------------------------------------------------------------------------------------ 525.47s
download : Download_file | Download item ------------------------------------------------------------------------------------------------ 419.29s
download : Download_file | Download item ------------------------------------------------------------------------------------------------ 413.05s
download : Download_file | Download item ------------------------------------------------------------------------------------------------ 372.28s
container-engine/containerd : Download_file | Download item ----------------------------------------------------------------------------- 303.79s
download : Download_file | Download item ------------------------------------------------------------------------------------------------ 193.78s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 109.65s
container-engine/crictl : Download_file | Download item --------------------------------------------------------------------------------- 102.85s
container-engine/runc : Download_file | Download item ----------------------------------------------------------------------------------- 102.47s
container-engine/nerdctl : Download_file | Download item --------------------------------------------------------------------------------- 84.57s
download : Download_file | Download item ------------------------------------------------------------------------------------------------- 84.40s
download : Download_container | Download image if required ------------------------------------------------------------------------------- 72.69s
download : Download_container | Download image if required ------------------------------------------------------------------------------- 72.64s
download : Download_container | Download image if required ------------------------------------------------------------------------------- 65.75s
system_packages : Manage packages -------------------------------------------------------------------------------------------------------- 61.69s
download : Download_container | Download image if required ------------------------------------------------------------------------------- 60.04s
download : Download_container | Download image if required ------------------------------------------------------------------------------- 58.20s
download : Download_container | Download image if required ------------------------------------------------------------------------------- 51.01s
download : Download_container | Download image if required ------------------------------------------------------------------------------- 39.86s
user@sa2-demo:~/09.K8s/kubespray$
```