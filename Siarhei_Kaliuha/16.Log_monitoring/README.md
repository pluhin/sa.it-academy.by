# Homework report for 16.Log_monitoring by Siarhei Kaliuha

---
Cluster `cluster.remote.k8s` deployed inside IT-ACADEMY environment.  

## Grafana Loki deployed inside cluster:

![k8s-loki-helm.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/16.Log_monitoring/k8s-loki-helm.jpg)

## Grafana dashboard created to monitor counts of errors for the following application inside cluster:
* Jenkins
* Ingress
* node-exporter  

Counts of errors can be chosen as parameter from list: 5m, 1h, 1d.  
Dashboard exported to `Log_monitoring.json` file

![grafana.k8s-21.sa.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/16.Log_monitoring/grafana.k8s-21.sa.jpg)