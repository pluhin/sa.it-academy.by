# 07.Kubernetes
```
  570  sudo apt-get update && sudo apt-get install -y apt-transport-https
  571  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  572  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
  573  sudo apt-get update
  574  sudo apt-get install -y kubectl
  575  kubectl get pods
  576  minikube adons list
  577  minikube start 
  578  minikube adons list
  579  minikube service list
  580  minikube addons list
  581  minikube addons dashboard enable
  582  minikube addons enable dashboard
  583  kubectl get pods
  584  kubectl get nodes
  585  kubectl proxy --address='0.0.0.0' --disable-filter=true &
  586  kubectl config use-context lab-ecx
  587  kubectl get nodes
  588  sudo apt update
  589  sudo apt install ansible
  590  ssh-copy-id -i new_key.pub jump_sa@178.124.206.53
  591  ssh-copy-id jump_sa@178.124.206.53 -i new_key.pub
  592  ssh-copy-id -i new_key.pub jump_sa@178.124.206.53
  593  ssh-copy-id -i jump_sa@178.124.206.53
  594  nano ~/.ssh/config
  595  nano /etc/ssh/ssh_config
  596  nano ~/.ssh/config
  597  curl -O https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz
  598  sha256sum go1.12.1.linux-amd64.tar.gz
  599  sudo tar -xvf go1.12.1.linux-amd64.tar.gz -C /usr/local
  600  sudo chown -R root:root /usr/local/go
  601  mkdir -p $HOME/go/{bin,src}
  602  nano ~/.profile
  603  . ~/.profile
  604  echo $PATH
  605  go version
  606  go get github.com/digitalocean/godo
  607  ll $GOPATH/src/github.com/digitalocean/godo
  608  sudo apt update
  609  mkdir 3
  610  cd 3 
  611  git clone git@github.com:derailed/k9s.git
  612  ls
  613  cd k9s/
  614  make build && ./execs/k9s
  615  kubectl get nodes
  616  mkdir .kube
  617  scp root@192.168.203.9:/root/.kube/config .kube/config
  618  cd
  619  pwd
  620  scp root@192.168.203.9:/root/.kube/config .kube/config
  621  nano ~/.kube
  622  nano ~/.kube/config
  623  ssh -L 6443:127.0.0.1:6443 root@192.168.203.9 -f -N
  624  kubectl get nodes
  625  scp root@192.168.203.9:/root/.kube/config .kube/config
  626  nano ~/.kube/config
  627  scp root@192.168.203.9:/root/.kube/config .kube/config
  628  ssh -L 6443:127.0.0.1:6443 root@192.168.203.9 -f -N
  629  kubectl get nodes
  630  kubectl get pods --all-namespaces
  631  links https://127.0.0.1:6443/api/v1
  632  curl https://127.0.0.1:6443/api/v1
  633  curl -k https://127.0.0.1:6443/api/v1
  634  nano anon_access.yaml
  635  kubectl create -f dashboard.yaml 
  636  kubectl create -f dashboard.yaml
  637  ps aux | grep proxy
  638  kill 236244
  639  ps aux | grep proxy
  640  kubectl create -f dashboard.yaml
  641  kubectl create -f q.yaml
  642  kubectl create -f dashboard.yaml
  643  autossh --kill dbserver
  644  sudo snap install autossh  # version 1.4, or
  645  autossh --kill dbserver
  646  sudo nano /etc/ssh/sshd_config
  647  sudo systemctl restart ssh.service
  648  scp root@192.168.203.9:/root/.kube/config .kube/config
  649  kubectl create -f dashboard.yaml
  650  ssh -L 6443:127.0.0.1:6443 root@192.168.203.9 -f -N
  651  kubectl create -f dashboard.yaml
  652  kubectl get pods --all-namespaces
  653  kubectl create -f dashboard.yaml
  654  kubectl create -f dashboard.yaml 
  655  curl -k https://127.0.0.1:6443/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
  656  kubectl get pods -n kubernetes-dashboard
  657  /api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.
  658  kubectl create -f dashboard.yaml 
  659  nano w.yaml
  660  cd 1/test/test_hub/
  661  git add .
  662  git commit -m "07"
  663  git push
  664  cd ..
  665  cd 1/sa.it-academy.by/IKorolev/
  666  git push
  667  git pull
  668  git add .
  669  git commit -m "07"
  670  git push
  671  cd ..
  672  cd test/test_hub/k8/
  673  ls
  674  mkdir 1 
  675  cd 1 
  676  nano Vagrant
  677  Vagrant upp
  678  Vagrant up
  679  vagrant
  680  vagrant up
  681  kubectl version
  682  cd ..
  683  kubectl version
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
  701  kubectl 
  702  kubectl --v
  703* 
  704  kubectl get pods -n kube-system
  705  kubectl proxy --address='0.0.0.0' --disable-filter=true &
  706  kubectl get nodes
  707  kubectl config view
  708  ps aux | grep proxy
  709  ps aux | grep "kubectl proxy"
  710  kill 28324
  711  kill 745352
  712  kill 19005
  713  kill 28324
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
  730  git clone git@github.com:kubernetes-sigs/kubespray.git
  731  cd kubespray
  732  ansible --version
  733  cp -rfp inventory/sample inventory/ws
  734  declare -a IPS=(192.168.203.9 192.168.203.10)
  735  CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  736  CONFIG_FILE=inventory/ws/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  737  echo $IPS
  738  declare -a IPS=(192.168.203.9 192.168.203.10)
  739  echo $IPS
  740  ssh-copy-id root@178.124.203.10
  741  declare -a IPS=(192.168.203.9 192.168.203.10)
  742  echo $IPS
  743  CONFIG_FILE=inventory/ws/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  744  ssh root@192.168.203.9
  745  vim inventory/ws/hosts.yaml
  746  cd ..
  747  history
  748  history >> README.md
  ```
