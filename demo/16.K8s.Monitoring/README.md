## Monitoring

Repository with code 

https://github.com/pluhin/argo-flux-29-24


```bash
  851  ls
  852  mkdir monitoring
  853  cd monitoring/
  854  vim zabbix.yaml
  855  cd ../../06.Ansible.workshop/
  856  ls
  857  vim inv.yaml
  858  history | grep myql
  859  history | grep my
  860  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root
  861  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix" -u root
  862  cd -
  863  vim zabbix.yaml
  864  cd
  865  cd cd -
  866  cd 06.Ansible.workshop/
  867  vim mysql.yaml
  868  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix" -u root -t zabbix
  869  vim mysql.yaml
  870  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix" -u root -t zabbix
  871  vim mysql.yaml
  872  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix" -u root -t zabbix
  873  vim mysql.yaml
  874  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix" -u root -t zabbix
  875  cd ../
  876  cd 15.K8s.ArgoCD/
  877  ls
  878  cd monitoring/
  879  vim zabbix.yaml
  880  cd ../
  881  vim flux-system/gotk-sync.yaml
  882  git commit -m "add monitoring"
  883  git add --all
  884  git commit -m "add monitoring"
  885  git push
  886  vim monitoring/.ns.yaml
  887  git commit --amend -a
  888  git push origin -f
  889  git add --all
  890  git commit -m "add namespace monitoring"
  891  git push
  892  flux reconcile kustomization flux-monitoring --with-source
  893  cd ../
  894  cd 06.Ansible.workshop/
  895  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix" -u root -t never
  896  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix" -u root
  897  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix" -u root -t never
  898  vim mysql.yaml
  899  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix" -u root -
  900  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=zabbix user_db=zabbix pass_db=zabbix" -u root
  901  cd -
  902  cd 15.K8s.ArgoCD/
  903  cd monitoring/
  904  ;s
  905  ls
  906  vim prometheus.yaml
  907  vim ksm.yaml
  908  vim node-exporter.yaml
  909  git add --all
  910  git commit -m "add prometheus"
  911  git push
  912  flux reconcile kustomization flux-monitoring --with-source
  913  vim node-exporter.yaml
  914  vim node-exporter-sa.yaml
  915  git add --all
  916  git commit -m "promethus sa"
  917  git push
  918  flux reconcile kustomization flux-monitoring --with-source
  919  vim prometheus.yaml
  920  git commit --amend -a
  921  git push origin -f
  922  flux reconcile kustomization flux-monitoring --with-source
  923  vim prometheus-np.yaml
  924  vim prometheus-all.yaml
  925  git add --all
  926  git commit -m "add node-exporter"
  927  git push
  928  flux reconcile kustomization flux-monitoring --with-source
  929  vim prometheus-all.yaml
  930  vim prometheus.yaml
  931  vim prometheus-np.yaml
  932  mv prometheus-np.yaml node-exporter-np.yaml
  933  mv prometheus-all.yaml node-eporter-all.yaml
  934  vim node-eporter-all.yaml
  935  ls -l
  936  vim node-eporter.yaml
  937  vim node-exporter.yaml
  938  git add --all
  939  git commit -m "add fix"
  940  git push
  941  flux reconcile kustomization flux-monitoring --with-source
  942  vim node-exporter.yaml
  943  mv
  944  mc
  945  git ad --all
  946  git add --all
  947  git commit -m "add fix"
  948  git push
  949  flux reconcile kustomization flux-monitoring --with-source
  950  vim node-exporter.yaml
  951  cd ../
  952  mkdir dashboards
  953  cd dashboards/
  954  vim node.json
  955  cd ../monitoring/
  956  vim grafana.yaml
  957  git add --all
  958  git commit -m "Grafana"
  959  git push
  960  vim grafana.yaml
  961  history
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