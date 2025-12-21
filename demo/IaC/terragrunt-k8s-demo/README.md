# Terragrunt + Kubernetes demo (local cluster)

Structure:
- modules/namespace : Terraform module to create a Kubernetes namespace
- modules/nginx     : Terraform module to deploy nginx (Deployment + Service + Ingress)
- live/             : Terragrunt live configuration
  - prod/
    - namespace/    : creates 'prod' namespace
    - nginx/        : deploys nginx into 'prod' namespace
  - pre-prod/
    - namespace/    : creates 'pre-prod' namespace
    - nginx/        : deploys nginx into 'pre-prod' namespace

## Usage (example for local cluster: kind, minikube, k3d, etc.)

Ensure your kubeconfig is at ~/.kube/config and points to the desired cluster.

### Prod environment

cd live/prod/namespace
terragrunt init
terragrunt apply

cd ../nginx
terragrunt init
terragrunt apply

### Pre-prod environment

cd live/pre-prod/namespace
terragrunt init
terragrunt apply

cd ../nginx
terragrunt init
terragrunt apply

Then configure your /etc/hosts (or local DNS) to point:
- nginx-prod.local     -> ingress controller IP
- nginx-preprod.local  -> ingress controller IP
