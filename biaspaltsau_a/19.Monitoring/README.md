## Monitoring

[Grafana dashboards](https://grafana.com/grafana/dashboards)

https://grafana.com/docs/grafana/latest/datasources/prometheus/


```bash
10558  ssh -L 6443:localhost:6443 root@192.168.203.24 -f -N; export KUBECONFIG=$HOME/.kube/config_ec_ws
10559  kubectl get nodes
10560  vim  zabbix.yaml
10561  vim ns.yaml
10562  kubectl create -f  ns.yaml
10563  vim  zabbix.yaml
10564  kubectl create -f  zabbix.yaml
10565  sudo vim  /etc/hosts
10566  kubectl get posds -n monitoring
10567  kubectl get pods -n monitoring
10568  watch -b 4 kubectl get pods -n monitoring
10569  watch -i 4 kubectl get pods -n monitoring
10570  watch -n 4 kubectl get pods -n monitoring
10571  vim prometheus.yaml
10572  k9s
10573  vim prometheus.yaml
10574  kubectl create -f  prometheus.yaml
10575  sudo vim  /etc/hosts
10576  watch -n 4 kubectl get pods -n monitoring
10577  k9s
10578  kubectl create -f  prometheus.yaml
10579  vim prometheus.yaml
10580  kubectl create -f  prometheus.yaml
10581  kubectl apply -f  prometheus.yaml
10582  k9s
10583  vim node-exporter.yaml
10584  kubectl create -f node-exporter.yaml
10585  k9s
10586  vim grafana.yaml
10587  kubectl create -f grafana.yaml
10588  sudo vim  /etc/hosts
10589  k9s

```