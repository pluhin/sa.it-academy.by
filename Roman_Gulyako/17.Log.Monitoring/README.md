#### 1.  Create a Pod/Deployment with logs

```bash
kubectl create ns log-monitoring
nano logging-deployment.yaml
kubectl apply -f logging-deployment.yaml  -n log-monitoring
```
Deployment manifest file: `logging-deployment.yaml`

#### 2. Collect logs with kubectl

- List all running Pods:
```bash
kubectl get pods -n log-monitoring
NAME                          READY   STATUS             RESTARTS        AGE
logging-app-b888d49fc-kkbpn   1/1     Running            0               24m
logging-app-b888d49fc-wr5n4   1/1     Running            0               24m
```
- Show logs from a specific Pod:
```bash
kubectl logs -n log-monitoring logging-app-b888d49fc-wr5n4 | head -n 10

2025-12-06T13:10:03+00:00 logging-demo: tick=0 on logging-app-b888d49fc-wr5n4
2025-12-06T13:10:04+00:00 logging-demo: tick=1 on logging-app-b888d49fc-wr5n4
2025-12-06T13:10:05+00:00 logging-demo: tick=2 on logging-app-b888d49fc-wr5n4
2025-12-06T13:10:06+00:00 logging-demo: tick=3 on logging-app-b888d49fc-wr5n4
2025-12-06T13:10:07+00:00 logging-demo: tick=4 on logging-app-b888d49fc-wr5n4
2025-12-06T13:10:08+00:00 logging-demo: tick=5 on logging-app-b888d49fc-wr5n4
2025-12-06T13:10:09+00:00 logging-demo: tick=6 on logging-app-b888d49fc-wr5n4
2025-12-06T13:10:10+00:00 logging-demo: tick=7 on logging-app-b888d49fc-wr5n4
2025-12-06T13:10:11+00:00 logging-demo: tick=8 on logging-app-b888d49fc-wr5n4
2025-12-06T13:10:12+00:00 logging-demo: tick=9 on logging-app-b888d49fc-wr5n4
```
- Collect logs from all Pods of your Deployment:
```bash
kubectl logs -n log-monitoring -l app=logging-app --all-containers=true

2025-12-06T13:37:03+00:00 logging-demo: tick=1613 on logging-app-b888d49fc-kkbpn
2025-12-06T13:37:04+00:00 logging-demo: tick=1614 on logging-app-b888d49fc-kkbpn
2025-12-06T13:37:05+00:00 logging-demo: tick=1615 on logging-app-b888d49fc-kkbpn
2025-12-06T13:37:06+00:00 logging-demo: tick=1616 on logging-app-b888d49fc-kkbpn
2025-12-06T13:37:07+00:00 logging-demo: tick=1617 on logging-app-b888d49fc-kkbpn
2025-12-06T13:37:08+00:00 logging-demo: tick=1618 on logging-app-b888d49fc-kkbpn
2025-12-06T13:37:09+00:00 logging-demo: tick=1619 on logging-app-b888d49fc-kkbpn
2025-12-06T13:37:10+00:00 logging-demo: tick=1620 on logging-app-b888d49fc-kkbpn
2025-12-06T13:37:11+00:00 logging-demo: tick=1621 on logging-app-b888d49fc-kkbpn
2025-12-06T13:37:12+00:00 logging-demo: tick=1622 on logging-app-b888d49fc-kkbpn
2025-12-06T13:37:03+00:00 logging-demo: tick=1613 on logging-app-b888d49fc-wr5n4
2025-12-06T13:37:04+00:00 logging-demo: tick=1614 on logging-app-b888d49fc-wr5n4
2025-12-06T13:37:05+00:00 logging-demo: tick=1615 on logging-app-b888d49fc-wr5n4
2025-12-06T13:37:06+00:00 logging-demo: tick=1616 on logging-app-b888d49fc-wr5n4
2025-12-06T13:37:07+00:00 logging-demo: tick=1617 on logging-app-b888d49fc-wr5n4
2025-12-06T13:37:08+00:00 logging-demo: tick=1618 on logging-app-b888d49fc-wr5n4
2025-12-06T13:37:09+00:00 logging-demo: tick=1619 on logging-app-b888d49fc-wr5n4
2025-12-06T13:37:10+00:00 logging-demo: tick=1620 on logging-app-b888d49fc-wr5n4
2025-12-06T13:37:11+00:00 logging-demo: tick=1621 on logging-app-b888d49fc-wr5n4
2025-12-06T13:37:13+00:00 logging-demo: tick=1622 on logging-app-b888d49fc-wr5n4
```
- Stream logs in real time:
```bash
kubectl logs -n log-monitoring -f deploy/logging-app
```
#### 3. Investigate logs from a failing Pod

