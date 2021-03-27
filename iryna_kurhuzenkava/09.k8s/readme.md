## SONARR+RADARR+HELM
```
[root@onlyoffice helm-app]# kubectl get pods -n myapp
NAME                                 READY   STATUS    RESTARTS   AGE
radarr-deployment-77477fd9f-hjcx7    1/1     Running   0          2d7h
radarr-helm-55fc47745d-fjtwb         1/1     Running   0          80s
sonarr-deployment-5696755df8-d4sln   1/1     Running   0          2d8h
sonarr-helm-64858bf9f4-xs279         1/1     Running   0          9m44s
[root@onlyoffice helm-app]# kubectl get service -n myapp
NAME             TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
radarr-helm      LoadBalancer   10.233.3.221    <pending>     7878:30512/TCP   3m22s
radarr-service   LoadBalancer   10.233.48.225   <pending>     7878:31180/TCP   2d7h
sonarr-helm      LoadBalancer   10.233.19.145   <pending>     8989:30466/TCP   11m
sonarr-service   LoadBalancer   10.233.42.29    <pending>     8989:30621/TCP   2d8h
```
