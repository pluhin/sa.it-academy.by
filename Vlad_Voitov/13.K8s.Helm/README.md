# 13. Kubernetes. Helm
## Homework Assignment 1. Application deployment by Helm

## Install Wordpress:
```bash
helm install my-wordpress oci://registry-1.docker.io/bitnamicharts/wordpress -n apps -f wordpress.yaml
```

## Install Drupal:
```bash
helm install my-drupal oci://registry-1.docker.io/bitnamicharts/drupal -n apps -f drupal.yaml
```

![DRUPAL](<screenshots/screenshot2.png>)

![WP](<screenshots/screenshot1.png>)
