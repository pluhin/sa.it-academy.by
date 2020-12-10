https://127.0.0.1:6443/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/secret?namespace=default

```bash
10337* git pull
10338* git log --oneline
10339* mkdir 08.K8s 
10340* cd 08.K8s
10341  vim inventory/ws/group_vars/k8s-cluster/k8s-cluster.yml
10342  vim inventory/ws/inventory.ini
10343  vim inventory/ws/hosts.yaml
10344* ssh root@192.168.203.21
10345  cd ~/Documents/git_repos/home/sa.it-academy.by/demo/08.K8s
10346  kubectl --version
10347  kubectl --client
10348  kubectl version --client
10349  vim ~/.kube/config_ec_ws
10350  ssh -L 6443:localhost:6443 root@192.168.203.21 -f -N; export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config_ec_ws
10351  kubectl get pods --all-namespaces 
10352  ps aux | grep localhost
10353  netstat -npt | grep 6443
10354  sudo netstat -npt | grep 6443
10355  sudo netstat -nlt | grep 6443
10356* top
10357  vim ~/.kube/config_ec_ws
10358  scp root@192.168.203.21:/root/.kube/config ./
10359  ls
10360  ls -ll
10361  rm config
10362  kubectl get pods --all-namespaces  
10363  time kubectl get pods --all-namespaces  
10364  vim ~/.kube/config_ec_ws
10365  kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="ExternalIP")].address}'
10366  kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}'
10367  vim dashboard.yaml
10368  ls
10369  kubectl create -f dashboard.yaml
10370  kubectl get pods --all-namespaces  
10371  kubectl delete pods -n kubernetes-dashboard dashboard-metrics-scraper-7445d59dfd-wphqt
10372  kubectl get pods --all-namespaces  
10373  vim dashboard.yaml
10374  kubectl delete -f  dashboard.yaml
10375  kubectl create -f dashboard.yaml
10376  sudo apt install links
10377  links https://127.0.0.1:6443/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/\#/secret\?namespace\=default
10378  history
10379  links https://127.0.0.1:6443/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/\#/secret\?namespace\=default
10380  vim anon.yaml
10381  kubectl create -f anon.yaml
10382  links https://127.0.0.1:6443/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/\#/secret\?namespace\=default
10383  vim dashboard.yaml
10384  kubectl create -f dashboard.yaml
10385  kubectl apply -f dashboard.yaml
10386  kubectl delete -f dashboard.yaml
10387  kubectl create -f dashboard.yaml
10388  links https://127.0.0.1:6443/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/\#/login
10389  kubectl create serviceaccount dashboard-admin-sa
10390  kubectl create clusterrolebinding dashboard-admin-sa --clusterrole=cluster-admin --serviceaccount=default:dashboard-admin-sa
10391  kubectl get secrets 
10392  kubectl describe secrets dashboard-admin-sa-token-zngbb
10393  go --version
10394  go -version
10395  go version
10396* cd /tmp
10397* wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz
10398* sudo tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz
10399* export PATH=$PATH:/usr/local/go/bin
10400* go version
10401* history
10402* vim ~/.bashrc
10403* git clone git@github.com:derailed/k9s.git
10404* cd k9s
10405* make build
10406* top
10407* whereis k9s
10408* sudo cp ./execs/k9s /usr/bin/k9s
10409* history
10410  k9s
10411  go version
10412* export PATH=$PATH:/usr/local/go/bin
10413* cd /tmp/k9s/
10414* make build
10415* top
10416* htop
10417* sudo apt install htop
10418* htop
10419* rm execs/k9s
10420* make build
10421* ls -l execs/k9s
10422* ls -l execs/k9s -h
10423  k9s
10424  vim ksm.yaml
10425  kubectl create -f ksm.yaml
10426  kubectl create -f ns.yaml
10427  k9s
10428  kubectl get secrets 
10429  env 
10430  k9s
10431  cat ~/.kube/config_k3s
10432  :q1
10433  sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC=--write-kubeconfig /home/spishchyk/.kube/config_k3s sh - 
10434  ls -l ~/.kube/
10435* cd ~
10436* pwd
10437  sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig ~/.kube/config_k3s" sh - 
10438* ps aux | grep localhost
10439* kill -9 2700882
10440  sudo service k3s start
10441  ls -l ~/.kube/
10442  history| grep local
10443  export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config_k3s
10444  kubectl get nodes
10445  export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config_k3s
10446* ps aux | grep 6443
10447* netstat -npt | grep 6443
10448  kubectl get nodes
10449  ls -l ~/.kube/
10450  env
10451  unset KUBECONFIG
10452  env
10453  export KUBECONFIG=$HOME/.kube/config_k3s
10454  kubectl get nodes
10455  history
10456  kubectl get nodes
10457  vim ~/.bashrc
10458  sh /usr/local/bin/k3s-uninstall.sh
10459  sudo sh /usr/local/bin/k3s-uninstall.sh

```