# 09.Kubernetes

## Homework Assignment 0: Finish full install k8s

Clohe repository

```bash
git clone https://github.com/kubernetes-sigs/kubespray.git
```

inventory file

```ini
# This inventory describe a HA typology with stacked etcd (== same nodes as control plane)
# and 3 worker nodes
# See https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html
# for tips on building your # inventory

# Configure 'ip' variable to bind kubernetes services on a different ip than the default iface
# We should set etcd_member_name for etcd cluster. The node that are not etcd members do not need to set the value,
# or can set the empty string value.
node1 ansible_host=192.168.208.5 ip=192.168.208.5 etcd_member_name=etcd1
node2 ansible_host=192.168.208.6 ip=192.168.208.6
[kube_control_plane]
node1

[etcd:children]
kube_control_plane

[kube_node]
node1
node2
```

Bash command to install

```bash
ansible-playbook -i inventory/grigorev/inventory.ini cluster.yml -u root --ask-pass
```

Result of instalation

```bash
PLAY RECAP **************************************************************************************************
node1                      : ok=705  changed=144  unreachable=0    failed=0    skipped=1100 rescued=0    ignored=6
node2                      : ok=469  changed=89   unreachable=0    failed=0    skipped=686  rescued=0    ignored=1

Thursday 17 April 2025  09:05:00 +0000 (0:00:00.079)       0:15:25.334 ********
===============================================================================
kubernetes/preinstall : Install packages requirements ----------------------------------------------- 64.69s
download : Download_container | Download image if required ------------------------------------------ 37.39s
download : Download_container | Download image if required ------------------------------------------ 29.07s
container-engine/containerd : Download_file | Download item ----------------------------------------- 22.81s
download : Download_container | Download image if required ------------------------------------------ 21.43s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -- 21.10s
download : Download_container | Download image if required ------------------------------------------ 21.00s
download : Download_container | Download image if required ------------------------------------------ 20.82s
container-engine/crictl : Download_file | Download item --------------------------------------------- 20.51s
download : Download_container | Download image if required ------------------------------------------ 19.17s
download : Download_container | Download image if required ------------------------------------------ 18.95s
download : Download_container | Download image if required ------------------------------------------ 17.96s
download : Download_file | Download item ------------------------------------------------------------ 17.78s
download : Download_container | Download image if required ------------------------------------------ 16.87s
download : Download_file | Download item ------------------------------------------------------------ 16.74s
container-engine/runc : Download_file | Download item ----------------------------------------------- 16.58s
kubernetes/kubeadm : Join to cluster if needed ------------------------------------------------------ 16.11s
download : Download_container | Download image if required ------------------------------------------ 15.67s
bootstrap-os : Update Apt cache --------------------------------------------------------------------- 15.51s
container-engine/nerdctl : Download_file | Download item -------------------------------------------- 15.45s

```
