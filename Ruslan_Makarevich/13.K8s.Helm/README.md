# HA1: Application deployment by Helm

## INSTALL HELM

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

## WORDPRESS

```
helm install wordpress oci://registry-1.docker.io/bitnamicharts/wordpress \
  --namespace web-test --create-namespace \
  --set service.type=NodePort \
  --set service.nodePorts.http=30011 \
  --set ingress.enabled=true \
  --set ingress.hostname=wordpress.k8s-5.sa
```

## DRUPAL

```
helm install drupal oci://registry-1.docker.io/bitnamicharts/drupal \
  --namespace web-test --create-namespace \
  --set service.type=NodePort \
  --set service.nodePorts.http=30012 \
  --set ingress.enabled=true \
  --set ingress.hostname=drupal.k8s-5.sa
```

## CHECKING HELM RELEASES

![List](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/13.K8s.Helm/helm_list.png)

## Print-screen WP

![WP](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/13.K8s.Helm/wordpress.png)

## Print-screen Drupal

![Drupal](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/13.K8s.Helm/drupal.png)


