### 12. Kubernetes. Data. Security

I installed kubeseal on the 192.168.203.4 server to get started
```bash
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.23.1/kubeseal-0.23.1-linux-amd64.tar.gz
tar -xvzf kubeseal-*.tar.gz
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
kubeseal --version
kubeseal version: 0.23.1
```
SealedSecrets requires a controller in the cluster
```bash
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.23.1/controller.yaml
kubectl get pods -n kube-system | grep sealed-secrets

sealed-secrets-controller-57b9bbf677-g2gtf   1/1     Running     0          77m
```
1.Used existing SSH keys for 192.168.203.4
```bash
scp -o "ProxyJump jump_sa@178.124.206.53:32510" ~/.ssh/id_rsa* root@192.168.203.4:~/nginx/
```

2.Create index.html
```bash
cat <<EOF > index.html
<!DOCTYPE html>
<html>
<head>
    <title>Pod Info</title>
</head>
<body>
    <h1>Hostname: $(hostname)</h1>
</body>
</html>
EOF
```

3.Create ConfigMap
The configmap.yaml file has been provided separately.

4.Create Secret
```bash
kubectl create secret generic ssh-keys \
  --from-file=id_rsa=./id_rsa \
  --from-file=id_rsa.pub=./id_rsa.pub \
  --dry-run=client -o yaml > secret.yaml
```

5.Converted to SealedSecret.
```bash
kubeseal -f secret.yaml -o yaml > sealedsecret.yaml
```
The sealedsecret.yaml file has been provided separately.

6.Update nginx-deployment.yaml
The nginx-deployment.yaml file has been provided separately.

The nginx-service.yaml and nginx-ingress.yaml files remain unchanged

7.Apply the changes
```bash
kubectl apply -f configmap.yaml -f sealedsecret.yaml -f nginx-service.yaml -f nginx-deployment.yaml -f nginx-ingress.yaml
```
Check status:

```bash
kubectl get pods -l app=nginx

NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-7b887b4c64-5jfbq   1/1     Running   0          3m56s
nginx-deployment-7b887b4c64-dfzbx   1/1     Running   0          3m56s
nginx-deployment-7b887b4c64-htfwl   1/1     Running   0          3m51s
nginx-deployment-7b887b4c64-hvjbm   1/1     Running   0          3m51s
```

```bash
curl -H "Host: nginx-test.k3s-4.sa" http://192.168.203.4:30001

<!DOCTYPE html>
<html>
<head>
    <title>Pod Info</title>
</head>
<body>
    <h1>Hostname: nginx-deployment-7b887b4c64-dfzbx</h1>
</body>
</html>
```
```bash
POD_NAME=$(kubectl get pods -l app=nginx -o jsonpath='{.items[0].metadata.name}')
echo $POD_NAME

kubectl exec $POD_NAME -- ls -la /root/.ssh

Defaulted container "nginx" out of: nginx, init-html (init)
total 4
drwxrwxrwt    3 root     root           120 Apr 30 08:22 .
drwx------    1 root     root          4096 Apr 30 08:22 ..
drwxr-xr-x    2 root     root            80 Apr 30 08:22 ..2025_04_30_08_22_01.2423515635
lrwxrwxrwx    1 root     root            32 Apr 30 08:22 ..data -> ..2025_04_30_08_22_01.2423515635
lrwxrwxrwx    1 root     root            13 Apr 30 08:22 id_rsa -> ..data/id_rsa
lrwxrwxrwx    1 root     root            17 Apr 30 08:22 id_rsa.pub -> ..data/id_rsa.pub
```

7.Open nginx-test.k3s-4.sa
Result: [google drive image](https://drive.google.com/file/d/1zf7Zef1J8qP1Lm75a0NpP1VguYLmY-n7/view?usp=sharing "google drive image")
