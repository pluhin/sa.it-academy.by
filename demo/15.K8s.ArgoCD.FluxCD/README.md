# GitOps

```bash
flux bootstrap github \
  --token-auth \
  --owner=pluhin \
  --repository=argo-flux-31-25 \
  --branch=master \
  --path=flux \
  --personal
```

## History 

```bash
  702  cd 15.K8s.FluxCD.ArgoCD/
  703  ls
  704  git init
  705  vim README.md
  706  git add --all
  707  git commit -m "Init commit"
  708  git remote add origin git@github.com:pluhin/argo-flux-31-25.git
  709  curl -s https://fluxcd.io/install.sh | sudo bash
  710  flux
  711  ls
  712  export GITHUB_TOKEN=XXXXXXXX
  713  clear
  714  flux bootstrap github   --token-auth   --owner=pluhin   --repository=argo-flux-31-25   --branch=master   --path=flux   --personal
  715  cd ../
  716  cd 13.K8s.Helm/jenkins/
  717  kubectl delete -f deploy.yaml
  718  cd -
  719  cd 15.K8s.FluxCD.ArgoCD/
  720  ls
  721  git pull
  722  ls -l
  723  mkdir
  724  mkdir ci-cd
  725  cp ../13.K8s.Helm/jenkins/deploy.yaml ./jenkins.yaml
  726  ls
  727  mv jenkins.yaml ci-cd/
  728  ls ci-cd/
  729  vim ci-cd/jenkins.yaml
  730  vim flux/flux-system/gotk-sync.yaml
  731  git add --all
  732  git commit -m "Add jenkins"
  733  git push
  734  vim ci-cd/jenkins.yaml
  735  vim flux/flux-system/gotk-sync.yaml
  736  kubectl create namespace argocd
  737  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
  738  vim argocd-install.yaml
  739  kubectl apply -f argocd-install.yaml -n argocd
  740  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  741  mkdir argo-app-manifest
  742  cp ../11.K8s/app.yaml ./argo-app-manifest/
  743  ls argo-app-manifest/
  744  git add --all
  745  git commit -m "Add argoCD manifests"
  746  git push
  747  helm uninstall my-drupal
  748  vim argo-app-manifest/app.yaml
  749  git commit --amend -a
  750  git push
  751  git push origin -f
  752  kubectl get Application -a
  753  kubectl get Application -A
  754  echo "XXX" |  base64 -d
  755  mkdir argo-apps
  756  vim argo-apps/app-web.yaml
  757  vim argo-apps/helm.yaml
  758  git add --all
  759  git commit -m "Add next argo apps"
  760  git push
  761  vim argo-apps/helm.yaml
  762  git commit --amend -a
  763  git push origin -f
  764  vim argo-apps/helm.yaml
  765  history | grep helm
  766  history
```

## All apps

https://github.com/pluhin/argo-flux-31-25

## Changes in argocd deployment (lines added)

https://github.com/pluhin/argo-flux-31-25/blob/master/argocd-install.yaml#L24398

https://github.com/pluhin/argo-flux-31-25/blob/master/argocd-install.yaml#L24403

https://github.com/pluhin/argo-flux-31-25/blob/master/argocd-install.yaml#L25324
