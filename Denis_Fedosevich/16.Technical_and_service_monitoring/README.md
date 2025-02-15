# 16. Technical and service monitoring
## Homework Assignment 1: Deploy and setup Prometheus Alertmanage

**Deploy Monitoring System Using ArgoCD**
```shell
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: monotoring
  namespace: argocd
spec:
  destination:
    server: https://kubernetes.default.svc
  source:
    path: monitoring
    repoURL: https://github.com/fedos1993/argo-cd
    targetRevision: HEAD
    directory:
      recurse: true
  project: default
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
```

**Add Alert for CPU Overload per Pods**
```shell
groups:
    - name: pod_alerts
      rules:
      - alert: High CPU Usage
        expr: sum by (pod, namespace) (rate(container_cpu_usage_seconds_total{container!="", pod!=""}[2m])) > 0.7
        for: 1m
        labels:
          severity: "critical"
        annotations:
          summary: "High CPU usage detected in pod {{ $labels.pod }}"
          description: "Pod {{ $labels.pod }} in namespace {{ $labels.namespace }} is using high CPU for more than 1 minute."
          details: "CPU usage: {{ $value }} for pod {{ $labels.pod }} in namespace {{ $labels.namespace }}"
```

**Setup Slack Notification for Alertmanager**
```shell
    global:
      resolve_timeout: 5m
    route:
      receiver: "slack"
      group_wait: 30s
      group_interval: 5m
      repeat_interval: 1h
    receivers:
      - name: "slack"
        slack_configs:
          - send_resolved: true
            channel: "U084W6B1ZPC"
            username: "Alertmanager"
            icon_emoji: ":warning:"
            api_url: "xxxxxxxxxxxxxxxxx"
            text: |
              *Summary*: {{ .CommonAnnotations.summary }}
              *Description*: {{ .CommonAnnotations.description }}
              *Details*: {{ .CommonAnnotations.details }}
```

**Using Sealed Secret for Encryption**
```shell
cat secret-alertmanager.yaml | kubeseal --format yaml > sealed-alertmanager.yaml
```

**Argo-CD monitoring dashboard**

![monitoring in argo-cd](.images/argo-cd-monitoring)

**Web UI Prometheus**

![alerts in prometheus](.images/prometheus)

**Receive Alert Notification in Slack After Load Simulation**

![slack-notification](.images/slack-notification)


## Homework Assignment 2: Use Grafana to Display Load of Pods

**Create Dashboard with CPU and Memory Graphs per Pods**

**CPU Usage per POD**

![pod cpu usage](.images/pod_cpu)

**Memory Usage per POD**

![pod memory usage](.images/pod_memory)
