# Project

---

### Project's reporter

`Borovskiy Danila`

### Group number

`md-sa2-27-24`

---

## Application description

### Name

`project-nextjs`

### Programming language

`JavaScript / TypeScript`

### Database

`MySQL 192.168.201.2:3306`

--- 

## Pipeline. High Level Design

![img.png](https://raw.githubusercontent.com/dborovskiy00/sa.it-academy.by/md-sa2-27-24/Danila_Borovskiy/project/diagram.png)

---

## Technologies which were used in project

### Orchestration

`Kubernetes`

### Automation tools

`GitHub Actions, ArgoCD`

### Other tools

`HELM, Docker, MySQL, NextJS`

### Notification

`Slack`

---

## CI/CD description

### Github

> Github was utilized as the version control system.
> Three core repositories were created to implement the CI/CD pipeline for the application.
> The Next.js repository serves as the primary repository housing the website’s code.
> The Helm repository stores the Helm chart with predefined values.
> The Argocd repository is employed to implement GitOps principles.


### GitHub Actions

> GitHub Actions were utilized for CI/CD purposes.
> Actions from the Next.js application ran linters and tests for the application upon pull request creation.
> Additionally, a deployment action was manually triggered, allowing for the selection of the release type (major, minor, patch).
> Subsequently, it automatically incremented the application version based on the previous tag, built the Docker image,
> published it to Docker Hub, and sent a version update request to the GitHub Actions repository associated with the Helm chart.
> Actions from the Helm repository, upon receiving a request with a new version, updated the image version within the values file and also updated the version within the chart.yaml file.
> Following this, they sent a version update request to the ArgoCD repository. ArgoCD actions, upon receiving the request, updated the targetRevision in the application.yaml to the appropriate version.


### Docker HUB

> Docker Hub served as the repository for Docker images and their respective versions.

### ArgoCD

> ArgoCD was employed to implement GitOps principles and synchronize manifests to maintain infrastructure in alignment with the code.
> Additionally, notifications synchronized with Slack were set up to notify about deployments or synchronizations.

---

## Repositories

- [Application](https://github.com/dborovskiy00/nextjs-ssr)
- [Helm](https://github.com/dborovskiy00/nextjs-ssr-helm)
- [ArgoCD](https://github.com/dborovskiy00/nextjs-ssr-argocd/settings)
