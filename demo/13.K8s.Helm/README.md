```bash
helm install my-drupal \
    --set drupalUsername=admin,drupalPassword=XXXXX,mariadb.auth.rootPassword=XXXXXX \
    --set global.defaultStorageClass=nfs-client  \
    --set image.registry=docker.io \
    --set image.repository=bitnamilegacy/drupal \
    --set mariadb.image.registry=docker.io \
    --set mariadb.image.repository=bitnamilegacy/mariadb \
    oci://registry-1.docker.io/bitnamicharts/drupal -n default
```

## Istio

```yaml
---
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: drupal-gateway
  namespace: default
spec:
  selector:
    istio: ingressgateway
  servers:
    - port:
        number: 80
        name: http
        protocol: HTTP
      hosts:
        - drupal-helm.k8s-9.sa
---
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: drupal-vs
  namespace: default
spec:
  hosts:
    - drupal-helm.k8s-9.sa
  gateways:
    - drupal-gateway
  http:
    - match:
        - uri:
            prefix: /
      route:
        - destination:
            host: my-drupal
            port:
              number: 80
```

https://pluhin.github.io/helm-34-26/

https://github.com/pluhin/helm-34-26

```bash

 670  cd 13.Helm/
  671  mkdir -p {helm-releases,helm-sources}
  672  ls -l
  673  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
  674  chmod 700 get_helm.sh
  675  ./get_helm.sh
  676  helm --help
  677  rm get_helm.sh
  678  ls
  679  cd helm-sources/
  680  helm create first-app
  681  ls
  682  vim first-app/templates/ingress.yaml
  683  vim first-app/templates/_helpers.tpl
  684  kubectl delete -f ../../12.k8s/app.yaml
  685  ls
  686  vim ../../12.k8s/app.yaml
  687  vim first-app/values.yaml
  688  vim first-app/templates/gateway.yaml
  689  vim first-app/templates/virtual-service.yaml
  690  vim first-app/templates/gateway.yaml
  691  vim first-app/templates/virtual-service.yaml
  692  vim first-app/templates/ingress.yaml
  693  vim first-app/templates/virtual-service.yaml
  694  helm install first-app ./first-app/ -n default --dry-run
  695  vim first-app/templates/virtual-service.yaml
  696  helm install first-app ./first-app/ -n default --dry-run
  697  vim first-app/templates/virtual-service.yaml
  698  vim first-app/values.yaml
  699  vim first-app/templates/virtual-service.yaml
  700  vim first-app/templates/httproute.yaml
  701  vim first-app/templates/virtual-service.yaml
  702  helm install first-app ./first-app/ -n default --dry-run
  703  wq
  704  vim first-app/templates/virtual-service.yaml
  705  vim first-app/templates/gateway.yaml
  706  vim first-app/templates/virtual-service.yaml
  707  vim first-app/templates/gateway.yaml
  708  helm install first-app ./first-app/ -n default --dry-run
  709  helm install first-app ./first-app/ -n default
  710  vim first-app/values.yaml
  711  vim first-app/templates/gateway.yaml
  712  vim first-app/templates/virtual-service.yaml
  713  helm uninstall first-app
  714  helm package first-app
  715  ls
  716  ls -l first-app
  717  ls -l first-app -a
  718  mc
  719  ls
  720  mv first-app-0.1.0.tgz ../helm-releases/
  721  ls
  722  helm install first-app ../helm-releases/first-app-0.1.0.tgz -n default
  723  helm uninstall first-app
  724  cd ../
  725  ls
  726  git init
  727  git add --all
  728  git commit -m "Init commit"
  729  git remote add origin git@github.com:pluhin/helm-34-26.git
  730  git push --set-upstream origin master
  731  helm repo index --url "https://pluhin.github.io/helm-34-26/" .
  732  vim index.yaml
  733  git add index.yaml
  734  git commit -m "Add index file"
  735  git push
  736  helm repo add helm-34-26 https://pluhin.github.io/helm-34-26/
  737  helm search repo helm-34-26 -l
  738  vim helm-sources/first-app/Chart.yaml
  739  vim helm-sources/first-app/values.yaml
  740  helm install first-app helm-34-26/first-app -n default --dry-run
  741  helm install first-app helm-34-26/first-app -n default
  742  helm uninstall first-app
  743  vim helm-sources/first-app/templates/pvc.yaml
  744  vim helm-sources/first-app/values.yaml
  745  helm install first-app helm-sources/first-app -n default --dry-run
  746  vim helm-sources/first-app/Chart.yaml
  747  helm package helm-sources/first-app/
  748  ls
  749  mv first-app-0.2.0.tgz helm-releases/
  750  ls -l helm-releases/
  751  helm repo index --url "https://pluhin.github.io/helm-34-26/" --merge index.yaml .
  752  vim index.yaml
  753  git add --all
  754  git commit -m "add pvc"
  755  git push
  756  helm repo update
  757  helm search repo helm-34-26 -l
  758  helm install first-app helm-34-26/first-app -n default --version 0.2.0
  759  helm install my-drupal     --set drupalUsername=admin,drupalPassword=XXXXX,mariadb.auth.rootPassword=XXXXXX     --set global.defaultStorageClass=nfs-client      --set image.registry=docker.io     --set image.repository=bitnamilegacy/drupal     --set mariadb.image.registry=docker.io     --set mariadb.image.repository=bitnamilegacy/mariadb     oci://registry-1.docker.io/bitnamicharts/drupal -n default
  760  vim istio-drupal.yaml
  761  kubectl apply -f istio-drupal.yaml -n default
  762  history
```