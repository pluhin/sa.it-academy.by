# ANTON IVANOV HW13

## INSTALL
```yaml
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```
### values.yaml
```yaml
wordpressUsername: user

wordpressPassword: ""

wordpressEmail: antonstal@yandex.ru

wordpressFirstName: Anton
wordpressLastName: Ivanov

ingress:

  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "wordpress.k8s-2.sa"
  hosts:
    - host: wordpress.k8s-2.sa
      paths:
        - path: /
          pathType: ImplementationSpecific


mariadb:
  enabled: false
  replication:
    enabled: false

externalDatabase:
  host: 192.168.202.4
  user: bn_wordpress
  password: "bn_wordpress"
  database: bn_wordpress
  port: 3306 
```
### values2.yaml
```yaml
ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "wordpress.k8s-2.sa"
  hosts:
    - host: wordpress.k8s-2.sa
      paths:
        - path: /
          pathType: ImplementationSpecific

mariadb:

  enabled: false

externalDatabase:
  host: 192.168.202.4
  port: 3306
  user: bn_drupal
  password: "bn_drupal"
  database: bn_drupal
  existingSecret: ""
```
### Commands
```yaml
helm install wordpress bitnami/wordpress -f values.yaml
helm install wordpress bitnami/drupal -f values2.yaml
```