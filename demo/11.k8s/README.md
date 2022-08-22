## K8s

```bash
  450  mkdir 11.K8s
  451  cd 11.K8s/
  452  ls
  453  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  454  ls
  455  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  456  kubectl --version
  457  kubectl version
  458  mkdir ~/.kube
  459  scp -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" root@192.168.203.35:/root/.kube/config ~/.kube/config
  460  vim ~/.kube/config
  461  vim ../10.K8s/kubespray/inventory/plu/hosts.yaml
  462  vim ~/.kube/config
  463  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.35 -f -N
  464  netstat
  465  apt install network-tools
  466  sudo apt install network-tools
  467  sudo apt install net-tools
  468  netstat -ntp
  469  netstat -ntpa
  470  kubectl get nodes
  471  cd 11.K8s/
  472  ls
  473  rm kubectl
  474  kubectl
  475  clear
  476  ps aux | 6443
  477  ps aux | grep 6443
  478  kill 79379
  479  ps aux | grep 6443
  480  kubectl get nodes
  481  vim ~/.kube/config
  482  sudo apt install sshuttle
  483  vim ~/.ssh/config
  484  sshuttle -r ec_bastion 192.168.0.0/16 &
  485  kubectl get nodes
  486  vim ~/.kube/config
  487  curl https://192.168.203.35:6443
  488  ssh root@192.168.37.1
  489  ssh root@192.168.37.205
  490  ssh root@192.168.37.105
  491  ps aux | grep sshu
  492  kill 80122
  493  ps aux | grep sshud
  494  vim ~/.kube/config
  495  vim ~/.ssh/config
  496  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.35 -f -N
  497  kubectl get nodes
  498  kubectl get namespaces
  499  sudo apt-get install bash-completion
  500  echo 'source <(kubectl completion bash)' >>~/.bashrc
  501  echo 'alias k=kubectl' >>~/.bashrc
  502  echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
  503  source ~/.bashrc
  504  history
  505  clear
  506  k get -n kube-system pods nginx-proxy-node2
  507  k describe -n kube-system pods nginx-proxy-node2
  508  k describe -n kube-system pods nginx-proxy-node2 -o yaml
  509  k describe -n kube-system pods nginx-proxy-node2 --o yaml
  510  k describe -n kube-system pods nginx-proxy-node2 --yaml
  511  k describe -n kube-system pods nginx-proxy-node2 -o=yaml
  512  k describe -n kube-system pods nginx-proxy-node2 -o yaml
  513  k get  -n kube-system pods nginx-proxy-node2 -o yaml
  514  kubectl get pods -A
  515  kubectl get pods -A -wide
  516  kubectl get pods -A --wide
  517  kubectl get pods -A -o wide
  518  kubectl get service -A -o wide
  519  vim ../10.K8s/kubespray/inventory/plu/group_vars/k8s_cluster/k8s-cluster.yml
  520  go
  521  ls
  522  wget https://go.dev/dl/go1.19.linux-amd64.tar.gz
  523  sudo rm -rf /usr/local/go && sudo  tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz
  524  ls -l /usr/local/go/bin/
  525  export PATH=$PATH:/usr/local/go/bin/
  526  go version
  527  vim ~/.bashrc
  528  source ~/.bashrc
  529  go version
  530  vim ~/.bashrc
  531  cd 11.K8s/
  532  go version
  533  history
  534  go version
  535  ls
  536  rm go1.19.linux-amd64.tar.gz
  537  wget https://github.com/derailed/k9s/releases/download/v0.26.3/k9s_Linux_x86_64.tar.gz
  538  ls
  539  tar -C /usr/local/bin -xzf k9s_Linux_x86_64.tar.gz
  540  sudo tar -C /usr/local/bin -xzf k9s_Linux_x86_64.tar.gz
  541  history
  542  k9s
  543  sleep 5s
  544  history
```