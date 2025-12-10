# Chart Structure
``` text
jenkins-chart/
├── Chart.yaml              # Chart metadata
├── values.yaml             # Default configuration values
├── templates/              # Kubernetes manifests
    ├── namespace.yaml
    ├── secret.yaml
    ├── clusterrolebinding.yaml
    ├── configmap-jenkins.yaml
    ├── configmap-basic-security.yaml
    ├── deployment.yaml
    ├── service.yaml
    └── ingress.yaml
```
## Step 1: Clone or Create Chart Structure
``` bash
# Create directory structure
mkdir -p jenkins-chart/templates

# Navigate to chart directory
cd jenkins-chart
```

## Step 2: Create Chart Files

### Create all the files as described:
```text
Chart.yaml

values.yaml

All template files in templates/ directory
```    
## Step 3: Validate Chart Syntax
```bash
# Lint the Helm chart
helm lint . 
```
```bash
# Dry run to validate templates
helm template jenkins . --debug
```
## Step 4: Package Chart
```bash
# Package Chart
helm package . --destination ~/
```

## Step 5: Install Package
```bash
helm upgrade --install jenkins jenkins-0.1.0.tgz -fvalues.yaml
```
