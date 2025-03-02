# 16. Technical and service monitoring

manifests uploaded to github
[github](https://github.com/AndrewBulah/argo-flux)

## Homework Assignment 1: Deploy and setup Prometheus Alertmanager

alertmanager.yaml
```bash

---
apiVersion: v1
kind: ConfigMap
metadata:
  name: alertmanager-config
  namespace: monitoring
data:
  alertmanager.yml: |-
    global:
      resolve_timeout: 5m
    route:
      receiver: 'slack-notifications'
      group_by: [alertname]
      group_wait: 10s
      group_interval: 5m
      repeat_interval: 3h
    receivers:
    - name: 'slack-notifications'
      slack_configs:
      - api_url: 'XXXXXXXXXXXXX'
        channel: '@AndrewFreak'
        send_resolved: true
        title: '[{{ .Status | title }}] {{ .CommonLabels.alertname }}'
        text: |-
          *Instance*: {{ .CommonLabels.instance }}
          *Description*: {{ .CommonAnnotations.description }}
          *Value*: {{ .Value }}
          *Graph*: <http://prometheus.k8s-1.sa/graph?g0.expr={{ .GeneratorURL | urlquery }}|Prometheus>
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: alertmanager
  namespace: monitoring
spec:
  replicas: 1
  selector:
    matchLabels:
      app: alertmanager
  template:
    metadata:
      labels:
        app: alertmanager
    spec:
      containers:
      - name: alertmanager
        image: prom/alertmanager
        args:
          - "--config.file=/etc/alertmanager/alertmanager.yml"
          - "--storage.path=/alertmanager"
        ports:
        - containerPort: 9093
        volumeMounts:
        - name: alertmanager-config
          mountPath: /etc/alertmanager
        - name: alertmanager-storage
          mountPath: /alertmanager
      volumes:
      - name: alertmanager-config
        configMap:
          name: alertmanager-config
      - name: alertmanager-storage
        emptyDir: {}

---
apiVersion: v1
kind: Service
metadata:
  name: alertmanager
  namespace: monitoring
spec:
  selector:
    app: alertmanager
  ports:
    - port: 9093
      targetPort: 9093
```
## Homework Assignment 2: Use Grafana to display load of pods

screenshots are attached
