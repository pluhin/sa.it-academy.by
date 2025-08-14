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

Graph for cont of pods per node

- Metrics: `sum(kube_pod_info{node=~"$node",job="kube-state-metrics"}) by (node)`
- Legend: `{{node}}`
#### Containers restart
- Metrics: `sum(kube_pod_container_status_restarts_total{job="kube-state-metrics"}) by (pod)`
- Legend: `{{pod}}`
