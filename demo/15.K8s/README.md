```bash
1569  cd ../sa.it-academy.by/
 1570  git pull
 1571  cd demo
 1572  ls
 1573  mkdir 15.K8s
 1574  cd 15.K8s
 1575  mkdir mini
 1576  cd mini
 1577  vim Vagrantfile
 1578  ifconfig
 1579  vim Vagrantfile
 1580  vagrant up
 1581  cd /tmp/sa.it-academy.by/demo/15.K8s
 1582  ls
 1583  cd mini
 1584  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin
 1585  minikube start --help
 1586  minikube start
 1587  kubectl proxy --address='0.0.0.0' --disable-filter=true
 1588  minikube dashboard
 1589  kubectl proxy --address='0.0.0.0' --disable-filter=true
 1590  kubectl get nodes
 1591  vim ~/.kube/config
 1592  minikube service list
 1593  minikube stop
 1594  cd ../
 1595  cd /tmp
 1596  mc
 1597* vagrant halt
 1598  cd sa.it-academy.by/demo/15.K8s
 1599  cd k8s
 1600  ls
 1601* vagrant destroy -f
 1602  ls
 1603  vim Vagrantfile
 1604  vagrant up
 1605* cd /tmp
 1606* git clone git@github.com:kubernetes-sigs/kubespray.git
 1607* cd kubespray
 1608* ls
 1609* cp -rfp inventory/sample inventory/plu
 1610* declare -a IPS=(10.20.40.30 10.20.40.31 10.20.40.32 10.20.40.33)
 1611* CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
 1612* vim inventory/plu/hosts.yaml
 1613  ssh vagrant@10.20.40.30
 1614* ansible-playbook -i inventory/plu/hosts.yaml -u vagrant -b cluster.yml
 1615  top
 1616  vagrant globla-status
 1617  vagrant global-status
 1618  cd /home/plu/sa/infra/
 1619  vagrant halt
 1620  cd /tmp/sa.it-academy.by

kubectl create serviceaccount dashboard-admin-sa
kubectl create clusterrolebinding dashboard-admin-sa --clusterrole=cluster-admin --serviceaccount=default:dashboard-admin-sa
kubectl get secrets
```
