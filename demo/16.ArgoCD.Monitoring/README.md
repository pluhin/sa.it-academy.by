https://github.com/pluhin/argo-flux-34-26/tree/master


```bash
858  kubectl create namespace argocd
  859  wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  860  cd 14.K8s.WorkShop/
  861  ls
  862  cd ../15.K8s.FluxCD.ArgoCD/
  863  git branch
  864  ls
  865  mkdir argo-core
  866  cd argo-core/
  867  mv ~/install.yaml .
  868  ls
  869  vim install.yaml
  870  kubectl apply -n argocd --server-side --force-conflicts -f install.yaml
  871  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  872  cd ../
  873  ld
  874  ls
  875  mkdir apps
  876  cp ../12.k8s/app.yaml ./apps/
  877  vim apps/app.yaml
  878  git add --all
  879  git commit -m "Add first app for argocd"
  880  git push
  881  mkdir argo-apps/app.yaml
  882  mkdir argo-apps/
  883  vim argo-apps/app.yaml
  884  git add --all
  885  git commit -m "Add application"
  886  git push
  887  vim argo-apps/helm-app.yaml
  888  git add --all
  889  git commit -m "Add helm-app"
  890  git push
  891  mkdir monitoring
  892  vim monitoring/ksm.yaml
  893  vim monitoring/node-exporter.yaml
  894  vim monitoring/_ns.yaml
  895  vim monitoring/prometheus.yaml
  896  vim flux/flux-system/gotk-sync.yaml
  897  git add --all
  898  git commit -m "Add monitoring"
  899  git push
  900  history | flux
  901  history | grep flux
  902  flux reconcile ks flux-monitoring -n flux-system --with-source
  903  flux reconcile ks flux-system -n flux-system --with-source
  904  vim flux/flux-system/gotk-sync.yaml
  905  vim monitoring/grafana-istio.yaml
  906  git add --all
  907  git commit -m "Add grafana"
  908  git push
  909  history
```

## Changes in ArgoCD install

- https://github.com/pluhin/argo-flux-34-26/blob/master/argo-core/install.yaml#L31472
- https://github.com/pluhin/argo-flux-34-26/blob/master/argo-core/install.yaml#L31478
- https://github.com/pluhin/argo-flux-34-26/blob/master/argo-core/install.yaml#L32474

## Prometheus

test filter examples: https://samber.github.io/awesome-prometheus-alerts/rules.html

```
rate(container_cpu_usage_seconds_total{pod=~"jenk.*"}[1m])
container_memory_working_set_bytes{container="jenkins"}
```

## Grafana dashboard

### Pods per nodes
Add variable to dashboard settings (DASHBOARD_Settings):

- Name: <variable_name>
- Label: <Dispalay_name>
- Data source: Prometheus
- Query:`label_values(node)`

Graph for cont of pods per node

- Metrics: `sum(kube_pod_info{node=~"$node",job="kube-state-metrics"}) by (node)`
- Legend: `{{node}}`6### Containers restart
- Metrics: `sum(kube_pod_container_status_restarts_total{job="kube-state-metrics"}) by (pod)`
- Legend: `{{pod}}`
