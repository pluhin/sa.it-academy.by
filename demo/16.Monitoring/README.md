# Monitoring

```
/etc/hosts
178.124.206.53   zabbix.k8s-XX.sa prometheus.k8s-XX.sa grafana.k8s-XX.sa
```

XX - last octet k8s master (192.168.208.**XX**)

## Zabbix install


```SQL
SET GLOBAL log_bin_trust_function_creators = 1;
```

after install zabbix need to return 

```SQL
SET GLOBAL log_bin_trust_function_creators = 0;
```

ref:  https://www.zabbix.com/documentation/current/en/manual/appendix/install/db_scripts


> Default user: Admin, pass: zabbix

---

## History

```bash
  778  cd 15.K8s.GitOps/
  779  mkdir monitoring
  780  vim monitoring/.ns.yaml
  781  vim monitoring/zabbix.yaml
  782  cd ../06.Ansible.WorkShop/
  783  vim inv.yaml
  784  cd ../06.Ansible.WorkShop/
  785  vim mysql.yaml
  786  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix" -u root
  787  cd ../15.K8s.GitOps/
  788  ls
  789  cd monitoring/
  790  ls
  791  cd ../
  792  vim flux/flux-system/gotk-sync.yaml
  793  git add --all
  794  git commit  -m "Monitoring"
  795  git push
  796  vim monitoring/zabbix.yaml
  797  vim monitoring/prometheus.yaml
  798  vim monitoring/node-exporter.yaml
  799  vim monitoring/ksm.yaml
  800  git add --all
  801  git commit -m "Add prometheus"
  802  git push
  803  vim monitoring/grafana.yaml
  804  git add --all
  805  git commit -m "add grafana"
  806  git push
  807  flux reconcile kustomization monitoring --with-source
  808  history
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

Graph for cont of pods per node

- Metrics: `sum(kube_pod_info{node=~"$node",job="kube-state-metrics"}) by (node)`
- Legend: `{{node}}`
#### Containers restart
- Metrics: `sum(kube_pod_container_status_restarts_total{job="kube-state-metrics"}) by (pod)`
- Legend: `{{pod}}`