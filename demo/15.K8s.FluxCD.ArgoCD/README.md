```bash
export GITHUB_TOKEN=XXXXXXXXXXXX

flux bootstrap github \
  --token-auth \
  --owner=pluhin \
  --repository=argo-flux-35-26 \
  --branch=master \
  --path=flux \
  --personal

```
## Changes before install argocd

https://github.com/pluhin?tab=repositories

- https://github.com/pluhin/argo-flux-35-26/blob/master/argo-core/install.yaml#L31483
- https://github.com/pluhin/argo-flux-35-26/blob/master/argo-core/install.yaml#L31488
- https://github.com/pluhin/argo-flux-35-26/blob/master/argo-core/install.yaml#L32565

```bash
 717  mkdir 15.K8s.FluxCD.ArgoCD
  718  cd 16
  719  cd 15.K8s.FluxCD.ArgoCD/
  720  ls
  721  curl -s https://fluxcd.io/install.sh | sudo bash
  722  . <(flux completion bash)
  723  git init
  724  vim README.md
  725  git add README.md
  726  git commit -m "Init commit"
  727  git remote add origin git@github.com:pluhin/argo-flux-35-26.git
  728  git push -u origin master
  729  export GITHUB_TOKEN=XXXXXXX
  730  flux bootstrap github   --token-auth   --owner=pluhin   --repository=argo-flux-35-26   --branch=main   --path=flux   --personal
  731  flux bootstrap github   --token-auth   --owner=pluhin   --repository=argo-flux-35-26   --branch=master   --path=flux   --personal
  732  git pull
  733  mkdir ci-cd
  734  cp ../14.K8s.Workshop/jenkins.yaml ci-cd/
  735  vim flux/flux-system/gotk-sync.yaml
  736  git add --all
  737  git commit -m "Add Jenkins"
  738  git push
  739  vim flux/flux-system/gotk-sync.yaml
  740  mkdir kube-system
  741  cd kube-system/
  742  vim sealsecret.yaml
  743  cd ..
  744  vim flux/flux-system/gotk-sync.yaml
  745  git add --all
  746  git commit -m "sealsecret"
  747  git push
  748  flux reconcile hr sealed-secrets -n flux-system
  749  flux reconcile ks flux-secret  -n flux-system
  750  kubectl create namespace argocd
  751  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  752  mkdir argo-core
  753  mv install.yaml argo-core/
  754  vim argo-core/install.yaml
  755  kubectl apply -n argocd --server-side --force-conflicts -f argo-core/install.yaml
  756  vim argo-core/install.yaml
  757  kubectl apply -n argocd --server-side --force-conflicts -f argo-core/install.yaml
  758  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  759  git status
  760  history
  761  git add --ll
  762  git add --all
  763  git commit -m "Add argocd"
  764  git push
  765  mkdir argo-apps
  766  cd argo-
  767  cd argo-apps/
  768  ls
  769  vim helm-app.yaml
  770  vim argo-app.yaml
  771  kubectl get app -A
  772  kubectl get app argo -n argocd -o yaml > argo-app.yaml
  773  vim argo-app.yaml
  774  ls
  775  cd ../
  776  git add --all
  777  git commit -m "Add apps"
  778  git push
  779  history
```