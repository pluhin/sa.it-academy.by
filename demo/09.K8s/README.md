```bash
423  curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
  424  sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
  425  ls -l /usr/local/bin/minikube
  426  minikube -help
  427  minikube help
  428  minikube start
  429  minikube kubectl -- get po -A
  430  minikube addons list
  431  minikube addons enable dashboard
  432  minikube addons enable metrics-server
  433  minikube kubectl -- get po -A
  434  minikube kubectl proxy --address='0.0.0.0' --disable-filter=true &
  435  ps aux | grep proxy
  436  kill -9 149598
  437  sudo kill -9 149598
  438  kill -9 149598
  439  ps aux | grep proxy
  440  kubectl
  441  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  442  kubectl
  443  kubectl get pods
  444  kubectl get pods -A
  445  kubectl proxy --address='0.0.0.0' --disable-filter=true &
  446  ps aux | grep proxy
  447  kill 152556
  448  ps aux | grep proxy
  449  mkdir 09.K8s
  450  cd 09.K8s/
```

```
ssh -L 8001:127.0.0.1:8001 user@192.168.204.85 -f -N
```

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/kubernetes-dashboard:/proxy/#

## K8s full install

```bash
  451  git clone git@github.com:kubernetes-sigs/kubespray.git
  452  cd kubespray/
  453  ls
  454  vim requirements.txt
  455  sudo pip install -U -r requirements.txt
  456  minikube stop
  457  minikube delete
  458  cp -rfp inventory/sample/ inventory/plu
  459  vim inventory/plu/inventory.ini
  460  ls -l contrib/inventory_builder/inventory.py
  461  vim inventory/plu/inventory.ini
  462  ansible-playbook -i inventory/plu/ cluster.yml -u root --ask-pass
  463  ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-pass
  464  history
```

## File inventory/plu/inventory.ini

```ini
# This inventory describe a HA typology with stacked etcd (== same nodes as control plane)
# and 3 worker nodes
# See https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html
# for tips on building your # inventory

# Configure 'ip' variable to bind kubernetes services on a different ip than the default iface
# We should set etcd_member_name for etcd cluster. The node that are not etcd members do not need to set the value,
# or can set the empty string value.
node1 ansible_host=192.168.208.25 ip=192.168.208.25 etcd_member_name=etcd1
node2 ansible_host=192.168.208.26 ip=192.168.208.26
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
PLAY RECAP *****************************************************************************************************
node1                      : ok=682  changed=146  unreachable=0    failed=0    skipped=1096 rescued=0    ignored=6
node2                      : ok=452  changed=89   unreachable=0    failed=0    skipped=677  rescued=0    ignored=1

Thursday 09 January 2025  18:19:57 +0000 (0:00:00.077)       0:19:10.006 ******
===============================================================================
kubernetes/preinstall : Install packages requirements -------------------------------------------------- 81.07s
download : Download_file | Download item --------------------------------------------------------------- 61.53s
download : Download_file | Download item --------------------------------------------------------------- 53.56s
container-engine/containerd : Download_file | Download item -------------------------------------------- 45.07s
download : Download_container | Download image if required --------------------------------------------- 35.66s
download : Download_container | Download image if required --------------------------------------------- 33.48s
download : Download_container | Download image if required --------------------------------------------- 32.73s
download : Download_container | Download image if required --------------------------------------------- 31.47s
download : Download_container | Download image if required --------------------------------------------- 31.02s
download : Download_file | Download item --------------------------------------------------------------- 26.22s
download : Download_file | Download item --------------------------------------------------------------- 25.59s
download : Download_container | Download image if required --------------------------------------------- 24.82s
container-engine/nerdctl : Download_file | Download item ----------------------------------------------- 24.23s
container-engine/crictl : Download_file | Download item ------------------------------------------------ 24.11s
download : Download_container | Download image if required --------------------------------------------- 22.51s
download : Download_container | Download image if required --------------------------------------------- 21.85s
download : Download_container | Download image if required --------------------------------------------- 21.54s
download : Download_file | Download item --------------------------------------------------------------- 21.25s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -- 21.10s
bootstrap-os : Update Apt cache ------------------------------------------------------------------------ 18.23s
user@sa2-demo
```