Create a Pod that fails immediately:
```
nano failing-pod.yaml
kubectl apply -f failing-pod.yaml -n log-monitoring
```
Pod's manifest file: `failing-pod.yaml`

- Check its status:
```bash
kubectl get pod failing-app -n log-monitoring 
NAME          READY   STATUS             RESTARTS       AGE
failing-app   0/1     CrashLoopBackOff   10 (27s ago)   26m
```
- Inspect its logs:
```bash
kubectl logs -n log-monitoring failing-app --previous
2025-12-06T13:42:13+00:00 failing-app: about to exit with code 1
```

#### 4. Explore node-level logs

Connect to the Kubernetes node:
```bash
ssh root@192.168.208.5
```

- Container logs:
```bash
ls /var/log/containers/

calico-node-6768q_kube-system_calico-node-1801c5322651c6c8bbf2c2311e897a9753fc40a714a5ee02010d45446f6e7081.log
calico-node-6768q_kube-system_install-cni-974e81b8b66d8926fbcd57a38b04fbdfca02f2ae8f687cda74686c8ae4ab4fb1.log
calico-node-6768q_kube-system_mount-bpffs-b045d24baa4adafd40648996e021af494edc35f84b9c24760f3aeb72e178f89a.log
calico-node-6768q_kube-system_upgrade-ipam-922e79112797777bf7b350ccab3efd845c24194830c453a395aa62f785a5fd84.log
coredns-64b5cc5cbc-59t4w_kube-system_coredns-3437c73abaf39fd2fb63fa0ac4cd967259dd0810fbcee15b94523f01708a25af.log
jenkins-6cd89b46b-82vj9_ci-cd_jenkins-f86a53389963d6357483ef12b5dcabf38fb609b2a73088e4aa2b577a90323a51.log
kube-apiserver-node1_kube-system_kube-apiserver-7ef4ecfc156820bec4819d0cfb95d9d15ec9f7e7b7ffc43c7bed8b19c7715587.log
kube-apiserver-node1_kube-system_kube-apiserver-8d8cc6ef177c440611a1334cd736c738df1082e5192026dbf627479b515343e6.log
kube-controller-manager-node1_kube-system_kube-controller-manager-1e738773a0a23512da4dcfba98499008d51db2552bfb102948929f33d890581f.log
kube-controller-manager-node1_kube-system_kube-controller-manager-aba454de87adcf3860ccc2a2c163fa6c73f495852d286141d660fae42c227c5e.log
kube-controller-manager-node1_kube-system_kube-controller-manager-d5e48f933187cf897e0d2a50fa39f1db5b094d2ee3fc1ae61e764b2ee4788170.log
kube-proxy-4lwbw_kube-system_kube-proxy-49e730ad8d29df780919c8b48c94e43eba539e595c42db2a9e47f7b6f02b8894.log
kube-scheduler-node1_kube-system_kube-scheduler-00cea6334071bc70490c4c1a75806b70ba74a958d9589a5bf292126b22c3aefe.log
kube-scheduler-node1_kube-system_kube-scheduler-6daa455f6165af8aaa1209c1fc97ed30374706e86a71b6dd4f0ffb869b70a2f8.log
logging-app-b888d49fc-wr5n4_log-monitoring_logger-9db3ad0863d99d685f357a18ab36ba2e36c4f6aba82d1fabef9e62e2d577e158.log
node-exporter-g2k2s_monitoring_node-exporter-cc97e4cd1310dc614dc6b7fa552367af5db9b077e1b7e6b87e695d89ac0c8306.log
nodelocaldns-scjlk_kube-system_node-cache-9fa1e1ac13f3504e7b1d94224d82dd9c1c2c64379b880ebcdccf19795799b28d.log
```

