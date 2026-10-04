```
1.
jenkins-chart/
├── Chart.yaml             # Паспорт чарта
├── values.yaml            # Все переменные и настройки
└── templates/             # Папка с шаблонами Kubernetes
    ├── namespace.yaml
    ├── rbac.yaml
    ├── volume.yaml
    ├── secrets-config.yaml
    ├── deployment.yaml
    ├── service.yaml
    └── istio-networking.yaml

2. 
    helm lint .
        ==> Linting .
            [INFO] Chart.yaml: icon is recommended

            1 chart(s) linted, 0 chart(s) failed

3.
    helm package .
        Successfully packaged chart and saved it to: /Users/user/Documents/DevOps_learning/15.Kuberbnetes.Jenkins/Kuberbnetes.Jenkins/15.-Kubernetes.Jenkins/jenkins-chart-0.1.0.tgz
        
4.        
    helm template jenkins-release . --namespace ci-cd
    
5.
    helm install jenkins . --namespace ci-cd
        Error: INSTALLATION FAILED: unable to continue with install: Namespace "ci-cd" in namespace "" exists and cannot \
        be imported into the current release: invalid ownership metadata; label validation error: missing key \
        "app.kubernetes.io/managed-by": must be set to "Helm"; annotation validation error: missing key \
        "meta.helm.sh/release-name": must be set to "jenkins"; annotation validation error: missing key \
        "meta.helm.sh/release-namespace": must be set to "ci-cd"
```
        
        

