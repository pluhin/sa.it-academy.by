# Command history

## Local tools

```bash
brew link --overwrite kubernetes-cli
brew install k9s kubectx
kubectl version --client
k9s version
kubectx --help
```

Installed versions:

```text
kubectl v1.36.2
k9s v0.51.0
kubectx v0.11.0
```

## Local kubeconfig and tunnels

Kubeconfig files contain client credentials and are stored only in `~/.kube`
with mode `0600`. They are not committed.

```bash
scp root@192.168.208.3:/root/.kube/config ~/.kube/config-k8s
scp root@192.168.203.2:/etc/rancher/k3s/k3s.yaml ~/.kube/config-k3s
chmod 0600 ~/.kube/config-k8s ~/.kube/config-k3s

ssh -N -L 6443:127.0.0.1:6443 root@192.168.208.3
ssh -N -L 6444:127.0.0.1:6443 root@192.168.203.2

kubectl config get-contexts
kubectl get pods --all-namespaces --context k8s
kubectl get pods --all-namespaces --context k3s
```

## k3s installation

```bash
apt-get update
apt-get install -y curl
curl -sfL https://get.k3s.io \
  | INSTALL_K3S_VERSION='v1.36.2+k3s1' sh -s - \
      --write-kubeconfig-mode 600 \
      --disable traefik \
      --disable servicelb

systemctl is-active k3s
KUBECONFIG=/etc/rancher/k3s/k3s.yaml kubectl get nodes --output=wide
KUBECONFIG=/etc/rancher/k3s/k3s.yaml kubectl get pods --all-namespaces
```

## Shell pod

```bash
kubectl apply --context k8s -f shell-pod.yaml
kubectl wait --context k8s --for=condition=Ready pod/shell --timeout=180s
kubectl get pod shell --context k8s --output=wide
kubectl exec --context k8s shell -- nslookup kubernetes.default.svc.cluster.local
```
