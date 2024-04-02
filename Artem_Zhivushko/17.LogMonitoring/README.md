# Log monitoring

## Export JSON dashboard

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
  "id": 7,
  "links": [],
  "panels": [
    {
      "datasource": {
        "type": "loki",
        "uid": "cdg4slkf561vkc"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
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
        "h": 14,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 1,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "single",
          "sort": "none"
        }
      },
      "targets": [
        {
          "datasource": {
            "type": "loki",
            "uid": "cdg4slkf561vkc"
          },
          "editorMode": "code",
          "expr": "sum(count_over_time({pod=\"jenkins-84ddf6796f-mvjcs\"} [$time] |= \"error\")) by (pod)",
          "legendFormat": "{{time}}",
          "queryType": "range",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "loki",
            "uid": "cdg4slkf561vkc"
          },
          "editorMode": "code",
          "expr": "sum(count_over_time({pod=\"ingress-nginx-controller-5458dd5f6-9p8vw\"} [$time] |= \"error\")) by (pod)",
          "hide": false,
          "queryType": "range",
          "refId": "B"
        },
        {
          "datasource": {
            "type": "loki",
            "uid": "cdg4slkf561vkc"
          },
          "editorMode": "code",
          "expr": "sum(count_over_time({namespace=\"monitoring\",component=\"exporter\"} [$time] |= \"error\")) by (pod)",
          "hide": false,
          "queryType": "range",
          "refId": "C"
        },
        {
          "datasource": {
            "type": "loki",
            "uid": "cdg4slkf561vkc"
          },
          "editorMode": "code",
          "expr": "sum(count_over_time({namespace=\"drupal-argo\"} [$time] |= \"error\")) by (pod)",
          "hide": false,
          "queryType": "range",
          "refId": "D"
        },
        {
          "datasource": {
            "type": "loki",
            "uid": "cdg4slkf561vkc"
          },
          "editorMode": "code",
          "expr": "sum(count_over_time({namespace=\"monitoring\",app=\"loki\"} [$time] |= \"error\")) by (pod)",
          "hide": false,
          "queryType": "range",
          "refId": "E"
        }
      ],
      "title": "Panel Title",
      "type": "timeseries"
    }
  ],
  "refresh": "5s",
  "schemaVersion": 39,
  "tags": [],
  "templating": {
    "list": [
      {
        "auto": false,
        "auto_count": 30,
        "auto_min": "10s",
        "current": {
          "selected": false,
          "text": "5m",
          "value": "5m"
        },
        "hide": 0,
        "label": "time",
        "name": "time",
        "options": [
          {
            "selected": true,
            "text": "5m",
            "value": "5m"
          },
          {
            "selected": false,
            "text": "1h",
            "value": "1h"
          },
          {
            "selected": false,
            "text": "1d",
            "value": "1d"
          }
        ],
        "query": "5m,1h,1d",
        "queryValue": "",
        "refresh": 2,
        "skipUrlSync": false,
        "type": "interval"
      }
    ]
  },
  "time": {
    "from": "now-12h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "browser",
  "title": "test loki",
  "uid": "adg5400in50cgf",
  "version": 11,
  "weekStart": ""
}
```

![Pasted image 20240319192516.png](../_attachments/Pasted%20image%2020240319192516.png)

## Queries

```
sum(count_over_time({pod="jenkins-84ddf6796f-mvjcs"} [$time] |= "error")) by (pod)
sum(count_over_time({pod="ingress-nginx-controller-5458dd5f6-9p8vw"} [$time] |= "error")) by (pod)
sum(count_over_time({namespace="monitoring",component="exporter"} [$time] |= "error")) by (pod)
sum(count_over_time({namespace="drupal-argo"} [$time] |= "error")) by (pod)
```
