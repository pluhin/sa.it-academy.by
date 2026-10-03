# 13.Kubernetes.Data.Secrets

## 1

Для генерации уникальных `index.html` используем `initContainers`, который создает стандартный html с импортированным в тело `hostname`

```bash
brewery@kubekosh:~ % kubectl -n 13-k8s exec hostame-check -- curl -sS nginx
<!doctype html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <title>Kubernetes lab</title>
</head>
<body>
  <h1>Hello from nginx</h1>
  <p>This HTML is hosted in pod nginx-56b5b5d44c-rtzkx</p>
</body>
</html>
brewery@kubekosh:~ % kubectl -n 13-k8s exec hostame-check -- curl -sS nginx
<!doctype html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <title>Kubernetes lab</title>
</head>
<body>
  <h1>Hello from nginx</h1>
  <p>This HTML is hosted in pod nginx-56b5b5d44c-z7hrx</p>
</body>
</html>
brewery@kubekosh:~ % kubectl -n 13-k8s exec hostame-check -- curl -sS nginx
<!doctype html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <title>Kubernetes lab</title>
</head>
<body>
  <h1>Hello from nginx</h1>
  <p>This HTML is hosted in pod nginx-56b5b5d44c-cxkzh</p>
</body>
</html>
brewery@kubekosh:~ % kubectl -n 13-k8s get po -l app=html-nginx
NAME                     READY   STATUS    RESTARTS   AGE
nginx-56b5b5d44c-cxkzh   1/1     Running   0          57m
nginx-56b5b5d44c-rtzkx   1/1     Running   0          57m
nginx-56b5b5d44c-z7hrx   1/1     Running   0          57m
```

## 2

```bash
curl -LO "https://github.com/bitnami/sealed-secrets/releases/download/v0.40.0/kubeseal-0.40.0-linux-amd64.tar.gz"
tar -xvzf kubeseal-0.40.0-linux-amd64.tar.gz
install -m 0755 kubeseal /usr/local/bin
sudo install -m 0755 kubeseal /usr/local/bin
kubeseal --version
ssh-keygen -t id_rsa
ssh-keygen -t rsa
cat .ssh/id_rsa >> 13-key-secret.yaml
cat .ssh/id_rsa.pub >> 13-key-secret.yaml
nano 13-key-secret.yaml <-- приведение к формату kind: Secret
cat 13-key-secret.yaml | kubeseal --format yaml > sealed-13-key-secret.yaml
brewery@kubekosh:~ % kubectl -n 13-k8s exec secret -- ls /cred
id_rsa
id_rsa.pub
brewery@kubekosh:~ % kubectl -n 13-k8s exec secret -- cat /cred/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwQW1EUCvPqatxYR49dSXRxXxINmcJd6kcibIYpS0KZ5h0X0W7v2xeUOMtvWyIGG3NDRtFW+KbSE2MHZjuoVc+ovecNlkH+RMcPJcXWTdbIRfn9SQGUFLU8tm0Tag0+fIB5JN37byJ1jSSiN8HzX3wr0q8mx8fmGC+9PL+2Oi7fHqjuGLCqDWmUkBxvEute75Ih7KISvy396XOb+Pjot9NtYqZzRvIl2FY8V9hc32p+Lbmki8AdGU5TXgpvy6ZMEDCfz5kGPXfwd7E/AcjqqfadaIk2LmtAeA3W9mzb6dFJNqEQG/i1lH6p/2icHZczAPfk4aSYCXUbUyqToaXoAT7BCoL+Q9vfftXzztOWyBlTIiUvUHrkwjrylxQnB1de0geiy1h5DOrBqFaH+dutHO3v+OxBOTaOEwL5NSvPoL6V0nSHQ/6Sm69z63cIRQLpKjtaINdgrcHd1Bl4bqpn9mGPYul9mnKhUCPMgJoMLI5SAMMFoKCzj0dZJCikmOPI+0= brewery@kubekosh
brewery@kubekosh:~ % cat .ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwQW1EUCvPqatxYR49dSXRxXxINmcJd6kcibIYpS0KZ5h0X0W7v2xeUOMtvWyIGG3NDRtFW+KbSE2MHZjuoVc+ovecNlkH+RMcPJcXWTdbIRfn9SQGUFLU8tm0Tag0+fIB5JN37byJ1jSSiN8HzX3wr0q8mx8fmGC+9PL+2Oi7fHqjuGLCqDWmUkBxvEute75Ih7KISvy396XOb+Pjot9NtYqZzRvIl2FY8V9hc32p+Lbmki8AdGU5TXgpvy6ZMEDCfz5kGPXfwd7E/AcjqqfadaIk2LmtAeA3W9mzb6dFJNqEQG/i1lH6p/2icHZczAPfk4aSYCXUbUyqToaXoAT7BCoL+Q9vfftXzztOWyBlTIiUvUHrkwjrylxQnB1de0geiy1h5DOrBqFaH+dutHO3v+OxBOTaOEwL5NSvPoL6V0nSHQ/6Sm69z63cIRQLpKjtaINdgrcHd1Bl4bqpn9mGPYul9mnKhUCPMgJoMLI5SAMMFoKCzj0dZJCikmOPI+0= brewery@kubekosh
```