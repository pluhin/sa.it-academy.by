
```bash
  512  history
  513  ssh root@192.168.208.17
  514  clear
  515  ls -la ~
  516  scp 192.168.208.17:/root/.kube/config /home/user/.kube/
  517  scp root@192.168.208.17:/root/.kube/config /home/user/.kube/
  518  vim ~/.kube/config
  519  kubectl get pods -A
  520  vim ~/.kube/config
  521  scp 192.168.203.9:/etc/rancher/k3s/k3s.yaml /home/user/.kube/config-k3s
  522  vim .kube/config-k3s
  523  kubectl get pods -A
  524  export KUBECONFIGF=~/.kube/config-k3s
  525  kubectl get pods -A
  526  export KUBECONFIG=~/.kube/config-k3s
  527  kubectl get pods -A
  528  export KUBECONFIG=~/.kube/config-k3s,~/.kube/config
  529  kubectl get pods
  530  export KUBECONFIG=~/.kube/config-k3s:~/.kube/config
  531  kubectl get pods
  532  export KUBECONFIG=$HOME/.kube/config-k3s:$HOME/.kube/config
  533  kubectl get pods
  534  kubectl get pods -a
  535  kubectl get pods -A
  536  vim .bashrc
  537  source .bashrc
  538  kubectl get pods -A --context=default
  539  vim .kube/config
  540  kubectl get pods -A --context=cluster.local
  541  vim .kube/config
  542  kubectl get pods -A --context=cluster.local
  543  export KUBECONFIG=$HOME/.kube/config-k3s:$HOME/.kube/config
  544  kubectl get pods -A --context=cluster.local
  545  kubectl get pods -A --context="cluster.local"
  546  kubectl get pods -A --context="kubernetes-admin@cluster.local"
  547  vim .kube/config
  548  export KUBECONFIG=$HOME/.kube/config-k3s:$HOME/.kube/config
  549  kubectl get pods -A --context="k8s"
  550  vim .kube/config-k3s
  551  kubectl get pods -A --context="k3s"
  552  kubectl get pods -A --context="k8s"
  553  kubectl get pods -A --context="k3s"
  554  vim .kube/config-k3s
  555  vim .kube/config
  556  history
  557  vim .bashrc
  558  wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
  559  sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
  560  go --version
  561  source .bash
  562  source .bashrc
  563  go --version
  564  history
  565  wget https://github.com/derailed/k9s/releases/download/v0.31.8/k9s_Linux_amd64.tar.gz
  566  history | grep tar
  567  sudo tar -C /usr/local -xzf k9s_Linux_amd64.tar.gz
  568  rm go1.22.0.linux-amd64.tar.gz
  569  rm k9s_Linux_amd64.tar.gz
  570  history
  571  k9s
  572  sudo mv /usr/local/k9s /usr/local/bin/
  573  k9s
  574  kubectl get ns
  575  kubectl get pods -A
  576  kubectl config use-context k8s
  577  kubectl get pods -A
  578  vim pod.yaml
  579  kubectl apply -f pod.yaml
  580  k9s --headless
  581  k9s
  582  kubectl exec -it ubuntu -n default -- bash
  583  history
  584  kubectl get pods -A
  585  history
```


(Ansible host | kubectl )


ssh -L 6443:127.0.0.1:6443 root@192.168.208.XX -f -N

## Install K3s

```bash
   40  shutdown -h now
   41   curl -fL https://get.k3s.io |  sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
   42  apt install curl
   43  apt update
   44  apt install curl
   45   curl -fL https://get.k3s.io |  sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
   46  service k3s status
   47  kubectl get pods -A
   48  cat /etc/rancher/k3s/k3s.yaml
```

Uninstall: `/usr/local/bin/k3s-uninstall.sh`


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