```bash
 916  cd 15.K8s.GitOps/
  917  ls
  918  vim monitoring/node-exporter.yaml
  919  kubectl scale deployment kube-state-metrics --replicas=0 -n kube-state-metrics
  920  kubectl scale deployment kube-state-metrics --replicas=0 -n monitoring
  921  kubectl scale deployment kube-state-metrics --replicas=1 -n monitoring
  922  sudo pip3 install ansible-lint
  923  ansible-lint
  924  cd ../06.Ansible.WorkShop/
  925  ls
  926  ansible-lint mariadb.yaml
  927  cd ../
  928  cd 15.K8s.GitOps/
  929  wget https://github.com/yannh/kubeconform/releases/download/v0.6.7/kubeconform-linux-amd64.tar.gz
  930  sudo tar -C /usr/local/bin/ -xzf kubeconform-linux-amd64.tar.gz
  931  ls -l /usr/local/bin/kubeconform
  932  kubeconform  --summary monitoring/
  933  ls -l monitoring/
  934  vim monitoring/zabbix.yaml
  935  kubeconform  --summary monitoring/
  936  vim monitoring/zabbix.yaml
  937  kubeconform  --summary monitoring/ --schema-location default --schema-location 'https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/all.json'
  938  kubeconform  --summary --schema-location default --schema-location 'https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/all.json' monitoring
  939  vim monitoring/loki.yaml
  940  cp monitoring/loki.yaml monitoring/loki2.yaml
  941  vim monitoring/loki2.yaml
  942  kubeconform  --summary --schema-location default --schema-location 'https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/all.json' monitoring
  943  kubeconform  --summary --schema-location default --schema-location 'https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' monitoring
  944  kubeconform  --summary --schema-location default --schema-location 'https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/{{.ResourceKind}}-{{.ResourceAPIVersion}}.json' monitoring
  945  kubeconform  --summary --schema-location default --schema-location 'https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/{{.ResourceKind}}-{{.ResourceAPIVersion}}.json' --scheme-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/helmrelease-helm-v2.json monitoring
  946  kubeconform  --summary --schema-location default --schema-location 'https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/{{.ResourceKind}}-{{.ResourceAPIVersion}}.json' --schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/helmrelease-helm-v2.json monitoring
  947  vim monitoring/loki2.yaml
  948  kubeconform  --summary --schema-location default --schema-location 'https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/{{.ResourceKind}}-{{.ResourceAPIVersion}}.json' --schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/helmrelease-helm-v2.json monitoring
  949  wget https://github.com/stackrox/kube-linter/releases/download/v0.7.1/kube-linter-linux
  950  mv kube-linter-linux kube-linter
  951  l
  952  chmod +z kube-linter
  953  chmod +x kube-linter
  954  l
  955  sudo mv kube-linter /usr/local/bin/
  956  kube-linter
  957  kube-linter lint ci-cd/jenkins.yaml
  958  kube-linter --help
  959  kube-linter lint --help
  960  kube-linter lint --add-all-built-in
  961  kube-linter lint --add-all-built-in ci-cd/jenkins.yaml
  962  vim k6s.yaml
  963  kubectl apply -f k6s.yaml
  964  kubectl delete -f k6s.yaml
  965  history
```

```bash
 kubeconform  --summary --schema-location default --schema-location 'https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/{{.ResourceKind}}-{{.ResourceAPIVersion}}.json' --schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/helmrelease-helm-v2.json monitoring


 kubeconform  --summary --schema-location default --schema-location 'https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/refs/heads/main/{{.ResourceKind}}-helm-{{.ResourceAPIVersion}}.json' monitoring
```
