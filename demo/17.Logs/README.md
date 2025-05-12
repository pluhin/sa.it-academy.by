# Logs

```bash
 812  cd 15.K8s.FluxCD.ArgoCD/
  813  vim monitoring/loki.yaml
  814  vim flux/flux-system/gotk-sync.yaml
  815  vim monitoring/loki.yaml
  816  git add --all
  817  git commit -m "Add loki"
  818  git push
  819  history | flux
  820  history | grep flux
  821  flux reconcile kustomization monitoring --with-source
  822  helm install my-release oci://registry-1.docker.io/bitnamicharts/elasticsearch   --set global.defaultStorageClass=nfs-client,master.persistence.storageClass=nfs-client,data.persistence.storageClass=nfs-client,ingress.enabled=true,ingress.hostname=elk.k8s-25.sa,ingress.ingressClassName=nginx,global.kibanaEnabled=true,kibana.ingress.enabled=true,kibana.ingress.hostname=kibana.k8s-25.sa,kibana.ingress.ingressClassName=nginx
  823  helm uninstall my-release
  824  history
```

## ELK Helm release

```yaml
---
apiVersion: source.toolkit.fluxcd.io/v1beta2
kind: HelmRepository
metadata:
  name: bitnami-charts-oci
  namespace: flux-system
spec:
  type: oci
  interval: 1h
  url: oci://registry-1.docker.io/bitnamicharts
---
apiVersion: helm.toolkit.fluxcd.io/v2beta2
kind: HelmRelease
metadata:
  name: elasticsearch
  namespace: elasticsearch
spec:
  interval: 15m
  timeout: 10m
  chart:
    spec:
      chart: elasticsearch
      sourceRef:
        kind: HelmRepository
        name: bitnami-charts-oci
        namespace: flux-system
  values:
    global:
      defaultStorageClass: nfs-client
      kibanaEnabled: true
    master:
      persistence:
        storageClass: nfs-client
    data:
      persistence:
        storageClass: nfs-client
    ingress:
      enabled: true
      hostname: elk.k8s-25.sa
      ingressClassName: nginx
    kibana:
      ingress:
        enabled: true
        hostname: kibana.k8s-25.sa
        ingressClassName: nginx


```