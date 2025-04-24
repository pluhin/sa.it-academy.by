### 11. Kubernetes. Basic objects
1.On my VM I created a project folder 11. Kubernetes. Basic objects
I created 3 files in the folder:
* nginx-deployment.yaml
* nginx-service.yaml
* nginx-ingress.yaml

2.Copy the created files to 192.168.203.4
```bash
scp -o "ProxyJump jump_sa@178.124.206.53:32510" nginx-*.yaml root@192.168.203.4:~/nginx/
```
3.Connecting to 192.168.203.4 and applying manifests via commands:
```bash
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
kubectl apply -f nginx-ingress.yaml
```
4.Checking through commands:
```bash
kubectl get all -o wide

NAME                                   READY   STATUS    RESTARTS   AGE   IP           NODE       NOMINATED NODE   READINESS GATES
pod/nginx-deployment-74c556868-52p45   1/1     Running   0          62m   10.42.0.10   debian10   <none>           <none>
pod/nginx-deployment-74c556868-vj4rc   1/1     Running   0          62m   10.42.0.11   debian10   <none>           <none>
pod/nginx-deployment-74c556868-w7cns   1/1     Running   0          62m   10.42.0.12   debian10   <none>           <none>
pod/nginx-deployment-74c556868-zz9q2   1/1     Running   0          62m   10.42.0.9    debian10   <none>           <none>

NAME                    TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE   SELECTOR
service/kubernetes      ClusterIP   10.43.0.1      <none>        443/TCP        20h   <none>
service/nginx-service   NodePort    10.43.140.69   <none>        80:30001/TCP   62m   app=nginx

NAME                               READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS   IMAGES         SELECTOR
deployment.apps/nginx-deployment   4/4     4            4           62m   nginx        nginx:alpine   app=nginx

NAME                                         DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES         SELECTOR
replicaset.apps/nginx-deployment-74c556868   4         4         4       62m   nginx        nginx:alpine   app=nginx,pod-template-hash=74c556868
```

```bash
kubectl describe ingress nginx-ingress

Name:             nginx-ingress
Labels:           <none>
Namespace:        default
Address:          192.168.203.4
Ingress Class:    traefik
Default backend:  <default>
Rules:
  Host                 Path  Backends
  ----                 ----  --------
  nginx-test.k3s-4.sa  
                       /   nginx-service:80 (10.42.0.9:80,10.42.0.11:80,10.42.0.12:80 + 1 more...)
Annotations:           traefik.ingress.kubernetes.io/router.entrypoints: web
Events:                <none>
```

```bash
kubectl get pods -A | grep traef

kube-system   helm-install-traefik-7fxv6                0/1     Completed   1          20h
kube-system   helm-install-traefik-crd-z2fpk            0/1     Completed   0          20h
kube-system   traefik-6ff5d7746c-2849f                  1/1     Running     0          11m
```

5.Added an entry to hosts file
Checking in the browser http://nginx-test.k3s-4.sa/
Result: [google drive image](https://drive.google.com/file/d/15G7UviLi3YKk2IbOBa8rOCtfRm6cL2xS/view?usp=sharing "google drive image")
