## 14.K8s.App.Deployment
---
### GIT
[GitHub](https://github.com/alexfiz/jenkins_helm)
---
### Live manifest
``` yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  creationTimestamp: "2022-06-06T12:23:30Z"
  generation: 14
  name: jenkins-helm
  namespace: argocd
  resourceVersion: "2175636"
  uid: 42d055bb-cd85-4041-ab99-804e166aaa2f
spec:
  destination:
    namespace: jenkins-helm
    server: https://kubernetes.default.svc
  project: default
  source:
    chart: jenkins_helm_demo
    repoURL: https://alexfiz.github.io/jenkins_helm/
    targetRevision: 0.2.0
  syncPolicy:
    automated: {}
status:
  health:
    status: Healthy
  history:
  - deployStartedAt: "2022-06-06T12:23:30Z"
    deployedAt: "2022-06-06T12:23:31Z"
    id: 0
    revision: 0.2.0
    source:
      chart: jenkins_helm_demo
      repoURL: https://alexfiz.github.io/jenkins_helm/
      targetRevision: 0.2.0
  operationState:
    finishedAt: "2022-06-06T12:23:31Z"
    message: successfully synced (all tasks run)
    operation:
      initiatedBy:
        automated: true
      retry:
        limit: 5
      sync:
        revision: 0.2.0
    phase: Succeeded
    startedAt: "2022-06-06T12:23:30Z"
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
        kind: ConfigMap
        message: configmap/jenkins-config created
        name: jenkins-config
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
        chart: jenkins_helm_demo
        repoURL: https://alexfiz.github.io/jenkins_helm/
        targetRevision: 0.2.0
  reconciledAt: "2022-06-06T12:34:07Z"
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
  - health:
      status: Healthy
    kind: Service
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
    - http://jenkins.k8s-1.sa/
    images:
    - jfrog.it-academy.by/public/jenkins-ci:aaleksei
  sync:
    comparedTo:
      destination:
        namespace: jenkins-helm
        server: https://kubernetes.default.svc
      source:
        chart: jenkins_helm_demo
        repoURL: https://alexfiz.github.io/jenkins_helm/
        targetRevision: 0.2.0
    revision: 0.2.0
    status: Synced
```
### Screen
![ArgoCD](ArgoCD.png)
![jenkins](jenkins.png)
![k9s](k9s.png)
