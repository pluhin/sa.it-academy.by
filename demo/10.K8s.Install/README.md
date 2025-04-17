
Outside EC/it-academy.by:
- install kubectl
- copy config from master (scp ...)
- make tunnel for k8s (ssh -L 6440:127.0.0.....)
- check it (kubectl get ... )
Inside EC/it-academy.by:
- install kubectl
- copy config from master (scp ...)
- change in config-k8s IP from 127.0.0.1 -> 192.168.208.XX (master IP)
- make tunnel for k8s (ssh -L 6440:127.0.0.....)
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

---

## K8s full install

- where (we are doing real changes): 192.168.208.XX 192.168.208.YY
- from (where command will be executed): 192.168.202.XX


```bash
    6  git clone https://github.com/kubernetes-sigs/kubespray.git
    7  cd kubespray/
    8  ls
    9  cat /etc/os-release
   10  pip install -U -r requirements.txt
   11  apt update
   12  apt install python3-pip
   13  pip install -U -r requirements.txt
   14  history

apt install sshpass
```

## Aggregate kubernetes config


```bash
mkdir .kube

scp root@192.168.203.XX:/etc/rancher/k3s/k3s.yaml ~/.kube/config-k3s
apt install curl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

scp root@192.168.208.YY:/root/.kube/config ~/.kube/config-k8s

export KUBECONFIG=$HOME/.kube/config-k3s:$HOME/.kube/config-k8s  ### you can add this command into .bashrc file

```

rename inside context, user and cluster names

```bash
  cat ~/.kube/config-k3s | grep "k3s"
      name: k3s
        cluster: k3s
        user: k3s
      name: k3s
    current-context: k3s
    - name: k3s
  ## and inside config
  cat ~/.kube/config-k8s | grep "k8s"
      name: k8s
        cluster: k8s
        user: k8s
      name: k8s-cluster
    current-context: k8s-cluster
    - name: k8s
```


output example with different context

```bash
root@sa-25:~# kubectl get pods -A --context "k8s-cluster"
NAMESPACE     NAME                                       READY   STATUS    RESTARTS   AGE
kube-system   calico-kube-controllers-55d498b656-ht6bs   1/1     Running   0          2d22h
kube-system   calico-node-7wtgl                          1/1     Running   0          2d22h
kube-system   calico-node-skl5g                          1/1     Running   0          2d22h
kube-system   coredns-69d6675447-47lft                   1/1     Running   0          2d22h
kube-system   coredns-69d6675447-4q9jh                   1/1     Running   0          2d22h
kube-system   dns-autoscaler-5cb4578f5f-qs87b            1/1     Running   0          2d22h
kube-system   kube-apiserver-node1                       1/1     Running   1          2d22h
kube-system   kube-controller-manager-node1              1/1     Running   2          2d22h
kube-system   kube-proxy-bgjlc                           1/1     Running   0          2d22h
kube-system   kube-proxy-wln4f                           1/1     Running   0          2d22h
kube-system   kube-scheduler-node1                       1/1     Running   1          2d22h
kube-system   nginx-proxy-node2                          1/1     Running   0          2d22h
kube-system   nodelocaldns-9kh7x                         1/1     Running   0          2d22h
kube-system   nodelocaldns-9v4x4                         1/1     Running   0          2d22h
root@sa-25:~# kubectl get pods -A --context "k3s"
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE
kube-system   coredns-7b98449c4-q4wlp                   1/1     Running   0          62m
kube-system   local-path-provisioner-6795b5f9d8-wvvmh   1/1     Running   0          62m
kube-system   metrics-server-cdcc87586-jgtt4            1/1     Running   0          62m
```

### Install kubectx

```bash
  503  wget https://github.com/ahmetb/kubectx/releases/download/v0.9.5/kubectx
  504  chmod +x kubectx
  505  sudo   mv kubectx /usr/local/bin/
  506  kubectx
  507  kubectx k8s
  508  kubectl get pods -A
  509  history
```


### Insatll k9s

https://github.com/derailed/k9s/releases

```bash
wget https://github.com/derailed/k9s/releases/download/v0.32.7/k9s_Linux_amd64.tar.gz
tar -C /usr/local/bin -xzf k9s_Linux_amd64.tar.gz
ls -l /usr/local/bin/k9s
k9s
```

## Tunnel notes

```bash
ssh -L 6443:127.0.0.1:6443 root@192.168.208.XX -f -N
ssh -L 6444:127.0.0.1:6443 root@192.168.203.YY -f -N
```

changes in conigs

```yaml

cat .kube/config-k8s
....
    server: https://127.0.0.1:6443
  name: k8s
contexts:
....

cat .kube/config-k3s
....
    server: https://127.0.0.1:6444
  name: k3s
contexts:
....
```