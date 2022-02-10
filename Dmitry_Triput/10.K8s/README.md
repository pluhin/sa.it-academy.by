### 10.K8s

## Minikube command for run minikube with different HW options
```bash
minikube start --addons dashboard --addons ingress --memory='6g' --cpus='4' --disk-size='10000mb'
* minikube v1.25.1 on Microsoft Windows 11 Pro 10.0.22000 Build 22000
* Using the virtualbox driver based on existing profile
* Starting control plane node minikube in cluster minikube
* Restarting existing virtualbox VM for "minikube" ...
  ! This VM is having trouble accessing https://k8s.gcr.io
* To pull new external images, you may need to configure a proxy: https://minikube.sigs.k8s.io/docs/reference/networking/proxy/
* Preparing Kubernetes v1.23.1 on Docker 20.10.12 ...
    - kubelet.housekeeping-interval=5m
    - Generating certificates and keys ...
    - Booting up control plane ...
    - Configuring RBAC rules ...| E0211 00:08:49.778209    7384 kubeadm.go:270] unable to create cluster role binding, some addons might not work: apply sa: sudo /var/lib/minikube/binaries/v1.23.1/kubectl create clusterrolebinding minikube-rbac --clusterrole=cluster-admin --serviceaccount=kube-system:default --kubeconfig=/var/lib/minikube/kubeconfig: Process exited with status 1
      stdout:

stderr:
error: failed to create clusterrolebinding: clusterrolebindings.rbac.authorization.k8s.io "minikube-rbac" already exists

- Using image kubernetesui/dashboard:v2.3.1
- Using image gcr.io/k8s-minikube/storage-provisioner:v5
- Using image k8s.gcr.io/ingress-nginx/controller:v1.1.0
- Using image kubernetesui/metrics-scraper:v1.0.7
- Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
- Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
* Verifying Kubernetes components...
* Verifying ingress addon...
* Enabled addons: storage-provisioner, default-storageclass, dashboard, ingress
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

## Kuberspray Recap

```bash
PLAY RECAP *******************************************************************************************************************************************************************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=548  changed=113  unreachable=0    failed=0    skipped=727  rescued=0    ignored=1
node2                      : ok=634  changed=132  unreachable=0    failed=0    skipped=1114 rescued=0    ignored=3

Thursday 10 February 2022  20:35:49 +0000 (0:00:00.030)       0:34:08.862 *****
===============================================================================
kubernetes/preinstall : Install packages requirements ---------------------------------------------------------------------------------------------------------------------------------------------------------------- 68.15s
download : download_container | Download image if required ----------------------------------------------------------------------------------------------------------------------------------------------------------- 56.03s
download : download_container | Download image if required ----------------------------------------------------------------------------------------------------------------------------------------------------------- 50.65s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates ----------------------------------------------------------------------------------------------------------------------------------------------- 46.98s
download : download_container | Download image if required ----------------------------------------------------------------------------------------------------------------------------------------------------------- 41.61s
download : download_container | Download image if required ----------------------------------------------------------------------------------------------------------------------------------------------------------- 40.15s
kubernetes-apps/ansible : Kubernetes Apps | Start Resources ---------------------------------------------------------------------------------------------------------------------------------------------------------- 34.93s
kubernetes/control-plane : kubeadm | Initialize first master --------------------------------------------------------------------------------------------------------------------------------------------------------- 33.57s
download : download_container | Download image if required ----------------------------------------------------------------------------------------------------------------------------------------------------------- 32.30s
network_plugin/calico : Calico | Create calico manifests ------------------------------------------------------------------------------------------------------------------------------------------------------------- 27.81s
download : download_file | Download item ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 25.99s
download : download_file | Download item ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 23.59s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -------------------------------------------------------------------------------------------- 23.41s
bootstrap-os : Update Apt cache -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 22.06s
download : download_container | Download image if required ----------------------------------------------------------------------------------------------------------------------------------------------------------- 21.31s
kubernetes/kubeadm : Join to cluster --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 21.06s
download : download_container | Download image if required ----------------------------------------------------------------------------------------------------------------------------------------------------------- 20.43s
download : download_container | Download image if required ----------------------------------------------------------------------------------------------------------------------------------------------------------- 19.96s
container-engine/containerd : download_file | Download item ---------------------------------------------------------------------------------------------------------------------------------------------------------- 19.90s
download : download_container | Download image if required ----------------------------------------------------------------------------------------------------------------------------------------------------------- 19.30s

```