```bash
tail -f /var/log/containers/jenkins-6cd89b46b-82vj9_ci-cd_jenkins-f86a53389963d6357483ef12b5dcabf38fb609b2a73088e4aa2b577a90323a51.log

2025-12-04T15:40:04.606694291+03:00 stderr F 2025-12-04 12:40:04.601+0000 [id=52066]    INFO    hudson.util.Retrier#start: Attempt #1 to do the action check updates server
2025-12-04T15:40:08.784451812+03:00 stderr F 2025-12-04 12:40:08.783+0000 [id=52066]    INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
2025-12-04T15:40:09.866870466+03:00 stderr F 2025-12-04 12:40:09.866+0000 [id=52066]    INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tools.JDKInstaller
2025-12-04T15:40:09.867088983+03:00 stderr F 2025-12-04 12:40:09.866+0000 [id=52066]    INFO    hudson.util.Retrier#start: Performed the action check updates server successfully at the attempt #1
2025-12-05T15:40:06.062188518+03:00 stderr F 2025-12-05 12:40:06.060+0000 [id=59507]    INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
2025-12-05T15:40:07.675881624+03:00 stderr F 2025-12-05 12:40:07.675+0000 [id=59507]    INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tools.JDKInstaller
2025-12-06T15:40:04.607333913+03:00 stderr F 2025-12-06 12:40:04.604+0000 [id=66944]    INFO    hudson.util.Retrier#start: Attempt #1 to do the action check updates server
2025-12-06T15:40:10.27234463+03:00 stderr F 2025-12-06 12:40:10.270+0000 [id=66944]     INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
2025-12-06T15:40:11.394632268+03:00 stderr F 2025-12-06 12:40:11.393+0000 [id=66944]    INFO    h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tools.JDKInstaller
2025-12-06T15:40:11.395131535+03:00 stderr F 2025-12-06 12:40:11.394+0000 [id=66944]    INFO    hudson.util.Retrier#start: Performed the action check updates server successfully at the attempt #1
```

- Pod logs:
```bash
ls /var/log/pods/
ci-cd_jenkins-6cd89b46b-82vj9_b64afa93-de2b-4bd9-a908-dd7d67113efb          
kube-system_kube-proxy-4lwbw_76cc12d3-ef38-46be-8321-4d1ad568a999
kube-system_calico-node-6768q_1c775799-06a6-4c50-b758-4fae86beae2c          
kube-system_kube-scheduler-node1_c05532e7574890baa2ca3255315091a5
kube-system_coredns-64b5cc5cbc-59t4w_2a4c04d0-9cf8-4c3e-ac23-401fec52adff   
kube-system_nodelocaldns-scjlk_93d069d3-a3d4-49f9-8af4-3282245226ae
kube-system_kube-apiserver-node1_9dbc18c948f1fd46e599e0c1831b03bc           
log-monitoring_logging-app-b888d49fc-wr5n4_dfe383b2-9950-41d1-a28e-e38f74a88f2b
kube-system_kube-controller-manager-node1_8d7412d04a3d909da2a81a48b364aa6f  monitoring_node-exporter-g2k2s_23d20708-cb63-4e1c-9a4b-aa4f9ae061d4
```
- Kubelet/system logs via systemd:
```bash
journalctl -u kubelet -f

Dec 06 16:54:07 node1 kubelet[34489]: E1206 16:54:07.240891   34489 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 06 16:54:11 node1 kubelet[34489]: E1206 16:54:11.239536   34489 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 06 16:54:14 node1 kubelet[34489]: E1206 16:54:14.237978   34489 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 06 16:54:19 node1 kubelet[34489]: E1206 16:54:19.242096   34489 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 06 16:54:41 node1 kubelet[34489]: E1206 16:54:41.241109   34489 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 06 16:55:02 node1 kubelet[34489]: E1206 16:55:02.238071   34489 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 06 16:55:04 node1 kubelet[34489]: E1206 16:55:04.238036   34489 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 06 16:55:09 node1 kubelet[34489]: E1206 16:55:09.240577   34489 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 06 16:55:15 node1 kubelet[34489]: E1206 16:55:15.237879   34489 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 06 16:55:21 node1 kubelet[34489]: E1206 16:55:21.243184   34489 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
```


#### Screenshots:
- Pods with logging - `logging-pods.png`
- First 10 lines of logs - `10-line-logs`
- Logs of the failing Pod - `failing-pod-logs.png`
- Node-level logs - `node-level-logs.png`
