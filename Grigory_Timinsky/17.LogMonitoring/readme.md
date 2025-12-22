# 17. Log monitoring

#### 1.  Create a Pod/Deployment with logs

```bash
kubectl create ns log-monitoring
nano logging-deployment.yaml
kubectl apply -f logging-deployment.yaml  -n log-monitoring
```

#### 2. Collect logs with kubectl

- List all running Pods:
```bash
kubectl get pods -n log-monitoring
NAME                          READY   STATUS    RESTARTS   AGE
logging-app-c6f488956-sx9wn   1/1     Running   0          9s
logging-app-c6f488956-xszwj   1/1     Running   0          9s
```
- Show logs from a specific Pod:
```bash
kubectl logs -n log-monitoring logging-app-c6f488956-xszwj | head -n 10

2025-12-22T14:14:05+00:00 logging-demo: tick=0 on logging-app-c6f488956-xszwj
2025-12-22T14:14:06+00:00 logging-demo: tick=1 on logging-app-c6f488956-xszwj
2025-12-22T14:14:07+00:00 logging-demo: tick=2 on logging-app-c6f488956-xszwj
2025-12-22T14:14:08+00:00 logging-demo: tick=3 on logging-app-c6f488956-xszwj
2025-12-22T14:14:09+00:00 logging-demo: tick=4 on logging-app-c6f488956-xszwj
2025-12-22T14:14:10+00:00 logging-demo: tick=5 on logging-app-c6f488956-xszwj
2025-12-22T14:14:11+00:00 logging-demo: tick=6 on logging-app-c6f488956-xszwj
2025-12-22T14:14:12+00:00 logging-demo: tick=7 on logging-app-c6f488956-xszwj
2025-12-22T14:14:13+00:00 logging-demo: tick=8 on logging-app-c6f488956-xszwj
2025-12-22T14:14:14+00:00 logging-demo: tick=9 on logging-app-c6f488956-xszwj
```
- Collect logs from all Pods of your Deployment:
```bash
kubectl logs -n log-monitoring -l app=logging-app --all-containers=true

2025-12-22T14:15:16+00:00 logging-demo: tick=70 on logging-app-c6f488956-xszwj
2025-12-22T14:15:17+00:00 logging-demo: tick=71 on logging-app-c6f488956-xszwj
2025-12-22T14:15:18+00:00 logging-demo: tick=72 on logging-app-c6f488956-xszwj
2025-12-22T14:15:19+00:00 logging-demo: tick=73 on logging-app-c6f488956-xszwj
2025-12-22T14:15:20+00:00 logging-demo: tick=74 on logging-app-c6f488956-xszwj
2025-12-22T14:15:21+00:00 logging-demo: tick=75 on logging-app-c6f488956-xszwj
2025-12-22T14:15:22+00:00 logging-demo: tick=76 on logging-app-c6f488956-xszwj
2025-12-22T14:15:23+00:00 logging-demo: tick=77 on logging-app-c6f488956-xszwj
2025-12-22T14:15:24+00:00 logging-demo: tick=78 on logging-app-c6f488956-xszwj
2025-12-22T14:15:25+00:00 logging-demo: tick=79 on logging-app-c6f488956-xszwj
2025-12-22T14:15:16+00:00 logging-demo: tick=70 on logging-app-c6f488956-sx9wn
2025-12-22T14:15:17+00:00 logging-demo: tick=71 on logging-app-c6f488956-sx9wn
2025-12-22T14:15:18+00:00 logging-demo: tick=72 on logging-app-c6f488956-sx9wn
2025-12-22T14:15:19+00:00 logging-demo: tick=73 on logging-app-c6f488956-sx9wn
2025-12-22T14:15:20+00:00 logging-demo: tick=74 on logging-app-c6f488956-sx9wn
2025-12-22T14:15:21+00:00 logging-demo: tick=75 on logging-app-c6f488956-sx9wn
2025-12-22T14:15:22+00:00 logging-demo: tick=76 on logging-app-c6f488956-sx9wn
2025-12-22T14:15:23+00:00 logging-demo: tick=77 on logging-app-c6f488956-sx9wn
2025-12-22T14:15:24+00:00 logging-demo: tick=78 on logging-app-c6f488956-sx9wn
2025-12-22T14:15:25+00:00 logging-demo: tick=79 on logging-app-c6f488956-sx9wn

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

- Check its status:
```bash
kubectl get pod failing-app -n log-monitoring 
NAME          READY   STATUS   RESTARTS     AGE
failing-app   0/1     Error    1 (7s ago)   38s

