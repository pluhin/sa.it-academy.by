# Deployment and verification commands

## Create encrypted secrets

The Slack URL is supplied only through a local environment variable:

```bash
kubectl create secret generic alertmanager-slack-webhook \
  --namespace monitoring \
  --from-literal=url="$SLACK_WEBHOOK_URL" \
  --dry-run=client -o yaml | \
  kubeseal \
    --controller-name sealed-secrets-controller \
    --controller-namespace kube-system \
    --format yaml > manifests/31-alertmanager-slack-sealedsecret.yaml

GRAFANA_PASS=$(openssl rand -hex 16)
kubectl create secret generic grafana-admin \
  --namespace monitoring \
  --from-literal=admin-user=admin \
  --from-literal=admin-password="$GRAFANA_PASS" \
  --dry-run=client -o yaml | \
  kubeseal \
    --controller-name sealed-secrets-controller \
    --controller-namespace kube-system \
    --format yaml > manifests/32-grafana-admin-sealedsecret.yaml
unset GRAFANA_PASS SLACK_WEBHOOK_URL
```

## GitOps deployment

The manifests are pushed to the public GitOps repository. Argo CD then creates
the `monitoring` Application and deploys the Helm chart.

```bash
git add manifests
git commit -m "Add Prometheus Alertmanager and Grafana monitoring"
git push origin main

kubectl annotate application homework-15-root \
  --namespace argocd \
  argocd.argoproj.io/refresh=hard --overwrite
```

## Verify Argo CD and Kubernetes resources

```bash
kubectl get applications --namespace argocd
kubectl get pods,svc,sealedsecret,prometheusrule --namespace monitoring
kubectl get gateway,virtualservice --namespace monitoring
```

Expected application state:

```text
monitoring   Synced   Healthy   87.15.2
```

## Verify the CPU alert

```bash
curl --get \
  --data-urlencode 'query=sum by (namespace,pod) (rate(container_cpu_usage_seconds_total{container!="",image!=""}[1m]))' \
  http://prometheus.k8s-3.sa/api/v1/query

curl 'http://prometheus.k8s-3.sa/api/v1/rules?type=alert'
```

The Alertmanager delivery counters are queried from Prometheus:

```promql
alertmanager_notifications_total{integration="slack"}
alertmanager_notifications_failed_total{integration="slack"}
```

## Verify Grafana dashboard

```bash
GRAFANA_PASS=$(kubectl get secret grafana-admin \
  --namespace monitoring \
  -o jsonpath='{.data.admin-password}' | base64 --decode)

curl --user "admin:$GRAFANA_PASS" \
  'http://grafana.k8s-3.sa/api/search?query=Kubernetes%20Pod%20CPU%20and%20Memory'

unset GRAFANA_PASS
```
