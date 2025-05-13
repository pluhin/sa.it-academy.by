# Homework Assignment 1. Application deployment by Helm
## Drupal deploying in k8s
- Precondition: nfs-client storageClass is created. Row in /etc/hosts -> drupal.k8s-19.sa is added.
1. Create drupal-values.yaml
2. Run command:
```
helm install drupal -f drupal-values.yaml oci://registry-1.docker.io/bitnamicharts/drupal
```
3. Check pods creation and status.
4. Open Mozila and go to drupal.k8s-19.sa -> home page is opened.
5. Add content to home page -> See attachment (drupal.png)

## Wordpress
- Precondition: nfs-client storageClass is created. Row in /etc/hosts -> wordpress.k8s-19.sa is added.
1. Create wordpress-values.yaml
2. Run command:
```
helm install wordpress -f wordpress-values.yaml oci://registry-1.docker.io/bitnamicharts/wordpress
```
3. Check pods creation and status.
4. Open Mozila and go to wordpress.k8s-19.sa -> home page is opened.
5. Add content to home page -> See attachment (wordpress.png)
