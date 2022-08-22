# Kubernetes Installation

### Aliases
```bash
  416  alias k='kubectl'
  419  alias kg='kubectl get'
  420  alias kgpo='kubectl get pods'
```
## Screenshots
### K8s cluster
<dv>
<img src="https://dub01pap001files.storage.live.com/y4mQLZZKpz4WCi26KIL03lBKPA6gX-lLkQdujTOK61Ll6OSddTZ_Y4X-ccV0A3-aj3yxOCmJ8ArrVuktok7MNSfAxpGkeb6kWfPFFF9KeuknysYcqJKh5sJryrma67ePD--_CpJsbPOgxxrUAZmeEc8BaPLIQg0uArG9uqJPSRNlT94q4JZaJgCjfiW_hY38tzy?width=2139&height=1105&cropmode=none" width="auto" height="auto" />
</dv>

### K3s cluster
<dv>
<img src="https://dub01pap001files.storage.live.com/y4m31SfOT_oiCWoEh7R_eCqX-6QGJAuvBK_J-8TqeyX2FU-QMjH_xvl-4IRFUJfRNS1Fn4XTlw3rWOkzsjQyeWj_My9oo6Ol_hoSDqLj9oGWvWtqXNyVErFlfZJWwhDhmAhGsXgp5RJ03--JenuMSCtXIcKbiwULS0QzJKLcB92Ja8lBw6TWj_FGC7pQGN7i5Zn?width=2137&height=1107&cropmode=none" width="auto" height="auto" />
</dv>

## History
```bash
  348  cd ~
  349  mkdir 11.Kubernetes
  350  cd 11.Kubernetes/
  351  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  352  ls -ll
  353  mkdir .kube
  354  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  355  scp -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" root@192.168.203.25:/root/.kube/config ~/.kube/config
  356  cd ..
  357  mkdir .kube
  358  cd 11.Kubernetes/
  359  scp -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" root@192.168.203.25:/root/.kube/config ~/.kube/config
  360  scp -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" root@192.168.203.25:/root/.kube/config /home/anton/11.Kubernetes/.kube/config
  361  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.25 -f -N
  362  kubectl get nodes
  363  kubectl get namespaces
  364  echo 'source <(kubectl completion bash)' >>~/.bashrc
  365  echo 'alias k=kubectl' >>~/.bashrc
  366  echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
  367  source ~/.bashrc
  368  k get -n kube-system pods
  369  k get -n kube-system pods nginx-proxy-node2
  370  k discribe -n kube-system pods nginx-proxy-node2
  371  k describe -n kube-system pods nginx-proxy-node2
  372  kubectl get pods -A -o wide
  373  kubectl get service -A -o wide
  374  wget https://go.dev/dl/go1.19.linux-amd64.tar.gz
  375  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz
  376  export PATH=$PATH:/usr/local/go/bin
  377  go --version
  378  go version
  379  nano ~/.bashrc
  380  go version
  381  ls
  382  rm go1.19.linux-amd64.tar.gz
  383  wget https://github.com/derailed/k9s/releases/download/v0.26.3/k9s_Linux_x86_64.tar.gz
  384  sudo tar -C /usr/local/bin -xzf k9s_Linux_x86_64.tar.gz
  385  k9s
  386  history
  387  cd ~
  388  ls -ll
  389  cd .kube/
  390  ls -ll
  391  cp ~/.kube/config ~/.kube/config.bak
  392  ls -ll
  393  cd ..
  394  mkdir k3s
  395  ls -ll
  396  scp -i /mnt/d/Projects/11.Kubernetes.installation/.vagrant/machines/default/virtualbox/private_key vagrant@192.168.56.110:/vagrant/.kube/config ~/k3s/config
  397  scp -i /mnt/d/Projects/11.Kubernetes.installation/.vagrant/machines/default/virtualbox/private_key vagrant@192.168.56.110:/etc/rancher/k3s/k3s.yaml ~/k3s/config
  398  ping 192.168.56.110
  399  nano k3s/config
  400  KUBECONFIG=~/.kube/config:~/k3s/config kubectl config view --flatten > /tmp/config
  401  cat /tmp/config
  402  mv /tmp/config ~/.kube/config -v
  403  kubectl get nodes
  404  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.25 -f -N
  405  kubectl get nodes
  406  kubectl cluster-info
  407  kubectl config view
  408  kubectl config get-contexts
  409  kubectl config use-context default
  410  kubectl config get-contexts
  411  kubectl get nodes
  412  k9s
  413  kubectl config use-context kubernetes-admin@cluster.local
  414  kubectl get nodes
  415  $alias
  416  alias k='kubectl'
  417  $alias
  418  k get nodes
  419  alias kg='kubectl get'
  420  alias kgpo='kubectl get pods'
  421  kg nodes
  422  kgpo
```