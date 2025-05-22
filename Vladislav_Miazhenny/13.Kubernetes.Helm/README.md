## Homework Assignment 1. Application deployment by Helm

### Drupal
1. add in hosts 
	`178.124.206.53  wordpress.k8s-23.sa drupal.k8s-23.sa`
2. create `drupal-values.yaml`
3. commands:
```bash
helm install drupal oci://registry-1.docker.io/bitnamicharts/drupal -f drupal-values.yaml
```
4. results in `drupal.png`

### Wordpress
1. create `wp-values.yaml`
2. commands:
```bash
helm install wordpress oci://registry-1.docker.io/bitnamicharts/wordpress -f wp-values.yaml
```
3. results in `wordpress.png`