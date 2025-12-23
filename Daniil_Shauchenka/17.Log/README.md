### List all running Pods:
``` 
root@debian12:~/17.Log# kubectl get pods
NAME                           READY   STATUS    RESTARTS   AGE
log-generator-c8cb46d4-787rp   1/1     Running   0          20s
log-generator-c8cb46d4-j7szj   1/1     Running   0          20s
```

### Show logs from a specific Pod:
```
root@debian12:~/17.Log# kubectl logs log-generator-c8cb46d4-787rp
Fri Dec 19 14:31:10 UTC 2025 | log message #0
Fri Dec 19 14:31:12 UTC 2025 | log message #1
Fri Dec 19 14:31:14 UTC 2025 | log message #2
Fri Dec 19 14:31:16 UTC 2025 | log message #3
Fri Dec 19 14:31:18 UTC 2025 | log message #4
Fri Dec 19 14:31:20 UTC 2025 | log message #5
Fri Dec 19 14:31:22 UTC 2025 | log message #6
Fri Dec 19 14:31:24 UTC 2025 | log message #7
Fri Dec 19 14:31:26 UTC 2025 | log message #8
Fri Dec 19 14:31:28 UTC 2025 | log message #9
Fri Dec 19 14:31:30 UTC 2025 | log message #10
```

### Collect logs from all Pods of your Deployment
```
root@debian12:~/17.Log# kubectl logs -l app=log-generator --all-containers=true
Fri Dec 19 14:31:42 UTC 2025 | log message #16
Fri Dec 19 14:31:44 UTC 2025 | log message #17
Fri Dec 19 14:31:46 UTC 2025 | log message #18
Fri Dec 19 14:31:48 UTC 2025 | log message #19
Fri Dec 19 14:31:50 UTC 2025 | log message #20
Fri Dec 19 14:31:52 UTC 2025 | log message #21
Fri Dec 19 14:31:54 UTC 2025 | log message #22
Fri Dec 19 14:31:56 UTC 2025 | log message #23
Fri Dec 19 14:31:58 UTC 2025 | log message #24
Fri Dec 19 14:32:00 UTC 2025 | log message #25
Fri Dec 19 14:31:42 UTC 2025 | log message #16
Fri Dec 19 14:31:44 UTC 2025 | log message #17
Fri Dec 19 14:31:46 UTC 2025 | log message #18
Fri Dec 19 14:31:48 UTC 2025 | log message #19
Fri Dec 19 14:31:50 UTC 2025 | log message #20
Fri Dec 19 14:31:52 UTC 2025 | log message #21
Fri Dec 19 14:31:54 UTC 2025 | log message #22
Fri Dec 19 14:31:56 UTC 2025 | log message #23
Fri Dec 19 14:31:58 UTC 2025 | log message #24
Fri Dec 19 14:32:00 UTC 2025 | log message #25

```


### Stream logs in real time:

```
root@debian12:~/17.Log# kubectl logs -f deploy/log-generator
Found 2 pods, using pod/log-generator-c8cb46d4-787rp
Fri Dec 19 14:31:10 UTC 2025 | log message #0
Fri Dec 19 14:31:12 UTC 2025 | log message #1
Fri Dec 19 14:31:14 UTC 2025 | log message #2
Fri Dec 19 14:31:16 UTC 2025 | log message #3
Fri Dec 19 14:31:18 UTC 2025 | log message #4
Fri Dec 19 14:31:20 UTC 2025 | log message #5
Fri Dec 19 14:31:22 UTC 2025 | log message #6
Fri Dec 19 14:31:24 UTC 2025 | log message #7
Fri Dec 19 14:31:26 UTC 2025 | log message #8
Fri Dec 19 14:31:28 UTC 2025 | log message #9
Fri Dec 19 14:31:30 UTC 2025 | log message #10
Fri Dec 19 14:31:32 UTC 2025 | log message #11
Fri Dec 19 14:31:34 UTC 2025 | log message #12
Fri Dec 19 14:31:36 UTC 2025 | log message #13
Fri Dec 19 14:31:38 UTC 2025 | log message #14
Fri Dec 19 14:31:40 UTC 2025 | log message #15
Fri Dec 19 14:31:42 UTC 2025 | log message #16
Fri Dec 19 14:31:44 UTC 2025 | log message #17
```



