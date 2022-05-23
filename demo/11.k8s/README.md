## K8s setup local

```bash
  383  clear
  384  ls -l
  385  cd k8s/
  386  ls
  387  cd kubespray/
  388  ansible -i inventory/plu/hosts.yaml -m shell -a "kubectl get nodes" all --ask-pass
  389  ansible -i inventory/plu/hosts.yaml -m shell -a "kubectl get nodes" node1 --ask-pass
  390  cd  ../
  391  clear
  392  vim ~/.ssh/config
  393  cd kubespray/
  394  ansible -i inventory/plu/hosts.yaml -m shell -a "kubectl get nodes" node1 --ask-pass
  395  cd ..
  396  ssh root@192.168.203.7
  397  ssh root@192.168.203.57
  398  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  399  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  400  rm kubectl
  401  kubectl --version
  402  kubectl version
  403  mkdir ~/.kube
  404  ls -la ~
  405  scp root@192.168.203.57:/root/.kube/config ~/.kube/config
  406  kubectl version
  407  vim ~/.ssh/config
  408  scp root@192.168.203.57:/root/.kube/config ~/.kube/config -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  409  scp -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" root@192.168.203.57:/root/.kube/config ~/.kube/config
  410  vim ~/.kube/config
  411  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.57 -f -N
  412  kubectl get nodes
  413  vim ~/.ssh/config
  414  ssh root@192.168.203.3
  415  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" root@192.168.203.3
  416  kubectl get nodes
  417  ps aux | grep 127
  418  sudo kill -9 1718
  419  kubectl get nodes
  420  vim ~/.ssh/config
  421  sudo apt install sshuttle
  422  sshuttle -r ec_bastion 192.168.0.0/16 &
  423  vim ~/.kube/config
  424  kubectl get nodes
  425  curl https://192.168.37.105
  426  curl https://192.168.37.105 --insecure
  427  curl https://192.168.37.222 --insecure
  428  ps aux | grep bastion
  429  kill -9 1984
  430  sudo kill -9 1984
  431  ps aux | grep bastion
  432  vim ~/.kube/config
  433  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" root@192.168.203.3
  434  history | grep ssh
  435  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.57 -f -N
  436  kubectl get nodes
  437  kubectl get ns
  438  kubectl get namespace
  439  kubectl get pods
  440  kubectl get pods -A
  441  wget https://go.dev/dl/go1.18.2.linux-amd64.tar.gz
  442  ls
  443  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.2.linux-amd64.tar.gz
  444  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.18.2.linux-amd64.tar.gz
  445  go version
  446  ls -l /usr/local/go/
  447  ls -l /usr/local/go/bin
  448  export PATH=$PATH:/usr/local/go/bin
  449  go version
  450  vim ~/.profile
  451  history
  452  wget https://github.com/derailed/k9s/releases/download/v0.25.18/k9s_Linux_x86_64.tar.gz
  453  sudo tar -C /usr/local -xzf k9s_Linux_x86_64.tar.gz
  454  k9s
  455  sudo tar -C /usr/local/bin -xzf k9s_Linux_x86_64.tar.gz
  456  k9s
  457  history
  458  k9s
  459  ps aux | grep 127
  460  kubectl get namespace
  461  kubectl get nodes
  462  kubectl get namespace
  463  history
```

## k3s

See [Vagrantfile](./Vagrantfile)