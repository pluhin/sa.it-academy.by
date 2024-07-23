# 1. Homework Assignment 1: Use grafana Loki for log monitoring

Устанавливаем grafana 9 версии, так как loki стабильно работает с этой версией

```
nano grafana.yaml
```
grafana.yaml
```

---
apiVersion: v1
kind: ConfigMap
metadata:
  name: grafana-datasources
  namespace: loki
data:
  prometheus.yaml: |-
    {
        "apiVersion": 1,
        "datasources": [
            {
               "access":"proxy",
                "editable": true,
                "name": "prometheus",
                "orgId": 1,
                "type": "prometheus",
                "url": "http://prometheus-service:8080",
                "version": 1
            }
        ]
    }
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: grafana
  namespace: loki
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana
  template:
    metadata:
      name: grafana
      labels:
        app: grafana
    spec:
      containers:
      - name: grafana
        image: grafana/grafana:9.4.0
        ports:
        - name: grafana
          containerPort: 3000
        resources:
          limits:
            memory: "1Gi"
            cpu: "500m"
          requests:
            memory: "1Gi"
            cpu: "500m"
        volumeMounts:
          - mountPath: /var/lib/grafana
            name: grafana-storage
          - mountPath: /etc/grafana/provisioning/datasources
            name: grafana-datasources
            readOnly: false
      volumes:
        - name: grafana-storage
          emptyDir: {}
        - name: grafana-datasources
          configMap:
              defaultMode: 420
              name: grafana-datasources
---
apiVersion: v1
kind: Service
metadata:
  name: grafana
  namespace: loki
  annotations:
      prometheus.io/scrape: 'true'
      prometheus.io/port:   '3000'
spec:
  selector:
    app: grafana
  type: NodePort
  ports:
    - port: 3000
      targetPort: 3000
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-grafana
  namespace: loki
spec:
  ingressClassName: nginx
  rules:
    - host: grafana-loki.k8s-1.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: grafana
                port:
                  number: 3000
```
Создадим namespace loki
```
kubectl create namespace loki
kubectl apply -f grafana.yaml -n loki
```
2. Установим loki
   Ссылка на установку здесь: [https://grafana.github.io/helm-charts/]

   ![image](https://github.com/user-attachments/assets/cc0eb17c-63d0-4d1a-afe4-43a1a9b9e049)

Сами логи которые получил с drupal

![image](https://github.com/user-attachments/assets/5842f71b-6554-4c4a-92ff-24f13bb7bfc7)

![image](https://github.com/user-attachments/assets/1f0b4ce2-78bc-40f8-817f-ef145c8da0a6)

Само выражение отображающий показ за время

count_over_time({pod="drupal-579b9f476-gh8d5"} [30m] |= "GET")

![image](https://github.com/user-attachments/assets/68236cf8-3730-42be-b1da-03131bd37521)
