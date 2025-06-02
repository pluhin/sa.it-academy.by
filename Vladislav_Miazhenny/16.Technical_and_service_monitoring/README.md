#### Homework Assignment 1: Deploy and setup Prometheus Alertmanager
1. Create `prometheus.yaml`  `alertmanager.yaml` `node-exporter.yaml` `ksm.yaml` `.ns.yaml`
2. Deploy by using ArgoCD: `deploy.png`
3. Add secret
```bash
kubectl create secret generic alertmanager-secrets --from-literal=slack-api-url='https://hooks.slack.com/services/XXXXXXXXX/XXXXXXXXXX/XXXXXXXXXXXXXXXXX' -n monitoring
```
Results `alerts.png`

#### Homework Assignment 2: Use Grafana to display load of pods
1. Deploy Grafana by using ArgoCD: `grafana.yaml`
2. Add Prometheus in Grafana `grafana_datasources.png`
3. CPU
```
sum(rate(container_cpu_usage_seconds_total{container!="", pod=~"$pod"}[5m])) by (pod)
```
4. Memory
```
sum(rate(container_memory_usage_bytes{container!="", pod=~"$pod"}[5m])) by (pod)
```
Result: `grafana_result.png`





