kubectl apply -n argocd --server-side --force-conflicts -f /home/user/15.KubernetesCICD/poteenokaargocd/argo-core/install.yaml

echo 178.124.206.53 argocd.k8s-4.sa argocd.k8s-3.sa > /etc/hosts

* project
``` bash
~/14.HelmPoteenoka/HelmJenkinsPoteenoka$ tree
.
├── docs
│   ├── index.yaml
│   ├── jenkinsPoteenoka-0.1.0.tgz
│   ├── monitoring-stack-0.1.1.tgz
│   ├── monitoring-stack-0.1.2.tgz
│   ├── monitoring-stack-0.1.3.tgz
│   ├── monitoring-stack-0.1.4.tgz
│   ├── monitoring-stack-0.1.5.tgz
│   ├── monitoring-stack-0.1.6.tgz
│   ├── monitoring-stack-0.1.7.tgz
│   └── monitoring-stack-0.1.8.tgz
├── jenkinsPoteenoka
│   ├── charts
│   ├── Chart.yaml
│   ├── templates
│   │   ├── jenkins.yaml
│   │   ├── nfs-storageclass.yaml
│   │   └── tests
│   ├── values-secrets.yaml
│   └── values.yaml
└── monitoring-stack
    ├── Chart.lock
    ├── charts
    │   ├── grafana-8.5.1.tgz
    │   └── prometheus-25.30.0.tgz
    ├── Chart.yaml
    ├── templates
    │   ├── grafana-istio.yaml
    │   └── tests
    ├── tmpcharts-459021
    └── values.yaml

```

  
* in argocd - add new app with repo thrue web  (https://github.com/poteenoka/14applicationdeployment.git)
http://argocd.k8s-4.sa/applications/argocd/monitoring-stack?view=tree&resource=



```
 helm dependency update monitoring-stack
 1792  helm package monitoring-stack -d docs
 1793  helm repo index docs --url https://poteenoka.github.io/14applicationdeployment/
```

* result 


[Runned helm cahrt from ](runnedHelm_from_github.png)
