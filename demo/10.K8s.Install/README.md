# Setup work environment

## Install K3s

```bash
   43  apt update
   44  apt install curl
   45  curl -fL https://get.k3s.io |  sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
   46  service k3s status
   47  kubectl get pods -A
   48  cat /etc/rancher/k3s/k3s.yaml
```

Uninstall: `/usr/local/bin/k3s-uninstall.sh`

## Your local environment

```bash
  ## copy both configs from your clusters to your local host
  scp root@192.168.208.15:/root/.kube/config ~/.kube/config
  scp root@192.168.203.8:/etc/rancher/k3s/k3s.yaml ~/.kube/config-k3s
  ## Create tunnels to your clusters (our bastion host should be set aslready in ~/.ssh/config, please see Ansible webinar)
  ssh -L 6443:127.0.0.1:6443 root@192.168.208.15 -f -N
  ssh -L 6444:127.0.0.1:6443 root@192.168.203.8 -f -N
  ## If you set 6444 port for k3s, please change server record in  kube config as well
  cat ~/.kube/config | grep "server"
    server: https://127.0.0.1:6443
  cat ~/.kube/config-k3s | grep "server"
    server: https://127.0.0.1:6444
  ## Validate
  kubectl get nodes -A --kubeconfig ~/.kube/config-k3s
  kubectl get nodes -A --kubeconfig ~/.kube/config
  ## you can rename names inside config-k3s:
  cat ~/.kube/config-k3s | grep "k3s"
      name: k3s
        cluster: k3s
        user: k3s
      name: k3s
    current-context: k3s
    - name: k3s
  ## and inside config
  cat ~/.kube/config_28 | grep "k8s"
      name: k8s
        cluster: k8s
        user: k8s
      name: k8s
    current-context: k8s
    - name: k8s
  export KUBECONFIG=$HOME/.kube/config-k3s:$HOME/.kube/config
  ## Validate
  kubectl get pods -A --context "k8s"
  kubectl get pods -A --context "k3s"

```

## Environment in it-academy

> No tunnels are needed

```bash
  scp 192.168.208.15:/root/.kube/config /home/user/.kube/config
  scp root@192.168.208.15:/root/.kube/config /home/user/.kube/config
  cat /home/user/.kube/config
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  kubectl version
  kubectl get nodes
  kubectl get pods -A
  scp root@192.168.203.8:/etc/rancher/k3s/k3s.yaml /home/user/.kube/config-k3s
  wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz
  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
  vim .bashrc
  ### Added line to the end of file: export PATH=$PATH:/usr/local/go/bin 
  source .bashrc
  go version
  wget https://github.com/derailed/k9s/releases/download/v0.32.5/k9s_Linux_amd64.tar.gz
  sudo tar -C /usr/local/bin -xzf k9s_Linux_amd64.tar.gz
  export KUBECONFIG=$HOME/.kube/config-k3s:$HOME/.kube/config
  k9s
  kubectl create -f pod.yaml --context "k8s"
```
