# Config maps and secrets

You need to improve deployment from previous task:

- Add `index.php` page as config map, which should display hostname of pod as first level header, or generate index.html inside init container
- generate pair public and private keys (or use existing) and add them to the pod for user root as secrets, please use sealsecret object for that
- Validate secrets and index.html display

```yaml
#configs

kind: ConfigMap
apiVersion: v1
metadata:
  name: nginx-php-config
data:
  default.conf: |
    server {
            listen       80;
            listen       [::]:80;
            server_name  example.com;
            root         /var/www/html;
            server_tokens off;

            access_log /var/log/nginx/example.com-access.log;
            error_log  /var/log/nginx/example.com-error.log error;
            index index.html index.htm index.php;

            location / {
                          try_files $uri $uri/ /index.php$args;
            }

            location ~ \.php$ {
                fastcgi_split_path_info ^(.+\.php)(/.+)$;
                fastcgi_pass php-fpm:9000;
                fastcgi_index index.php;
                include fastcgi_params;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                fastcgi_param SCRIPT_NAME $fastcgi_script_name;
        }
    }
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: test-config-html
data:
  index.php: "<!DOCTYPE html>\n<html>\n  <head>\n      <title>PHP Test</title>\n  </head>\n  <body>\n    <?php\n    echo 'My podname is ' .$_ENV[\"POD_NAME\"] . '!';\n    // Show all information, defaults to INFO_ALL\n    phpinfo(); \n    ?>\n  </body>\n</html>\n"
```

```yaml
# secrets

---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: my-ssh-secret
  namespace: default
spec:
  encryptedData:
    ssh-privatekey: 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
    ssh-publickey: AgDCD1og49LMmOs+uyAipTuX9nb1kitbfUBEpt2+aGufoGBLxRb2hkByL7MDuolE6ew9BeekZLdM8u/OT3tGPPxLPRA0riZ3VZxPba/HfHbcL+q1YZ8biDTL8y7oPtAwfUvMK1GMj611O8MnzyeWKLiK268JFR0nhHIsvInnyyEyyUcan5A/0vxKwsBNoU9s9d+17pF7Mm627y0C1NhwOJmxEriqOMgO41z1z3UNKGq3d583Rv03vlF5J9pfZGDhe00nWrIymNEHK/LffIoWZqWDkRe2Vp9ulkNCovAHYtD1b6B1x+5wITQ0pqK68ZREsXUo9tNNZrPNd8YJGKuT4jsY7y5IUmjt+InyFnxIDpOfIsSCWMHqVZ6OL/dItWjxscOaa+Gl2ys5bRpNWsElPvCkSa86yRirPOpKkkOpDXI3ZYUajAwwOO7qdaBiqdzIWbB8DQysDmDiH0GWkorklr2tfkWzdaz6Mr2RWHL4b84vYfUmtDxW80CQM0zBfo4NR08m65Nmdc5eCyhDD6nQC+nGOMArMSm+GF9J/uZpt4dhElltAiCxd33iXUribXePvfUgCZz8ltI3tn0Nz6Tdo4axW42sr3+rtcwDVvHU3RV4dD4ygG7DKS0JTmvdtAD00nDK/py7+8h58SVO59xDjj/uZYpbb+hqYOw/ep98pgS9bwILzBGSILKpQssnFjwHErcvFZJTpnmXYfk0qG+/AE7IVKpZeZ7xGGJKISSrPL9+UW8SueucquviqcUACCaWoIgDG96n7J+bSD9+3PokwSEzyuLdESIKHWkFpNG+72Y1L+4KBVpCi+v59Sb7l/5tr1RLxH2GLrPD0AGlt4Xg2E046kCCcJKBNNSW4CEsE2iMsXGO3rVXL3V+eLXXunJSAsEXbwdgwQhz2reqeyp80zwTUXxh8q0vE7vjYk/gzjKxO8F0qHLnoqcQ9gKnrW49Br1zQ3aMP8FyVK1ziTpPPP1nvT7vsomJ/9kfFoWeAY9UYSUORcO8m3dh/3xzyYHTSEsEQlLQM/qUMO2Kg0gxZqWcEyyC4xIyYncnA+YWCSRHNxJlwSbBKaRrQEzoIFZwr6Z8Di7bi0ziGIWRVh5z8/MNgbo1lbRP1kiIA8KDZvwevDXbFRpFsLarjObvRRRrmgvpRgtI1rX5HARR8BAftxq2TEy5hbnDBwoh3tQ0Rc8j+Of0XZaqdWraiNq4W6cp8vMsw/KLwLJ1UAYzp1e3M5B7w1dNnMA3OcmR
  template:
    metadata:
      creationTimestamp: null
      name: my-ssh-secret
      namespace: default
    type: kubernetes.io/ssh-auth
```

```yaml
#services

apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  labels:
    run: nginx-service
spec:
  ports:
  - protocol: TCP
    port: 80
  selector:
    app: nginx-app
---
apiVersion: v1
kind: Service
metadata:
  name: php-fpm
  labels:
    run: php-fpm
spec:
  selector:
    app: php-fpm
  type: ClusterIP
  ports:
  - name: php-fpm
    port: 9000
    targetPort: 9000
```

```yaml
#deployments

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx-app
spec:
  selector:
    matchLabels:
      app: nginx-app
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 2
      maxUnavailable: 2
  template:
    metadata:
      labels:
        app: nginx-app
    spec:
      containers:
      - name: nginx-container
        image: nginx:latest
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 50m
            memory: 50Mi
          limits:
            cpu: 100m
            memory: 100Mi
        volumeMounts:
        - name: init-nginx-container
          mountPath: /etc/nginx/conf.d/
        - name: init-php-container
          mountPath: /var/www/html/
        - name: ssh-keys
          mountPath: /root/.ssh/
          readOnly: true
      volumes:
      - name: init-nginx-container
        configMap:
          name: nginx-php-config
      - name: init-php-container
        configMap:
          name: test-config-html
      - name: ssh-keys
        secret:
          secretName: my-ssh-secret
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: php-fpm
  labels:
    app: php-fpm
spec:
  selector:
    matchLabels:
      app: php-fpm
  replicas: 4
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: php-fpm
    spec:
      containers:
      - name: php-fpm
        image: php:fpm-alpine
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
          limits:
            cpu: 100m
            memory: 100Mi
        env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        ports:
        - containerPort: 9000
          name: php-fpm
        volumeMounts:
        - name: init-php-container
          mountPath: /var/www/html/
      volumes:
      - name: init-php-container
        configMap:
          name: test-config-html
```

```bash
╭╴my-study/Artem_Zhivushko on  ZhivArt-work [!?] 
╰─ ssh-keygen -b 2048 -t rsa -f ./12.Kubernetes.Data.Security/.ssh/id_rsa
cat ./12.Kubernetes.Data.Security/00_secret.yaml | kubeseal --format yaml > ./12.Kubernetes.Data.Security/application/seal_secred.yaml
```

![](./attachments/Pasted%20image%2020240309174342.png)
![](./attachments/Pasted%20image%2020240309174400.png)
![](./attachments/Pasted%20image%2020240310010013.png)
![](./attachments/Pasted%20image%2020240309175001.png)