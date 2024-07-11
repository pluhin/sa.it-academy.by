## ArgoCD install

ArgoCD reposirory for demo: https://github.com/pluhin/argo-flux-28-24


## Changes in argoCD installation file

+ https://github.com/pluhin/argo-flux-28-24/blob/master/argocd-install.yaml#L22367
+ https://github.com/pluhin/argo-flux-28-24/blob/master/argocd-install.yaml#L21505
+ https://github.com/pluhin/argo-flux-28-24/blob/master/argocd-install.yaml#L21511


```bash
  815  mkdir 15.K8s.ArgoCD
  816  cd 15.K8s.ArgoCD/
  817  kubectl create namespace argocd
  818  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
  819  vim argocd-install.yaml
  820  kubectl apply -f argocd-install.yaml -n argocd
  821  vim argocd-install.yaml
  822  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-install.yaml
  823  vim argocd-install.yaml
  824  kubectl apply -f argocd-install.yaml -n argocd
  825  vim argocd-install.yaml
  826  kubectl apply -f argocd-install.yaml -n argocd
  827  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  828  cd ../12.K8s.configmaps.secrets/
  829  ls
  830  history | grep sealed
  831  cd -
  832  kubectl delete -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.27.0/controller.yaml
  833  ls
  834  mkdir argo-apps
  835  kubectl get applications
  836  kubectl get applications -A
  837  kubectl get applications helm-sa -n argocd -o yaml > helm-sa.yaml
  838  vim helm-sa.yaml
  839  vim sealed-secret.yaml
  840  mv helm-sa.yaml argo-apps/
  841  mv sealed-secret.yaml argo-apps/
  842  ls
  843  git init
  844  git remote add origin git@github.com:pluhin/argo-flux-28-24.git
  845  vim argo-apps/sealed-secret.yaml
  846  vim argo-apps/helm-sa.yaml
  847  git add --all
  848  git commit -m "Init"
  849  git config --global user.email "pluhin@gmail.com"
  850  git config --global user.name "Siarhei Pishchyk"
  851  git commit --amend -a
  852  git commit -m "Init"
  853  git push
  854  git push --set-upstream origin master
  855  history
```
