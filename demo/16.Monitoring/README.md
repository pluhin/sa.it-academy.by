```bash
774  cd 15.K8s.FluxCD.ArgoCD/
  775  ls
  776  mkdir monitoring
  777  vim monitoring/prometheus.yaml
  778  vim ksm.yaml
  779  vim node-exporter.yaml
  780  vim flux/flux-system/gotk-sync.yaml
  781  git add --all
  782  git commit -m "Add monitoring"
  783  git push
  784  vim monitoring/prometheus.yaml
  785  vim ci-cd/jenkins.yaml
  786  vim monitoring/.ns.yaml
  787  git add --all
  788  git commit -m "Add monitoring namespace"
  789  git push
  790  flux reconcile kustomization monitoring --with-source
  791  mc
  792  mv ksm.yaml monitoring/
  793  mv node-exporter.yaml monitoring/
  794  git add --all
  795  git commit -m "Correct patch for monitoring"
  796  git push
  797  flux reconcile kustomization monitoring --with-source
  798  ls -l monitoring/
  799  vim grafana.yaml
  800  git add --all
  801  git commit -m "Add grafana"
  802  git push
  803  flux reconcile kustomization monitoring --with-source
  804  mv grafana.yaml monitoring/
  805  git add --all
  806  git commit -m "Add grafana 2"
  807  git push
  808  flux reconcile kustomization monitoring --with-source
  809  history
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
- Label: <Dispalay_name>
- Data source: Prometheus
- Query:`label_values(node)`