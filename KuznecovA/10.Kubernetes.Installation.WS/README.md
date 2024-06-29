# Home task 10. Kubernetes installation (WS)

Install kubectl:
```bash
  189  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  190  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  193  kubectl version
  194  kubectl get nodes
  197  kubectl get pods -A
```

Copy configs:
```bash
scp root@192.168.208.5:/root/.kube/config /home/vmuser/.kube/config
scp root@192.168.203.3:/etc/rancher/k3s/k3s.yaml /home/vmuser/.kube/config-k3s
```

Create tunnel:
```bash
ssh -L 6443:127.0.0.1:6443 root@192.168.208.5 -f -N
ssh -L 6444:127.0.0.1:6443 root@192.168.203.3 -f -N
```

```bash
export KUBECONFIG=/home/vmsuser/.kube/config-k3s:/home/vmuser/.kube/config
env | grep KUBE
```
Result:
```bash
KUBECONFIG=/home/vmuser/.kube/config-k3s:/home/vmuser/.kube/config
```

Get pods in context "k8s":
```bash
kubectl get pods -A --context "k8s"
```
Result:
```bash
NAMESPACE     NAME                                       READY   STATUS    RESTARTS   AGE
default       ubuntu                                     1/1     Running   0          62m
kube-system   calico-kube-controllers-68485cbf9c-swj49   1/1     Running   0          12d
kube-system   calico-node-mdtnf                          1/1     Running   0          12d
kube-system   calico-node-tsmgw                          1/1     Running   0          12d
kube-system   coredns-69db55dd76-cbj5z                   1/1     Running   0          12d
kube-system   coredns-69db55dd76-sqxcr                   1/1     Running   0          12d
kube-system   dns-autoscaler-6f4b597d8c-2wkmm            1/1     Running   0          12d
kube-system   kube-apiserver-node1                       1/1     Running   1          12d
kube-system   kube-controller-manager-node1              1/1     Running   2          12d
kube-system   kube-proxy-hv6pq                           1/1     Running   0          12d
kube-system   kube-proxy-w52ch                           1/1     Running   0          12d
kube-system   kube-scheduler-node1                       1/1     Running   1          12d
kube-system   nginx-proxy-node2                          1/1     Running   0          12d
kube-system   nodelocaldns-kx9nn                         1/1     Running   0          12d
kube-system   nodelocaldns-r44jn                         1/1     Running   0          12d
```

Get pods in context "k3s":
```bash
kubectl get pods -A --context "k3s"
```
Result:
```bash
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE
kube-system   coredns-6799fbcd5-scrzg                   1/1     Running   0          12d
kube-system   local-path-provisioner-6c86858495-ksmfr   1/1     Running   0          12d
kube-system   metrics-server-54fd9b65b-2qln8            1/1     Running   0          12d
```

Install k9s:
```bash
wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz
sudo  rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
vim .bashrc
go --version
source .bashrc
cd ..
source .bashrc
go --version
wget https://github.com/derailed/k9s/releases/download/v0.32.5/k9s_Linux_amd64.tar.gz
sudo tar -C /usr/local/bin -xzf k9s_Linux_amd64.tar.gz
k9s
```

```bash
k9s
```
Result:
!k9s-pods-1.png!

```bash
kubectl create -f pod.yaml
```
Result:
!k9s-pods-2.png!
