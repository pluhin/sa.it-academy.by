## Setup

```bash
  20  clear
   21  ls -l
   22  ls -la
   23  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   24  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
   25  kubectl --version
   26  kubectl version
   27  clear
   28  kubectl get nodes
   29  mkdir .kube
   30  vim kubespray/inventory/plu/hosts.yaml
   31  scp root@192.168.203.23:/root/.kube/config ~/.kube/config
   32  vim .ssh/config
   33  scp root@192.168.203.23:/root/.kube/config ~/.kube/config
   34  cat .kube/config
   35  clear
   36  history
   37  ssh -L 6443:127.0.0.1:6443 root@192.168.20.23 -f -N
   38  ssh -L 6443:127.0.0.1:6443 root@192.168.203.23 -f -N
   39  kubectl get nodes
   40  vim inv.yaml
   41  ansible -i inv.yaml ansible_ws -u root -m shell -a "kubectl get nodes" --ask-pass
   42  vim ansible.cfg
   43  ansible -i inv.yaml ansible_ws -u root -m shell -a "kubectl get nodes" --ask-pass
   44  clear
   45  ps aux | 127
   46  ps aux | grep  127
   47  kill -9 1223
   48  kubectl get nodes
   49  sudo apt-get install sshuttle
   50  sshuttle -r ec_bastion 192.168.0.0/16
   51  sshuttle -r ec_bastion 192.168.0.0/16 &
   52  vim .kube/config
   53  kubectl get nodes
   54  kubectl get ns
   55  kubectl get namespaces
   56  mkdir src
   57  cd src/
   58  wget Download Go for Linux
   59  wget https://go.dev/dl/go1.17.7.linux-amd64.tar.gz
   60  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.7.linux-amd64.tar.gz
   61  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.7.linux-amd64.tar.gz
   62  go version
   63  export PATH=$PATH:/usr/local/go/bin
   64  go version
   65  history
   66  wget https://github.com/derailed/k9s/releases/download/v0.25.18/k9s_Linux_x86_64.tar.gz
   67  ls -l
   68  vim k9s_Linux_x86_64.tar.gz
   69  sudo tar -C /usr/local -xzf k9s_Linux_x86_64.tar.gz
   70  k9s
   71  sudo tar -C /usr/local/bin/ -xzf k9s_Linux_x86_64.tar.gz
   72  k9s
   73  history
   74  k9s
   75  history
   76  k9s
   77  ssh root@192.168.203.36
   78  history
```

## K3s install

```bash
   42  apt update
   43  apt install curl
   44  curl -sfL https://get.k3s.io | sh -
   45  kubectl get nodes
   46  history
```