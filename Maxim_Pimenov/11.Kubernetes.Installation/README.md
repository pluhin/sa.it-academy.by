### 11.Kubernetes.Installation
## K3s installation
~~~bash
maxim@server:~$ curl -sfL https://get.k3s.io | sh -
[INFO]  Finding release for channel stable
[INFO]  Using v1.23.6+k3s1 as release
[INFO]  Downloading hash https://github.com/k3s-io/k3s/releases/download/v1.23.6+k3s1/sha256sum-amd64.txt
[INFO]  Downloading binary https://github.com/k3s-io/k3s/releases/download/v1.23.6+k3s1/k3s
[INFO]  Verifying binary download
[INFO]  Installing k3s to /usr/local/bin/k3s
[INFO]  Skipping installation of SELinux RPM
[INFO]  Skipping /usr/local/bin/kubectl symlink to k3s, already exists
[INFO]  Creating /usr/local/bin/crictl symlink to k3s
[INFO]  Skipping /usr/local/bin/ctr symlink to k3s, command exists in PATH at /usr/bin/ctr
[INFO]  Creating killall script /usr/local/bin/k3s-killall.sh
[INFO]  Creating uninstall script /usr/local/bin/k3s-uninstall.sh
[INFO]  env: Creating environment file /etc/systemd/system/k3s.service.env
[INFO]  systemd: Creating service file /etc/systemd/system/k3s.service
[INFO]  systemd: Enabling k3s unit
Created symlink /etc/systemd/system/multi-user.target.wants/k3s.service → /etc/systemd/system/k3s.service.
[INFO]  systemd: Starting k3s
maxim@server:~$ sudo k3s kubectl get node
NAME     STATUS   ROLES                  AGE   VERSION
server   Ready    control-plane,master   51s   v1.23.6+k3s1
maxim@server:~$ sudo k3s kubectl get pods -A
NAMESPACE     NAME                                      READY   STATUS      RESTARTS   AGE
kube-system   local-path-provisioner-6c79684f77-kf99g   1/1     Running     0          8m41s
kube-system   coredns-d76bd69b-wv6vw                    1/1     Running     0          8m41s
kube-system   helm-install-traefik-crd-h46gd            0/1     Completed   0          8m41s
kube-system   metrics-server-7cd5fcb6b7-qdsvt           1/1     Running     0          8m41s
kube-system   helm-install-traefik-nxxgp                0/1     Completed   2          8m41s
kube-system   svclb-traefik-wd5kz                       2/2     Running     0          7m54s
kube-system   traefik-df4ff85d6-mfzfr                   1/1     Running     0          7m54s
~~~

## Aliases commands
~~~bash
➜  ~ kccc
kubernetes-admin@cluster.k8s
➜  ~ kgp
No resources found in default namespace.
➜  ~ kgns
NAME              STATUS   AGE
default           Active   3d10h
kube-node-lease   Active   3d10h
kube-public       Active   3d10h
kube-system       Active   3d10h
➜  ~ kcn kube-system
Context "kubernetes-admin@cluster.k8s" modified.
➜  ~ kgp
NAME                                       READY   STATUS    RESTARTS        AGE
calico-kube-controllers-6dd874f784-724sp   1/1     Running   2 (3d10h ago)   3d10h
calico-node-62rld                          1/1     Running   0               3d10h
calico-node-jqbbt                          1/1     Running   0               3d10h
coredns-5f44f89dcc-gzkfh                   1/1     Running   0               3d10h
coredns-5f44f89dcc-hdd9h                   1/1     Running   0               3d10h
dns-autoscaler-78676459f6-5gpb9            1/1     Running   0               3d10h
kube-apiserver-node1                       1/1     Running   1               3d10h
kube-controller-manager-node1              1/1     Running   1               3d10h
kube-proxy-k4xnj                           1/1     Running   0               3d10h
kube-proxy-rzlgh                           1/1     Running   0               3d10h
kube-scheduler-node1                       1/1     Running   1               3d10h
nginx-proxy-node2                          1/1     Running   0               3d10h
nodelocaldns-dzfm4                         1/1     Running   0               3d10h
nodelocaldns-hsxsf                         1/1     Running   0               3d10h
➜  ~ kgno
NAME    STATUS   ROLES                  AGE     VERSION
node1   Ready    control-plane,master   3d11h   v1.23.7
node2   Ready    <none>                 3d11h   v1.23.7
➜  ~ kcgc
CURRENT   NAME                           CLUSTER       AUTHINFO           NAMESPACE
*         kubernetes-admin@cluster.k8s   cluster.k8s   kubernetes-admin
          minikube                       cluster.k3s   minikube           default
➜  ~ kcuc minikube
Switched to context "minikube".
➜  ~ kgp
No resources found in default namespace.
➜  ~ kgno
NAME       STATUS   ROLES                  AGE   VERSION
minikube   Ready    control-plane,master   24h   v1.23.3
~~~


##kubectl config
~~~yaml
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    extensions:
    - extension:
        last-update: Thu, 09 Jun 2022 08:44:11 MSK
        provider: minikube.sigs.k8s.io
        version: v1.25.2
      name: cluster_info
    server: https://127.0.0.1:8443
  name: cluster.k3s
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://127.0.0.1:6443
  name: cluster.k8s
contexts:
- context:
    cluster: cluster.k8s
    namespace: kube-system
    user: kubernetes-admin
  name: kubernetes-admin@cluster.k8s
- context:
    cluster: cluster.k3s
    extensions:
    - extension:
        last-update: Thu, 09 Jun 2022 08:44:11 MSK
        provider: minikube.sigs.k8s.io
        version: v1.25.2
      name: context_info
    namespace: default
    user: minikube
  name: minikube
current-context: kubernetes-admin@cluster.k8s
kind: Config
preferences: {}
users:
- name: kubernetes-admin
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
- name: minikube
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
~~~