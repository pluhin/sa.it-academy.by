# K8s

## Minikube
```bash
10604  mkdir 07.K8s 
10605  cd 07.K8s
10606  kubectl --version
10607  kubectl -v
10608  kubectl varsion
10609  kubectl version
10610  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \\n  && chmod +x minikube
10611  ecgo $PATH
10612  echo $PATH
10613  mv minikube /usr/local/bin
10614  sudo mv minikube /usr/local/bin
10615  minikube
10616  minikube start --help
10617  minikube start
10618* cd ../07.K8s
10619* ls
10620* vim Vagrantfile
10621  free
10622  kubectl get pods
10623  kubectl get nodes
10624  vim ~/.kube/config
10625  vim ~/.kube/config_mini
10626  kubectl cluster-info
10627  vim ~/.kube/config
10628  kubectl get nodes
10629  minikube service list
10630  kubectl get services
10631  minikube plugins list
10632  minikube plugin list
10633  minikube --help
10634  minikube addons list
10635  minikube addons dashboard enabled
10636  minikube addons dashboard enable
10637  minikube addons dashboard
10638  minikube addons enable dashboard
10639  kubectl proxy --address='0.0.0.0' --disable-filter=true &
10641  minikube addons enable dashboard
10642  kubectl proxy --address='0.0.0.0' --disable-filter=true &
10643  minikube addons list
10650  minikube destroy 
10651  minikube --help
10652  minikube delete
```

[minikube dashboard](http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/overview?namespace=default)


## K8s

```
10653  ssh jump_sa@178.124.206.53
10654  ssh-copy-id jump_sa@178.124.206.53 
10655  vim ~/.ssh/config
10656  ssh root@192.168.201.24
10657  192.168.201.22
10658  ssh root@192.168.201.22
10659  ssh-copy-id root@192.168.201.22
10660  ssh root@192.168.201.22
10661  ssh root@192.168.201.23
10662  ssh-copy-id root@192.168.201.23
10663* cd /tmp
10664* git clone git@github.com:kubernetes-sigs/kubespray.git
10665* cd  kubespray
10666* ls
10667* cp -rfp inventory/sample inventory/ws
10668* declare -a IPS=(192.168.201.22 192.168.201.23)
10669* CONFIG_FILE=inventory/ws/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
10670* vim inventory/ws/hosts.yaml
10671* vim inventory/ws/group_vars/all/all.yml
10672* vim inventory/ws/group_vars/k8s-cluster/addons.yml
10673* vim inventory/ws/group_vars/k8s-cluster/k8s-cluster.yml
10674* ansible-playbook -i inventory/ws/hosts.yaml  --become --become-user=root cluster.yml --ask-pass
10675* ansible-playbook -i inventory/ws/hosts.yaml -u root  --become --become-user=root cluster.yml --ask-pass
```