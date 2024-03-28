# 17. Log monitoring
## Create Grafana dashboard to monitor counts errors for the following application inside your cluster
![grafana-dashboard-loki](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-25%20%D0%B2%2021.46.34.png?raw=true)

![loki](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-25%20%D0%B2%2021.51.02.png?raw=true)
## loki application 
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: loki
  namespace: argocd
spec:
  destination:
    namespace: monitoring
    server: https://kubernetes.default.svc
  project: default
  source:
    chart: loki-stack
    helm:
      parameters:
        - name: grafana.enabled
          value: 'false'
        - name: loki.queryScheduler.maxOutstandingRequestsPerTenant 
          value: '10000'
        - name: loki.limitsConfig.retentionPeriod
          value: '720h'
    repoURL: https://grafana.github.io/helm-charts
    targetRevision: 2.10.2
  syncPolicy:
    automated: {}
    syncOptions:
    - Validate=false
```