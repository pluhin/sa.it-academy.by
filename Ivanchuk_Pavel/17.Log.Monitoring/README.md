# 17. Log monitoring

## Deployed Grafana loki inside my cluster

![Deploy loki](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/2d209085-97ba-4b04-b0fd-0218c6cf44da)
**changes in prometheus.yaml:**
```yaml
...
      - job_name: 'kubernetes-service-endpoints'
        kubernetes_sd_configs:
        - role: endpoints
        relabel_configs:
        - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_scrape]
          action: keep
          regex: true
        - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_scheme]
          action: replace
          target_label: __scheme__
          regex: (https?)
        - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_path]
          action: replace
          target_label: __metrics_path__
          regex: (.+)
        - source_labels: [__address__, __meta_kubernetes_service_annotation_prometheus_io_port]
          action: replace
          target_label: __address__
          regex: ([^:]+)(?::\d+)?;(\d+)
          replacement: $1:$2
        - action: labelmap
          regex: __meta_kubernetes_service_label_(.+)
        - source_labels: [__meta_kubernetes_namespace]
          action: replace
          target_label: kubernetes_namespace
        - source_labels: [__meta_kubernetes_service_name]
          action: replace
          target_label: kubernetes_name
      - job_name: 'loki'  #Add this endpoint for sure
        static_configs:
        - targets: ['loki.monitoring.svc:3100']
        metric_relabel_configs:
        - source_labels: [__name__]
          regex: 'loki_http_requests_total|loki_http_requests_duration_seconds.*'
          action: keep
---
apiVersion: apps/v1
kind: Deployment
...
```

**changes in grafana.yaml:**
```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: grafana-datasources
  namespace: monitoring
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
            },
            {
                "access":"proxy",  #Add this datasource for grafana 
                "editable": true,
                "name": "loki-helm",
                "orgId": 1,
                "type": "loki",
                "url": "http://loki.monitoring.svc:3100",
                "version": 1
           }
        ]
    }
---

```

**changes in grafana-loki-app.yaml in my github repo:**
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: loki
  namespace: argocd
spec:
  project: default
  source:
    repoURL: 'https://grafana.github.io/helm-charts'
    targetRevision: 2.9.11
    chart: loki-stack
    helm:
      parameters:
        - name: grafana.enabled
          value: 'false'
        - name: loki.queryScheduler.maxOutstandingRequestsPerTenant #add this parametrs because after 30m I was hetting this error: Status: 500. Message: too many outstanding requests
          value: '10000'
        - name: loki.limitsConfig.retentionPeriod
          value: '720h'
  destination:
    server: 'https://kubernetes.default.svc'
    namespace: monitoring
  syncPolicy:
    automated: {}
    syncOptions:
    - Validate=false
```

**changes in live-manifest in argocd:**
```yaml
apiVersion: v1
kind: Pod
metadata:
  annotations:
    checksum/config: 8543d68a9795066423a4ce0ff28f2c56950acfa1bac20e850c016a4fd91a9300
    prometheus.io/port: '3100'   #Changed 'http-metric' on '3100' because prometheus was getting errors about not seeing the endpoints of Loki's metrics
    prometheus.io/scrape: 'true'
  creationTimestamp: '2023-11-24T07:14:00Z'
  generateName: loki-
  labels:
    app: loki
    controller-revision-hash: loki-87bb78676
    name: loki
    release: loki
    statefulset.kubernetes.io/pod-name: loki-0
