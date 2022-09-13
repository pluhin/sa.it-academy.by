# 15. K8s. Monioring and alerts

Deploy monitoring service: Grafana and Promitheus + Alertmanager.

Add alerts from Alertmanager to Slack:
## Screenshot alerts in slack
![alt text](figures/slack.png)

Add dashboards CPU and memory from Promitheus
## Grafana
![alt text](figures/grafana.png)

## Promitheus command
```bash
(sum(rate(container_cpu_usage_seconds_total{name!=""}[3m])) BY (instance, name) * 100)
container_memory_usage_bytes
```
Add dashboard CPU and memory usage
## Promitheus memory monitoring
![alt text](figures/Promitheus_memory.png)

## Promitheus CPU monitoring
![alt text](figures/Promitheus_CPU.png)
