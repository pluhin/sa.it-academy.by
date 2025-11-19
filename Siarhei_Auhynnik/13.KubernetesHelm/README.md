# 13. Kubernetes. Helm

## Install Wordpress portal
```
helm install wordpress oci://registry-1.docker.io/bitnamicharts/wordpress \  
--namespace 13 \  
--create-namespace \  
--set wordpressUsername=admin \  
--set wordpressPassword=admin1! \  
--set wordpressBlogName="Homework WP" \  
--set service.type=ClusterIP \  
--set ingress.enabled=true \  
--set ingress.hostname=wordpress.k8s-1.sa \  
--set ingress.tls=false \  
--set mariadb.enabled=false \  
--set externalDatabase.host=192.168.201.1 \  
--set externalDatabase.port=3306 \  
--set externalDatabase.user=wpuser \  
--set externalDatabase.password=wpuser1! \  
--set externalDatabase.database=wordpress \  
--set persistence.enabled=true \  
--set persistence.existingClaim=wp-pvc-13
```

## Install Drupal portal
```
helm install drupal oci://registry-1.docker.io/bitnamicharts/drupal \
  --namespace 13 \
  --set drupalUsername=admin \
  --set drupalPassword=admin1! \
  --set drupalSiteName="Homework Drupal" \
  --set service.type=ClusterIP \
  --set ingress.enabled=true \
  --set ingress.ingressClassName=nginx\
  --set ingress.hostname=drupal.k8s-1.sa \
  --set ingress.tls=false \
  --set mariadb.enabled=false \
  --set externalDatabase.host=192.168.201.1 \
  --set externalDatabase.port=3306 \
  --set externalDatabase.user=dpuser \
  --set externalDatabase.password=dpuser1! \
  --set externalDatabase.database=drupal \
  --set persistence.enabled=true \
  --set persistence.existingClaim=drupal-pvc-13 \
  --set image.registry=docker.io \
  --set image.repository=bitnamilegacy/drupal \
  --set image.tag=latest
```
## Additional input
```
kubectl create secret generic drupal-ssmtp -n 13 --from-literal=ssmtp.conf=""
```

## Screenshots

__wordpress.k8s-1.sa.jpg__

__drupal.k8s-1.sa.jpg__
