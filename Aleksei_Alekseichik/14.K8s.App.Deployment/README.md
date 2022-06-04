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
  creationTimestamp: "2022-06-04T09:43:56Z"
  generation: 31
  name: jen
  namespace: argocd
  resourceVersion: "1781344"
  uid: e4aeae96-2634-4d21-8090-dfbb38dfb45e
spec:
  destination:
    namespace: jenkins-helm
    server: https://kubernetes.default.svc
  project: default
  source:
    chart: jenkins_helm_demo
    repoURL: https://alexfiz.github.io/jenkins_helm/
    targetRevision: 0.1.0
  syncPolicy:
    automated: {}
status:
  conditions:
  - lastTransitionTime: "2022-06-04T09:49:06Z"
    message: 'Failed sync attempt to 0.1.0: one or more objects failed to apply, reason:
      ServiceAccount "jen-jenkins_helm_demo" is invalid: metadata.name: Invalid value:
      "jen-jenkins_helm_demo": a lowercase RFC 1123 subdomain must consist of lower
      case alphanumeric characters, ''-'' or ''.'', and must start and end with an
      alphanumeric character (e.g. ''example.com'', regex used for validation is ''[a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*'')
      (retried 5 times).'
    type: SyncError
  health:
    status: Healthy
  operationState:
    finishedAt: "2022-06-04T09:49:06Z"
    message: 'one or more objects failed to apply, reason: ServiceAccount "jen-jenkins_helm_demo"
      is invalid: metadata.name: Invalid value: "jen-jenkins_helm_demo": a lowercase
      RFC 1123 subdomain must consist of lower case alphanumeric characters, ''-''
      or ''.'', and must start and end with an alphanumeric character (e.g. ''example.com'',
      regex used for validation is ''[a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*'')
      (retried 5 times).'
    operation:
      initiatedBy:
        automated: true
      retry:
        limit: 5
      sync:
        revision: 0.1.0
    phase: Failed
    retryCount: 5
    startedAt: "2022-06-04T09:43:56Z"
    syncResult:
      resources:
      - group: ""
        hookPhase: Running
        kind: Namespace
        message: namespace/jenkins-helm unchanged
        name: jenkins-helm
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Failed
        kind: ServiceAccount
        message: 'ServiceAccount "jen-jenkins_helm_demo" is invalid: metadata.name:
          Invalid value: "jen-jenkins_helm_demo": a lowercase RFC 1123 subdomain must
          consist of lower case alphanumeric characters, ''-'' or ''.'', and must
          start and end with an alphanumeric character (e.g. ''example.com'', regex
          used for validation is ''[a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*'')'
        name: jen-jenkins_helm_demo
        namespace: jenkins-helm
        status: SyncFailed
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: ConfigMap
        message: configmap/basic-security unchanged
        name: basic-security
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: ConfigMap
        message: configmap/jenkins-config unchanged
        name: jenkins-config
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: rbac.authorization.k8s.io
        hookPhase: Running
        kind: ClusterRoleBinding
        message: clusterrolebinding.rbac.authorization.k8s.io/jenkins-helm reconciled.
          clusterrolebinding.rbac.authorization.k8s.io/jenkins-helm unchanged
        name: jenkins-helm
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: Service
        message: service/jenkins-helm unchanged
        name: jenkins-helm
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: apps
        hookPhase: Running
        kind: Deployment
        message: deployment.apps/jenkins-helm configured
        name: jenkins-helm
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: networking.k8s.io
        hookPhase: Running
        kind: Ingress
        message: ingress.networking.k8s.io/ingress-jenkins-helm unchanged
        name: ingress-jenkins-helm
        namespace: jenkins-helm
        status: Synced
        syncPhase: Sync
        version: v1
      revision: 0.1.0
      source:
        chart: jenkins_helm_demo
        repoURL: https://alexfiz.github.io/jenkins_helm/
        targetRevision: 0.1.0
  reconciledAt: "2022-06-04T10:01:06Z"
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
  - health:
      status: Missing
    kind: ServiceAccount
    name: jen-jenkins_helm_demo
    namespace: jenkins-helm
    status: OutOfSync
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
        targetRevision: 0.1.0
    revision: 0.1.0
    status: OutOfSync
```
### Screen
![ArgoCD](ArgoCD.png)
![jenkins](jenkins.png)
![k9s](k9s.png)
