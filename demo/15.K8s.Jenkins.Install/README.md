## History

```bash
  783  mkdir 15.K8s.Jenkins.Install
  784  cd 15.K8s.Jenkins.Install/
  785  ls
  786  git init
  787  mkdir -p ./github/workflows/
  788  ls -la
  789  mv github/ .github
  790  ls
  791  ls -la
  792  vim .github/workflows/build.yaml
  793  vim Dockerfile
  794  git add --all
  795  git commit -m "Init"
  796  git remote add origin git@github.com:pluhin/sa-36-26-jenkins.git
  797  git push -u origin master
  798  history
  799  vim 01-namespace-rbac.yaml
  800  kubectl apply -f 01-namespace-rbac.yaml
  801  vim 02-storage.yaml
  802  kubectl apply -f 02-storage.yaml
  803  kubectl get ns
  804  kubectl get pv
  805  kubectl get pv | grep ci
  806  kubectl get pvc | grep ci
  807  kubectl get pvc | grep jenk
  808  kubectl get pvc -A | grep jenk
  809  history
  810  kubectl get pv
  811  kubectl get pvc -A | grep jenk
  812  vim 03-config.yaml
  813  kubectl apply -f 03-config.yaml
  814  vim 03-config.yaml
  815  kubectl apply -f 03-config.yaml
  816  vim 03-config.yaml
  817  vim 04-jenkins.yaml
  818  kubectl apply -f 04-jenkins.yaml
  819  vim 02-storage.yaml
  820  kubectl apply -f 02-storage.yaml
  821  kubectl describe pod jenkins-7cc7689767-rl6p2 -n ci-cd
  822  kubectl get pods -n ci-cd
  823  kubectl describe pod jenkins-7cc7689767-rl6p2 -n ci-cd
  824  history
  825  kubectl get events -n ci-cd
  826  kubectl get events -n ci-cd | War
  827  kubectl get events -n ci-cd | grep  War
  828  history | grep  common
  829  history | grep  ansible
  830  kubectl get pods -n ci-cd
  831  vim 02-storage.yaml
  832  vim jenkins-istio.yaml
  833  kubectl apply -f jenkins-istio.yaml
  834  vim 01-namespace-rbac.yaml
  835  kubectl apply -f 01-namespace-rbac.yaml
  836  kubectl rollout jenkins -n ci-cd
  837  kubectl rollout deployment jenkins -n ci-cd
  838  kubectl rollout -h
  839  kubectl rollout restart jenkins -n ci-cd
  840  kubectl rollout restart deployment/jenkins -n ci-cd
  841  vim 01-namespace-rbac.yaml
  842  vim 03-config.yaml
  843  kubectl apply -f 03-config.yaml
  844  kubectl rollout restart deployment/jenkins -n ci-cd
```
