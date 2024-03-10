## Manifests

manifests for monitoring: https://github.com/pluhin/argocd-27-24/tree/master/monitoring

## History

```bash
  901  mkdir k3s
  902  curl -s https://fluxcd.io/install.sh | sudo bash
  903  flux --version
  904  kubectl config use-context k3s
  905  kubectl get ns
  906  kubectl get pods -A
  907  flux check --pre
  908  export GITHUB_TOKEN=ghp_XXXXXXXXXXXXXXXXXXXXX
X 909  flux bootstrap github   --token-auth   --owner=my-github-username   --repository=my-repository-name   --branch=main   --path=clusters/my-cluster   --personal
  910  cp ../11.K8s/app.yaml k3s/
  911  vim k3s/app.yaml
  912  git add --all
  913  git commit -m "Add flux"
  914  git push
  915  flux bootstrap github   --token-auth   --owner=pluhin   --repository=argocd-27-24   --branch=master   --path=./k3s   --personal
  916  git pull
  917  mv k3s/flux-system ./
  918  ls
  919  vim k3s/app.yaml
  920  vim flux-system/kustomization.yaml
  921  vim flux-system/gotk-sync.yaml
  922  vim flux-system/gotk-sync.yaml
  923  git add --all
  924  git commit -m "fix flux and add app"
  925  git push
  926  kubectl apply -f flux-system/gotk-sync.yaml
  927  vim flux-system/gotk-sync.yaml
  928  kubectl apply -f flux-system/gotk-sync.yaml
  929  vim flux-system/gotk-sync.yaml
  930  vim k3s/app.yaml
  931  git add --all
  932  git commit -m "test"
  933  git push
  934  kubectl config use-context "k8s"
  935  kubectl get ns
  936  mkdir monitoring
  937  cd monitoring/
  938  vim zabbix.yaml
  939  git add --all
  940  git commit -m "add zabbix"
  941  git push
  942  vim zabbix.yaml
  943  vim prometheus.yaml
  944  git add --all
  945  git commit -m "add prometheus"
  946  git push
  947  vim ksm.yaml
  948  vim node-exporter.yaml
  949  git add --all
  950  git commit -m "add ksm and node-exporter"
  951  git push
  952  vim grafana.yaml
  953  git add --all
  954  git commit -m "Add grafana"
  955  git push
  956  vim grafana.yaml
  957  history
```

### Prometheus

test filter examples: https://samber.github.io/awesome-prometheus-alerts/rules.html

```
rate(container_cpu_usage_seconds_total{pod=~"jenk.*"}[1m])
container_memory_working_set_bytes{container="jenkins"}
```

### Grafana

- Apply manifest
- User/pass: admin/admin
- check sources for prometheus
- add dashboard set `11074` [link](https://grafana.com/grafana/dashboards/11074)

### Grafana dashboard

#### Pods per nodes
Add variable to dashboard settings (DASHBOARD_Settings):

- Name: <variable_name>
- Lable: <Dispalay_name>
- Data source: Prometheus
- Query:`label_values(node)`

Graph for cont of pods per node

- Metrics: `sum(kube_pod_info{node=~"$node",job="kube-state-metrics"}) by (node)`
- Legend: `{{node}}`
#### Containers restarts
- Metrics: `sum(kube_pod_container_status_restarts_total{job="kube-state-metrics"}) by (pod)`
- Legend: `{{pod}}`