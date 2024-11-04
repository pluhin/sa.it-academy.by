## ArgoCD and Flux

https://github.com/pluhin/argo-flux-29-24.git

### Changes in argocd installation files

https://github.com/pluhin/argo-flux-29-24/blob/master/argocd-install.yaml#L22849

https://github.com/pluhin/argo-flux-29-24/blob/master/argocd-install.yaml#L22855

https://github.com/pluhin/argo-flux-29-24/blob/master/argocd-install.yaml#L23747

```bash
  776  mkdir 15.K8s.ArgoCD
  777  cd 15.K8s.ArgoCD/
  778  kubectl create namespace argocd
  779  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
  780  vim argocd-install.yaml
  781  kubectl apply -f argocd-install.yaml -n argocd
  782  vim argocd-install.yaml
  783  kubectl apply -f argocd-install.yaml -n argocd
  784  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  785  cd ../
  786  12.K8s.Data/
  787  cd 12.K8s.Data/
  788  kubectl delete -f sealed_secret.yaml
  789  cd -
  790  cd ../15.K8s.ArgoCD/
  791  vim app.yaml
  792  kubectl apply -f app.yaml
  793  ls
  794  mkdir argo-apps
  795  mv app.yaml argo-apps/
  796  mv argocd-install.yaml argo-apps/
  797  ls
  798  git init
  799  git add --all
  800  git commit -m "first commit"
  801  git remote add origin git@github.com:pluhin/argo-flux-29-24.git
  802  mv argo-apps/argocd-install.yaml ./
  803  git add --all
  804  git commit -m "fix"
  805  git push
  806  git push --set-upstream origin master
  807  kubectl get application seal-secret -o yaml
  808  kubectl get application seal-secret -n argocd -o yaml
  809  kubectl get application seal-secret -n argocd -o yaml > argo-apps/seal-secret.yaml
  810  vim argo-apps/seal-secret.yaml
  811  git add --all
  812  git commit -m "add seal-secret app"
  813  git push
  814  vim argo-apps/seal-secret.yaml
  815  git commit --amend -a
  816  git push origin -f
  817  echo "aHR0cHM6Ly9wbHVoaW4uZ2l0aHViLmlvL2hlbG0tMjktMjQv" | base64 -d
  818  curl -s https://fluxcd.io/install.sh | sudo bash
  819  flux --version
  820  flux check --pre
  821  export GITHUB_TOKEN=ghp_XXXXXXXXXXXXX
  822  flux bootstrap github   --token-auth   --owner=pluhin   --repository=argo-flux-29-24   --branch=master   --path=./   --personal
  823  git pull
  824  vim flux-system/gotk-sync.yaml
  825  vim flux-system/kustomization.yaml
  826  vim flux-system/gotk-sync.yaml
  827  git add --all
  828  git commit -m "fix flux"
  829  git push
  830  kubectl apply -f  flux-system/gotk-sync.yaml
  831  vim flux-system/gotk-sync.yaml
  832  kubectl apply -f  flux-system/gotk-sync.yaml
  833  mkdir ci-cd
  834  cp ../14.K8s.Application/jenkins.yaml ci-cd/
  835  vim flux-system/gotk-sync.yaml
  836  git sattus
  837  git status
  838  ls -l ci-cd/
  839  git add --all
  840  git commit -m "add jenkins"
  841  git push
  842  ls -l argo-apps/
  843  vim argo-apps/app.yaml
  844  kubectl get secret repo-1115609827 -n argocd -o yaml >  secret.yaml
  845  vim secret.yaml
  846  vim argo-apps/app.yaml
  847  history
```

### Flux deployment

```bash
export GITHUB_TOKEN=ghp_XXXXXXXXXXXXX
flux bootstrap github \
  --token-auth \
  --owner=pluhin \
  --repository=argo-flux-29-24 \
  --branch=master \
  --path=./ \
  --personal
  ```

  