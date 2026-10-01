# Homework Assignment 1: Application Deployment by Helm
* Install Helm:
```
cd Project/14.K8s/
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
chmod 700 get_helm.sh
./get_helm.sh
helm version
version.BuildInfo{Version:"v4.3.0", GitCommit:"bec5b06ed841fe5269972d864d5177944fd5970f",
GitTreeState:"clean", GoVersion:"go1.27.1", KubeClientVersion:"v1.37"}
```

## Project Overview
Deployment for **WordPress** and **Drupal** applications inside a Kubernetes cluster using **Helm v4** package manager. The setup is integrated with **Istio Service Mesh** for traffic routing and uses **NFS** persistent network storage for databases and application states.

* All charts were pulled directly from the **official Bitnami OCI registry** hosted on Docker Hub (`oci://registry-1.docker.io/bitnamicharts`).

---

## Deployment 


# 1. Install WordPress
```
helm install wordpress oci://registry-1.docker.io/bitnamicharts/wordpress \
  --namespace default \
  --set ingress.enabled=false \
  --set global.storageClass=nfs-app \
  --set mariadb.primary.persistence.storageClass=nfs-app \
``` 
<img width="975" height="436" alt="image" src="https://github.com/user-attachments/assets/fce259b1-d495-411b-a60a-03b9afc1e8d1" />


# 2. Install Drupal
```
helm install drupal
--set drupalUsername=xxx,drupalPassword=xxx,mariadb.auth.rootPassword=xxx
--set global.defaultStorageClass=nfs-client
--set image.registry=docker.io
--set image.repository=bitnamilegacy/drupal
--set mariadb.image.registry=docker.io
--set mariadb.image.repository=bitnamilegacy/mariadb
oci://registry-1.docker.io/bitnamicharts/drupal
-n default
```
<img width="975" height="392" alt="image" src="https://github.com/user-attachments/assets/17b55519-6615-49cf-82b5-d68c1ccbb679" />

---

### Verification of Releases
```bash
$helm list
NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART                   APP VERSION
drupal          default         1               2026-09-30 16:40:11.608087509 +0000 UTC deployed        drupal-23.0.0           11.2.3
wordpress       default         1               2026-09-30 09:27:35.051593816 +0000 UTC deployed        wordpress-34.1.0        7.1.2

```

---

## Routing Rules (`istio-routing.yaml`)

```yaml
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: app-gateway
  namespace: default
spec:
  selector:
    istio: ingressgateway
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - "wordpress.k8s-7.sa"
    - "drupal.k8s-8.sa"
---
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: wordpress-vs
  namespace: default
spec:
  hosts:
  - "wordpress.k8s-7.sa"
  gateways:
  - app-gateway
  http:
  - route:
    - destination:
        host: wordpress.default.svc.cluster.local
        port:
          number: 80
---
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: drupal-vs
  namespace: default
spec:
  hosts:
  - "drupal.k8s-8.sa"
  gateways:
  - app-gateway
  http:
  - route:
    - destination:
        host: drupal.default.svc.cluster.local
        port:
          number: 80
```

---


1. **Hosts Resolution:** 
   ```
   vim /etc/hosts
   178.124.206.53  wordpress.k8s-7.sa drupal.k8s-8.sa
   ```


### 3. Application Verification Screenshots
Custom dummy pages have been officially published on both platforms displaying my name.

#### WordPress 
http://wordpress.k8s-7.sa/

<img width="975" height="437" alt="image" src="https://github.com/user-attachments/assets/8a431fe1-6738-4f16-bfd9-9ca0c8080f2f" />

#### Drupal 
http://drupal.k8s-8.sa/

<img width="975" height="478" alt="image" src="https://github.com/user-attachments/assets/9eeffd7b-c436-41ff-b3fd-bcc9937681e0" />

