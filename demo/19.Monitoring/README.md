
## Prometheus rules

```
rate(container_cpu_usage_seconds_total{pod=~"jenk.*"}[1m])
container_memory_working_set_bytes{container="jenkins"}
```