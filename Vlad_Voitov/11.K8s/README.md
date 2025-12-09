## Nginx deployment
```bash
# 178.124.206.53 app.k8s-3.sa /etc/hosts
ssh -L 6443:127.0.0.1:6443 root@192.168.208.3 -f -N

kubectl apply -f nginx_deploy.yaml

kubectl get deployment nginx-deployment

kubectl get pods -l app=nginx
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-7d44685db9-87h25   1/1     Running   0          113m
nginx-deployment-7d44685db9-9lqlc   1/1     Running   0          113m
nginx-deployment-7d44685db9-nn4z2   1/1     Running   0          113m
nginx-deployment-7d44685db9-sxbtx   1/1     Running   0          113m

kubectl get svc nginx-service
NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
nginx-service   ClusterIP   10.233.39.235   <none>        80/TCP    117m

kubectl get ingress nginx-ingress
NAME            CLASS   HOSTS          ADDRESS         PORTS   AGE
nginx-ingress   nginx   app.k8s-3.sa   192.168.208.4   80      118m

wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/refs/heads/main/deploy/static/provider/baremetal/deploy.yaml -O ingress-controller.yaml
nano ingress-controller.yaml
 # add nodePort: 30001 
 kubectl apply -f ingress-controller.yaml
```
![msg](<screenshots/Screenshot 2025-12-03 150441.png>)
