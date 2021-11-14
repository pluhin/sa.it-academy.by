## 15.Technical_and_service_monitoring

# flux-demo (created additional Alert-usertiger chanel)
```bash
repo: https://github.com/usertiger/flux_demo
/// installing flux by bash
export GITHUB_TOKEN=____TOKEN____
export GITHUB_USER=usertiger
export GITHUB_REPO=flux_demo
[root@sa-centos-13 flux_demo]# flux create source git jenkins \\n  --url=https://github.com/usertiger/flux_demo.git \\n  --branch=main \\n  --interval=1m \\n  --export > ./clusters/jenkins-source.yaml
-bash: ./clusters/jenkins-source.yaml: No such file or directory
[root@sa-centos-13 flux_demo]# flux get kustomizations
[root@sa-centos-13 flux_demo]# kubectl -n flux-system create secret generic slack-url \--from-literal=address=https://hooks.slack.com/services/
[root@sa-centos-13 flux_demo]# kubectl -n flux-system get alerts
NAME             READY   STATUS        AGE
on-call-webapp   True    Initialized   47h

# Deploy monitoring (all files saved in repo too)
```bash
[root@sa-centos-13 flux_demo]# kubectl apply -f ns.yaml
[root@sa-centos-13 flux_demo]# kubectl apply -f zabbix.yaml
[root@sa-centos-13 flux_demo]# kubectl apply -f prometheus.yaml
[root@sa-centos-13 flux_demo]# kubectl apply -f node-exporter.yaml
[root@sa-centos-13 flux_demo]#kubectl apply -f grafana.yaml
/// import node-exporter.json
[root@sa-centos-13 flux_demo]# kubectl get pod --namespace monitoring
NAME                                     READY   STATUS    RESTARTS   AGE
alertmanager-55c486dd65-zrngr            1/1     Running   0          33m
grafana-6cb5cf45bf-2wlkh                 1/1     Running   0          87m
node-exporter-flbfl                      1/1     Running   0          102m
node-exporter-kxpnl                      1/1     Running   0          102m
prometheus-deployment-599bbd9457-z29g7   1/1     Running   0          2d4h
zabbix-server-6b8f4cc95d-mwr6p           1/1     Running   0          153m
[root@sa-centos-13 flux_demo]# kubectl get ingress --namespace monitoring
NAME                   CLASS    HOSTS                    ADDRESS          PORTS   AGE
ingress-alertmanager   <none>   alertmanager.k8s-13.sa   192.168.203.14   80      33m
ingress-grafana        <none>   grafana.k8s-13.sa        192.168.203.14   80      87m
ingress-prometheus     <none>   prometheus.k8s-13.sa     192.168.203.14   80      2d4h
ingress-zabbix         <none>   zabbix.k8s-13.sa         192.168.203.14   80      153m
```

# Links:
1. [Zabbix](https://github.com/usertiger/sa.it-academy.by/tree/md-sa2-18-21/Anton_Usertiger/15.monitoring/demo/zabbix.png)
2. [Prometheus](https://github.com/usertiger/sa.it-academy.by/tree/md-sa2-18-21/Anton_Usertiger/15.monitoring/demo/prometheus.png)
3. [Grafana](https://github.com/usertiger/sa.it-academy.by/tree/md-sa2-18-21/Anton_Usertiger/15.monitoring/demo/grafana.png)
4. [Alerts](https://github.com/usertiger/sa.it-academy.by/tree/md-sa2-18-21/Anton_Usertiger/15.monitoring/demo/alerts.png)