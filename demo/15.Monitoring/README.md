## Monitoring

```
  822  kubectl get ns
  823  cd monitor/
  824  ls
  825  vim zabbix.yaml
  826  kubectl apply -f zabbix.yaml
  827  kubectl create ns monitoring
  828  kubectl apply -f zabbix.yaml
  829  vim zabbix.yaml
  830  vim prometheus.yaml
  831  kubectl apply -f prometheus.yaml
  832  vim ksm.yaml
  833  kubectl apply -f ksm.yaml
  834  vim grafana.yaml
  835  kubectl apply -f grafana.yaml
  836  vim node-exporter.yaml
  837  kubectl apply -f node-exporter.yaml
  838  ls -l
  839  mc
  840  history
```