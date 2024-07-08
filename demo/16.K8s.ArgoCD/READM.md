## Manifests

manifests for monitoring: https://github.com/pluhin/argo-flux-28-24

## History

```bash


curl -s https://fluxcd.io/install.sh | sudo bash
flux --version

flux check --pre
export GITHUB_TOKEN=ghp_XXXXXXXXX
cp ../11.K8s/app.yaml k3s/
vim monitoring/app.yaml
flux bootstrap github   --token-auth   --owner=pluhin   --repository=argo-flux-28-24   --branch=master   --path=./   --personal
git pull
vim flux-system/kustomization.yaml
vim flux-system/gotk-sync.yaml
vim flux-system/gotk-sync.yaml
git add --all
git commit -m "fix flux and add app"
git push
kubectl apply -f flux-system/gotk-sync.yaml
vim flux-system/gotk-sync.yaml
kubectl apply -f flux-system/gotk-sync.yaml
vim flux-system/gotk-sync.yaml




cd monitoring/
vim zabbix.yaml
git add --all
git commit -m "add zabbix"
git push
vim zabbix.yaml
vim prometheus.yaml
git add --all
git commit -m "add prometheus"
git push
vim ksm.yaml
vim node-exporter.yaml
git add --all
git commit -m "add ksm and node-exporter"
git push
 vim grafana.yaml
 git add --all
 git commit -m "Add grafana"
 git push
 vim grafana.yaml

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