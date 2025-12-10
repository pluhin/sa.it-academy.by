```
repo: https://github.com/daniilshauchenka/kubernetes-KinD-minicube-actions/
KinD runs on pushes to kind branch
Minikube runs on PR to master branch

KinD output:
Kubernetes control plane is running at https://127.0.0.1:34037
CoreDNS is running at https://127.0.0.1:34037/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
NAME                       STATUS   ROLES           AGE   VERSION
ci-cluster-control-plane   Ready    control-plane   19s   v1.29.0


Minukube output:
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
NAME       STATUS   ROLES           AGE   VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION      CONTAINER-RUNTIME
minikube   Ready    control-plane   48s   v1.34.0   192.168.49.2   <none>        Ubuntu 22.04.5 LTS   6.11.0-1018-azure   docker://28.4.0

minikube version: v1.37.0

KinD nodes: 
Minikube nodes: 1

KinD k8s version: 1.29.0
Minikube k8s version: 1.34.0

KinD  Cluster startup time: 41 seconds
Minikube Cluster startup time: 91 seconds


Conclusion: kind starts 2x+ times faster, light-weight and is better for CI, 
minikube runs k8s inside vm or docker, has higher resources usage, but is more realistic to production

```
