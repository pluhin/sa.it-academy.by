# convert Projekt to helm

``` sh
cd ~./14.K8s.WorkShop
mkdir HelmJenkinsPoteenoka

helm create jenkinsPoteenoka

cd HelmJenkinsPoteenoka

helm create jenkinsPoteenoka
cd templates
rm deployment.yaml service.yaml ingress.yaml serviceaccount.yaml tests
cd ..

cp jenkins.yaml templates/jenkins.yaml
cp nfs-storageclass.yaml templates/nfs-storageclass.yaml

~/../jenkinsPoteenoka$ tree
.
├── charts
├── Chart.yaml
├── templates
│   ├── jenkins.yaml
│   ├── nfs-storageclass.yaml
│   └── tests
├── values-secrets.yaml
└── values.yaml

```

# add to end of file values.yaml

``` yaml

# Jenkins + Istio + NFS ( параметры которые я вынес)
hostOctet: 3
gatewayPort: 80
nameOfnfs: poteenoka

```

* jenkins.yaml

``` yaml
---
apiVersion: v1
kind: Namespace
metadata:
  name: ci-cd
---
apiVersion: v1
kind: Secret
metadata:
  name: jenkins-secret
  namespace: ci-cd
type: Opaque
data:
  password: c2VjcmV0
---
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
            path: /mnt/IT-Academy/nfs-data/sa2-34-26/{{ .Values.nameOfnfs }}/jenkins
---
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
                  password: "XXXXXXXXXXX"
                  scope: GLOBAL
                  username: "git_hub_user"
        unclassified:
          location:
            adminAddress: "pluhin@gmail.com"
            url: "http://jenkins.k8s-{{ .Values.hostOctet }}.sa/"
          shell:
            shell: "/bin/bash"
---
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
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: jenkins-gateway
  namespace: ci-cd
spec:
  selector:
    istio: ingressgateway
  servers:
    - port:
        number: {{ .Values.gatewayPort }}
        name: http
        protocol: HTTP
      hosts:
        - jenkins.k8s-{{ .Values.hostOctet }}.sa
---
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: jenkins
  namespace: ci-cd
spec:
  hosts:
    - jenkins.k8s-{{ .Values.hostOctet }}.sa
  gateways:
    - jenkins-gateway
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


* nfs-storageclass.yaml

``` yaml
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: nfs-client-provisioner
  namespace: default
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: nfs-client-provisioner-runner
rules:
  - apiGroups: [""]
    resources: ["nodes"]
    verbs: ["get", "list", "watch"]
  - apiGroups: [""]
    resources: ["persistentvolumes"]
    verbs: ["get", "list", "watch", "create", "delete"]
  - apiGroups: [""]
    resources: ["persistentvolumeclaims"]
    verbs: ["get", "list", "watch", "update"]
  - apiGroups: ["storage.k8s.io"]
    resources: ["storageclasses"]
    verbs: ["get", "list", "watch"]
  - apiGroups: [""]
    resources: ["events"]
    verbs: ["create", "update", "patch"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: run-nfs-client-provisioner
subjects:
  - kind: ServiceAccount
    name: nfs-client-provisioner
    namespace: default
roleRef:
  kind: ClusterRole
  name: nfs-client-provisioner-runner
  apiGroup: rbac.authorization.k8s.io
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: leader-locking-nfs-client-provisioner
  namespace: default
rules:
  - apiGroups: [""]
    resources: ["endpoints"]
    verbs: ["get", "list", "watch", "create", "update", "patch"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: leader-locking-nfs-client-provisioner
  namespace: default
subjects:
  - kind: ServiceAccount
    name: nfs-client-provisioner
    namespace: default
roleRef:
  kind: Role
  name: leader-locking-nfs-client-provisioner
  apiGroup: rbac.authorization.k8s.io
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nfs-client-provisioner
  namespace: default
  labels:
    app: nfs-client-provisioner
spec:
  replicas: 1
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app: nfs-client-provisioner
  template:
    metadata:
      labels:
        app: nfs-client-provisioner
    spec:
      serviceAccountName: nfs-client-provisioner
      containers:
        - name: nfs-client-provisioner
          image: registry.k8s.io/sig-storage/nfs-subdir-external-provisioner:v4.0.2
          volumeMounts:
            - name: nfs-client-root
              mountPath: /persistentvolumes
          env:
            - name: PROVISIONER_NAME
              value: k8s-sigs.io/nfs-subdir-external-provisioner
            - name: NFS_SERVER
              value: "192.168.37.105"
            - name: NFS_PATH
              value: "/mnt/IT-Academy/nfs-data/sa2-34-26/{{ .Values.nameOfnfs }}"
      volumes:
        - name: nfs-client-root
          nfs:
            server: 192.168.37.105
            path: /mnt/IT-Academy/nfs-data/sa2-34-26/{{ .Values.nameOfnfs }}
            readOnly: false
---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-client
provisioner: k8s-sigs.io/nfs-subdir-external-provisioner
parameters:
  archiveOnDelete: "false"
# Устраняет "mount.nfs: Protocol not supported" — сервер отдаёт NFSv3
mountOptions:
  - vers=3

```

```
 helm template . 2>&1 | head -250
```


result 
```
---
# Source: jenkinsPoteenoka/templates/jenkins.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: ci-cd
---
# Source: jenkinsPoteenoka/templates/nfs-storageclass.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: nfs-client-provisioner
  namespace: default
---
# Source: jenkinsPoteenoka/templates/jenkins.yaml
apiVersion: v1
kind: Secret
metadata:
  name: jenkins-secret
  namespace: ci-cd
type: Opaque
data:
  password: c2VjcmV0
---
# Source: jenkinsPoteenoka/templates/jenkins.yaml
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
                  password: "XXXXXXXXXXX"
                  scope: GLOBAL
                  username: "git_hub_user"
        unclassified:
          location:
            adminAddress: "pluhin@gmail.com"
            url: "http://jenkins.k8s-3.sa/"
          shell:
            shell: "/bin/bash"
---
# Source: jenkinsPoteenoka/templates/jenkins.yaml
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
# Source: jenkinsPoteenoka/templates/nfs-storageclass.yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-client
provisioner: k8s-sigs.io/nfs-subdir-external-provisioner
parameters:
  archiveOnDelete: "false"
# Устраняет "mount.nfs: Protocol not supported" — сервер отдаёт NFSv3
mountOptions:
  - vers=3
---
# Source: jenkinsPoteenoka/templates/nfs-storageclass.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: nfs-client-provisioner-runner
rules:
  - apiGroups: [""]
    resources: ["nodes"]
    verbs: ["get", "list", "watch"]
  - apiGroups: [""]
    resources: ["persistentvolumes"]
    verbs: ["get", "list", "watch", "create", "delete"]
  - apiGroups: [""]
    resources: ["persistentvolumeclaims"]
    verbs: ["get", "list", "watch", "update"]
  - apiGroups: ["storage.k8s.io"]
    resources: ["storageclasses"]
    verbs: ["get", "list", "watch"]
  - apiGroups: [""]
    resources: ["events"]
    verbs: ["create", "update", "patch"]
---
# Source: jenkinsPoteenoka/templates/jenkins.yaml
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
# Source: jenkinsPoteenoka/templates/nfs-storageclass.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: run-nfs-client-provisioner
subjects:
  - kind: ServiceAccount
    name: nfs-client-provisioner
    namespace: default
roleRef:
  kind: ClusterRole
  name: nfs-client-provisioner-runner
  apiGroup: rbac.authorization.k8s.io
---
# Source: jenkinsPoteenoka/templates/nfs-storageclass.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: leader-locking-nfs-client-provisioner
  namespace: default
rules:
  - apiGroups: [""]
    resources: ["endpoints"]
    verbs: ["get", "list", "watch", "create", "update", "patch"]
---
# Source: jenkinsPoteenoka/templates/nfs-storageclass.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: leader-locking-nfs-client-provisioner
  namespace: default
subjects:
  - kind: ServiceAccount
    name: nfs-client-provisioner
    namespace: default
roleRef:
  kind: Role
  name: leader-locking-nfs-client-provisioner
  apiGroup: rbac.authorization.k8s.io
---
# Source: jenkinsPoteenoka/templates/jenkins.yaml
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
# Source: jenkinsPoteenoka/templates/jenkins.yaml
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
```


#  publish to github as helm repo


```
helm package .
Successfully packaged chart and saved it to: /home/user/14.K8s.WorkShop/HelmJenkinsPoteenoka/jenkinsPoteenoka/jenkinsPoteenoka-0.1.0.tgz

mv jenkinsPoteenoka-0.1.0.tgz ../docs/
 1586  cd ../docs
 1588  helm repo index . --url https://github.com/poteenoka/14applicationdeployment.git
 1589  cd ..
 1591  git init
 1596  git add jenkinsPoteenoka/
 1597  git status
 1598  git commit -m "Add Jenkins Helm chart source"
 1599  git branch -M main
 1600  git remote add origin https://github.com/poteenoka/14applicationdeployment.git
 1601  git push -u origin main
 1602  git add docs/
        mv jenkinsPoteenoka/index.yaml  docs/index.yaml
 1603  git commit -m "Add Helm repo index"
 1604  git push origin main
 1605  git status
 1608  helm repo index --url https://github.com/poteenoka/14applicationdeployment.git/docs
 1609  helm repo index . --url https://github.com/poteenoka/14applicationdeployment.git/docs
 1610  git status
 1611  git add .
 1612  git commit -m "add helm repo and chart"
 1613  git push origin main
 1614  helm repo add myjenkins https://github.com/poteenoka/14applicationdeployment.git/docs
  ..fail
 1616  helm repo add myjenkins https://poteenoka.github.io/14applicationdeployment/docs
 fail..
 1617  helm repo add myjenkins https://poteenoka.github.io/14applicationdeployment
   
```
* check helm repo

``` sh
helm search repo myjenkins
NAME                            CHART VERSION   APP VERSION     DESCRIPTION                
myjenkins/jenkinsPoteenoka      0.1.0           1.16.0          A Helm chart for Kubernetes

```

