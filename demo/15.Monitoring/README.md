
## Links

[Alerts](https://awesome-prometheus-alerts.grep.to/rules.html)

## History

```bash
1240  git clone git@github.com:pluhin/flux_demo.git
 1241  cd flux_demo
 1242* ssh root@192.168.202.22
 1243  vim ns.yaml
 1244  git add --all
 1245  git commit -m "Add NS for monitoring"
 1246  git push
 1247  vim ns.yaml
 1248  vim zabbix.yaml
 1249* sudo vim /etc/hosts
 1250  git add --all
 1251  git commit -m "Add zabbix"
 1252  git push
 1253  ssh -L 6443:127.0.0.1:6443 root@192.168.203.21 -f -N
 1254  export KUBECONFIG=$KUBECONFIG:$HOME/.kube/ec_htp_sa
 1255  kubectl get nodes
 1256  kubectl apply -f ns.yaml
 1257  kubectl apply -f zabbix.yaml
 1258  vim zabbix.yaml
 1259  kubectl apply -f zabbix.yaml
 1260  vim zabbix.yaml
 1261  kubectl apply -f zabbix.yaml
 1262  vim prometheus.yaml
 1263  vim zabbix.yaml
 1264  vim prometheus.yaml
 1265* sudo vim /etc/hosts
 1266  vim prometheus.yaml
 1267  kubectl apply -f zabbix.yaml
 1268  kubectl apply -f zabbix.yam
 1269  kubectl apply -f prometheus.yaml
 1270* sudo vim /etc/hosts
 1271  vim node-exporter.yaml
 1272  kubectl apply -f node-exporter.yaml
 1273  vim prometheus.yaml
 1274  kubectl apply -f node-exporter.yaml
 1275  kubectl apply -f prometheus.yaml
 1276  vim grafana.yaml
 1277  kubectl apply -f grafana.yaml
 1278  vim grafana.yaml
 1279  kubectl apply -f grafana.yaml
 1280  vim grafana.yaml
```

