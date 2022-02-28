
## History

```bash
 323  kubectl create ns monitoring
  324  vim zibbix.yaml
  325  kubectl apply -f zibbix.yaml
  326  vim prometheus.yaml
  327  kubectl apply -f prometheus.yaml
  328  kubectl apply -f ksm.yaml
  329  kubectl apply -f prometheus.yaml
  330  kubectl logs kube-state-metrics-648dbcfcb7-vdwx2 -n monitoring
  331  kubectl apply -f grafana.yaml
  332  kubectl apply -f node-exporter.yaml
  333  kubectl apply -f prometheus.yaml
  334  history
```

Pods per nodes
Add variable to dashboard settings (DASHBOARD_Settings):

Name: `node`
Label: <Display_name>
Data source: Prometheus
Query:label_values(node)
Graph for cont of pods per node

Metrics: `sum(kube_pod_info{node=~"$node",job="kube-state-metrics"}) by (node)`
Legend: `{{node}}`
Containers restarts
Metrics: `sum(kube_pod_container_status_restarts_total{job="kube-state-metrics"}) by (pod)`
Legend: `{{pod}}`
