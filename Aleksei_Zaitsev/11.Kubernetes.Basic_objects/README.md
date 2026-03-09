# 11. Kubernetes. Basic objects

### Create deployment of nginx service:

```bash
kubectl apply -f nginx_deployment.yaml
kubectl apply -f nginx_service.yaml 
kubectl apply -f nginx_ingress.yaml 
```

### Check pods creation:

```bash
aleks@ams4:~$ kubectl get pods -l app=nginx -w
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-64cb87b666-68pk6   1/1     Running   0          39m
nginx-deployment-64cb87b666-lnd8n   1/1     Running   0          39m
nginx-deployment-64cb87b666-qjqxg   1/1     Running   0          39m
nginx-deployment-64cb87b666-xfhnn   1/1     Running   0          39m
```

### Updating the pods after executing `kubectl apply -f nginx_deployment.yaml command`

<details>
<summary> show logs</summary>

```bash
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-64cb87b666-68pk6   1/1     Running   0          39m
nginx-deployment-64cb87b666-lnd8n   1/1     Running   0          39m
nginx-deployment-64cb87b666-qjqxg   1/1     Running   0          39m
nginx-deployment-64cb87b666-xfhnn   1/1     Running   0          39m
nginx-deployment-77847799f9-q2zzg   0/1     Pending   0          0s
nginx-deployment-77847799f9-q2zzg   0/1     Pending   0          0s
nginx-deployment-64cb87b666-xfhnn   1/1     Terminating   0          42m
nginx-deployment-77847799f9-q2zzg   0/1     ContainerCreating   0          0s
nginx-deployment-64cb87b666-xfhnn   1/1     Terminating         0          42m
nginx-deployment-77847799f9-27t8v   0/1     Pending             0          0s
nginx-deployment-77847799f9-27t8v   0/1     Pending             0          0s
nginx-deployment-77847799f9-27t8v   0/1     ContainerCreating   0          0s
nginx-deployment-64cb87b666-xfhnn   1/1     Terminating         0          42m
nginx-deployment-77847799f9-q2zzg   0/1     ContainerCreating   0          1s
nginx-deployment-77847799f9-27t8v   0/1     ContainerCreating   0          1s
nginx-deployment-64cb87b666-xfhnn   0/1     Completed           0          42m
nginx-deployment-64cb87b666-xfhnn   0/1     Completed           0          42m
nginx-deployment-64cb87b666-xfhnn   0/1     Completed           0          42m
nginx-deployment-77847799f9-q2zzg   0/1     Running             0          20s
nginx-deployment-77847799f9-27t8v   0/1     Running             0          21s
nginx-deployment-77847799f9-q2zzg   1/1     Running             0          26s
nginx-deployment-64cb87b666-lnd8n   1/1     Terminating         0          42m
nginx-deployment-64cb87b666-lnd8n   1/1     Terminating         0          42m
nginx-deployment-77847799f9-sdhnw   0/1     Pending             0          0s
nginx-deployment-77847799f9-sdhnw   0/1     Pending             0          0s
nginx-deployment-77847799f9-sdhnw   0/1     ContainerCreating   0          0s
nginx-deployment-77847799f9-sdhnw   0/1     ContainerCreating   0          1s
nginx-deployment-64cb87b666-lnd8n   1/1     Terminating         0          42m
nginx-deployment-64cb87b666-lnd8n   0/1     Completed           0          42m
nginx-deployment-77847799f9-27t8v   1/1     Running             0          27s
nginx-deployment-64cb87b666-qjqxg   1/1     Terminating         0          42m
nginx-deployment-77847799f9-mx884   0/1     Pending             0          0s
nginx-deployment-64cb87b666-qjqxg   1/1     Terminating         0          42m
nginx-deployment-77847799f9-mx884   0/1     Pending             0          0s
nginx-deployment-77847799f9-mx884   0/1     ContainerCreating   0          0s
nginx-deployment-64cb87b666-qjqxg   1/1     Terminating         0          42m
nginx-deployment-77847799f9-sdhnw   0/1     Running             0          2s
nginx-deployment-64cb87b666-lnd8n   0/1     Completed           0          42m
nginx-deployment-64cb87b666-lnd8n   0/1     Completed           0          42m
nginx-deployment-77847799f9-mx884   0/1     ContainerCreating   0          1s
nginx-deployment-64cb87b666-qjqxg   0/1     Completed           0          42m
nginx-deployment-64cb87b666-qjqxg   0/1     Completed           0          42m
nginx-deployment-64cb87b666-qjqxg   0/1     Completed           0          42m
nginx-deployment-77847799f9-mx884   0/1     Running             0          2s
nginx-deployment-77847799f9-sdhnw   1/1     Running             0          9s
nginx-deployment-64cb87b666-68pk6   1/1     Terminating         0          42m
nginx-deployment-64cb87b666-68pk6   1/1     Terminating         0          42m
nginx-deployment-64cb87b666-68pk6   1/1     Terminating         0          42m
nginx-deployment-64cb87b666-68pk6   0/1     Completed           0          42m
nginx-deployment-77847799f9-mx884   1/1     Running             0          9s
nginx-deployment-64cb87b666-68pk6   0/1     Completed           0          42m
nginx-deployment-64cb87b666-68pk6   0/1     Completed           0          42m

```
</details>

### Apply runner_pod: 

```bash
kubectl apply -f runner_secret.yaml
kubectl apply -f runner_configmap.yaml 
kubectl apply -f runner_pod.yaml 
kubectl get pod gitlab-runner
```

```bash
NAME            READY   STATUS    RESTARTS       AGE
gitlab-runner   1/1     Running   5 (7m3s ago)   8m55s
```

