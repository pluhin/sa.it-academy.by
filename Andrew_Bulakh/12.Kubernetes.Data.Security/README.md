# 12. Kubernetes. Data. Security

## Homework Assignment 1. Config maps and secrets

deployment.yaml
```bash
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 4
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      initContainers:
      - name: init-config
        image: busybox
        command:
        - sh
        - -c
        - |
          cp /config/index.html /usr/share/nginx/html/index.html && \
          sed -i "s/{{ .Values.hostname }}/$HOSTNAME/g" /usr-share/nginx/html/index.html
        volumeMounts:
        - name: config-volume
          mountPath: /config
        - name: www-volume
          mountPath: /usr/share/nginx/html
      containers:
      - name: nginx
        image: nginx:1.25
        ports:
        - containerPort: 80
        volumeMounts:
        - name: www-volume
          mountPath: /usr/share/nginx/html
        - name: ssh-keys
          mountPath: /root/.ssh # Монтируем секреты в директорию /root/.ssh
        - name: nginx-config
          mountPath: /etc/nginx/nginx.conf # Монтируем конфигурацию Nginx
          subPath: nginx.conf
        resources:
          limits:
            cpu: "500m"
            memory: "512Mi"
          requests:
            cpu: "250m"
            memory: "256Mi"
        lifecycle:
          postStart:
            exec:
              command: ["sh", "-c", "nginx -s reload"]
      volumes:
      - name: config-volume
        configMap:
          name: nginx-index
      - name: www-volume
        emptyDir: {}
      - name: ssh-keys
        secret:
          secretName: ssh-keys
      - name: nginx-config
        configMap:
          name: nginx-config
```

service.yaml
```bash
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: NodePort
```

ingress.yaml
```bash
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: nginx-test.k8s-1.sa
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nginx-service
            port:
              number: 80
```

nginx.conf
```bash
server {
    listen 80;
    server_name nginx-test.k8s-1.sa;
    root /usr/share/nginx/html;
    index index.html index.htm;
    location / {
        try_files $uri $uri/ =404;
    }
}
```
index.html
```bash
<!DOCTYPE html>
<html>
<head>
  <title>Host Info</title>
</head>
<body>
  <h1>Hostname: {{ .Values.hostname }}</h1>
</body>
</html>
```

