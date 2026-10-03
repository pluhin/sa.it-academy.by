# 13. Kubernetes. Data. Secrets

## Assignment 1: Config maps and secrets

### Install kubeseal
```bash
curl -OL "https://github.com/bitnami/sealed-secrets/releases/download/v0.40.0/kubeseal-0.40.0-linux-amd64.tar.gz"
tar -xvzf kubeseal-0.40.0-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
```

### Generate keys
```bash
ssh-keygen -t ed25519 -f ./id_ed25519 -N "" -C "root@nginx-test"
```

### Create secrets
```bash
kubectl -n nginx-test create secret generic nginx-test-ssh-keys --context k8s \
  --from-file=id_ed25519=./id_ed25519 \
  --from-file=id_ed25519.pub=./id_ed25519.pub \
  --dry-run=client -o yaml >  secret.yaml
kubeseal --format=yaml < secret.yaml > sealed-secret.yaml
```

### Apply updated deployment
```bash
kubectl -n nginx-test apply -f nginx-test.yaml --context k8s
kubectl -n nginx-test get secret nginx-test-ssh-keys
#   NAME                   TYPE     DATA   AGE
#   nginx-test-ssh-keys    Opaque   2      40s

kubectl -n nginx-test rollout restart deploy/nginx-test --context k8s
```

## Screenshots 

![Screenshot1](Screenshots/Screenshot_2026-09-29_11-48-48.png)

![Screenshot2](Screenshots/Screenshot_2026-09-29_11-49-15.png)

![Screenshot3](Screenshots/Screenshot_2026-09-29_11-49-19.png)
