

``` sh
tree
.
├── Chart.lock
├── charts
│   ├── drupal-23.0.0.tgz
│   └── wordpress-29.1.2.tgz
├── Chart.yaml
├── README.md
├── templates
│   ├── gateway.yaml
│   └── virtual-service.yaml
└── values.yaml

```

# Chart.yaml

``` yaml
apiVersion: v2
name: helmdrupal
description: Drupal + WordPress via Bitnami subcharts with Istio Gateway and VirtualServices

type: application
version: 0.2.0
appVersion: "1.0"

dependencies:
  - name: drupal
    version: "23.0.0"
    repository: oci://registry-1.docker.io/bitnamicharts
  - name: wordpress
    version: "29.1.2"
    repository: oci://registry-1.docker.io/bitnamicharts
```

values.yaml

``` yaml

nameOverride: ""
fullnameOverride: ""

global:
  defaultStorageClass: nfs-client

# Istio: 1 Gateway 4 2-VirtualService (Drupal + WordPress)
istio:
  servicePort: 80
  
  drupalHosts:
    - drupal-helm.k8s-3.sa
  drupalServiceName: "drupal-helm"
  # WordPress
  wordpressHosts:
    - wordpress-helm.k8s-3.sa
  wordpressServiceName: ""   

# --- Bitnami  subchart ---
drupal:
  image:
    registry: docker.io
    repository: bitnamilegacy/drupal
  service:
    type: ClusterIP   
  ingress:
    enabled: false
  persistence:
    enabled: true
    storageClass: ""
    size: 2Gi
  mariadb:
    enabled: true
    image:
      registry: docker.io
      repository: bitnamilegacy/mariadb
    auth:
      rootPassword: ""
      database: bitnami_drupal
      username: bn_drupal
      password: ""
    primary:
      persistence:
        enabled: true
        storageClass: ""
        size: 2Gi


wordpress:
  ingress:
    enabled: false
  service:
    type: ClusterIP
  persistence:
    enabled: true
    storageClass: ""
    size: 2Gi
  mariadb:
    enabled: false
  externalDatabase:
    host: drupal-helm-mariadb
    port: 3306
    database: wordpress
    user: bn_wordpress
    password: "" 

```


# gateway

``` yaml
---
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: {{ .Release.Name }}-{{ .Chart.Name }}
  labels:
    app.kubernetes.io/name: {{ .Chart.Name }}
    app.kubernetes.io/instance: {{ .Release.Name }}
spec:
  selector:
    istio: ingressgateway
  servers:
    - port:
        number: {{ .Values.istio.servicePort }}
        name: http
        protocol: HTTP
      hosts:
        {{- toYaml (concat .Values.istio.drupalHosts .Values.istio.wordpressHosts) | nindent 8 }}


```



# virtual-service

``` yaml
# Drupal VirtualService
---
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: {{ .Release.Name }}-{{ .Chart.Name }}-drupal
  labels:
    app.kubernetes.io/name: {{ .Chart.Name }}
    app.kubernetes.io/instance: {{ .Release.Name }}
spec:
  hosts:
    {{- toYaml .Values.istio.drupalHosts | nindent 4 }}
  gateways:
    - {{ .Release.Name }}-{{ .Chart.Name }}
  http:
    - match:
        - uri:
            prefix: /
      route:
        - destination:
            host: {{ .Values.istio.drupalServiceName | default (printf "%s-drupal" .Release.Name) }}
            port:
              number: {{ .Values.istio.servicePort }}


# WordPress VirtualService
---
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: {{ .Release.Name }}-{{ .Chart.Name }}-wordpress
  labels:
    app.kubernetes.io/name: {{ .Chart.Name }}
    app.kubernetes.io/instance: {{ .Release.Name }}
spec:
  hosts:
    {{- toYaml .Values.istio.wordpressHosts | nindent 4 }}
  gateways:
    - {{ .Release.Name }}-{{ .Chart.Name }}
  http:
    - match:
        - uri:
            prefix: /
      route:
        - destination:
            host: {{ .Values.istio.wordpressServiceName | default (printf "%s-wordpress" .Release.Name) }}
            port:
              number: {{ .Values.istio.servicePort }}
```



# bash commands 
``` sh
helm template drupal-helm . -n default
helm dependency update
helm install drupal-helm . -n default   --set drupal.drupalUsername=admin   --set drupal.drupalPassword=****   --set drupal.mariadb.auth.rootPassword=****   --set drupal.mariadb.auth.password=****  --set wordpress.wordpressPassword=YOUR_WORDPRESS_PASSWORD --set wordpress.externalDatabase.password=YOUR_WP_DB_PASSWORD


...
helm upgarade drupal-helm **
...


```

** 2 инстанса mariadb через один чарт поставить не получилось - использовал 1 инстанс для 2 сервисов..


#  Links

[WordPress](http://wordpress-helm.k8s-3.sa/)
[Drupal](http://drupal-helm.k8s-3.sa/)