#### Homework Assignment 1: Use grafana Loki for log monitoring
1. Create `loki.yaml` and deploy by using ArgoCD: `loki.png`
2. Tried to find errors for various pods and made for ingress-nginx-controller, Prometheus, Grafana: `dashboard.png`
```
count_over_time({pod=~"ingress-nginx-controller-.*"} [$period] |= "error")

count_over_time({pod=~"prometheus-deployment-.*"} [$period] |= "err")

count_over_time({pod=~"grafana-.*"} [$period] |= "error")
```
