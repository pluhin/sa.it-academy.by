# 12.Kubernetes. Data. Security

### Add init-container for index.html to deployment

```yaml
initContainers:
  - name: init-html
    image: busybox:latest
    command: ['sh', '-c', 'echo "$(hostname)" > /work/index.html']
```

### Validation
```bash
$ curl http://nginx-test.k8s-7.sa/
nginx-deployment-c77595797-87z29
$ curl http://nginx-test.k8s-7.sa/
nginx-deployment-c77595797-tpjxs
$ curl http://nginx-test.k8s-7.sa/
nginx-deployment-c77595797-7rrzb
$ curl http://nginx-test.k8s-7.sa/
nginx-deployment-c77595797-87z29
```

### Install Sealed Secrets for Kubernetes

```bash
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.36.0/controller.yaml
curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.36.0/kubeseal-0.36.0-linux-amd64.tar.gz"
tar -xvzf kubeseal-0.36.0-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
kubeseal --version
```

### Create secret with key pair

```bash
# generating a key pair
ssh-keygen -t ed25519 -C "kubeseal" -f ssh-key

# create init_secret.yaml
nano init_secret.yaml 
echo "  id_ed25519: $(cat ssh-key | base64 -w0)" >> init_secret.yaml
echo "  id_ed25519.pub: $(cat ssh-key.pub | base64 -w0)" >> init_secret.yaml

# create and apply sealed_secret.yaml 
cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
kubectl apply -f sealed_secret.yaml
```

### Add volume and volumeMount to deployment

```yaml
volumes:
- name: ssh-keys
  secret:
    secretName: ssh-keys
    defaultMode: 0600

volumeMounts:
- name: ssh-keys
  mountPath: /root/.ssh
```

### Apply and check

```bash
kubectl apply -f nginx_deployment.yaml
```

```bash
 kubectl exec -it nginx-deployment-74b78c859c-g8k29 -- ls -la /root/.ssh/
```

### Output:

```bash
Defaulted container "nginx" out of: nginx, init-html (init)
total 4
drwxrwxrwt 3 root root  120 Mar 11 07:36 .
drwx------ 1 root root 4096 Mar 11 07:36 ..
drwxr-xr-x 2 root root   80 Mar 11 07:36 ..2026_03_11_07_36_31.3802764872
lrwxrwxrwx 1 root root   32 Mar 11 07:36 ..data -> ..2026_03_11_07_36_31.3802764872
lrwxrwxrwx 1 root root   17 Mar 11 07:36 id_ed25519 -> ..data/id_ed25519
lrwxrwxrwx 1 root root   21 Mar 11 07:36 id_ed25519.pub -> ..data/id_ed25519.pub
```

### Add secrets to .gitignore

```bash
touch .gitignore
echo "ssh-key" >> .gitignore
echo "init_secret.yaml" >> .gitignore
```
