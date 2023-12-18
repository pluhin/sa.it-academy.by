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
  "id": 6,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "datasource": {
        "type": "loki",
        "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
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
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 0
      },
      "id": 4,
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
            "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
          },
          "editorMode": "code",
          "expr": "count_over_time({pod=\"argocd-repo-server-5b66d87f77-xwbc5\"}[5m] |= \"error\")",
          "queryType": "range",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "loki",
            "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
          },
          "editorMode": "code",
          "expr": "count_over_time({pod=\"argocd-repo-server-5b66d87f77-xwbc5\"}[1h] |= \"error\")",
          "hide": false,
          "queryType": "range",
          "refId": "B"
        },
        {
          "datasource": {
            "type": "loki",
            "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
          },
          "editorMode": "code",
          "expr": "count_over_time({pod=\"argocd-repo-server-5b66d87f77-xwbc5\"}[1d] |= \"error\")",
          "hide": false,
          "queryType": "range",
          "refId": "C"
        }
      ],
      "title": "Argo CD",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "loki",
        "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
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
        "h": 8,
        "w": 12,
        "x": 12,
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
            "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
          },
          "editorMode": "code",
          "expr": "count_over_time({pod=\"loki-0\"}[5m] |= \"error\")",
          "queryType": "range",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "loki",
            "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
          },
          "editorMode": "code",
          "expr": "count_over_time({pod=\"loki-0\"}[1h] |= \"error\")",
          "hide": false,
          "queryType": "range",
          "refId": "B"
        },
        {
          "datasource": {
            "type": "loki",
            "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
          },
          "editorMode": "code",
          "expr": "count_over_time({pod=\"loki-0\"}[1d] |= \"error\")",
          "hide": false,
          "queryType": "range",
          "refId": "C"
        }
      ],
      "title": "Loki",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "loki",
        "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
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
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 8
      },
      "id": 3,
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
            "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
          },
          "editorMode": "code",
          "expr": "count_over_time({pod=\"ingress-nginx-controller-fbd5665c9-rfkjj\"}[5m] |= \"error\")",
          "queryType": "range",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "loki",
            "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
          },
          "editorMode": "code",
          "expr": "count_over_time({pod=\"ingress-nginx-controller-fbd5665c9-rfkjj\"}[1h] |= \"error\")",
          "hide": false,
          "queryType": "range",
          "refId": "B"
        },
        {
          "datasource": {
            "type": "loki",
            "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
          },
          "editorMode": "code",
          "expr": "count_over_time({pod=\"ingress-nginx-controller-fbd5665c9-rfkjj\"}[1d] |= \"error\")",
          "hide": false,
          "queryType": "range",
          "refId": "C"
        }
      ],
      "title": "Ingress",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "loki",
        "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
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
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 8
      },
      "id": 2,
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
            "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
          },
          "editorMode": "code",
          "expr": "count_over_time({pod=\"jekajenkins-558d58c7f5-jnrk9\"}[5m] |= \"error\")",
          "queryType": "range",
          "refId": "A"
        },
        {
          "datasource": {
            "type": "loki",
            "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
          },
          "editorMode": "code",
          "expr": "count_over_time({pod=\"jekajenkins-558d58c7f5-jnrk9\"}[1h] |= \"error\")",
          "hide": false,
          "queryType": "range",
          "refId": "B"
        },
        {
          "datasource": {
            "type": "loki",
            "uid": "c9ae154b-2929-4bc1-8e9c-6f448ed70f3e"
          },
          "editorMode": "code",
          "expr": "count_over_time({pod=\"jekajenkins-558d58c7f5-jnrk9\"}[1d] |= \"error\")",
          "hide": false,
          "queryType": "range",
          "refId": "C"
        }
      ],
      "title": "Jenkins",
      "type": "timeseries"
    }
  ],
  "refresh": "",
  "schemaVersion": 38,
  "tags": [],
  "templating": {
    "list": [
      {
        "current": {
          "selected": true,
          "text": "5m",
          "value": "5m"
        },
        "hide": 0,
        "includeAll": false,
        "label": "list",
        "multi": false,
        "name": "list",
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
        "query": "5m, 1h, 1d",
        "queryValue": "",
        "skipUrlSync": false,
        "type": "custom"
      }
    ]
  },
  "time": {
    "from": "now-6h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "hw17",
  "uid": "ded67d98-4261-4752-831c-ca2c966f1880",
  "version": 2,
  "weekStart": ""
}
```