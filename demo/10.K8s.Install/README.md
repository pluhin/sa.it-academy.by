## Outside EC/it-academy.by:

- install kubectl
- copy config from master (scp ...)
- make tunnel for k8s (ssh -L 6440:127.0.0.....)
- check it (kubectl get ... ) 

## Inside EC/it-academy.by:

- install kubectl
- copy config from master (scp ...)
- change in config-k8s IP from 127.0.0.1 -> 192.168.208.XX (master IP)
- check it (kubectl get ... )


## K3s install

- where (we are doing real changes): 192.168.203.XX
- from (where command will be executed): 192.168.203.XX

```bash
apt update
apt install curl
curl -fL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
service k3s status
kubectl get pods -A
```

## Tunnel notes

```bash
ssh -L 6443:127.0.0.1:6443 root@192.168.208.XX -f -N
ssh -L 6444:127.0.0.1:6443 root@192.168.203.YY -f -N
```
## changes in conigs

```yaml
user@sa2-demo:~$ egrep "k8s|server" ~/.kube/config-k8s
    server: https://127.0.0.1:6443
  name: k8s
    cluster: k8s
  name: k8s
##################
user@sa2-demo:~$ egrep -n "k3s|server" ~/.kube/config-k3s
5:    server: https://127.0.0.1:6444
6:  name: k3s
9:    cluster: k3s
11:  name: k3s
```

## History

``` bash
  459  cd 10.K8s.Install/
  460  ls
  461  kubectl get pods -A --context k8s
  462  kubectl get pods -A --context k3s
  463  wget https://github.com/ahmetb/kubectx/releases/download/v0.9.5/kubectx
  464  chmod +x kubectx
  465  sudo   mv kubectx /usr/local/bin/
  466  kubectx
  467  kubectl get pods -A
  468  wget https://github.com/derailed/k9s/releases/download/v0.50.18/k9s_linux_amd64.deb
  469  dpkg -i k9s_linux_amd64.deb
  470  sudo dpkg -i k9s_linux_amd64.deb
  471  k9s
  472  hisr
  473  history
  474  ks9
  475  k9s
  476  kubectl get pods -A
  477  kubectl describe pod calico-kube-controllers-5f56575fc9-qwwmp -n kubec-system
  478  kubectl describe pod calico-kube-controllers-5f56575fc9-qwwmp -n kube-system
  479  kubectl describe pod calico-kube-controllers-5f56575fc9-qwwmp -n kube-system -o yaml
  480  kubectl describe pod calico-kube-controllers-5f56575fc9-qwwmp -n kube-system
  481  vim pod.yaml
  482  kubect apply -f pod.yaml
  483  kubectl apply -f pod.yaml
  484  kubectl get pods
  485  kubectl describe pod ubuntu-default
  486  kubectl get events
  487  kubectl get pods -A
  488  kubectl apply -f pod.yaml
  489  vim pod.yaml
  490  kubectl apply -f pod.yaml
  491  kubectl delete -f pod.yaml
  492  kubectl apply -f pod.yaml
  493  kubectl get pods -A
  494  kubectl get events
  495  history
```