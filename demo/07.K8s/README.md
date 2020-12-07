## Minikube

```bash

11235  git pull
11236  mkdir 07.K8s 
11237  cd 07.K8s
11238  vim Vagrnatfile
11239  ping 192.168.1.201
11240  vagrant up
11241  ls
11242  vagrant up
11243* cd ../07.K8s
11244* minikube start --help
11245* minikube start 
11246* clear
11247* top
11248* kill -9 244963
11249* top
11250* minikube service list
11251* minikube addons list
11252* minikube addons dashboard enable
11253* minikube addons enable dashboard
11254* kubectl proxy --address='0.0.0.0' --disable-filter=true &
11255* kubectl get pods
11256* kubectl get nodes
11257* vim ~/.kube/config
11258* kubectl get ns
11259* kubectl get pods --all-namespaces 
11260  vagrant halt && vagrant destroy -f
11261* minikube stop
11262* minikube delete
11263* clear
11264* ls
11265* ls 
11266* ps aux | grep mini
11267* fgb
11268* bg
```

Minikube dashboard: http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#

## k8s
```bash
11269* ssh jump_sa@178.124.206.53
11270* ls -l ~/.ssh
11271* vim ~/.ssh/config
11272* vim /etc/ssh/ssh_config
11273* ssh root@192.168.203.21
11274* vim ~/.ssh/config
11275* ssh-copy-id  root@192.168.203.21
11276* ssh-copy-id  root@192.168.203.22
11277* ssh root@192.168.203.21
11278* cd /tmp
11279* git clone git@github.com:kubernetes-sigs/kubespray.git
11280* cd kubespray
11281* ls
11282* cp -rfp inventory/sample inventory/ws
11283* declare -a IPS=(192.168.203.21 192.168.203.22)
11284* CONFIG_FILE=inventory/ws/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
11285* vim inventory/ws/hosts.yaml
11286* cat inventory/mycluster/group_vars/all/all.yml
11287* cat inventory/ws/group_vars/all/all.yml
11288* vim inventory/ws/group_vars/all/all.yml
11289* vim inventory/ws/group_vars/k8s-cluster/k8s-cluster.yml
11290* ansible-playbook -i inventory/ws/hosts.yaml  -u root cluster.yml --ask-pass
11291* ansible-playbook -i inventory/ws/hosts.yaml  -u root cluster.yml
```