### Investigate logs from a failing Pod
```
root@debian12:~/17.Log# nano failing-pod.yaml
root@debian12:~/17.Log# kubectl apply -f failing-pod.yaml
pod/failing-pod created
root@debian12:~/17.Log# kubectl get pod failing-pod
NAME          READY   STATUS             RESTARTS     AGE
failing-pod   0/1     CrashLoopBackOff   1 (2s ago)   5s
root@debian12:~/17.Log# kubectl logs failing-pod --previous
Pod is about to fail
```

### Explore node-level logs
```
root@debian12:~/17.Log# ls /var/log/containers/
alertmanager-monitoring-kube-prometheus-alertmanager-0_monitoring_alertmanager-1070221a4628951bf170d18f7a0799eefb38d0ef4359f31f0cf43e8ae92bc6f8.log
alertmanager-monitoring-kube-prometheus-alertmanager-0_monitoring_config-reloader-c4f137f5121130db5426aacbf4a097db50b4173c0d0efbf2d2a083df002a6af0.log
alertmanager-monitoring-kube-prometheus-alertmanager-0_monitoring_init-config-reloader-3bad5654922b1626d9b7e6fc3ec50e044b3978152ee3b040e26b7005fb65a2b3.log
coredns-6d668d687-jqzdl_kube-system_coredns-7502dec093c1091d3acd5437031eb900757a035df835e930b3af786864aa58a1.log
failing-pod_default_fail-bf75db7e2f243b03f87ce9a0eb8e4edba388fa13284132795182131abf57cbbc.log
helm-install-traefik-crd-bkxvl_kube-system_helm-f43fc45eaa3feff293ed8865784956cec52356ef88a951c98af8876042c3f476.log
helm-install-traefik-phlz8_kube-system_helm-47413003dd4fe6cba72501e4b58541db23532c303614d7d0c401b6ccde7fab4b.log
ingress-nginx-controller-76c4946df7-cnb58_ingress-nginx_controller-a807cff5158ed55da4225bf7625fb4d055d1d87c248f25c7c642c43a8dae894e.log
jenkins-c885d7b5f-dnpdq_ci-cd_jenkins-50521672b21eb0e6e26f2b4015d803b7baf9295da243c71a9f37e61b6fa488db.log
local-path-provisioner-869c44bfbd-cvdzp_kube-system_local-path-provisioner-e6b2574020335ba0c2a237efc96a39ace8ef961991ca91bfddc88ceace1e7436.log
log-generator-c8cb46d4-787rp_default_logger-15bf997d2abc3915cdc1fea956a471a46de30d0711c06fb1dd390dc30d789d93.log
log-generator-c8cb46d4-j7szj_default_logger-19ec7f6f53c16931069e5634c2841301827feb5a14118038673cb57f9b4a04ac.log
metrics-server-7bfffcd44-d26qs_kube-system_metrics-server-4c0f9e8a559f1b53bcfa8586b75e3cbce7815c96bef0e0a9235bb0083a0413a2.log
monitoring-grafana-5c5fb48466-8wzvl_monitoring_grafana-4d22d1ca151c3874d4449702bef0cb95e41acd0fe25aa9f0d1e8d7c0f1c7dc5e.log
monitoring-grafana-5c5fb48466-8wzvl_monitoring_grafana-sc-dashboard-2ae0d90e242c102bb23e35e5d3807679a47c562e4cff080cec5f867b698785aa.log
monitoring-grafana-5c5fb48466-8wzvl_monitoring_grafana-sc-datasources-05bda58193f66e5e115584b3c6109f4a94d43dee2f5348b069b22ace59a0860b.log
monitoring-kube-prometheus-operator-6c6f6988d8-shhdq_monitoring_kube-prometheus-stack-2dc3a38a794ff9dde8db89bb4d3e99f025df10d1b1acd63988a30fbf51e2ebdd.log
monitoring-kube-state-metrics-7f575674-mqsdm_monitoring_kube-state-metrics-7537bd6dd7c236058f1266ef54cb40f8c45b3ec220e7d374b959889a97d0d9e7.log
monitoring-prometheus-node-exporter-v9pn4_monitoring_node-exporter-f8ad966662fb9803dfb49fba609f76d7a3c60d709a3daaba51bd98681ed4de33.log
prometheus-monitoring-kube-prometheus-prometheus-0_monitoring_config-reloader-29d65da97e9b706cc4cbf4a5fc46729296b862fc573804c3117f32f60e17575a.log
prometheus-monitoring-kube-prometheus-prometheus-0_monitoring_init-config-reloader-6cc021d3a1d8bcda21f0a450adbc046c57fc7a18c67cccf55c785a82430214e2.log
prometheus-monitoring-kube-prometheus-prometheus-0_monitoring_prometheus-dcdd842d3805e9ea03279c289edb57af543c114bce01cc6ba56e4b63b8c482a0.log
root@debian12:~/17.Log# sudo tail -n 20 /var/log/containers/log-generator-c8cb46d4-787rp_default_logger-15bf997d2abc3915cdc1fea956a471a46de30d0711c06fb1dd390dc30d789d93.log
-bash: sudo: command not found
root@debian12:~/17.Log#  tail -n 20 /var/log/containers/log-generator-c8cb46d4-787rp_default_logger-15bf997d2abc3915cdc1fea956a471a46de30d0711c06fb1dd390dc30d789d93.log
2025-12-19T17:34:09.040399401+03:00 stdout F Fri Dec 19 14:34:09 UTC 2025 | log message #89
2025-12-19T17:34:11.04386654+03:00 stdout F Fri Dec 19 14:34:11 UTC 2025 | log message #90
2025-12-19T17:34:13.047585183+03:00 stdout F Fri Dec 19 14:34:13 UTC 2025 | log message #91
2025-12-19T17:34:15.05138614+03:00 stdout F Fri Dec 19 14:34:15 UTC 2025 | log message #92
2025-12-19T17:34:17.054973232+03:00 stdout F Fri Dec 19 14:34:17 UTC 2025 | log message #93
2025-12-19T17:34:19.058658777+03:00 stdout F Fri Dec 19 14:34:19 UTC 2025 | log message #94
2025-12-19T17:34:21.062419982+03:00 stdout F Fri Dec 19 14:34:21 UTC 2025 | log message #95
2025-12-19T17:34:23.066062457+03:00 stdout F Fri Dec 19 14:34:23 UTC 2025 | log message #96
2025-12-19T17:34:25.069776346+03:00 stdout F Fri Dec 19 14:34:25 UTC 2025 | log message #97
2025-12-19T17:34:27.073416092+03:00 stdout F Fri Dec 19 14:34:27 UTC 2025 | log message #98
2025-12-19T17:34:29.076987288+03:00 stdout F Fri Dec 19 14:34:29 UTC 2025 | log message #99
2025-12-19T17:34:31.080379418+03:00 stdout F Fri Dec 19 14:34:31 UTC 2025 | log message #100
2025-12-19T17:34:33.084064895+03:00 stdout F Fri Dec 19 14:34:33 UTC 2025 | log message #101
2025-12-19T17:34:35.087715335+03:00 stdout F Fri Dec 19 14:34:35 UTC 2025 | log message #102
2025-12-19T17:34:37.091392212+03:00 stdout F Fri Dec 19 14:34:37 UTC 2025 | log message #103
2025-12-19T17:34:39.095278176+03:00 stdout F Fri Dec 19 14:34:39 UTC 2025 | log message #104
2025-12-19T17:34:41.09896132+03:00 stdout F Fri Dec 19 14:34:41 UTC 2025 | log message #105
2025-12-19T17:34:43.102863618+03:00 stdout F Fri Dec 19 14:34:43 UTC 2025 | log message #106
2025-12-19T17:34:45.106447123+03:00 stdout F Fri Dec 19 14:34:45 UTC 2025 | log message #107
2025-12-19T17:34:47.110677484+03:00 stdout F Fri Dec 19 14:34:47 UTC 2025 | log message #108

```
