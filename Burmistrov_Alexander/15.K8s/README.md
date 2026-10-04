# 15.Kubernetes.Application deployment

## Homework Assignment 1. Transform Jenkins deployment to Helm
```
jenkins-local
├── charts
├── Chart.yaml
├── templates
│   ├── 01-namespace-rbac.yaml
│   ├── 02-storage.yaml
│   ├── 03-config.yaml
│   ├── 04-jenkins.yaml
│   └── jenkins-istio.yaml
└── values.yaml
```
```bash
helm create jenkins-local
helm template my-jenkins-release . --namespace ci-cd
helm install jenkins . --namespace test-helm
```

```yaml
---
# Source: jenkins-local/templates/01-namespace-rbac.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: ci-cd
  labels:
    istio-injection: enabled

---
# Source: jenkins-local/templates/01-namespace-rbac.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: jenkins
  namespace: ci-cd

---
# Source: jenkins-local/templates/03-config.yaml
apiVersion: v1
kind: Secret
metadata:
  name: jenkins-secret
  namespace: ci-cd
type: Opaque
stringData:
  admin-password: "admin"
  github-token: "admin"

---
# Source: jenkins-local/templates/03-config.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: jenkins-config
  namespace: ci-cd
data:
  jenkins.yaml: |
    jenkins:
      numExecutors: 2
      clouds:
        - kubernetes:
            containerCapStr: "10"
            maxRequestsPerHostStr: "32"
            jenkinsUrl: "http://jenkins.ci-cd.svc.cluster.local:8080"
            name: "kubernetes"
            namespace: "ci-cd"
            skipTlsVerify: true
    credentials:
      system:
        domainCredentials:
          - credentials:
              - usernamePassword:
                  description: "GitHub user"
                  id: "github-creds"
                  scope: GLOBAL
                  username: "CHANGE_ME"
                  password: "${GITHUB_TOKEN}"
    unclassified:
      location:
        adminAddress: "CHANGE_ME@example.com"
        url: "http://jenkins.k8s-5.sa/"
      shell:
        shell: "/bin/bash"

---
# Source: jenkins-local/templates/03-config.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: basic-security
  namespace: ci-cd
data:
  basic-security.groovy: |
    #!groovy
    import jenkins.model.*
    import hudson.security.*
    def instance = Jenkins.getInstance()
    println "--> creating local user 'admin'"
    def password = System.getenv("ADMIN_PASSWORD")
    def hudsonRealm = new HudsonPrivateSecurityRealm(false)
    hudsonRealm.createAccount('admin', password)
    instance.setSecurityRealm(hudsonRealm)
    def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
    strategy.setAllowAnonymousRead(false)
    instance.setAuthorizationStrategy(strategy)
    instance.save()

---
# Source: jenkins-local/templates/02-storage.yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-jenkins-release-pv
  labels:
    app: jenkins
spec:
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteMany
  persistentVolumeReclaimPolicy: Retain
  storageClassName: ""
  claimRef:
    namespace: ci-cd
    name: jenkins-home
  nfs:
    server: 192.168.37.105
    path: /mnt/IT-Academy/nfs-data/sa2-36-26/alexb/jenkins-my-jenkins-release

---
# Source: jenkins-local/templates/02-storage.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: jenkins-home
  namespace: ci-cd
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: ""
  resources:
    requests:
      storage: 10Gi

---
# Source: jenkins-local/templates/01-namespace-rbac.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: jenkins-agents
  namespace: ci-cd
rules:
  - apiGroups: [""]
    resources: ["pods"]
    verbs: ["create", "delete", "get", "list", "watch"]
  - apiGroups: [""]
    resources: ["pods/exec"]
    verbs: ["create", "get"]
  - apiGroups: [""]
    resources: ["pods/log"]
    verbs: ["get", "list"]
  - apiGroups: [""]
    resources: ["events"]
    verbs: ["get", "list", "watch"]
  - apiGroups: [""]
    resources: ["secrets"]
    verbs: ["get", "list"]

---
# Source: jenkins-local/templates/01-namespace-rbac.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: jenkins-agents
  namespace: ci-cd
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: jenkins-agents
subjects:
  - kind: ServiceAccount
    name: jenkins
    namespace: ci-cd

---
# Source: jenkins-local/templates/04-jenkins.yaml
apiVersion: v1
kind: Service
metadata:
  name: jenkins
  namespace: ci-cd
spec:
  selector:
    app: jenkins
  ports:
    - name: http
      port: 8080
      targetPort: 8080
    - name: jnlp
      port: 50000
      targetPort: 50000

---
# Source: jenkins-local/templates/04-jenkins.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jenkins
  namespace: ci-cd
spec:
  replicas: 1
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app: jenkins
  template:
    metadata:
      labels:
        app: jenkins
    spec:
      serviceAccountName: jenkins
      securityContext:
        fsGroup: 1000
      containers:
        - name: jenkins
          image: "jfrog.it-academy.by/public/jenkins-ci:alexb_36"
          imagePullPolicy: IfNotPresent
          env:
            - name: ADMIN_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: jenkins-secret
                  key: admin-password
            - name: GITHUB_TOKEN
              valueFrom:
                secretKeyRef:
                  name: jenkins-secret
                  key: github-token
            - name: JAVA_OPTS
              value: "-Djenkins.install.runSetupWizard=false"
            - name: CASC_JENKINS_CONFIG
              value: /var/jenkins_config/jenkins.yaml
          ports:
            - name: http
              containerPort: 8080
            - name: jnlp
              containerPort: 50000
          resources:
            requests:
              cpu: 500m
              memory: 2Gi
            limits:
              cpu: "2"
              memory: 4Gi
          readinessProbe:
            httpGet:
              path: /login
              port: 8080
            initialDelaySeconds: 30
            periodSeconds: 10
          livenessProbe:
            httpGet:
              path: /login
              port: 8080
            initialDelaySeconds: 120
            periodSeconds: 20
            failureThreshold: 6
          volumeMounts:
            - name: jenkins-home
              mountPath: /var/jenkins_home
            - name: casc-config
              mountPath: /var/jenkins_config
            - name: init-scripts
              mountPath: /var/jenkins_home/init.groovy.d/basic-security.groovy
              subPath: basic-security.groovy
      volumes:
        - name: jenkins-home
          persistentVolumeClaim:
            claimName: jenkins-home
        - name: casc-config
          configMap:
            name: jenkins-config
        - name: init-scripts
          configMap:
            name: basic-security

---
# Source: jenkins-local/templates/jenkins-istio.yaml
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: jenkins
  namespace: ci-cd
spec:
  selector:
    istio: ingressgateway
  servers:
    - port:
        number: 80
        name: http
        protocol: HTTP
      hosts:
        - jenkins.k8s-5.sa

---
# Source: jenkins-local/templates/jenkins-istio.yaml
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: jenkins
  namespace: ci-cd
spec:
  hosts:
    - jenkins.k8s-5.sa
  gateways:
    - jenkins
  http:
    - match:
        - uri:
            prefix: /
      route:
        - destination:
            host: jenkins.ci-cd.svc.cluster.local
            port:
              number: 8080
```