```
- Inspect its logs:
```bash
kubectl logs -n log-monitoring failing-app --previous

2025-12-22T14:33:24+00:00 failing-app: about to exit with code 1
```

#### 4. Explore node-level logs

Connect to the Kubernetes node:
```bash
ssh root@192.168.208.25
```

- Container logs:
```bash
ls /var/log/containers/

argocd-application-controller-0_argocd_argocd-application-controller-402392331636028aa8684624a5a7d9e61fd8d2a5465f2e5d18a39070a3ff4a03.log
argocd-redis-6dbb9f6cf4-pzqjl_argocd_redis-5a5284d90ece80bfcfd3f90b7fca058b381424a23fc69e60693991d88bcc6b81.log
argocd-redis-6dbb9f6cf4-pzqjl_argocd_secret-init-0092fa525e0bc6dc6ebcac6a93cac71dd10c858853bfcc38e58b49ec3c4cf717.log
calico-node-54mxl_kube-system_calico-node-07abf0bf99162bf346503db54dcaee48afc80c184e52e175a85817acb2609a20.log
calico-node-54mxl_kube-system_install-cni-08106a15e5369db3cec8da151e5ac36bcbd096e2d35694a1cf17bcec67235575.log
calico-node-54mxl_kube-system_mount-bpffs-0b01cdb802485ccc49f9f1146c0141ed35ced6edd1ea891fc7db5caa78a3a16c.log
calico-node-54mxl_kube-system_upgrade-ipam-8a98a95cf8f5cef861f658c2418d2783310f1c97f54240b19720bb0a8e2f0aeb.log
coredns-64b5cc5cbc-6kpc7_kube-system_coredns-fd56b89eab3be9bc51d7e80c8272b757eee2acc7f07144832fe48b6f6dd0ecc2.log
jenkins-58599d855-sfcpp_ci-cd_jenkins-2c3665adaa2fbcac42738791535434a6e7df6e82cf5b2c1d36b4810199d5c059.log
kube-apiserver-node1_kube-system_kube-apiserver-bd2bb9a35b16f254c067f1261649de6d7fe87e74a010f32ed0039cd7afeb6b51.log
kube-apiserver-node1_kube-system_kube-apiserver-eb4d281f1641ea8aab967efe1cf6ec6cfa77069d7ad299b7aa483b0781a2fae9.log
kube-controller-manager-node1_kube-system_kube-controller-manager-0117558e6251f72becf0ce63f0c33239c86e4c84792d4ee3deba3b968e147915.log
kube-controller-manager-node1_kube-system_kube-controller-manager-672c096fbee87daa111aff8f4a82beb37a24c58360518c06c0238f4b409cc24d.log
kube-controller-manager-node1_kube-system_kube-controller-manager-b0bc7f936341a19ca5bfb441af103266277e34bf7e10335fd2eecda6764b4182.log
kube-proxy-kv4nq_kube-system_kube-proxy-edd66eebea8af37c9f7989704a8fbbf44a88c22d8777f2796d86f0900dce83b4.log
kube-scheduler-node1_kube-system_kube-scheduler-94a228cbb798d99bb77d8548453884bc6aae2d2f8c0f3d33c264e7210e034efc.log
kube-scheduler-node1_kube-system_kube-scheduler-df22ee59ac784a76ece51e4dd95a125e4d226773e85698ed99df263e42c8f02a.log
nginx-deployment-6dcc4c744d-skd8c_default_nginx-2890ed95d6e9dcfa636e7723c2b75f0744dcc705ed0a9004b3df53df929ae18f.log
nginx-deployment-6dcc4c744d-skd8c_default_replace-hostname-b594e9835ae689d3d15bed6c21403ca0e42e23ad96f56a1e9908f5224b27f7ee.log
nodelocaldns-fhn8x_kube-system_node-cache-b74674ec6ff3bee31b19b7530dc7360fd95c58b78e9f61989106bd114e4331db.log
postgresql-0_production_postgresql-3f1eb89b0f847596f9a7be317ede628914de5c149dd3fea588666c79478fe89c.log
postgresql-0_production_postgresql-837a5cf55665e0f4c2fbe3457637f3466c2f3d2c1b38f0a7304629961ea4e79e.log
postgresql-test-0_testing_postgresql-fbe0f8ef88e702804955cce26b8edafab355fa960f03374365d712b0c038954b.log
sealed-secrets-574cb47d88-g8pcv_kube-system_controller-277a84b14475cda9c20efcd1677770f7ed46ffdcbdc771c2254236e31fa31cfd.log

