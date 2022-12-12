# 10.K8s

## Install k3s
```
curl -fL https://get.k3s.io |  sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
```

## History

```bash
379  mkdir 10.K8s.WS
  380  cd 10.K8s.WS/
  381  ls
  382  ssh root@192.168.203.18
  383  vim ~/.ssh/config
  384  ssh root@192.168.203.18 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  385  kubectl
  386  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  387  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  388  kubectl version
  389  wget https://go.dev/dl/go1.19.4.linux-amd64.tar.gz
  390  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.4.linux-amd64.tar.gz
  391  vim ~/.profile
  392  source ~/.profile
  393  go
  394  go version
  395  wget https://github.com/derailed/k9s/releases/download/v0.26.7/k9s_Linux_x86_64.tar.gz
  396  sudo tar -C /usr/local -xzf k9s_Linux_x86_64.tar.gz
  397  k9s
  398  ls -l /usr/local/k9s
  399  k9s
  400  vim ~/.profile
  401  ls -l /usr/local/
  402  sudo tar -C /usr/local/bin -xzf k9s_Linux_x86_64.tar.gz
  403  k9s
  404  s
  405  ls
  406  mc
  407  k9s
  408  history | grep ssh
  409  ssh root@192.168.203.5 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  410  mkdir ~/.kube && scp root@192.168.203.5:/etc/rancher/k3s/k3s.yaml ~/.kube/config -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  411  mkdir ~/.kube && scp -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" root@192.168.203.5:/etc/rancher/k3s/k3s.yaml ~/.kube/config
  412  scp -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" root@192.168.203.5:/etc/rancher/k3s/k3s.yaml ~/.kube/config
  413  k9s
  414  apt-get install sshuttle
  415  sudo apt-get install sshuttle
  416  ssh root@192.168.201.2
  417  sshuttle -r jump_sa@178.124.206.53 192.168.0.0/16
  418  sshuttle -r jump_sa@178.124.206.53 192.168.0.0/16 &
  419  ssh root@192.168.201.2
  420  curl 192.168.201.1
  421  ps aux | grep sshuttle
  422  kill 60982 60983
  423  kill  60982
  424  sudo kill -9 60982
  425  sudo kill -9 60983
  426  ps aux | grep sshuttle
  427  sudo kill -9 60980
  428  ps aux | grep sshuttle
  429  vim ~/.ssh/config
  430  vim ~/.kube/config
  431  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.5 -f -N
  432  kubectl gent pods -A
  433  kubectl get pods -A
  434  k9s
  435  cd /vagrant/10.K8s.WS/
  436  ls
  437  vim test_pod.yaml
  438  kubectl apply -f test_pod.yaml
  439  k9s
  440  kubectl get pods
  441  kubectl exec ubuntu -- bash
  442  kubectl exec -it ubuntu -- bash
  443  kubectl get pods -A
  444  history
```