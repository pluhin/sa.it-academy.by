# ArgoCD

Changes in ArgoCD deployment

```yaml
            weight: 5
      containers:
      - command:
        - argocd-server
        - --insecure     ## <= added 
        env:
        - name: ARGOCD_SERVER_INSECURE
```

for it-academy nginx settings:

```yaml
  name: argocd-server
spec:
  type: NodePort   ## <= added 
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 8080
    nodePort: 30007  ## <= added 
  - name: https
    port: 443
    protocol: TCP
    targetPort: 8080
    nodePort: 30008  ## <= added 
  selector:
    app.kubernetes.io/name: argocd-server 
```

## History 
```bash
 811  mkdir 15.K8s.ArgoCD
  812  cd 15.K8s.ArgoCD/
  813  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  814  vim install.yaml
  815  kubectl create namespace argocd
  816  kubectl apply -f install.yaml -n argocd
  817  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
  818  history | grep github
  819  kubectl get application simpleapp -n argocd
  820  kubectl get application simpleapp -n argocd -o yaml
  821  kubectl get application jenkins -n argocd -o yaml
  822  kubectl get application simpleapp -n argocd -o yaml
  823  kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/release-1.0/manifests/install.yaml
  824  kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/release-1.0/catalog/install.yaml
  825  wgthttps://raw.githubusercontent.com/argoproj-labs/argocd-notifications/release-1.0/catalog/install.yaml
  826  wget https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/release-1.0/catalog/install.yaml notification-config.yaml
  827*
  828  wget https://raw.githubusercontent.com/argoproj-labs/argocd-notifications/release-1.0/catalog/install.yaml -O notification-config.yaml
  829  vim notification-config.yaml
  830  kubectl apply -f notification-config.yaml -n argocd
  831  history
```

## Repositories

- Jenkins by manifest: https://github.com/pluhin/build_sa/tree/master/ci-cd
- first app by helm: https://github.com/pluhin/helm-md-sa2-22-22
- Argocd application manifests: https://github.com/pluhin/argo-md-sa2-22-22