```

```bash
tail -f /var/log/containers/jenkins-58599d855-sfcpp_ci-cd_jenkins-2c3665adaa2fbcac42738791535434a6e7df6e82cf5b2c1d36b4810199d5c059.log

2025-12-19T07:56:19.147349729+03:00 stderr F 2025-12-19 04:56:19.146+0000 [id=349]	INFO	o.c.j.p.k.KubernetesSlave#_terminate: Disconnected computer test-2-gw11x-6c0rb-qxh3m
2025-12-19T07:56:19.14881193+03:00 stderr F 2025-12-19 04:56:19.147+0000 [id=352]	INFO	j.s.DefaultJnlpSlaveReceiver#channelClosed: Computer.threadPoolForRemoting [#8] for test-2-gw11x-6c0rb-qxh3m terminated: java.nio.channels.ClosedChannelException
2025-12-19T07:56:19.149553555+03:00 stderr F 2025-12-19 04:56:19.149+0000 [id=317]	INFO	hudson.remoting.Request$2#run: Failed to send back a reply to the request RPCRequest:hudson.remoting.RemoteClassLoader$IClassLoader.fetch3[java.lang.String](2): hudson.remoting.ChannelClosedException: Channel "hudson.remoting.Channel@e41c8b1:JNLP4-connect connection from 10.233.75.26/10.233.75.26:49366": channel is already closed
2025-12-19T07:56:19.150278389+03:00 stderr F 2025-12-19 04:56:19.149+0000 [id=348]	INFO	hudson.remoting.Request$2#run: Failed to send back a reply to the request UserRequest:UserRPCRequest:hudson.remoting.JarLoader.writeJarTo[long,long,java.io.OutputStream](3): hudson.remoting.ChannelClosedException: Channel "hudson.remoting.Channel@e41c8b1:JNLP4-connect connection from 10.233.75.26/10.233.75.26:49366": channel is already closed
2025-12-21T07:14:46.123818857+03:00 stderr F 2025-12-21 04:14:46.119+0000 [id=15200]	INFO	hudson.util.Retrier#start: Attempt #1 to do the action check updates server
2025-12-21T07:14:52.415740382+03:00 stderr F 2025-12-21 04:14:52.414+0000 [id=15200]	INFO	h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
2025-12-21T07:14:53.559354178+03:00 stderr F 2025-12-21 04:14:53.558+0000 [id=15200]	INFO	h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tools.JDKInstaller
2025-12-21T07:14:53.55988137+03:00 stderr F 2025-12-21 04:14:53.559+0000 [id=15200]	INFO	hudson.util.Retrier#start: Performed the action check updates server successfully at the attempt #1
2025-12-22T07:14:47.569805084+03:00 stderr F 2025-12-22 04:14:47.567+0000 [id=22712]	INFO	h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tasks.Maven.MavenInstaller
2025-12-22T07:14:48.713545778+03:00 stderr F 2025-12-22 04:14:48.712+0000 [id=22712]	INFO	h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.tools.JDKInstaller

```

- Pod logs:
```bash
ls /var/log/pods/
argocd_argocd-application-controller-0_46ae9df1-7626-4de7-bbae-07122c2507b4
argocd_argocd-redis-6dbb9f6cf4-pzqjl_41ac8560-b73f-4e4e-a17a-6dba3eedbc3e
ci-cd_jenkins-58599d855-sfcpp_66347100-601d-4487-804e-f07067cbc506
default_nginx-deployment-6dcc4c744d-skd8c_57b21451-5c43-4573-941a-7691071907d7
kube-system_calico-node-54mxl_efce18e5-88f9-4a0f-9fdc-ae439dcc3e45
kube-system_coredns-64b5cc5cbc-6kpc7_4a918dda-3411-4e73-aff2-6201104e98cf
kube-system_kube-apiserver-node1_dba4cbeb6140d89a34cdd134ab2cfef1
kube-system_kube-controller-manager-node1_354b04dc3888c19162a18d70a1cf718a
kube-system_kube-proxy-kv4nq_891ed3ab-5204-4293-bcb6-48da9fcc3f49
kube-system_kube-scheduler-node1_ede8fc88924e87e6a24f747709f0654c
kube-system_nodelocaldns-fhn8x_7af9361f-ebda-484e-b42a-784329f74651
kube-system_sealed-secrets-574cb47d88-g8pcv_83da2202-b412-43cc-892c-4912da49078e
production_postgresql-0_c30e3b5a-a4b1-431e-a45c-36ec3f35a4dd
testing_postgresql-test-0_e1714197-2045-4348-83dd-53596edd1e14
```
- Kubelet/system logs via systemd:
```bash
journalctl -u kubelet -f

