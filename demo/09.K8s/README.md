```bash
  467  clear
  468  free
  469  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  470  sudo install minikube-linux-amd64 /usr/local/bin/minikube
  471  ls -l
  472  ls -l /usr/local/bin/minikube
  473  ls
  474  rm minikube-linux-amd64
  475  minikube start
  476  minikube status
  477  minikube addon list
  478  minikube addons list
  479  minikube addons enable dashboard
  480  kubectl proxy --address='0.0.0.0' --disable-filter=true &
  481  ps aux | grep kubec
  482  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  483  ls
  484  rm kubectl
  485  ls
  486  kubectl get pods -A
  487  kubectl proxy --address='0.0.0.0' --disable-filter=true &
  488  kubectl get svc -A
  489  kubectl get svc kubernetes-dashboard -n kubernetes-dashboard -o yaml
  490  ps aux  | grep proxy
  491  kill -9 135878
  492  minikube stop
  493  minikube delete
  494  cd /tmp/
  495  cd ~/
  496  cd la
  497  mkdir 09.K8s
  498  cd 09.K8s/
  499  git clone git@github.com:kubernetes-sigs/kubespray.git
  500  cd kubespray/
  501  sudo pip3 install -U -r requirements.txt
  502  cp -rfp inventory/sample inventory/plu
  503  ls -l inventory/plu/
  504  vim inventory/plu/group_vars/all/all.yml
  505  declare -a IPS=(192.168.208.XX 192.168.208.YY)
  506  CONFIG_FILE=inventory/plu/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  507  vim inventory/plu/hosts.yaml
  508  ansible-playbook -i inventory/mycluster/hosts.yaml  -u root cluster.yml --ask-pass
  509  ansible-playbook -i inventory/plu/hosts.yaml  -u root cluster.yml --ask-pass
  510  history
```

## Minikube dashboard

http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/workloads?namespace=default

## K8s deployment

Monday 12 February 2024  18:44:28 +0000 (0:00:00.180)       0:23:41.582 *******

---
