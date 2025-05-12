### 12. Kubernetes. Data. Security

I installed kubeseal on the 192.168.203.4 server to get started
```bash
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.23.1/kubeseal-0.23.1-linux-amd64.tar.gz
tar -xvzf kubeseal-*.tar.gz
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
kubeseal --version
kubeseal version: 0.29.0
```
SealedSecrets requires a controller in the cluster
```bash
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.23.1/controller.yaml
kubectl get pods -n kube-system | grep sealed-secrets              
sealed-secrets-controller-788f46cd6d-lxw9z   1/1     Running   0          8d
```
```bash

scp -o "ProxyJump jump_sa@178.124.206.53:32510" ~/.ssh/id_ed25519* root@192.168.208.17:~/nginx/
kubectl create secret generic ssh-key-secret \\n  --from-file=id_ed25519=$HOME/.ssh/id_ed25519 \\n  --from-file=id_ed25519.pub=$HOME/.ssh/id_ed25519.pub \\n  --dry-run=client -o yaml > ssh-secret.yaml
 kubeseal -f secret.yaml -o yaml > sealedsecret.yaml

 Apply the changes
```bash
kubectl apply -f configmap.yaml -f sealedsecret.yaml -f nginx-service.yaml -f nginx-deployment.yaml -f nginx-ingress.yaml

Check status:

```bash
kubectl get pods -l app=nginx                             
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-56b4f8fc9d-26ghd   1/1     Running   0          36m
nginx-deployment-56b4f8fc9d-99kdj   1/1     Running   0          36m
nginx-deployment-56b4f8fc9d-qmlcq   1/1     Running   0          36m
nginx-deployment-56b4f8fc9d-wq2h4   1/1     Running   0          36m
  
 