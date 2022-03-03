
```bash
311  mkdir grafana_loki
  312  cd grafana_loki/
  313  kubectl log jenkins-6cbdb68985-6h886 -n ci-cd
  314  kubectl logs jenkins-6cbdb68985-6h886 -n ci-cd
  315  kubectl logs jenkins-6cbdb68985-6h886 -n ci-cd > jenkins.log
  316  ls -h
  317  ls -lh
  318  vim jenkins.log
  319  grep -n "error" jenkins.log
  320  grep -n "ERROR" jenkins.log
  321  grep -n "WARNING" jenkins.log
  322  clear
  323  wget https://github.com/kubernetes-sigs/metrics-server/releases/download/metrics-server-helm-chart-3.8.2/components.yaml -O ms.yaml
  324  ls
  325  kubectl apply -f ms.yaml
  326  rm jenkins.log
  327  vim ms.yaml
  328  kubectl apply -f ms.yaml
  329  history | grep argo
  330  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  331  clear
  332  cp /vagrant/grafana.yaml ./
  333  vim grafana.yaml
  334  kubectl apply -f grafana.yaml
  335  cd -r ../grafana_loki /vagrant/
  336  cc -r ../grafana_loki /vagrant/
  337  cp -r ../grafana_loki /vagrant/
  338  history
```