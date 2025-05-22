 # 16.Technical_and_service_monitoring
 
 #  installed Prometheus end Grafana
 # make secret in monitoring namespace for alertmanager for webhook notifiing
  
  ```bash
  kubectl create secret generic alertmanager-secret --from-literal=slack-api-url="https://hooks.slack.com/services/T08N4SS4DD0/XXXXXXXXX" -n monitoring
```
   # alert for CPU overload per pods: 
   sum by (namespace, pod) (irate(container_cpu_usage_seconds_total{container!=""}[1m])) / sum by (namespace, pod) (container_spec_cpu_quota{container!=""} / 100000) * 100 >= 5
   # add it to prometheus.yaml