...
```

## Created Grafana dashboard 

### 5min

![Loki-5m](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/b5499067-e0d1-4ffa-8649-f16336345534)

### 1 hour

![Loki-1h](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/819f2258-6427-4240-b8d8-b4901f3e3878)

### 1 day 

![Loki-24h](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/5099c57b-48b5-4766-9f14-f98e0578cebd)

### Dashboard.json
```json
{
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "grafana",
          "uid": "-- Grafana --"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 0,
  "id": 4,
  "links": [],
  "liveNow": true,
  "panels": [
    {
      "datasource": {
        "type": "loki",
        "uid": "PB8B74E0083A7FCB5"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 10,
        "w": 12,
        "x": 0,
        "y": 0
      },
      "id": 6,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "10.2.2",
      "targets": [
        {
          "datasource": {
            "type": "loki",
            "uid": "PB8B74E0083A7FCB5"
          },
          "editorMode": "builder",
          "expr": "count_over_time({pod=\"loki-0\"} |= `error` [$__auto])",
          "queryType": "range",
          "refId": "A"
        }
      ],
      "title": "argocd",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "loki",
        "uid": "PB8B74E0083A7FCB5"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 10,
        "w": 12,
        "x": 12,
        "y": 0
      },
      "id": 1,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "10.2.2",
      "targets": [
        {
          "datasource": {
            "type": "loki",
            "uid": "PB8B74E0083A7FCB5"
          },
          "editorMode": "builder",
          "expr": "count_over_time({pod=\"ingress-nginx-controller-fbd5665c9-mgqh2\"} |= `error` [$__auto])",
          "queryType": "range",
          "refId": "A",
          "step": ""
        }
      ],
      "title": "Ingress",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "loki",
        "uid": "PB8B74E0083A7FCB5"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 12,
        "x": 0,
        "y": 10
      },
      "id": 5,
      "maxDataPoints": 1000,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "10.2.2",
      "targets": [
        {
          "datasource": {
            "type": "loki",
            "uid": "PB8B74E0083A7FCB5"
          },
          "editorMode": "builder",
          "expr": "count_over_time({pod=\"node-exporter-5vwz2\"} |= `error` [$__auto])",
          "queryType": "range",
          "refId": "A"
        }
      ],
      "title": "Node-exporter",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "loki",
        "uid": "PB8B74E0083A7FCB5"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 12,
        "x": 12,
        "y": 10
      },
      "id": 4,
      "maxDataPoints": 1000,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "10.2.2",
      "targets": [
        {
          "datasource": {
            "type": "loki",
            "uid": "PB8B74E0083A7FCB5"
          },
          "editorMode": "builder",
          "expr": "count_over_time({pod=\"sa-wordpress-9786d5955-txjqx\"} |= `error` [$__auto])",
          "queryType": "range",
          "refId": "A"
        }
      ],
      "title": "Wordpress",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "loki",
        "uid": "PB8B74E0083A7FCB5"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 12,
        "x": 0,
        "y": 14
      },
      "id": 2,
      "maxDataPoints": 1000,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "10.2.2",
      "targets": [
        {
          "datasource": {
            "type": "loki",
            "uid": "PB8B74E0083A7FCB5"
          },
          "editorMode": "builder",
          "expr": "count_over_time({pod=\"my-helm-jenkins-66c6c9cf68-ztw65\"} |= `error` [$__auto])",
          "queryType": "range",
          "refId": "A"
        }
      ],
      "title": "my helm jenkins",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "loki",
        "uid": "PB8B74E0083A7FCB5"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 12,
        "x": 12,
        "y": 14
      },
      "id": 3,
      "maxDataPoints": 1000,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "10.2.2",
      "targets": [
        {
          "datasource": {
            "type": "loki",
            "uid": "PB8B74E0083A7FCB5"
          },
          "editorMode": "builder",
          "expr": "count_over_time({pod=\"sa-drupal-85d9c4d94d-wl52f\"} |= `error` [$__auto])",
          "queryType": "range",
          "refId": "A"
        }
      ],
      "title": "Drupal",
      "type": "stat"
    }
  ],
  "refresh": "",
  "schemaVersion": 38,
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-24h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "My-Grafana-Loki",
  "uid": "f438196b-5012-4b51-9c18-80027e20d8f9",
  "version": 11,
  "weekStart": ""
}
```
