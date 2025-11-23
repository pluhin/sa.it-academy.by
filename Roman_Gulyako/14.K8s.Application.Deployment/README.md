# Homework Assignment 1. Transform Jenkins deployment to Helm

## 1. Preparing the Helm Chart

Create chart structure:
```bash
mkdir -p helm/jenkins/templates
touch helm/jenkins/Chart.yaml helm/jenkins/values.yaml
```
Add template files:
```bash
touch helm/jenkins/templates/secret.yaml
touch helm/jenkins/templates/clusterrolebinding.yaml
touch helm/jenkins/templates/configmap-basic-security.yaml
touch helm/jenkins/templates/configmap-jenkins.yaml
touch helm/jenkins/templates/deployment.yaml
touch helm/jenkins/templates/service.yaml
touch helm/jenkins/templates/ingress.yaml
```

## 2. Filling Chart.yaml, values.yaml and templates

- `Chart.yaml` contains chart metadata.
    
- `values.yaml` contains all parameters (image, resources, RBAC, NFS, ingress, configs).
    
- Sensitive data (admin password) is stored in a separate file `values-secret.yaml` and added to `.gitignore`.
Example `values-secret.yaml`:
```yaml
admin:
  password: "YourSecretPassword"
```
- `/templates`:
	- `secret.yaml` – stores admin password securely via Kubernetes Secret
	- `clusterrolebinding.yaml` – RBAC configuration
	- `configmap-basic-security.yaml` – Groovy script for initial security setup
	- `configmap-jenkins.yaml` – Jenkins Configuration as Code (JCasC)
	- `deployment.yaml` – main Jenkins Deployment with NFS volume and environment variables
	- `service.yaml` – ClusterIP service exposing Jenkins ports
	- `ingress.yaml` – Ingress resource for external access

## 3. Installing Jenkins with Helm

First create namespace:
```bash
kubectl create namespace ci-cd
```
Install chart:
```bash
helm upgrade --install jenkins helm/jenkins \
  -n ci-cd \
  -f helm/jenkins/values.yaml \
  -f helm/jenkins/values-secret.yaml
```
Check resources:
```bash
kubectl get pods -n ci-cd
kubectl get svc,ingress -n ci-cd
```
Access Jenkins in browser:
`http://jenkins.k8s-5.sa`

## 4. Packaging the Chart

Build Helm package:
```bash
helm package helm/jenkins -d dist
```
Generate repository index:
```bash
helm repo index dist --url https://romangulyako.github.io/helm-jenkins
```

## 5. Publishing to GitHub Pages

1. Create branch `gh-pages`.
    
2. Copy `dist/index.yaml` and `dist/jenkins-0.1.0.tgz` to root of `gh-pages`.
    
3. Commit and push:
```bash
git checkout -b gh-pages
cp dist/* .
git add index.yaml jenkins-0.1.0.tgz
git commit -m "Publish Jenkins Helm chart"
git push origin gh-pages
```
4. Enable GitHub Pages for branch `gh-pages`.

## 6. Using the Published Repository

Add repo locally:
```bash
helm repo add helm-jenkins https://romangulyako.github.io/helm-jenkins
helm repo update
helm search repo helm-jenkins
```

