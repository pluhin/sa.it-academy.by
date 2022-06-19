## argoCD application manifests:
```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  creationTimestamp: "2022-06-15T07:13:44Z"
  generation: 16
  name: jenkins
  namespace: argocd
  resourceVersion: "1117111"
  uid: 4671b21b-b782-4407-8d3d-24becb540095
spec:
  destination:
    namespace: argo-prod
    server: https://kubernetes.default.svc
  project: default
  source:
    chart: jenkins
    helm:
      valueFiles:
      - values.yaml
    repoURL: https://nikolaikunai.github.io/DEMO
    targetRevision: 0.1.0
  syncPolicy:
    automated: {}
status:
  health:
    status: Healthy
  history:
  - deployStartedAt: "2022-06-15T07:13:44Z"
    deployedAt: "2022-06-15T07:13:45Z"
    id: 0
    revision: 0.1.0
    source:
      chart: jenkins
      helm:
        valueFiles:
        - values.yaml
      repoURL: https://nikolaikunai.github.io/DEMO
      targetRevision: 0.1.0
  operationState:
    finishedAt: "2022-06-15T07:13:45Z"
    message: successfully synced (all tasks run)
    operation:
      initiatedBy:
        automated: true
      retry:
        limit: 5
      sync:
        revision: 0.1.0
    phase: Succeeded
    startedAt: "2022-06-15T07:13:44Z"
    syncResult:
      resources:
      - group: ""
        hookPhase: Running
        kind: Namespace
        message: namespace/argo-prod created
        name: argo-prod
        namespace: argo-prod
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: ConfigMap
        message: configmap/jenkins-config created
        name: jenkins-config
        namespace: argo-prod
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: ConfigMap
        message: configmap/basic-security created
        name: basic-security
        namespace: argo-prod
        status: Synced
        syncPhase: Sync
        version: v1
      - group: rbac.authorization.k8s.io
        hookPhase: Running
        kind: ClusterRoleBinding
        message: "clusterrolebinding.rbac.authorization.k8s.io/jenkins reconciled.
          reconciliation required create\n\tmissing subjects added:\n\t\t{Kind:ServiceAccount
          APIGroup: Name:default Namespace:argo-prod}. clusterrolebinding.rbac.authorization.k8s.io/jenkins
          configured. Warning: resource clusterrolebindings/jenkins is missing the
          kubectl.kubernetes.io/last-applied-configuration annotation which is required
          by  apply.  apply should only be used on resources created declaratively
          by either  create --save-config or  apply. The missing annotation will be
          patched automatically."
        name: jenkins
        namespace: argo-prod
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: Service
        message: service/jenkins created
        name: jenkins
        namespace: argo-prod
        status: Synced
        syncPhase: Sync
        version: v1
      - group: apps
        hookPhase: Running
        kind: Deployment
        message: deployment.apps/jenkins created
        name: jenkins
        namespace: argo-prod
        status: Synced
        syncPhase: Sync
        version: v1
      - group: networking.k8s.io
        hookPhase: Running
        kind: Ingress
        message: ingress.networking.k8s.io/ingress-jenkins created
        name: ingress-jenkins
        namespace: argo-prod
        status: Synced
        syncPhase: Sync
        version: v1
      revision: 0.1.0
      source:
        chart: jenkins
        helm:
          valueFiles:
          - values.yaml
        repoURL: https://nikolaikunai.github.io/DEMO
        targetRevision: 0.1.0
  reconciledAt: "2022-06-15T07:21:06Z"
  resources:
  - kind: ConfigMap
    name: basic-security
    namespace: argo-prod
    status: Synced
    version: v1
  - kind: ConfigMap
    name: jenkins-config
    namespace: argo-prod
    status: Synced
    version: v1
  - kind: Namespace
    name: argo-prod
    status: Synced
    version: v1
  - health:
      status: Healthy
    kind: Service
    name: jenkins
    namespace: argo-prod
    status: Synced
    version: v1
  - group: apps
    health:
      status: Healthy
    kind: Deployment
    name: jenkins
    namespace: argo-prod
    status: Synced
    version: v1
  - group: networking.k8s.io
    health:
      status: Healthy
    kind: Ingress
    name: ingress-jenkins
    namespace: argo-prod
    status: Synced
    version: v1
  - group: rbac.authorization.k8s.io
    kind: ClusterRoleBinding
    name: jenkins
    status: Synced
    version: v1
  sourceType: Helm
  summary:
    externalURLs:
    - http://jenkins.k8s-25.sa/
    images:
    - jfrog.it-academy.by/public/jenkins-ci:nkunai
  sync:
    comparedTo:
      destination:
        namespace: argo-prod
        server: https://kubernetes.default.svc
      source:
        chart: jenkins
        helm:
          valueFiles:
          - values.yaml
        repoURL: https://nikolaikunai.github.io/DEMO
        targetRevision: 0.1.0
    revision: 0.1.0
    status: Synced


```

## Jenkins screen:
<br>![jenkins.png](jenkins.png)