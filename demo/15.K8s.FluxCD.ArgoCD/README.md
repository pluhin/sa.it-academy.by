## GitOPS

```bash
flux bootstrap github \
  --token-auth \
  --owner=pluhin \
  --repository=argo-flux-33-25 \
  --branch=master \
  --path=flux \
  --personal
```

## Changes in ArgoCD install

- https://github.com/pluhin/argo-flux-33-25/
- https://github.com/pluhin/argo-flux-33-25/blob/master/argo-core/install.yaml#L25049
- https://github.com/pluhin/argo-flux-33-25/blob/master/argo-core/install.yaml#L25055
- https://github.com/pluhin/argo-flux-33-25/blob/master/argo-core/install.yaml#L26044

```bash
  714  mkdir 15.K8s.FluxCD.ArgoCD
  715  cd 15.K8s.FluxCD.ArgoCD/
  716  ls
  717  curl -s https://fluxcd.io/install.sh | sudo bash
  718  git init
  719  vim README.md
  720  git add --all
  721  git commit -m "Init"
  722  git remote add origin git@github.com:pluhin/argo-flux-33-25.git
  723  git push -u origin  master
  724  export GITHUB_TOKEN=XXXXXXXXXX
  725  flux bootstrap github   --token-auth   --owner=pluhin   --repository=argo-flux-33-25   --branch=master   --path=flux   --personal
  726  git pull
  727  mkdir ci-cd
  728  cp ../14.K8s/jenkins/jenkins.yaml ci-cd/
  729  ls -l ci-cd/
  730  vim flux/flux-system/gotk-sync.yaml
  731  git add --all
  732  git commit -m "Add CI/CD"
  733  git push
  734  flux get all
  735  kubeclt get Kustomization -n Kustomization
  736  kubeclt get Kustomization -n flux-system
  737  kubectl get Kustomization -n flux-system
  738  vim ci-cd/jenkins.yaml
  739  git commit --amend -a --no-edit
  740  git push origin -f
  741  flux reconcile kustomization flux-system  --with-source
  742  kubectl create namespace argocd
  743  mkdir argo-core
  744  cd argo-core/
  745  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml argo-install
  746  vim install.yaml
  747  kubectl apply -f install.yaml
  748  kubectl delete -f install.yaml
  749  kubectl delete -f install.yaml -n argocd
  750  kubectl apply -f install.yaml -n argocd
  751  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  752  cd ../
  753  mkdir apps
  754  cp ../12.K8s.Data/app.yaml apps/
  755  kubectl delete -f ../12.K8s.Data/app.yaml
  756  vim apps/app.yaml
  757  git add --all
  758  git commit -m "Add argo"
  759  git push
  760  cp ../12.K8s.Data/init_secret.yaml apps/
  761  git add apps/init_secret.yaml
  762  git commit -m "add secret"
  763  git push
  764  kubectl get applications -A
  765  ls
  766  mkdir argo-apps
  767  kubectl get applications app -n argocd -o yaml > argo-apps/app.yaml
  768  kubectl get applications sealsecret -n argocd -o yaml > argo-apps/secret.yaml
  769  vim argo-apps/app.yaml
  770  vim argo-apps/secret.yaml
  771  git add --all
  772  git commit -m "Add application for Argo"
  773  git push
  774  history
```
