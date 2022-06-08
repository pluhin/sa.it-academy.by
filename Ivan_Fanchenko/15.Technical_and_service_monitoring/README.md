## 15. Technical and service monitoring

### Screenshot of prometheus
![alt text](prometheus_alerts.png)

### Screenshot of alerts in slack
![alt text](slack_notification.png)

### Screenshot of grafana dashboard
![alt text](grafana_cpu_mem_mon.png)

### Queries
```sql
rate(container_cpu_usage_seconds_total[5m])

sum(container_memory_working_set_bytes) BY (pod) / sum(container_spec_memory_limit_bytes > 0) BY (pod) * 100
```