# Deploy Grafana Loki

Use Argo CD

## Deploy loki

- Add "https://grafana.github.io/helm-charts" to list of helm repositories
- Create application loki-helm with default parameters

Need to add to the deployed Grafana one more data sources or on grafana webui

```
            {
               "access":"proxy",
                "editable": true,
                "name": "loki-helm",
                "orgId": 1,
                "type": "loki",
                "url": "http://loki-helm.monitoring.svc:3100",
                "version": 1
            }
```

## Log query examples

Show only error level messages:

```
{pod="ingress-nginx-controller-f9d6fc8d8-xbmjr"} |= "error"
```

Count all error messages for last 5 days

```
count_over_time({pod="ingress-nginx-controller-f9d6fc8d8-xbmjr"}[5d] |= "error")
```