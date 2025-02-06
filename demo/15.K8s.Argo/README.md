# 15.K8s

## Flux

```bash
export GITHUB_TOKEN=<gh-token>

flux bootstrap github \
  --token-auth \
  --owner=pluhin \
  --repository=argo-flux-30-24 \
  --branch=master \
  --path=flux/ \
  --personal
```
---
## Argocd

```
root@jump:~# cat /etc/nginx/conf.d/k8s_sa.k8s.conf
## Ansible managed
## SA group cluster
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*argocd\.k8s-(\d+)\.sa$";

  location / {
       # proxy_set_header Host $host;
        proxy_pass       http://192.168.208.$1:30007;
  }
}
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*\.k8s-(\d+)\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.208.$1:30001;
  }
}
```
---

Line in /etc/hosts, to see argoWebUI in browser
```
178.124.206.53   argocd.k8s-25.sa
```

### Get default argo-cd admin pass

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

```bash
 718  mkdir 15.K8s.GitOps
  719  cd 15.K8s.GitOps/
  720  ls
  721  git init
  722  vim README.md
  723  git add --all
  724  git commit -m "Init"
  725  git remote add origin git@github.com:pluhin/argo-flux-30-24.git
  726  git push --set-upstream origin master
  727  curl -s https://fluxcd.io/install.sh | sudo bash
  728  flux
  729  cd 15.K8s.GitOps/
  730  ls
  731  curl -s https://fluxcd.io/install.sh | sudo bash
  732  flux
  733  export GITHUB_TOKEN=XXXXXXXXXXXXX
  734  flux bootstrap github   --token-auth   --owner=pluhin   --repository=argo-flux-30-24   --branch=master   --path=flux/   --personal
  735  cd ../
  736  cd 14.K8s.Application_deployment/
  737  kubectl delete -f jenkins.yaml
  738  cd -
  739  cd 15.K8s.GitOps/
  740  ls
  741  git pull
  742  mkdir ci-cd
  743  cp ../14.K8s.Application_deployment/jenkins.yaml ci-cd/
  744  vim flux/flux-system/gotk-sync.yaml
  745  git add --all
  746  git commit -m "add ci-cd"
  747  git push
  748  vim flux/flux-system/gotk-sync.yaml
  749  kubectl get ks
  750  kubectl get ks -a
  751  kubectl get ks -A
  752  kubectl create namespace argocd
  753  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argo-cd-install.yaml
  754  vim argo-cd-install.yaml
  755  mkdir argo-apps
  756  kubectl apply -f argo-cd-install.yaml -n argocd
  757  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  758  cd ../
  759  cd 12.K8s/
  760  ls
  761  kubectl delete -f sealed_secret.yaml
  762  history | grep seal
  763  kubectl delete -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.28.0/controller.yaml
  764  echo "aHR0cHM6Ly9wbHVoaW4uZ2l0aHViLmlvL2hlbG0tMzAtMjQv" | base64 -d
  765  kubectl get application -A
  766  cd ../15.K8s.GitOps/
  767  kubectl get application app -n argocd -o yaml > argo-apps/app.yaml
  768  kubectl get application sealsecret -n argocd -o yaml > argo-apps/sealsecret.yaml
  769  vim argo-apps/app.yaml
  770  vim argo-apps/sealsecret.yaml
  771  git add --al
  772  git add --all
  773  git commit -m "add argocd apps"
  774  git push
  775  kubectl get application -A
  776  history
```

https://github.com/pluhin/argo-flux-30-24

### Changes in argocd manifest

https://github.com/pluhin/argo-flux-30-24/blob/master/argo-cd-install.yaml#L22848

https://github.com/pluhin/argo-flux-30-24/blob/master/argo-cd-install.yaml#L22854

https://github.com/pluhin/argo-flux-30-24/blob/master/argo-cd-install.yaml#L23746

