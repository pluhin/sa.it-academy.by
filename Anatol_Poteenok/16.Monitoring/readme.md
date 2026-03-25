16. Technical and service monitoring
  
  Strukture of proj  ( continue prev HW)
  
```
tree
.
├── docs
│   ├── index.yaml
│   ├── jenkinsPoteenoka-0.1.0.tgz
│   ├── monitoring-stack-0.1.10.tgz
│   ├── monitoring-stack-0.1.1.tgz
│   ├── monitoring-stack-0.1.2.tgz
│   ├── monitoring-stack-0.1.3.tgz
│   ├── monitoring-stack-0.1.4.tgz
│   ├── monitoring-stack-0.1.5.tgz
│   ├── monitoring-stack-0.1.6.tgz
│   ├── monitoring-stack-0.1.7.tgz
│   ├── monitoring-stack-0.1.8.tgz
│   └── monitoring-stack-0.1.9.tgz
├── jenkinsPoteenoka
│   ├── charts
│   ├── Chart.yaml
│   ├── templates
│   │   ├── jenkins.yaml
│   │   ├── nfs-storageclass.yaml
│   │   └── tests
│   ├── values-secrets.yaml
│   └── values.yaml
└── monitoring-stack
    ├── Chart.lock
    ├── charts
    │   ├── grafana-8.5.1.tgz
    │   └── prometheus-25.30.0.tgz
    ├── Chart.yaml
    ├── templates
    │   ├── grafana-istio.yaml
    │   └── tests
    ├── tmpcharts-459021
    └── values.yaml

```

chart.yaml
``` yaml
apiVersion: v2
name: monitoring-stack
description: Prometheus + Grafana umbrella chart
type: application
version: 0.1.10
appVersion: "1.0.0"

dependencies:
  - name: prometheus
    version: "25.30.0"
    repository: "https://prometheus-community.github.io/helm-charts"
  - name: grafana
    version: "8.5.1"
    repository: "https://grafana.github.io/helm-charts"

```

grafana-istio.yaml
```
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: grafana-gateway
  namespace: {{ .Release.Namespace }}
spec:
  selector:
    istio: ingressgateway
  servers:
    - port:
        number: {{ .Values.gatewayPort }}
        name: http
        protocol: HTTP
      hosts:
        - grafana.k8s-{{ .Values.hostOctet }}.sa
---
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: grafana
  namespace: {{ .Release.Namespace }}
spec:
  hosts:
    - grafana.k8s-{{ .Values.hostOctet }}.sa
  gateways:
    - grafana-gateway
  http:
    - match:
        - uri:
            prefix: /
      route:
        - destination:
            host: {{ .Release.Name }}-grafana.{{ .Release.Namespace }}.svc.cluster.local
            port:
              number: 80

```

values.yaml
``` yaml
prometheus:
  server:
    persistentVolume:
      enabled: false
    service:
      type: ClusterIP

  # Правила алертов (подключаются дефолтным prometheus.yml → rule_files → alerting_rules.yml)  -- правило взято из дашборта скачанного с grafanaDashboars
  serverFiles:
    alerting_rules.yml:
      groups:
        - name: container-cpu
          rules:
            - alert: ContainerCPUUsageHigh
              expr: |
                (
                  sum by (namespace, pod, container) (
                    irate(container_cpu_usage_seconds_total{container!="", container!="POD", image!=""}[2m])
                  )
                  /
                  (
                    sum by (namespace, pod, container) (container_spec_cpu_quota{container!="", container!="POD"})
                    /
                    sum by (namespace, pod, container) (container_spec_cpu_period{container!="", container!="POD"})
                  )
                ) * 100 > 80
                and on (namespace, pod, container)
                sum by (namespace, pod, container) (container_spec_cpu_quota{container!="", container!="POD"}) > 0
              for: 5m
              labels:
                severity: warning
              annotations:
                summary: "CPU > 80% лимита (cgroup)"
                description: "{{ $labels.namespace }}/{{ $labels.pod }}/{{ $labels.container }} — использование CPU выше 80% от container limit (quota/period) в течение 5m."

  alertmanager:
    persistence:
      enabled: true
      storageClass: nfs-client
      size: 2Gi

    extraSecretMounts:
      - name: slack-webhook
        mountPath: /etc/alertmanager-slack-url
        subPath: url
        secretName: alertmanager-slack-webhook
        readOnly: true

    config:
      enabled: true
      global:
        slack_api_url_file: /etc/alertmanager-slack-url
      route:
        receiver: slack
        group_by: ["alertname", "namespace", "severity"]
        group_wait: 30s
        group_interval: 5m
        repeat_interval: 12h
      receivers:
        - name: slack
          slack_configs:
            - send_resolved: true
              channel: "#alerts"
              title: '[{{ .Status | toUpper }}] {{ .CommonLabels.alertname }}'
              text: >-
                {{ range .Alerts -}}
                *{{ .Labels.severity }}* {{ .Annotations.summary }}
                {{ .Annotations.description }}
                {{ end }}
      templates:
        - "/etc/alertmanager/*.tmpl"

grafana:
  adminUser: admin
  adminPassword: "***"
  persistence:
    enabled: false
  service:
    type: ClusterIP

hostOctet: 3
gatewayPort: 80
```





* Deploy Monitoring 

``` bash
helm dependency update monitoring-stack
helm package monitoring-stack -d docs
helm repo index docs --url https://poteenoka.github.io/14applicationdeployment/

git add .
git commit  -m "v 1.10"
git push
```

[ResultInArgoCD](argoMonitoringstack.png)

# Web Grafana
http://grafana.k8s-3.sa/d/bfgrs6ggd4hs0e/k8s-dashboard?orgId=1
[Grafanadashboard](grafana_kube_dashb.png)

  
 * test alertmanager notification
  
  
(in n.. revision )  
kubectl create secret generic alertmanager-slack-webhook   --from-literal=url='https://hooks.slack.com/services/eee/xxx'   -n monitoring    

(deploy rules in up)  
 
 
* Emulate CPU
 
 ``` sh
 kubectl exec -it jenkins-69bbcc4bf8-g499v -n ci-cd -- sh -c 'for i in $(seq 1 4); do (while true; do :; done) & done; wait'
 
 ```
 
 
 [Grap_of_hihLoad](promHighCPU.png)
 
 [slackNotification](slackNotify.png)