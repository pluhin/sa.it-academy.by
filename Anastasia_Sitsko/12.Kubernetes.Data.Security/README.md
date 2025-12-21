## kubeseal
```
ssh-keygen -t rsa -b 2048 -f id_rsa_nginx
```

```
curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.33.1/kubeseal-0.33.1-linux-amd64.tar.gz"
tar -xvzf kubeseal-0.33.1-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
rm kubeseal-0.33.1-linux-amd64.tar.gz
rm kubeseal
```
```
kubectl create secret generic nginx-keys  \ 
    --from-file=id_rsa=id_rsa_nginx \   
    --from-file=id_rsa.pub=id_rsa_nginx.pub  \ 
    -n test \  
    --dry-run=client -o yaml > secret.yaml
```
```
kubeseal \
  --controller-name sealed-secrets \
  --controller-namespace test \
  --format yaml < secret.yaml > sealedsecret.yaml

```
```
kubectl get all -n test
```
```
NAME                                  READY   STATUS    RESTARTS      AGE
pod/nginx-5f4c9bb9f4-6zhfz            2/2     Running   0             17m
pod/nginx-5f4c9bb9f4-797h8            2/2     Running   0             17m
pod/nginx-5f4c9bb9f4-8mm9s            2/2     Running   0             17m
pod/nginx-5f4c9bb9f4-v2c4r            2/2     Running   0             17m
pod/sealed-secrets-6756f98747-nrv8m   1/1     Running   2 (48m ago)   45h

NAME                             TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
service/nginx                    ClusterIP   10.107.163.13    <none>        80/TCP     46h
service/sealed-secrets           ClusterIP   10.105.233.63    <none>        8080/TCP   45h
service/sealed-secrets-metrics   ClusterIP   10.103.170.151   <none>        8081/TCP   45h

NAME                             READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx            4/4     4            4           17m
deployment.apps/sealed-secrets   1/1     1            1           45h

NAME                                        DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-5f4c9bb9f4            4         4         4       17m
replicaset.apps/sealed-secrets-6756f98747   1         1         1       45h

```

![alt text](<image-1.png>)