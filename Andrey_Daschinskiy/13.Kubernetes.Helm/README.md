### 13. Kubernetes. Helm
#### Installing WordPress (192.168.208.7)

1.Preparation
Minikube installed
Installed kubectl
Helm installed

2.Started the cluster:
```bash
minikube start --driver=docker
minikube addons enable ingress
```
3.Created the wordpress-values.yaml file
Provided it separately

Then the command to install it:
```bash
helm install wordpress oci://registry-1.docker.io/bitnamicharts/wordpress -f wordpress-values.yaml
```
Check:

```bash
helm list

NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART                   APP VERSION
wordpress       default         1               2025-05-05 05:28:41.83061755 -0400 EDT  deployed        wordpress-24.2.4        6.8.1  
```
```bash
kubectl get svc wordpress

NAME        TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
wordpress   NodePort   10.107.107.129   <none>        80:30001/TCP,443:30448/TCP   47m
```

5.Configured port forwarding
```bash
ssh -L 30001:localhost:30001 root@192.168.208.7
```

6.Hosts file
```bash
178.124.206.53 app1.k8s-7.sa
```

7.Result: [google drive image](https://drive.google.com/file/d/1IiBfV8SupESN0FkLVn5H1lqeSEhgmy28/view?usp=sharing "google drive image")

#### Installing Drupal (192.168.208.8)

1.Preparation
Minikube installed
Installed kubectl
Helm installed

2.Started the cluster:
```bash
minikube start --driver=docker
minikube addons enable ingress
```
3.Created the drupal-values.yaml file
Provided it separately

Then the command to install it:
```bash
helm install drupal oci://registry-1.docker.io/bitnamicharts/drupal -f drupal-values.yaml
```
Check:

```bash
helm list

NAME    NAMESPACE       REVISION        UPDATED                                 STATUS          CHART           APP VERSION
drupal  default         1               2025-05-05 06:57:32.744943546 -0400 EDT deployed        drupal-21.2.6   11.1.6   
```

```bash
kubectl get svc drupal

NAME     TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)                      AGE
drupal   NodePort   10.99.41.168   <none>        80:32025/TCP,443:31552/TCP   12m
```
5.Configured port forwarding
```bash
ssh -L 30001:localhost:30001 root@192.168.208.8
```
6.Hosts file
```bash
178.124.206.53 app2.k8s-8.sa
```
7.Result: [google drive image](https://drive.google.com/file/d/1jf916pRnF8wKU_yjonLhPbRhs1hx2R4g/view?usp=sharing "google drive image")
