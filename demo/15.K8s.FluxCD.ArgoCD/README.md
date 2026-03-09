```bash
flux bootstrap github \
  --token-auth \
  --owner=pluhin \
  --repository=argo-flux-34-26 \
  --branch=master \
  --path=flux \
  --personal
```
## GitOps repo

https://github.com/pluhin/argo-flux-34-26

---
```bash
 790  mkdir 15.K8s.FluxCD.ArgoCD
  791  cd 15.K8s.FluxCD.ArgoCD/
  792  ls
  793  curl -s https://fluxcd.io/install.sh | sudo bash
  794  flux
  795  touch README.md
  796  git init
  797  git add --all
  798  git commit -m "Init commit"
  799  git remote add origin git@github.com:pluhin/argo-flux-34-25.git
  800  git push -u origin master
  801  export GITHUB_TOKEN=XXXXXXXXXXXX
  802  clear
  803  flux bootstrap github   --token-auth   --owner=pluhin   --repository=argo-flux-34-26   --branch=master   --path=flux   --personal
  804  git pull
  805  ls
  806  la
  807  ls
  808  git remote rename origin origin-old
  809  git remote add origin git@github.com:pluhin/argo-flux-34-26.git
  810  git pull
  811  vim .git/config
  812  git remote set-url "origin" git@github.com:pluhin/argo-flux-34-26.git
  813  git pull
  814  git push -u origin main
  815  git remote -v
  816  rm -rf .git
  817  ls
  818  rm README.md
  819  cd ../
  820  git clone github.com:pluhin/argo-flux-34-26.git 15.K8s.FluxCD.ArgoCD
  821  cd 15.K8s.FluxCD.ArgoCD/
  822  git clone git@github.com:pluhin/argo-flux-34-26.git
  823  ls
  824  mc
  825  git pull
  826  git push
  827  mkdir ci-cd
  828  cp ../14.K8s.WorkShop/jenkins.yaml ci-cd/
  829  ls -l
  830  ls -l ci-cd/
  831  vim flux/flux-system/ci-cd.yaml
  832  vim flux/flux-system/gotk-sync.yaml
  833  git add --all
  834  git commit -m "add jenkins"
  835  git push
  836  git log --oneline
  837  mkdir kube-system
  838  vim kube-system/sealsecret.yaml
  839  vim flux/flux-system/gotk-sync.yaml
  840  vim kube-system/sealsecret.yaml
  841  git add  --all
  842  git commit -m "Add sealsecret"
  843  git push
  844  vim flux/flux-system/gotk-sync.yaml
  845  git commit --amend -a --no-edit
  846  git push origin -f
  847  vim flux/flux-system/gotk-sync.yaml
  848  git commit --amend -a --no-edit
  849  git push origin -f
  850  cd ../
  851  cd 12.k8s/
  852  ls
  853  kubectl delete -f sealed_secret.yaml
  854  flux reconcile hr sealed-secrets -n flux-system
  855  flux reconcile ks flux-secret -n flux-system --with-source
  856  history
```