```
  932  mkdir 16.Monitoring
  933  cd 16.Monitoring/
  934  ls
  935  vim zabbix.yaml
  936  cd ../06.Ansible/
  937  ls
  938  vim mysql.yaml
  939  vim inv.yaml
  940  vim mysql.yaml
  941  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix"
  942  vim inv.yaml
  943  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix"
  944  cd ../16.Monitoring/
  945  ls
  946  vim zabbix.yaml
  947  kubectl create ns monitoring
  948  kubectl apply -f zabbix.yaml -n monitoring
  949  vim zabbix.yaml
  950  cd ../06.Ansible/
  951  ls
  952  vim mysql.yaml
  953  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix" -t never
  954  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix"
  955  cd ../16.Monitoring/
  956  ls
  957  vim prometheus.yaml
  958  kubectl apply -f prometheus.yaml -n monitoring
  959  vim ksm.yaml
  960  kubectl apply -f  ksm.yaml -n monitoring
  961  vim grafana.yaml
  962  kubectl apply -f  grafana.yaml -n monitoring
  963  vim node-exporter.yaml
  964  kubectl apply -f node-exporter.yaml -n monitoring
  965  history
```

---

### Prometheus

test filter examples:

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