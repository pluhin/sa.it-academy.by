# 16.K8s.Monitoring

```bash
 838  mkdir 16.Monitoring
  839  cd 16.Monitoring/
  840  ls
  841  cd ../06.Ansible.WS/
  842  history | grep ansible
  843  ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix"
  844  cd -
  845  vim zabbix.yaml
  846  kubectl get ns
  847  kubectl create ns monitoring
  848  kubectl apply -f zabbix.yaml -n monitoring
  849  history
  850  vim zabbix.yaml
  851  kubectl logs zabbix-server-6795c46d4d-4v6x2 -n monitoring
  852  vim zabbix.yaml
  853  kubectl apply -f zabbix.yaml -n monitoring
  854  cd ../06.Ansible.WS/
  855  cp mariadb.yaml mysql.yaml
  856  vim inv.yaml
  857  vim mysql.yaml
  858  vim inv.yaml
  859  vim mysql.yaml
  860  history | grep ansible
  861  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix"
  862  cd -
  863  vim zabbix.yaml
  864  kubectl apply -f zabbix.yaml -n monitoring
  865  vim zabbix.yaml
  866  vim ../06.Ansible.WS/mysql.yaml
  867  kubectl apply -f zabbix.yaml -n monitoring
  868  cd ../
  869  cd 06.Ansible.WS/
  870  vim mysql.yaml
  871  cd -
  872  cd 16.Monitoring/
  873  vim prometheus.yaml
  874  kubectl apply -f prometheus.yaml -n monitoring
  875  vim ksm.yaml
  876  kubectl apply -f ksm.yaml -n monitoring
  877  vim node-exporter.yaml
  878  kubectl apply -f node-exporter.yaml -n monitoring
  879  vim grafana.yaml
  880  kubectl apply -f grafana.yaml -n monitoring
  881  vim grafana.yaml
  882  history
```


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