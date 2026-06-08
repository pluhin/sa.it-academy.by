```bash
784  cd 15.K8s.FluxCD.ArgoCD/
  785  ls
  786  mkdir monitoring
  787  cd monitoring/
  788  vim prometheus.yaml
  789  vim _ns.yaml
  790  cd ..
  791  vim flux/flux-system/gotk-sync.yaml
  792  git add --all
  793  git commit -m "Add monitoring"
  794  git push
  795  vim monitoring/kms.yaml
  796  vim monitoring/grafana.yaml
  797  mv monitoring/grafana.yaml monitoring/grafana-istio.yaml
  798  kubectl get svc -n monitoring
  799  vim monitoring/grafana.yaml
  800  git add --all
  801  git commit -m "Add grafana"
  802  git push
  803  flux reconcile source helm flagger -n flux-system
  804  kubectl get pods -n monitoring
  805  kubectl get pods -n monitoring
  806  vim monitoring/grafana.yaml
  807  git commit --amend --all --no-edit
  808  git push origin -f
  809  vim monitoring/grafana-istio.yaml
  810  git commit --amend --all --no-edit
  811  git push origin -f
  812  vim monitoring/prometheus.yaml
  813  vim monitoring/grafana.yaml
  814  git commit --amend --all --no-edit
  815  git push origin -f
  816  history
```

## Prometheus

test filter examples: https://samber.github.io/awesome-prometheus-alerts/rules.html

```
rate(container_cpu_usage_seconds_total{pod=~"jenk.*"}[1m])
container_memory_working_set_bytes{container="jenkins"}
```

## Grafana dashboard

### Pods per nodes
Add variable to dashboard settings (DASHBOARD_Settings):

- Name: <variable_name>
- Label: <Dispalay_name>
- Data source: Prometheus
- Query:`label_values(node)`

Graph for cont of pods per node

- Metrics: `sum(kube_pod_info{node=~"$node",job="kube-state-metrics"}) by (node)`
- Legend: `{{node}}`6### Containers restart
- Metrics: `sum(kube_pod_container_status_restarts_total{job="kube-state-metrics"}) by (pod)`
- Legend: `{{pod}}`
