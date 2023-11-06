
## Changes in argocd install:

```yaml
      containers:
      - args:
        - /usr/local/bin/argocd-server
        - --insecure     ### Added this line
        env:
        - name: ARGOCD_SERVER_INSECURE
```

## Add node port

```yaml
  name: argocd-server
spec:
  type: NodePort  ## Change service type
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 8080
    nodePort: 30007 ## Add port for bastion nginx
  - name: https
    port: 443
```

## Bastion nginx

```conf
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*argocd\.k8s-(\d+)\.sa$";

  location / {
       # proxy_set_header Host $host;
        proxy_pass       http://192.168.203.$1:30007;
  }
}
```

https://github.com/pluhin/argocd-25-23/tree/master


```bash
 954  mkdir 15.K8s.ArgoCD
  955  cd 15.K8s.ArgoCD/
  956  ls
  957  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
  958  vim argocd-install.yaml
  959  kubectl create namespace argocd
  960  vim argocd-install.yaml
  961  kubectl apply -f argocd-install.yaml -n argocd
  962  :pods
  963  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  964  echo "XXXXXX" | base64 -d
  965  echo "XXXXX" | base64 -d
  966  kubectl get application fist-app -n argocd -o yaml > fist-app.yaml
  967  vim fist-app.yaml
  968  kubectl get application jenkins -n argocd -o yaml > jenkins.yaml
  969  kubectl get application nfs-subdir-external-provisioner -n argocd -o yaml > nfs-subdir-external-provisioner.yaml
  970  vim fist-app.yaml
  971  vim jenkins.yaml
  972  vim nfs-subdir-external-provisioner.yaml
  973  ls
  974  mkdir apps
  975  mv *.yaml apps
  976  ls -l apps/
  977  ls -l
  978  git init
  979  git commit -m "Init commit"
  980  git add --all
  981  git commit -m "Init commit"
  982  git remote add origin git@github.com:pluhin/argocd-25-23.git
  983  git push --set-upstream origin master
  984  mv apps/argocd-install.yaml ./
  985  ls -la apps/
  986  git add  --all
  987  git commit -m "move argocd install"
  988  git push
  989  vim apps/fist-app.yaml
  990  git add  --all
  991  git commit -m "need more RAM"
  992  git push
  993  kubectl apply -f argocd-install.yaml -n argocd
  994  echo "MmxTcmdLeXhlZlRJdXRzcw==" | base64 -d
  995  vim argocd-install.yaml
  996  history
```