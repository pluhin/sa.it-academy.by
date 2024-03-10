
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

https://github.com/pluhin/argocd-27-24

## History

```bash
  858  mkdir 15.K8s.ArgoCD
  859  cd 15.K8s.ArgoCD/
  860  ls
  861  kubectl create namespace argocd
  862  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
  863  vim argocd-install.yaml
  864  kubectl apply -f argocd-install.yaml -n argocd
  865  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  866  kubectl get secrets -n argocd
  867  kubectl get secrets -n argocd -o yaml
  868  echo "XXXXXX" | base64 -d
  869  kubectl get application fist-app -n argocd
  870  kubectl get application fist-app -n argocd -o yaml > fisrt-app.yaml
  871  vim fisrt-app.yaml
  872  mkdir apps
  873  mv fisrt-app.yaml apps/
  874  git init
  875  git add --all
  876  git commit -m "Add first app"
  877  git remote add origin git@github.com:pluhin/argocd-27-24.git
  878  git push --set-upstream origin master
  879  vim apps/fisrt-app.yaml
  880  git add --all
  881  git commit -m "Change ingress"
  882  git push
  883  kubectl get secrets -n argocd
  884  vim apps/fisrt-app.yaml
  885  git add --all
  886  git commit -m "Fix"
  887  git push
  888  history
```