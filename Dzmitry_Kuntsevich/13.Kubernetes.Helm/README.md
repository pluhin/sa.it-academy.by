## Install WordPress

```
helm install my-wordpress \
>   --set wordpressUsername=admin \
>   --set wordpressPassword=admin \
>   --set service.type=ClusterIP \
-set ing>   --set ingress.enabled=true \
>   --set ingress.ingressClassName=nginx \
>   --set ingress.hostname=wp.k8s-3.sa \
>   --set persistence.accessMode=ReadWriteMany \
>   --set persistence.size=1Gi \
>   --set persistence.storageClass=nfs-client \
>   --set mariadb.primary.persistence.size=1Gi \
>   --set mariadb.primary.persistence.storageClass=nfs-client \
>   oci://registry-1.docker.io/bitnamicharts/wordpress
```


## Install Drupal


```
helm install drupal \
>   --set drupalUsername=admin \
>   --set drupalPassword=admin \
>   --set persistence.storageClass=nfs-client \
ReadWr>   --set persistence.accessModes={ReadWriteMany} \
>   --set persistence.size=1Gi \
>   --set service.type=ClusterIP \
>   --set ingress.enabled=true \
>   --set ingress.ingressClassName=nginx \
>   --set ingress.hostname=drupal.k8s-3.sa \
>   --set mariadb.primary.persistence.storageClass=nfs-client \
>   --set mariadb.primary.persistence.accessModes={ReadWriteMany} \
>   --set mariadb.primary.persistence.size=1Gi \
>   oci://registry-1.docker.io/bitnamicharts/drupal
```

## WordPress

![wordPress](https://github.com/2Qic1/04.Github-actions/blob/master/photo/wordPress.jpg)


## Drupal

![drupal](https://github.com/2Qic1/04.Github-actions/blob/master/photo/drupal.jpg)




