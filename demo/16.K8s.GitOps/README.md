```
flux bootstrap github \
  --token-auth \
  --owner=pluhin \
  --repository=argo-flux-36-26 \
  --branch=master \
  --path=my-cluster \
  --personal
```

https://github.com/pluhin/argo-flux-36-26

## ArgoCD changes

https://github.com/pluhin/argo-flux-36-26/blob/master/argo-core/argo-install.yaml#L31812

https://github.com/pluhin/argo-flux-36-26/blob/master/argo-core/argo-install.yaml#L31818

https://github.com/pluhin/argo-flux-36-26/blob/master/argo-core/argo-install.yaml#L32973


## History

```bash

849  mkdir 16.K8s.GitOps
  850  cd 16.K8s.GitOps/
  851  curl -s https://fluxcd.io/install.sh | sudo bash
  852  . <(flux completion bash)
  853  export GITHUB_TOKEN=XXXXXXXXXXX
  854  git int
  855  git init
  856  touch README.md
  857  git add --all
  858  git commit -m "Init commit"
  859  git remote add origin git@github.com:pluhin/argo-flux-36-26.git
  860  git push -u origin master
  861  flux bootstrap github   --token-auth   --owner=pluhin   --repository=argo-flux-36-26   --branch=master   --path=my-cluster   --personal
  862  cd ../15.K8s.Jenkins.Install/
  863  kubectl delete -f 01-namespace-rbac.yaml 02-storage.yaml
  864  kubectl delete -f 01-namespace-rbac.yaml
  865  kubectl delete -f 02-storage.yaml
  866  mc
  867  cd -
  868  ls
  869  git pull
  870  ls
  871  vim my-cluster/flux-system/gotk-sync.yaml
  872  vim ci-cd/01-namespace-rbac.yaml
  873  vim ci-cd/02-storage.yaml
  874  git add --add
  875  git add --all
  876  git commit -m "Add Jenkins"
  877  git push
  878  bim my-cluster/flux-system/gotk-sync.yaml
  879  vim my-cluster/flux-system/gotk-sync.yaml
  880  vim kube-system
  881  mkdir kube-system
  882* vim
  883  bim my-cluster/flux-system/gotk-sync.yaml
  884  vim my-cluster/flux-system/gotk-sync.yaml
  885  git add --all
  886  git commit -m "Add sealsecret controller"
  887  git push
  888  curl -I https://bitnami-labs.github.io/sealed-secrets/
  889  vim my-cluster/flux-system/gotk-sync.yaml
  890  git commit --amend -a
  891  git push origin -f
  892  kubectl create namespace argocd
  893  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  894  mv install.yaml argo-install.yaml
  895  vim argo-install.yaml
  896  kubectl apply -n argocd --server-side --force-conflicts -f argo-install.yaml
  897  mkdir argo-core
  898  mv argo-install.yaml argo-core/
  899  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  900  mkdir argo-apps
  901  vim argo-apps/helm-app.yaml
  902  history | grep app
  903  helm uninstall first-app
  904  vim argo-apps/helm-app.yaml
  905  vim argo-apps/argo-core.yaml
  906  git add --all
  907  git commit -m "Add argocd"
  908  git push
  909  vim argo-apps/argo-core.yaml
  910  vim argo-apps/helm-app.yaml
  911  kubectl get ppaliation -A
  912  kubectl get appaliation -A
  913  kubectl get apps -A
  914  history
```
