# 07.Kubernetes
```
  684  ssh-copy-id  root@192.168.203.9
  685  ssh-copy-id  root@192.168.203.10
  686  ssh root@192.168.203.9
  687  ssh root@192.168.203.10
  688  ssh root@192.168.203.9
  689  nano w.yaml
  690  kubectl create -f dashboard.yaml 
  691  kubectl create -f w.yaml 
  692  sudo apt install ansible
  693  sudo nano /etc/ansible/hosts
  694  minikube start
  695  minikube ssh
  696  minikube addons list
  697  minikube addons enable dashboard
  698  minikube addons list
  699  kubectl get nodes
  700  kubectl get pods
  704  kubectl get pods -n kube-system
  705  kubectl proxy --address='0.0.0.0' --disable-filter=true &
  706  kubectl get nodes
  707  kubectl config view
  708  ps aux | grep proxy
  709  ps aux | grep "kubectl proxy"
  710  kill 28324
  714  minikube stop
  715  minikube start
  716  kubectl get nodes
  717  ubectl proxy --address='0.0.0.0' --disable-filter=true &
  718  kubectl proxy --address='0.0.0.0' --disable-filter=true &
  719  ssh jump_sa@178.124.206.53
  720  ssh-keygen
  721  ssh-copy-id jump_sa@178.124.206.53 -i new_key.pub
  722  ssh-copy-id -i new_key.pub jump_sa@178.124.206.9
  723  nano  ~/.ssh/config
  724  ssh root@192.168.203.9
  725  ssh-copy-id root@178.124.206.9
  726  ssh-copy-id root@178.124.203.9
  727  ssh-copy-id root@192.168.203.9
  728  ssh-copy-id root@192.168.203.10
  729  minikube stop
  948  apt-get install python3-pip
  949  pip3  install -r contrib/inventory_builder/requirements.txt
  950  apt-get install python3-pip
  951  pip3  install -r contrib/inventory_builder/requirements.txt
  952  sudo apt install python3-pip
  953  pip3  install -r contrib/inventory_builder/requirements.txt
  954  CONFIG_FILE=inventory/ws/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  955  ansible-playbook -i inventory/ws/hosts.yaml  -u root cluster.yml
  956  history 
  ```
## Screen
![alt text](https://github.com/Korolev731/sa.it-academy.by/blob/md-sa2-16-21/IKorolev/07./1.png)
![alt text](https://github.com/Korolev731/sa.it-academy.by/blob/md-sa2-16-21/IKorolev/07./2.png)
