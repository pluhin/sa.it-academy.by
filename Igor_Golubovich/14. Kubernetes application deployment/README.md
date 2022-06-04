# 14. Kubernetes application deployment by Igor Golubovich

## argoCD application manifests:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  creationTimestamp: "2022-06-04T16:04:35Z"
  generation: 17
  name: jenkins-helm
  namespace: argocd
  resourceVersion: "2143564"
  uid: 7a01be21-7f25-46b4-9fa9-bba0a9cb0ebb
spec:
  destination:
    server: https://kubernetes.default.svc
  project: default
  source:
    chart: jenkins-helm
    repoURL: https://igor-golubovich.github.io/jenkins_helm/
    targetRevision: 0.1.0
  syncPolicy:
    automated: {}
status:
  health:
    status: Healthy
  history:
  - deployStartedAt: "2022-06-04T16:04:35Z"
    deployedAt: "2022-06-04T16:04:35Z"
    id: 0
    revision: 0.1.0
    source:
      chart: jenkins-helm
      repoURL: https://igor-golubovich.github.io/jenkins_helm/
      targetRevision: 0.1.0
  operationState:
    finishedAt: "2022-06-04T16:04:35Z"
    message: successfully synced (all tasks run)
    operation:
      initiatedBy:
        automated: true
      retry:
        limit: 5
      sync:
        revision: 0.1.0
    phase: Succeeded
    startedAt: "2022-06-04T16:04:35Z"
    syncResult:
      resources:
      - group: ""
        hookPhase: Running
        kind: Namespace
        message: namespace/ci-cd-helm created
        name: ci-cd-helm
        namespace: ""
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: ConfigMap
        message: configmap/basic-security created
        name: basic-security
        namespace: ci-cd-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: ConfigMap
        message: configmap/jenkins-config created
        name: jenkins-config
        namespace: ci-cd-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: rbac.authorization.k8s.io
        hookPhase: Running
        kind: ClusterRoleBinding
        message: "clusterrolebinding.rbac.authorization.k8s.io/jenkins reconciled.
          reconciliation required create\n\tmissing subjects added:\n\t\t{Kind:ServiceAccount
          APIGroup: Name:default Namespace:ci-cd-helm}. clusterrolebinding.rbac.authorization.k8s.io/jenkins
          configured. Warning: resource clusterrolebindings/jenkins is missing the
          kubectl.kubernetes.io/last-applied-configuration annotation which is required
          by  apply.  apply should only be used on resources created declaratively
          by either  create --save-config or  apply. The missing annotation will be
          patched automatically."
        name: jenkins
        namespace: ""
        status: Synced
        syncPhase: Sync
        version: v1
      - group: ""
        hookPhase: Running
        kind: Service
        message: service/jenkins-helm created
        name: jenkins-helm
        namespace: ci-cd-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: apps
        hookPhase: Running
        kind: Deployment
        message: deployment.apps/jenkins-helm created
        name: jenkins-helm
        namespace: ci-cd-helm
        status: Synced
        syncPhase: Sync
        version: v1
      - group: networking.k8s.io
        hookPhase: Running
        kind: Ingress
        message: ingress.networking.k8s.io/ingress-jenkins-helm created
        name: ingress-jenkins-helm
        namespace: ci-cd-helm
        status: Synced
        syncPhase: Sync
        version: v1
      revision: 0.1.0
      source:
        chart: jenkins-helm
        repoURL: https://igor-golubovich.github.io/jenkins_helm/
        targetRevision: 0.1.0
  reconciledAt: "2022-06-04T16:20:28Z"
  resources:
  - kind: ConfigMap
    name: basic-security
    namespace: ci-cd-helm
    status: Synced
    version: v1
  - kind: ConfigMap
    name: jenkins-config
    namespace: ci-cd-helm
    status: Synced
    version: v1
  - kind: Namespace
    name: ci-cd-helm
    status: Synced
    version: v1
  - health:
      status: Healthy
    kind: Service
    name: jenkins-helm
    namespace: ci-cd-helm
    status: Synced
    version: v1
  - group: apps
    health:
      status: Healthy
    kind: Deployment
    name: jenkins-helm
    namespace: ci-cd-helm
    status: Synced
    version: v1
  - group: networking.k8s.io
    health:
      status: Healthy
    kind: Ingress
    name: ingress-jenkins-helm
    namespace: ci-cd-helm
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
    - http://jenkins-helm.k8s-17.sa/
    images:
    - jfrog.it-academy.by/public/jenkins-ci:igolubovich
  sync:
    comparedTo:
      destination:
        server: https://kubernetes.default.svc
      source:
        chart: jenkins-helm
        repoURL: https://igor-golubovich.github.io/jenkins_helm/
        targetRevision: 0.1.0
    revision: 0.1.0
    status: Synced

```

## screenshots of web pages:

![argocd](argocd.jpg)
![jenkins](jenkins.jpg)
![jen_helm](jen_helm.jpg)
