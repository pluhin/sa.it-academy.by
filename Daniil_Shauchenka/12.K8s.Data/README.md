```
#Deployment, pods, and service
kubectl get deploy php-deployment
NAME             READY   UP-TO-DATE   AVAILABLE   AGE
php-deployment   4/4     4            4           18h

kubectl get pods -l app=phpapp -o wide
NAME                              READY   STATUS    RESTARTS   AGE   IP            NODE                 NOMINATED NODE   READINESS GATES
php-deployment-845cbd6d77-7k6ft   1/1     Running   0          26m   10.244.0.11   kind-control-plane   <none>           <none>
php-deployment-845cbd6d77-lmkfp   1/1     Running   0          25m   10.244.0.13   kind-control-plane   <none>           <none>
php-deployment-845cbd6d77-nv5hw   1/1     Running   0          25m   10.244.0.12   kind-control-plane   <none>           <none>
php-deployment-845cbd6d77-x29v4   1/1     Running   0          25m   10.244.0.14   kind-control-plane   <none>           <none>


kubectl get svc php-service
NAME          TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)   AGE
php-service   ClusterIP   10.96.53.66   <none>        80/TCP    18h


#ConfigMap
kubectl get cm nginx-index -o yaml

#SealedSecret and unsealed Secret
kubectl get sealedsecret
NAME       AGE
ssh-keys   28m

kubectl get secret ssh-keys -o yaml
apiVersion: v1
data:
  id_ed25519: ...
  id_ed25519.pub: ...
kind: Secret
metadata:
  creationTimestamp: "2025-12-02T11:40:57Z"


#Check mounted SSH keys inside the pod
kubectl exec -it deploy/php-deployment -- ls -l /root/.ssh
lrwxrwxrwx 1 root root 17 Dec  2 11:41 id_ed25519 -> ..data/id_ed25519
lrwxrwxrwx 1 root root 21 Dec  2 11:41 id_ed25519.pub -> ..data/id_ed25519.pub


#Test application inside the cluster
kubectl exec -it deploy/php-deployment -- curl -s localhost
<h1>php-deployment-845cbd6d77-7k6ft</h1>


#Test application through ingress
curl http://php-test.k8s-17.sa
<h1>php-deployment-845cbd6d77-lmkfp</h1>

```
