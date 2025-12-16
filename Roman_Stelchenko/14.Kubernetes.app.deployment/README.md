## Homework Assignment 1. Transform Jenkins deployment to Helm

Helm package: *jenkins-k8s-by-helm-0.4.0.tgz* 

Repo with helm project: [romastelchenko/it-academy.14-kubernetes-application-deployment](https://github.com/romastelchenko/it-academy.14-kubernetes-application-deployment)

Jenkins host: [http://jenkins-by-helm.k8s-13.sa/](http://jenkins-by-helm.k8s-13.sa/)

### Build and installation steps

#### 1. Created structure and configured files:
```
jenkins-k8s-by-helm/
├── charts
├── Chart.yaml 				
├── configs                             # Separate directory with configuration files
│   ├── basic-security.groovy
│   ├── jenkins.yaml
│   └── jobs
│       └── test
│           └── config.xml
├── templates                            
│   ├── cluster-role-binding.yml
│   ├── config-map-basic-security.yml
│   ├── config-map-jenkins-config.yml
│   ├── config-map-jobs.yml
│   ├── deployment.yml
│   ├── ingress.yml
│   ├── secret.yml
│   └── service.yml
└── values.yaml                         
```

#### 2. Checked resulting manifest using helm install with --dry-run
```
cd jenkins-k8s-by-helm
helm install jenkins-by-helm . -n ci-cd-by-helm --create-namespace -f values.yaml --dry-run
```

#### 3. Run real helm install from local directory to check
```
helm install jenkins-by-helm . -n ci-cd-by-helm --create-namespace -f values.yaml
```

#### 4. Created helm repo with packages
```
# created github repo with github pages https://github.com/romastelchenko/it-academy.14-kubernetes-application-deployment
# ...
helm package jenkins-k8s-by-helm
helm repo index --url "https://romastelchenko.github.io/it-academy.14-kubernetes-application-deployment/" .
# pushed changes 
# ...
helm repo add it-academy.14-kubernetes-application-deployment https://romastelchenko.github.io/it-academy.14-kubernetes-application-deployment/
# made some changes && changed helm chart version in Chart.yml
# ...
helm repo index --url "https://romastelchenko.github.io/it-academy.14-kubernetes-application-deployment/" --merge index.yaml .
# pushed changes
# ...
helm repo update
helm search repo it-academy.14-kubernetes-application-deployment -l
	NAME                                              	CHART VERSION	APP VERSION	DESCRIPTION                           
	it-academy.14-kubernetes-application-deployment...	0.4.0        	v1         	A Helm chart for jenkins on Kubernetes
	it-academy.14-kubernetes-application-deployment...	0.3.0        	v1         	A Helm chart for jenkins on Kubernetes
	it-academy.14-kubernetes-application-deployment...	0.2.0        	v1         	A Helm chart for jenkins on Kubernetes
	it-academy.14-kubernetes-application-deployment...	0.1.0        	v1         	A Helm chart for jenkins on Kubernetes
```

#### 5. Run helm install from helm repo
```
helm install jenkins-by-helm it-academy.14-kubernetes-application-deployment/jenkins-k8s-by-helm \
  --version 0.4.0  \
  -n ci-cd-by-helm --create-namespace \
  --set secret.password.value={rewritten password in base64}
```

## Homework Assignment 2. Add pre-set tasks to Jenkins deployment 
Added a config map "jenkins-jobs" with job config files, which are added via initContainers to the Jenkins jobs directory during deployment if they are not already there
As a result, we already have a configured job/jobs immediately after deployment.
