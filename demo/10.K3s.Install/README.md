# 10.K3s.Install


```bash

   41  curl -fL https://get.k3s.io |  sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
   42  apt update
   43  apt install curl
   44  curl -fL https://get.k3s.io |  sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
   45  top
   46  c
   47  clear
   48  kubectl get pods -A
   49  kubectl get pods -A
   50  history
   51  kubectl get pods -A
   52  top
   53  kubectl get pods -A
   54  top
   55  service k3s status
   56  history

```


/usr/local/bin/k3s-uninstall.sh


```bash
  565  mkdir 10.K8s.Install
  566  cd 10.K8s.Install/
  567  ls
  568  ssh root@192.168.203.20
  569  history | grep proxy
  570  history | grep Proxy
  571  vim ~/.ssh/config
  572  ssh root@192.168.203.20 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  573  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  574  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  575  kubectl version
  576  mkdir ~/.kube
  577  vim ~/.kube/config
  578  ls -l ~/.kube/
  579  scp -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" root@192.168.203.20:/etc/rancher/k3s/k3s.yaml ~/.kube/config
  580  vim ~/.kube/config
  581  scp -r -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" root@192.168.203.20:/etc/rancher/k3s/ /tmp/
  582  ls -l /tmp/
  583  ls -l /tmp/k3s/
  584  history
  585  vim ~/.kube/config
  586  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.20 -f -N
  587  kubectl get pods -A
  588  vim ~/.kube/config
  589  kubectl get pods -A --context default
  590  ls -l/usr/local/go
  591  ls -l /usr/local/go
  592  wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
  593  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz
  594  go vrersion
  595  vim ~/.profile
  596  source ~/.profile
  597  go
  598  history
  599  source ~/.profile
  600  vim ~/.profile
  601  wget https://github.com/derailed/k9s/releases/download/v0.27.3/k9s_Linux_amd64.tar.gz
  602  sudo tar -C /usr/local -xzf k9s_Linux_amd64.tar.gz
  603  k9s
  604  ls -l /usr/local/k9s
  605  sudo tar -C /usr/local/bin -xzf k9s_Linux_amd64.tar.gz
  606  k9s
  607  history
  608  k9s
  609  kubectl logs metrics-server-5f9f776df5-4wxtt -n kube-system
  610  kubectl logs metrics-server-5f9f776df5-4wxtt
  611  vim test-pod.yaml
  612  kubectl apply -f test-pod.yaml
  613  kubectl get pods
  614  kubectl exec -it ubuntu -- bash
  615  kubectl get svc -A
  616  kubectl exec -it ubuntu -- bash
  617  history
```
## Test pod

```yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu
  labels:
    app: ubuntu
spec:
  containers:
  - image: ghcr.io/pluhin/busy-box:latest
    command:
      - "sleep"
      - "604800"
    imagePullPolicy: IfNotPresent
    name: ubuntu
  restartPolicy: Always
```

```bash
vagrant@vagrant:/vagrant/10.K8s.Install$ kubectl exec -it ubuntu -- bash
root@ubuntu:/# history
    1  top
    2  mv
    3  mc
    4  git
    5  nc
    6  curl 10.43.179.25
    7  curl 10.43.0.1
    8  curl https://10.43.0.1
    9  curl https://10.43.179.25
   10  nc -zw2  10.43.179.25 443
   11  nc -zw  10.43.179.25 443
   12  nc -zv  10.43.179.25 443
   13  nc -zv  metrics-server.kube-system 443
   14  history
```

