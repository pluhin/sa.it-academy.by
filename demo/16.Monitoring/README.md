```bash
  998  ls -l
  999  mkdir 16.Monitoring
 1000  cd 16.Monitoring/
 1001  ls
 1002  vim zabbix.yaml
 1003  vim ../06.Ansible/mysql.yaml
 1004  vim ../06.Ansible/inv.yaml
 1005  vim zabbix.yaml
 1006  cd  ../06.Ansible/
 1007  history | grep mysql
 1008  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
 1009  ansible-playbook -i inv.yaml mysql.yaml -e name_db=zabbix -e user_db=zabbix -e pass_db=zabbix -u root
 1010  cd -
 1011  vim zabbix.yaml
 1012  kubectl create namespace monitoring
 1013  kubectl apply -f zabbix.yaml -n monitoring
 1014  vim zabbix.yaml
 1015  cd ../06.Ansible/
 1016  ls
 1017  vim mysql.yaml
 1018  ansible-playbook -i inv.yaml mysql.yaml -e name_db=zabbix -e user_db=zabbix -e pass_db=zabbix -u root -t never
 1019  ansible-playbook -i inv.yaml mysql.yaml -e name_db=zabbix -e user_db=zabbix -e pass_db=zabbix -u root
 1020  vim mysql.yaml
 1021  cd -
 1022  ls
 1023  vim zabbix.yaml
 1024  vim prometheus.yaml
 1025  q
 1026  vim prometheus.yaml
 1027  kubectl apply -f prometheus.yaml -n monitoring
 1028  vim prometheus.yaml
 1029  vim ksm.yaml
 1030  kubectl apply -f ksm.yaml -n monitoring
 1031  vim grafana.yaml
 1032  kubectl apply -f grafana.yaml -n monitoring
 1033  vim zabbix.yaml
 1034  vim node-exporter.yaml
 1035  kubectl apply -f node-exporter.yaml -n monitoring
 1036  history
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