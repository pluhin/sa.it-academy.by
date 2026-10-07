# Homework Assignment 1: Transform Jenkins Deployment to Helm

The goal of this assignment is to transform a static manifest Kubernetes deployment of Jenkins into a production-ready, fully parameterized Helm chart and package it.

## Project Structure

```text
.
├── 01-namespace-rbac.yaml
├── 02-storage.yaml
├── 03-config.yaml
├── 04-jenkins.yaml
├── Dockerfile
├── Jenkins
│   ├── Chart.yaml
│   ├── templates
│   │   ├── config-secret.yaml
│   │   ├── deployment-service.yaml
│   │   ├── _helpers.tpl
│   │   ├── istio.yaml
│   │   ├── rbac.yaml
│   │   └── volume.yaml
│   └── values.yaml
├── jenkins-0.1.0.tgz
├── jenkins-istio.yaml
└── README.md
```


### History workshop command:
```
 kubectl apply -f 01-namespace-rbac.yaml
 kubectl apply -f 02-storage.yaml
 ssh student@192.168.208.7
 kubectl apply -f 03-config.yaml
 clear
 kubectl apply -f 03-config.yaml
 kubectl apply -f 04-jenkins.yaml
 kubectl apply -f jenkins-istio.yaml
```
---
* I created a Jenkins Helm chart, converted the files from the workshop, and moved the parameters to `values.yaml`.
```
helm create Jenkins
```

* The chart was validated using Helm's built-in linting mechanism:

```bash
helm lint ./Jenkins/
```
<img width="975" height="221" alt="image" src="https://github.com/user-attachments/assets/a74a571f-e713-41e1-8ef5-3a12e25ab69d" />

* Generate the final manifest locally.
```
$ helm template jenkins-app Jenkins/
---
# Source: jenkins/templates/rbac.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: jenkins
  namespace: ci-cd

---
# Source: jenkins/templates/config-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: jenkins-secret
  namespace: ci-cd
type: Opaque
stringData:
  admin-password: "admin"
  github-token: "admin"

etc...
```
---

### Application Deployment (Local Installation)
To deploy the Jenkins application from your local chart folder into the target `ci-cd` namespace:

```
$ helm install jenkins-app Jenkins/ --create-namespace -n ci-cd
NAME: jenkins-app
LAST DEPLOYED: Fri Oct  2 16:29:15 2026
NAMESPACE: ci-cd
STATUS: deployed
REVISION: 1
DESCRIPTION: Install complete
TEST SUITE: None
```

---


###  Create the Helm Package
compressed distribution archive (`.tgz`):

```bash
max@ubuntu:~/Project/15.k8s$ helm package Jenkins/
Successfully packaged chart and saved it to: /home/max/Project/15.k8s/jenkins-0.1.0.tgz
```

### Verification


The release was installed successfully on the k8s context:
<img width="975" height="108" alt="image" src="https://github.com/user-attachments/assets/a7f41ce4-4927-4c9b-830e-05b98632a968" />



<img width="975" height="497" alt="image" src="https://github.com/user-attachments/assets/14aa520e-d7b8-4ab5-93e7-16c56023ad59" />

Сhecking Jenkins availability in the browser at http://jenkins.k8s-7.sa/
<img width="975" height="1003" alt="image" src="https://github.com/user-attachments/assets/a6e74ccf-b113-42ed-af04-f3d135ef7494" />


### Step 3: Publish Helm on Your Repository


#### Example via GitHub Pages:
1. Push the generated `jenkins-0.1.0.tgz` and `index.yaml` to a public repository (e.g., `helm-charts`).
2. Enable **GitHub Pages** under repository settings.
3. Access or share your published chart globally:
   ```bash
   helm repo add my-jenkins-repo https://<your-username>.github.io/helm-charts/
   helm repo update
   helm install my-jenkins my-jenkins-repo/jenkins -n ci-cd
   ```
