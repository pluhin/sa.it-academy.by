# Tasker Infrastructure Project

# Task Management Application

- **Project's reporter:** Aliaksei Dalhapolau
- **Group number:** m-sa2-30-24
- - [git-repository](https://github.com/alex-agd/tasker-infra)

CI Pipeline Stages
The project uses a CI/CD pipeline to automate the processes of building, testing, and deploying. The pipeline consists of the following stages:


- ** Validation and Testing:


#### Cache Maven Packages: Speeds up the build process by reusing previously downloaded dependencies.
Set up JDK 17: Configures the environment for building and testing the project.
Verify Maven Wrapper Exists: Ensures that the project includes a Maven Wrapper and generates it if necessary.
Run Tests: Executes all project tests using Maven.
Upload Test Results: Saves test results as artifacts for later analysis.
Build and Publish Docker Image:


#### Set up Docker Buildx: Prepares the environment for building Docker images.
Login to GitHub Container Registry: Authenticates to the container registry for publishing images.
Build and Push Image: Builds the Docker image and publishes it to the GitHub Container Registry.
Update Infrastructure:


#### Checkout Infrastructure Repository: Clones the repository containing the infrastructure configuration.
Update Image Version: Updates the Docker image version in the Helm configuration.
Commit and Push Changes: Saves and pushes the changes to the repository.
Helm and Kubernetes Validation:


#### Set up Helm: Configures the environment for working with Helm.
Add Helm Repositories: Adds necessary repositories for Helm charts.
Validate Helm Chart: Checks the correctness of the Helm chart.
Create Kubernetes Cluster: Creates a temporary cluster for testing.
Install CRDs: Installs Custom Resource Definitions for Prometheus and ArgoCD.
Validate Kubernetes Manifests: Checks the correctness of all Kubernetes manifests.
Send Slack Notification: Sends a notification about the validation result to Slack.
These stages ensure the reliability and stability of the development process by automating key tasks and minimizing the likelihood of errors.

### Application Details

- **Name:** Task Management Application
- **Programming Language:** Java 17
- **Database:** PostgreSQL 15

## Infrastructure

### ArgoCD

ArgoCD is used in the project for continuous deployment (CD) of applications. ArgoCD configuration is located in the `argocd/` directory.

### Helm

Kubernetes release management is handled using Helm. Helm charts are located in the `helm/tasker/` directory.

## Project Structure

```
tasker-infra/
├── argocd/
│   └── applications/    # ArgoCD application configurations
└── helm/
    └── tasker/         # Helm charts for application deployment
```

## Requirements

- Kubernetes cluster
- Helm v3+
- ArgoCD
- kubectl
