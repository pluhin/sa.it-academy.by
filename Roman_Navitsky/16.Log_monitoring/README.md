# 16. Log monitoring
## Install Grafana Loki
```
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo grafana
helm install loki grafana/loki-stack -n monitoring
```
## My Grafana Loki dashboard screen
![grafana-loki](./grafana-loki.jpg)
