# Homework report for 14.Kubernetes_application_deployment by Siarhei Kaliuha

---
Cluster `cluster.remote.k8s` deployed inside IT-ACADEMY environment.  


## Jenkins application deployment on k8s cluster during workshop finished. 
Application available from remote host at http://jenkins.k8s-21.sa/

![jenkins.k8s-21.sa](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/14.Kubernetes_application_deployment/jenkins.k8s-21.sa.jpg)


## Creating helm package for Jenkins.

Link of [Helm repository](https://github.com/s-kalyuga/jenkins-helm) for Jenkins


## Deploying ArgoCD.
Application available from remote host at http://argocd.k8s-21.sa/  

![argocd.k8s-21.sa.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/14.Kubernetes_application_deployment/argocd.k8s-21.sa.jpg)

![argocd.k8s-21.sa.repos.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/14.Kubernetes_application_deployment/argocd.k8s-21.sa.repos.jpg)

* Deploy Jenkins using Git repository manifest with ArgoCD:  
Application still available from remote host at http://jenkins.k8s-21.sa/

![argocd.jenkins.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/14.Kubernetes_application_deployment/argocd.jenkins.jpg)

* Deploy Jenkins using Helm repository with ArgoCD:  
Application available from remote host at http://jenkins-helm.k8s-21.sa/  

![jenkins-helm.k8s-21.sa.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/14.Kubernetes_application_deployment/jenkins-helm.k8s-21.sa.jpg)

![argocd.jenkins-helm.jpg](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/14.Kubernetes_application_deployment/argocd.jenkins-helm.jpg)

## ArgoCD helm application manifests:

```yaml
vagrant@vagrant-ubuntu-20:~/jenkins-helm$ kubectl get application -n argocd jenkins-helm -o yaml

apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  creationTimestamp: "2022-07-14T21:33:41Z"
  generation: 35
  name: jenkins-helm
  namespace: argocd
  resourceVersion: "7342143"
  uid: 5fae0c1c-4d44-48eb-a18f-17a7dd253896
spec:
  destination:
    namespace: jenkins-helm
    server: https://kubernetes.default.svc
  project: default
  source:
    chart: jenkins-helm
    repoURL: https://s-kalyuga.github.io/jenkins-helm/
    targetRevision: 0.2.0
  syncPolicy:
    automated: {}
status:
  health:
    status: Healthy
  history:
  - deployStartedAt: "2022-07-14T21:33:41Z"
    deployedAt: "2022-07-14T21:33:42Z"
    id: 0
    revision: 0.2.0
    source:
      chart: jenkins-helm
      repoURL: https://s-kalyuga.github.io/jenkins-helm/
      targetRevision: 0.2.0
  operationState:
    finishedAt: "2022-07-14T21:33:42Z"
    message: successfully synced (all tasks run)
    operation:
      initiatedBy:
        automated: true
      retry:
        limit: 5
      sync:
        revision: 0.2.0
    phase: Succeeded
    startedAt: "2022-07-14T21:33:41Z"
    syncResult:
      resources:
      - group: ""
        hookPhase: Running
        kind: Namespace
        message: namespace/jenkins-helm created
        name: jenkins-helm
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: ServiceAccount
        message: serviceaccount/jenkins-helm created
        name: jenkins-helm
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: Secret
        message: secret/jenkins-secret created
        name: jenkins-secret
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: ConfigMap
        message: configmap/basic-security created
        name: basic-security
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: ConfigMap
        message: configmap/jenkins-config created
        name: jenkins-config
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: rbac.authorization.k8s.io
        hookPhase: Running
        kind: ClusterRoleBinding
        message: "clusterrolebinding.rbac.authorization.k8s.io/jenkins-helm reconciled.
          reconciliation required create\n\tmissing subjects added:\n\t\t{Kind:ServiceAccount
          APIGroup: Name:default Namespace:jenkins-helm}. clusterrolebinding.rbac.authorization.k8s.io/jenkins-helm
          configured. Warning: resource clusterrolebindings/jenkins-helm is missing
          the kubectl.kubernetes.io/last-applied-configuration annotation which is
          required by  apply.  apply should only be used on resources created declaratively
          by either  create --save-config or  apply. The missing annotation will be
          patched automatically."
        name: jenkins-helm
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: Service
        message: service/jenkins-helm created
        name: jenkins-helm
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: apps
        hookPhase: Running
        kind: Deployment
        message: deployment.apps/jenkins-helm created
        name: jenkins-helm
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: networking.k8s.io
        hookPhase: Running
        kind: Ingress
        message: ingress.networking.k8s.io/ingress-jenkins-helm created
        name: ingress-jenkins-helm
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      revision: 0.2.0
      source:
        chart: jenkins-helm
        repoURL: https://s-kalyuga.github.io/jenkins-helm/
        targetRevision: 0.2.0
  reconciledAt: "2022-07-14T22:36:25Z"
  resources:
  - kind: ConfigMap
    name: basic-security
    namespace: jenkins-helm
    status: Synced
    version: v1
  - kind: ConfigMap
    name: jenkins-config
    namespace: jenkins-helm
    status: Synced
    version: v1
  - kind: Namespace
    name: jenkins-helm
    status: Synced
    version: v1
  - kind: Secret
    name: jenkins-secret
    namespace: jenkins-helm
    status: Synced
    version: v1
  - health:
      status: Healthy
    kind: Service
    name: jenkins-helm
    namespace: jenkins-helm
    status: Synced
    version: v1
  - kind: ServiceAccount
    name: jenkins-helm
    namespace: jenkins-helm
    status: Synced
    version: v1
  - group: apps
    health:
      status: Healthy
    kind: Deployment
    name: jenkins-helm
    namespace: jenkins-helm
    status: Synced
    version: v1
  - group: networking.k8s.io
    health:
      status: Healthy
    kind: Ingress
    name: ingress-jenkins-helm
    namespace: jenkins-helm
    status: Synced
    version: v1
  - group: rbac.authorization.k8s.io
    kind: ClusterRoleBinding
    name: jenkins-helm
    status: Synced
    version: v1
  sourceType: Helm
  summary:
    externalURLs:
    - http://jenkins-helm.k8s-21.sa/
    images:
    - skalyuga/jenkins-ci:skalyuga
  sync:
    comparedTo:
      destination:
        namespace: jenkins-helm
        server: https://kubernetes.default.svc
      source:
        chart: jenkins-helm
        repoURL: https://s-kalyuga.github.io/jenkins-helm/
        targetRevision: 0.2.0
    revision: 0.2.0
    status: Synced

```