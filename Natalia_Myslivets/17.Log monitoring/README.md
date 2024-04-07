# 17. Log monitoring


## Json of 2 dashboards:


### 1-st graph

```json

{
  "datasource": {
    "uid": "bdhf1cgj5t88we",
    "type": "loki"
  },
  "fieldConfig": {
    "defaults": {
      "custom": {
        "drawStyle": "line",
        "lineInterpolation": "linear",
        "barAlignment": 0,
        "lineWidth": 1,
        "fillOpacity": 0,
        "gradientMode": "none",
        "spanNulls": false,
        "insertNulls": false,
        "showPoints": "auto",
        "pointSize": 5,
        "stacking": {
          "mode": "none",
          "group": "A"
        },
        "axisPlacement": "auto",
        "axisLabel": "",
        "axisColorMode": "text",
        "axisBorderShow": false,
        "scaleDistribution": {
          "type": "linear"
        },
        "axisCenteredZero": false,
        "hideFrom": {
          "tooltip": false,
          "viz": false,
          "legend": false
        },
        "thresholdsStyle": {
          "mode": "off"
        }
      },
      "color": {
        "mode": "palette-classic"
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
  "id": 2,
  "options": {
    "tooltip": {
      "mode": "single",
      "sort": "none"
    },
    "legend": {
      "showLegend": false,
      "displayMode": "hidden",
      "placement": "right",
      "calcs": []
    }
  },
  "targets": [
    {
      "datasource": {
        "type": "loki",
        "uid": "bdhf1cgj5t88we"
      },
      "editorMode": "code",
      "expr": "count_over_time({node_name=\"node1\"} [$Time] |= `error`)",
      "queryType": "range",
      "refId": "A"
    }
  ],
  "title": "Node1 errors",
  "type": "timeseries"
}

```

### 2 graph

```json
{
  "datasource": {
    "uid": "bdhf1cgj5t88we",
    "type": "loki"
  },
  "fieldConfig": {
    "defaults": {
      "custom": {
        "lineWidth": 1,
        "fillOpacity": 80,
        "gradientMode": "none",
        "hideFrom": {
          "tooltip": false,
          "viz": false,
          "legend": false
        }
      },
      "color": {
        "mode": "palette-classic"
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
      },
      "unit": "short"
    },
    "overrides": []
  },
  "gridPos": {
    "h": 8,
    "w": 12,
    "x": 0,
    "y": 8
  },
  "id": 1,
  "options": {
    "legend": {
      "showLegend": true,
      "displayMode": "list",
      "placement": "bottom",
      "calcs": []
    }
  },
  "pluginVersion": "10.4.1",
  "targets": [
    {
      "datasource": {
        "type": "loki",
        "uid": "bdhf1cgj5t88we"
      },
      "editorMode": "code",
      "expr": "count_over_time({pod=~\"argocd-notifications-controller-5f6c747849-p726c|argocd-repo-server-58c78bd74f-gbr4z|my-jenkins-2-77c789f5b4-tsx55|my-wordpress-5bb4864bdd-sn67q|prometheus-deployment-556fbcc476-gpw4m|loki-0\"} [$Time]|= \"error\")",
      "legendFormat": "",
      "queryType": "range",
      "refId": "A",
      "step": ""
    }
  ],
  "title": "Argocd, wordpress and loki errors(1d)",
  "type": "histogram"
}
```

## for inatalling graphana and loki use yaml files from: 

[GitHub link](https://github.com/NataliaBelogolovaya/monitoring.git)

## dashbord:

![dashbord](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/17.Log%20monitoring/dashboard.png)