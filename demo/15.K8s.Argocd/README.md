## Install ArgoCD in k8s

```
kubectl create namespace argocd
wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
```

For ingress we need to add - --insecure here in deployment of argcd-server:

```yaml
            weight: 5
      containers:
      - command:
        - argocd-server
        - --insecure
        env:
        - name: ARGOCD_SERVER_INSECURE
```

and for service need to add this

```yaml
  name: argocd-server
spec:
  type: NodePort
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 8080
    nodePort: 30007
  - name: https
    port: 443
    protocol: TCP
    targetPort: 8080
    nodePort: 30008
  selector:
```

```bash
  896  ls
  897  mkdir 15.K8s.Argocd
  898  cd 15.K8s.Argocd/
  899  ls
  900  kubectl create namespace argocd
  901  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
  902  vim argocd-install.yaml
  903  kubectl apply -f argocd-install.yaml -n argocd
  904  vim argocd-install.yaml
  905  kubectl logs argocd-server-58b85dcfcc-9rl8v -n argocd
  906  history | grep proxy
  907  history | grep Proxy
  908  vim argocd-install.yaml
  909  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  910  kubectl logs argocd-applicationset-controller-676749c97d-dvmp9 -n argo-cd
  911  kubectl logs argocd-applicationset-controller-676749c97d-dvmp9 -n argocd
  912  git init
  913  git add --all
  914  git commit -m "Init commit"
  915  git remote add origin git@github.com:pluhin/argocd-23-23.git
  916  git push
  917  git push --set-upstream origin master
  918  mkdir apps
  919  cd apps/
  920  kubectl get application helm-app -n argocd -o yaml > helm-app.yaml
  921  vim helm-app.yaml
  922  kubectl get application jenkins -n argocd -o yaml > jenkins.yaml
  923  vim jenkins.yaml
  924  kubectl get application nfs-subdir-external-provisioner -n argocd -o yaml > nfs-subdir-external-provisioner.yaml
  925  vim nfs-subdir-external-provisioner.yaml
  926  git add --all
  927  git commit -m "Add apps"
  928  git push
  929  history
```

https://github.com/pluhin/argocd-23-23