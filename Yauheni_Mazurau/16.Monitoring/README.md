# 16. Technical and service monitoring
[https://github.com/YMazurau/16.-Technical-and-service-monitoring]

## Deploy Zabbix

* WebUI [zabbix.k8s-8.sa]  

```bash
nano Zabbix.yaml
```

* Creating a database, a user and permission

```sql
CREATE USER 'zabbix'@'%' IDENTIFIED BY 'zabbix';
GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'%';
FLUSH PRIVILEGES;
exit;
```

* Deploy

```bash
kubectl create namespace monitoring
kubectl apply -f zabbix.yaml -n monitoring
```

## Prometheus   

* WeBUI [prometheus.k8s-8.sa]

* Prometheus alerts [https://samber.github.io/awesome-prometheus-alerts/rules.html]

* Deploy

```bash
wget https://raw.githubusercontent.com/pluhin/sa.it-academy.by/md-sa2-25-23/demo/16.Monitoring/prometheus.yaml
kubectl apply -f prometheus.yaml -n monitoring
```

* KSM  [https://github.com/kubernetes/kube-state-metrics]

```bash
wget https://raw.githubusercontent.com/pluhin/sa.it-academy.by/md-sa2-25-23/demo/16.Monitoring/ksm.yaml
kubectl apply -f ksm.yaml -n monitoring
```

## Grafana  

* WebUI [grafana.k8s-8.sa] 

* Deploy

```bash
wget https://raw.githubusercontent.com/pluhin/sa.it-academy.by/md-sa2-25-23/demo/16.Monitoring/grafana.yaml
kubectl apply -f grafana.yaml -n monitoring
```
* Node-exporter

```bash
wget https://raw.githubusercontent.com/pluhin/sa.it-academy.by/md-sa2-25-23/demo/16.Monitoring/node-exporter.yaml
kubectl apply -f node-exporter.yaml -n monitoring
```

Graph for cont of pods per node

```
sum(kube_pod_info{node=~"$node",job="kube-state-metrics"}) by (node)
Legend: {{node}}
```

Containers restarts

```
sum(kube_pod_container_status_restarts_total{job="kube-state-metrics"}) by (pod)
{{pod}}
```

##  Alert manager 

* WebUI  [alertmanager.k8s-8.sa]

## Slack

[https://api.slack.com/messaging/webhooks]


## Grafana new dashboard

memory
```
sum(rate(container_memory_usage_bytes{}[1m])/1024/1024) by (pod)
```

CPU
```
sum(rate(container_cpu_usage_seconds_total{}[1m])) by (pod_name)
```