```bash
cd 09.K8s/
 curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
 sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
 minikube help
 minikube addons list
 minikube start help
 minikube start --help
 minikube start
 minikube kubectl -- get pods -A
 minikube addons enable dashboard
 minikube addons enable metrics-server
 ps aux | grep proxy
 sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
 rm kubectl
 kubectl proxy --address='0.0.0.0' --disable-filter=true
 ps aux | grep proxy
 minikube stop
 minikube delete
 git clone git@github.com:kubernetes-sigs/kubespray.git
 cd kubespray/
 ls
 sudo pip install -U -r requirements.txt
 cp -rfp inventory/sample/ inventory/plu
 vim inventory/plu/inventory.ini
 ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-pass
 vim inventory/plu/inventory.ini
 ssh root@192.168.208.25
 ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-pass
 vim inventory/plu/inventory.ini
 ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-pass
 history

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
PLAY RECAP **************************************************************************************************************************************
node1                      : ok=647  changed=143  unreachable=0    failed=0    skipped=993  rescued=0    ignored=6
node2                      : ok=430  changed=86   unreachable=0    failed=0    skipped=613  rescued=0    ignored=1

Monday 21 July 2025  20:51:25 +0000 (0:00:00.078)       0:15:58.138 ***********
===============================================================================
download : Download_container | Download image if required ------------------------------------------------------------------------------ 52.16s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 48.88s
system_packages : Manage packages ------------------------------------------------------------------------------------------------------- 45.05s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 38.90s
download : Download_file | Download item ------------------------------------------------------------------------------------------------ 22.58s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 22.10s
download : Download_file | Download item ------------------------------------------------------------------------------------------------ 21.78s
container-engine/containerd : Download_file | Download item ----------------------------------------------------------------------------- 21.78s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 20.99s
bootstrap_os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) --------------- 20.88s
container-engine/runc : Download_file | Download item ----------------------------------------------------------------------------------- 20.69s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 20.30s
download : Download_file | Download item ------------------------------------------------------------------------------------------------ 20.29s
container-engine/crictl : Download_file | Download item --------------------------------------------------------------------------------- 19.24s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 18.98s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 18.64s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 18.62s
download : Download_container | Download image if required ------------------------------------------------------------------------------ 17.82s
kubernetes/kubeadm : Join to cluster if needed ------------------------------------------------------------------------------------------ 17.22s
download : Download_file | Download item ------------------------------------------------------------------------------------------------ 16.90s
user@sa2-demo:~/09.K8s.Install/kubespray$
```