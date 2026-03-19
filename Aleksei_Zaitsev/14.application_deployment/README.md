# 14. Application deployment

### Deploy Jenkins to the Kubernetes cluster

```bash
kubectl apply -f jenkins.yaml
```

### Create chart jenkins-helm and remove default templates

```bash
helm create jenkins-helm
cd jenkins-helm/
rm -rf jenkins-helm/templates/*
rm -f jenkins-helm/values.yaml
rm -f jenkins-helm/values.yaml
```

### Create templates for Jenkins and values.yaml

```bash
nano Chart.yaml 
nano templates/namespace.yaml
nano templates/secret.yaml
nano templates/clusterrolebinding.yaml
nano templates/deployment.yaml
nano templates/configmap.yaml
nano templates/service.yaml 
nano templates/ingress.yaml 
```

### Variables (values.yaml)

| Parameter | Default | Description |
|---|---|---|
| `namespace` | `ci-cd` | Target namespace |
| `image.repository` | `jfrog.it-academy.by/public/jenkins-ci` | Jenkins image |
| `image.tag` | `spishchyk_33` | Image tag |
| `adminPassword` | `c2VjcmV0` | Admin password (base64) |
| `resources.requests.cpu` | `2` | CPU request |
| `resources.requests.memory` | `2Gi` | Memory request |
| `resources.limits.cpu` | `3` | CPU limit |
| `resources.limits.memory` | `3Gi` | Memory limit |
| `nfs.server` | `192.168.37.105` | NFS server address |
| `nfs.path` | `.../a_zaitsev/jenkins` | NFS path |
| `port.master` | `8080` | Jenkins web UI port |
| `port.slave` | `50000` | JNLP agent port |
| `ingress.host` | `jenkins.k8s-7.sa` | Ingress hostname |
| `jenkins.numExecutors` | `2` | Number of executors |
| `jenkins.credentials.*` | — | GitHub credentials (JCasC) |
| `jenkins.admin.email` | `pluhin@gmail.com` | Admin email |
| `jenkins.url` | `http://jenkins.k8s-7.sa/` | Jenkins URL |


### Check helm-chart

```bash
helm template jenkins jenkins-helm/
```

### Output:

```bash
---
# Source: jenkins-helm/templates/namespace.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: ci-cd
---
# Source: jenkins-helm/templates/secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: jenkins-secret
  namespace: ci-cd
type: Opaque
data:
  password: c2VjcmV0
---
# Source: jenkins-helm/templates/configmap.yaml
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
              jenkinsUrl: "http://jenkins:8080"
              name: "kubernetes"
              namespace: "ci-cd"
              skipTlsVerify: true
        credentials:
          system:
            domainCredentials:
            - credentials:
              - usernamePassword:
                  description: "Githubuser"
                  id: "some_randome"
                  password: "secret"
                  scope: GLOBAL
                  username: "git_hub_user"
        unclassified:
          location:
            adminAddress: "pluhin@gmail.com"
            url: "http://jenkins.k8s-7.sa/"
          shell:
            shell: "/bin/bash"
---
# Source: jenkins-helm/templates/configmap.yaml
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
    def password = System.getenv("PASS")
    def hudsonRealm = new HudsonPrivateSecurityRealm(false)
    hudsonRealm.createAccount('admin', password)
    instance.setSecurityRealm(hudsonRealm)
    def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
    strategy.setAllowAnonymousRead(true)
    instance.setAuthorizationStrategy(strategy)
    instance.save()
---
# Source: jenkins-helm/templates/clusterrolebinding.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: jenkins
  namespace: ci-cd
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: default
  namespace: ci-cd
---
# Source: jenkins-helm/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: jenkins
  namespace: ci-cd
spec:
  ports:
    - name: master
      port: 8080
      targetPort: 8080
    - name: slave
      port: 50000
      targetPort: 50000
  selector:
    app: jenkins
---
# Source: jenkins-helm/templates/deployment.yaml
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
      containers:
        - name: jenkins
          image: jfrog.it-academy.by/public/jenkins-ci:spishchyk_33
          imagePullPolicy: IfNotPresent
          env:
            - name: PASS
              valueFrom:
                secretKeyRef:
                  name: jenkins-secret
                  key: password
            - name: JAVA_OPTS
              value: "-Djenkins.install.runSetupWizard=false"
            - name: CASC_JENKINS_CONFIG
              value: /var/jenkins_home/casc_configs/jenkins.yaml
          ports:
            - name: http-port
              containerPort: 8080
            - name: jnlp-port
              containerPort: 50000
          resources:
            requests:
              cpu: 2
              memory: 2Gi
            limits:
              cpu: 3
              memory: 3Gi
          volumeMounts:
            - name: jenkins-auth-config
              mountPath: /var/jenkins_home/init.groovy.d/basic-security.groovy
              subPath: basic-security.groovy
            - name: jenkins-config-yaml
              mountPath: /var/jenkins_home/casc_configs/jenkins.yaml
              subPath: jenkins.yaml
            - name: jenkins-config
              mountPath: /var/jenkins_home
      volumes:
        - name: jenkins-auth-config
          configMap:
            name: basic-security
        - name: jenkins-config-yaml
          configMap:
            name: jenkins-config
        - name: jenkins-config
          nfs:
            server: 192.168.37.105
            path: /mnt/IT-Academy/nfs-data/sa2-34-26/a_zaitsev/jenkins
---
# Source: jenkins-helm/templates/ingress.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-jenkins
  namespace: ci-cd
spec:
  ingressClassName: nginx
  rules:
    - host: jenkins.k8s-7.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: jenkins
                port:
                  number: 8080
```

### Package chart

```bash
helm package jenkins-helm/
```
