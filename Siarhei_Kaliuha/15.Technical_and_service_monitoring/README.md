# Homework report for 15.Technical_and_service_monitoring by Siarhei Kaliuha

---
Cluster `cluster.remote.k8s` deployed inside IT-ACADEMY environment.  
All manifests provided in `manifests` directory. Also used `kube-state-metrics` and `node-exporter`.

## Next monitoring applications was deployed in `monitoring` namespace.

![k9s-monitoring.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/15.Technical_and_service_monitoring/k9s-monitoring.jpg)

## Zabbix available from remote host at http://zabbix.k8s-21.sa/  

![zabbix.k8s-21.sa.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/15.Technical_and_service_monitoring/zabbix.k8s-21.sa.jpg)

## Prometheus available from remote host at http://prometheus.k8s-21.sa/

![prometheus.k8s-21.sa.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/15.Technical_and_service_monitoring/prometheus.k8s-21.sa.jpg)

## Alertmanager available from remote host at http://alertmanager.k8s-21.sa/

![alertmanager.k8s-21.sa.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/15.Technical_and_service_monitoring/alertmanager.k8s-21.sa.jpg)

## Grafana available from remote host at http://grafana.k8s-21.sa/

* Prometheus added as metrics source for Grafana

![grafana.k8s-21.sa.source.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/15.Technical_and_service_monitoring/grafana.k8s-21.sa.source.jpg)

* Custom dashboard created with CPU and memory graphs per pods using queries:
```
rate(container_cpu_usage_seconds_total[5m])
container_memory_usage_bytes / 1000000000
```
![grafana.k8s-21.sa.dashboard.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/15.Technical_and_service_monitoring/grafana.k8s-21.sa.dashboard.jpg)


## Slack notification configured for Alertmanager

* Emulation of CPU overload per Jenkins pods (alerts previously described in `prometheus.yaml` file). Threshold values just for test:

![load-emulation.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/15.Technical_and_service_monitoring/load-emulation.jpg)

* Slack messages: 

![slack-notification.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/15.Technical_and_service_monitoring/slack-notification.jpg)
