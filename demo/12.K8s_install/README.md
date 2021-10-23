

```bash
   19  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   20  apt install curl
   21  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
   22  ls
   23  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   24  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
   25  kubectl --version
   26  kubectl -v
   27  kubectl --version
   28  kubectl --help
   29  kubectl version
   30  ls -l
   31  rm kubectl
   32  kubectl version
   33  vim kubespray/inventory/plu/hosts.yaml
   34  ls -la
   35  mkdir .kube
   36  scp root@192.168.203.21:/root/.kube/config .kube/
   37  history
   38  chmod 600 .kube/config
   39  vim .kube/config
## in config need to change ip to master ip, 192.168.203.XX
   40  history
   41  vim .kube/config
   42  kubectl get nodes
   43  vim .kube/config
   44  kubectl get nodes
   45  kubectl get ns
   46  kubectl get namespaces
   47  kubectl get pods
   48  kubectl get pods --all-namespaces
   49  wget https://golang.org/dl/go1.17.2.linux-amd64.tar.gz
   51  ls -l
   52  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.2.linux-amd64.tar.gz
   53  go version
   54  export PATH=$PATH:/usr/local/go/bin
   55  vim .profile
   56  source .profile
   57  env
   58  go version
   59  history
   60  wget https://github.com/derailed/k9s/releases/download/v0.24.15/k9s_Linux_x86_64.tar.gz
   61  tar -C /usr/local -xzf k9s_Linux_x86_64.tar.gz
   62  k9s
   63  ls -l /usr/local/k9s
   64  tar -C /usr/local/bin/ -xzf k9s_Linux_x86_64.tar.gz
   65  ls -l /usr/local/bin/k9s
   66  chown root:root /usr/local/bin/k9s
   67  k9s
   68  history
   69  k9s
   70  vim ms.yaml
   71  kubectl create -f ms.yaml
   72  kubectl get pods --all-namespaces
   73  k9s
   74  git clone https://github.com/kubernetes/kube-state-metrics
   75  kubectl apply -f kube-state-metrics/examples/standard/
   76  kubectl get pods --all-namespaces
   77  k9s
   78  kubectl delete -f kube-state-metrics/examples/standard/
   79  vim ksm.yaml
   80  kubectl apply -f ksm.yaml
   81  k9s
   82  kubectl delete -f ksm.yaml
   83  kubectl apply -f kube-state-metrics/examples/standard/
   91  k9s
   92  ls -l ./kube/co
   93  ls -l .kube/config
   96  wget https://github.com/kubernetes-sigs/metrics-server/releases/download/metrics-server-helm-chart-3.6.0/components.yaml
   97  mv components.yaml ms.yaml
## See metric-server.yaml there was added line #137 :         - --kubelet-insecure-tls
  107  kubectl apply -f ms.yaml
  108  k9s
  109  hsito
  110  history
```

---

## Setup access with bastion

vim .ssh/config

```
###################################
# EC HTP
Host ec_bastion
        User jump_sa
        HostName 178.124.206.53
Host 192.168.201.* 192.168.202.* 192.168.203.*
        ProxyJump ec_bastion
```

```bash
 1003  scp root@192.168.203.21:/root/.kube/config .kube/ec_htp_sa
 1004  ssh-copy-id jump_sa@178.124.206.53
 1005  ls -l .kube/ec_htp_sa
 1006  ssh -L 6443:127.0.0.1:6443 root@192.168.203.21 -f -N
 1007  export KUBECONFIG=$KUBECONFIG:$HOME/.kube/ec_htp_sa
 1008  kubectl get nodes
 1009  ps aux | grep 127
 1010  kill -9 23580
 1011  kubectl get nodes
 1015  vim .kube/ec_htp_sa
```