Dec 22 17:18:09 node1 kubelet[24741]: E1222 17:18:09.855846   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:18:09 node1 kubelet[24741]: E1222 17:18:09.855906   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:18:13 node1 kubelet[24741]: E1222 17:18:13.855278   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:18:19 node1 kubelet[24741]: E1222 17:18:19.855804   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:18:51 node1 kubelet[24741]: E1222 17:18:51.855456   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:19:10 node1 kubelet[24741]: E1222 17:19:10.855498   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:19:10 node1 kubelet[24741]: E1222 17:19:10.855498   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:19:13 node1 kubelet[24741]: E1222 17:19:13.854946   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:19:30 node1 kubelet[24741]: E1222 17:19:30.856247   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:19:33 node1 kubelet[24741]: E1222 17:19:33.855176   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:19:46 node1 kubelet[24741]: E1222 17:19:46.856742   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:20:10 node1 kubelet[24741]: E1222 17:20:10.856526   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:20:18 node1 kubelet[24741]: E1222 17:20:18.855292   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:20:27 node1 kubelet[24741]: E1222 17:20:27.856076   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:20:30 node1 kubelet[24741]: E1222 17:20:30.855751   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:20:39 node1 kubelet[24741]: E1222 17:20:39.855688   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:20:52 node1 kubelet[24741]: E1222 17:20:52.856330   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:20:56 node1 kubelet[24741]: E1222 17:20:56.855818   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:21:13 node1 kubelet[24741]: E1222 17:21:13.855755   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:21:19 node1 kubelet[24741]: E1222 17:21:19.854793   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:21:49 node1 kubelet[24741]: E1222 17:21:49.855932   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:21:54 node1 kubelet[24741]: E1222 17:21:54.859761   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:21:56 node1 kubelet[24741]: E1222 17:21:56.858283   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:21:57 node1 kubelet[24741]: E1222 17:21:57.855577   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:22:04 node1 kubelet[24741]: E1222 17:22:04.855099   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:22:39 node1 kubelet[24741]: E1222 17:22:39.855717   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:22:43 node1 kubelet[24741]: E1222 17:22:43.855593   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:22:58 node1 kubelet[24741]: E1222 17:22:58.856984   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:23:03 node1 kubelet[24741]: E1222 17:23:03.855106   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:23:11 node1 kubelet[24741]: E1222 17:23:11.855429   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:23:17 node1 kubelet[24741]: E1222 17:23:17.855388   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:23:20 node1 kubelet[24741]: E1222 17:23:20.856010   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:23:42 node1 kubelet[24741]: E1222 17:23:42.855586   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:23:49 node1 kubelet[24741]: E1222 17:23:49.854913   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:24:05 node1 kubelet[24741]: E1222 17:24:05.855630   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:24:26 node1 kubelet[24741]: E1222 17:24:26.856447   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:24:26 node1 kubelet[24741]: E1222 17:24:26.856513   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:24:36 node1 kubelet[24741]: E1222 17:24:36.856828   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:24:38 node1 kubelet[24741]: E1222 17:24:38.860469   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:24:49 node1 kubelet[24741]: E1222 17:24:49.856276   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:25:11 node1 kubelet[24741]: E1222 17:25:11.855727   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:25:21 node1 kubelet[24741]: E1222 17:25:21.855039   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:25:28 node1 kubelet[24741]: E1222 17:25:28.860106   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:25:34 node1 kubelet[24741]: E1222 17:25:34.855734   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:25:45 node1 kubelet[24741]: E1222 17:25:45.854947   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:25:50 node1 kubelet[24741]: E1222 17:25:50.860952   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:26:01 node1 kubelet[24741]: E1222 17:26:01.855487   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:26:31 node1 kubelet[24741]: E1222 17:26:31.855275   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:26:37 node1 kubelet[24741]: E1222 17:26:37.855488   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:26:44 node1 kubelet[24741]: E1222 17:26:44.856104   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:26:46 node1 kubelet[24741]: E1222 17:26:46.855957   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:26:56 node1 kubelet[24741]: E1222 17:26:56.856968   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:27:06 node1 kubelet[24741]: E1222 17:27:06.859535   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
Dec 22 17:27:15 node1 kubelet[24741]: E1222 17:27:15.855597   24741 dns.go:154] "Nameserver limits exceeded" err="Nameserver limits were exceeded, some nameservers have been omitted, the applied nameserver line is: 169.254.25.10 192.168.37.1 213.184.238.45"
```

