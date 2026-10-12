# 18. Monitoring

The whole stack is deployed by **Flux** from the GitOps repository we already
use since lesson 16:

**https://github.com/pluhin/argo-flux-36-26**

| Folder | Flux Kustomization | What is inside |
| --- | --- | --- |
| [`monitoring/`](https://github.com/pluhin/argo-flux-36-26/tree/master/monitoring) | `flux-monitoring` | kube-prometheus-stack, Loki, Promtail, metrics-server, dashboards, Istio routes |
| [`elk/`](https://github.com/pluhin/argo-flux-36-26/tree/master/elk) | `flux-elk` | Elasticsearch, Kibana, Filebeat |

Nothing is installed with `helm install` by hand. You change a file, push it,
Flux applies it.

## Deploy

The Kustomization objects live in `my-cluster/flux-system/gotk-sync.yaml`, one
per folder:

```yaml
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: flux-monitoring
  namespace: flux-system
spec:
  interval: 10m0s
  path: ./monitoring
  prune: true
  sourceRef:
    kind: GitRepository
    name: flux-system
```

Push a change and either wait for the interval or pull it now:

```bash
git add monitoring/ && git commit -m "monitoring: ..." && git push

flux reconcile source git flux-system
flux reconcile kustomization flux-monitoring
```

Check what Flux thinks:

```bash
kubectl -n flux-system get kustomization
kubectl get helmrelease -A
helm list -A
```

Two things that are easy to get wrong:

- **`targetNamespace` without `releaseName`.** Flux names the release
  `<targetNamespace>-<name>`, does not recognise an existing release and installs
  a second copy next to it. Either set `releaseName`, or put the HelmRelease
  directly into the target namespace.
- **A chart does not have to come from a HelmRepository.** `helm.elastic.co`
  returns `403` from the academy network, so ELK uses a `GitRepository` on
  `github.com/elastic/helm-charts` at tag `v8.5.1`, and the HelmRelease points at
  a path: `chart: ./elasticsearch`.

## Open the web UIs

Istio routes them by name — same scheme as Jenkins in lesson 15:

```text
browser → nginx on the bastion (*.k8s-N.sa) → NodePort 30001
        → istio-ingressgateway → VirtualService → Service
```

Add the names to your `/etc/hosts` (N is your node number):

```bash
echo "178.124.206.53  grafana.k8s-9.sa prometheus.k8s-9.sa kibana.k8s-9.sa" | sudo tee -a /etc/hosts
```

| What | URL | Login |
| --- | --- | --- |
| Grafana | http://grafana.k8s-9.sa | `admin` / `admin` |
| Prometheus | http://prometheus.k8s-9.sa | none |
| Prometheus targets | http://prometheus.k8s-9.sa/targets | |
| Kibana | http://kibana.k8s-9.sa | `elastic` / see below |
| Kibana Discover | http://kibana.k8s-9.sa/app/discover | data view `filebeat-*` |

Kibana password:

```bash
kubectl -n elk get secret elasticsearch-master-credentials \
  -o jsonpath='{.data.password}' | base64 -d; echo
```

Without Istio, fall back to port-forward:

```bash
kubectl -n monitoring port-forward svc/kps-grafana 3000:80
kubectl -n monitoring port-forward svc/kps-kube-prometheus-stack-prometheus 9090:9090
kubectl -n elk        port-forward svc/kibana-kibana 5601:5601
```

## PromQL — metrics

CPU per pod in a namespace. `rate()` over a counter gives cores per second:

```promql
sum(rate(container_cpu_usage_seconds_total{namespace="monitoring",container!=""}[5m])) by (pod)
```

Memory actually in use. `working_set` is what the OOM killer looks at, not
`usage_bytes`:

```promql
sum(container_memory_working_set_bytes{namespace="monitoring",container!=""}) by (pod)
```

How many pods sit on each node — comes from kube-state-metrics, not from the node:

```promql
sum(kube_pod_info) by (node)
```

Restarts per pod. A counter: look at the slope, not the absolute value:

```promql
sum(kube_pod_container_status_restarts_total) by (pod)
```

Node CPU utilisation, the classic "100 minus idle":

```promql
100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
```

## LogQL — logs in Loki

A stream selector is mandatory — Loki always starts from labels:

```logql
{namespace="monitoring"}
```

Add a text filter. `|=` is substring, `!=` excludes, `|~` is a regexp:

```logql
{namespace="monitoring"} |= "error"
{namespace="monitoring"} |= "error" != "debug"
```

Error rate as a metric, so it can go on a graph panel next to CPU:

```logql
sum(rate({namespace="monitoring"} |= "error" [5m]))
```

Which pod is the loudest:

```logql
topk(5, sum(rate({namespace="monitoring"}[5m])) by (pod))
```

Parse structured logs and filter by a field:

```logql
{namespace="monitoring"} | json | level="error"
```

## KQL — the same logs in Kibana

```text
kubernetes.namespace : "monitoring"
kubernetes.container.name : "loki" and message : *error*
not kubernetes.namespace : "kube-system"
kubernetes.labels.app_kubernetes_io/name : "grafana"
```

Dev Tools, for what Discover cannot do — who writes the most:

```json
GET filebeat-*/_search
{
  "size": 0,
  "aggs": {
    "by_ns": {
      "terms": { "field": "kubernetes.namespace", "size": 5 }
    }
  }
}
```

And the number that explains the price difference between Loki and ELK:

```text
GET _cat/indices?v
```

## The difference in one line

Loki indexes **labels**, Elasticsearch indexes **every field of every document**.
That single decision is why LogQL makes you pick a stream first, why KQL can
search any field of any age, and why the two cost what they cost.
