13.K8s.Helm
```bash
helm install my-drupal
--set drupalUsername=admin,drupalPassword=XXXXX,mariadb.auth.rootPassword=XXXXXX
--set global.defaultStorageClass=nfs-client
--set image.registry=docker.io
--set image.repository=bitnamilegacy/drupal
 --set mariadb.image.registry=docker.io
--set mariadb.image.repository=bitnamilegacy/mariadb
oci://registry-1.docker.io/bitnamicharts/drupal -n default

helm install wordpress oci://registry-1.docker.io/bitnamicharts/wordpress \
  --set wordpressUsername=admin \
  --set wordpressPassword=admin123 \
  --set wordpressEmail=admin@example.com \
  --set wordpressFirstName=Nikita \
  --set wordpressLastName=Puntik \
  --set wordpressBlogName="My Wordpress" \
  --set ingress.enabled=false \
  --set global.storageClass=nfs-client \
  --set mariadb.auth.rootPassword=rootPass123 \
  --set mariadb.auth.password=wpPass123

```

<img width="1917" height="960" alt="image" src="https://github.com/user-attachments/assets/713f658e-996c-48ad-8ef4-b840f776dd35" />

<img width="1917" height="965" alt="image" src="https://github.com/user-attachments/assets/a6a4f37f-a178-4207-8f57-1b809afe5bcf" />
