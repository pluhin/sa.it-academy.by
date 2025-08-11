# GitOPS

https://github.com/pluhin/argo-flux-32-25/

Changes in argocd deployment

https://github.com/pluhin/argo-flux-32-25/blob/master/argo-core/argocd-deploy.yaml#L24836

https://github.com/pluhin/argo-flux-32-25/blob/master/argo-core/argocd-deploy.yaml#L24841

https://github.com/pluhin/argo-flux-32-25/blob/master/argo-core/argocd-deploy.yaml#L25792

```bash
 782  mkdir 15.K8s.FluxCD.ArgoCD
  783  cd 15.K8s.FluxCD.ArgoCD/
  784  curl -s https://fluxcd.io/install.sh | sudo bash
  785  export GITHUB_TOKEN=XXXXX
  786  git init
  787  vim README.md
  788  git add README.md
  789  git commit -m "Init commit"
  790  git remote add origin git@github.com:pluhin/argo-flux-32-25.git
  791  git push -u origin master
  792  flux bootstrap github   --token-auth   --owner=pluhin   --repository=argo-flux-32-25   --branch=master   --path=flux   --personal
  793  git pull
  794  vim flux/flux-system/kustomization.yaml
  795  vim flux/flux-system/gotk-sync.yaml
  796  mkdir ci-cd
  797  cp ../14.K8s.Jenkins.Install/jenkins/deploy_jenkins.yaml ci-cd/
  798  vim flux/flux-system/gotk-sync.yaml
  799  vim ci-cd/deploy_jenkins.yaml
  800  vim flux/flux-system/gotk-sync.yaml
  801  git add --all
  802  git commit -m "Add flux app"
  803  git push
  804  vim flux/flux-system/gotk-sync.yaml
  805  git commit --amend --all --no-edit
  806  git push origin -f
  807  flux reconcile kustomization flux-system  --with-source
  808  kubectl create namespace argocd
  809  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-deploy.yaml
  810  vim argocd-deploy.yaml
  811  kubectl apply -f argocd-deploy.yaml -n argocd
  812  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  813  cd ../
  814  cd 12.K8s.Data.Security/
  815  ls
  816  kubectl delete -f app.yaml
  817  cd -
  818  cd 15.K8s.FluxCD.ArgoCD/
  819  ls
  820  mkdir argo-core
  821  cp argocd-deploy.yaml argo-core/
  822  rm argocd-deploy.yaml
  823  git add --all
  824  git commit -m "add argocd deploy"
  825  git push
  826  kubectl apply -f argo-core/argocd-deploy.yaml -n argocd
  827  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  828  kubectl apply -f argo-core/argocd-deploy.yaml -n argocd
  829  mkdir argo-app-manifests
  830  cp ../12.K8s.Data.Security/app.yaml argo-app-manifests/
  831  mkdir argo-apps
  832  kubectl get applications -n argocd argo-app -o yaml > argo-apps/web-app.yaml
  833  vim argo-apps/web-app.yaml
  834  git add --all
  835  git commit -m "Add web-app"
  836  git push
  837  ls -l
  838  vim argo-apps/web-app.yaml
  839  vim argo-apps/secret-controller.yaml
  840  git add --all
  841  git commit -m "Add secret controller"
  842  git push
  843  vim argo-app-manifests/app.yaml
  844  git commit --amend --all --no-edit
  845  git push origin -f
  846  cp ../12.K8s.Data.Security/sealed_secret.yaml ./argo-app-manifests/
  847  git add --all
  848  git commit -m "Add missing secret"
  849  git push
  850  vim argo-app-manifests/sealed_secret.yaml
  851  vim argo-app-manifests/app.yaml
  852  git commit --amend --all --no-edit
  853  git push origin -f
  854  ls -l
  855  echo "XXXX" | base64 -d
  856  history
```