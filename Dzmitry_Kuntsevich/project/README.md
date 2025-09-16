# Project report
### Project's reporter: Dzmitry Kuntsevich
### Group number: md-sa2-32-25
## Description of application for deployment
* Name of application: wordpress.
* DataBase: MariaDB
* Infrastructure**: Kubernetes, ArgoCD, GitHub Actions
* Core Technology**: GitOps with YAML configuration
* Link on git repository:
  - [Progect repository](https://github.com/2Qic1/wordpress-ci-cd.git)

## Pipeline. High Level Design
![project-scheme](https://github.com/2Qic1/04.Github-actions/blob/master/photo/project.jpg)

All infrastructure code is stored in a Git repository, GitHub acts as a single source of truth,
all configurations are stored here.

GitHub Action is implemented as follows: when pushing changes to the repository,
the repository files are checked for keys (private and public),
after which a notification is sent to Discord that someone made a push and about the keys found.

The heart of the system is ArgoCD, which implements the GitOps approach:
1) Constantly monitors the repository for changes
2) Automatically synchronizes the cluster state with the configuration in Git
3) Provides a UI for monitoring the status of applications.

The cluster deploys:
1) MariaDB as a Stateful Service with Persistent Volumes (separate storage on the disk)
2) WordPress as a Stateless Application (Simply put: This is a website engine that does not store data itself, but only takes it from the database)
3) an Ingress controller is implemented for incoming traffic

🌐 http://wp.k8s-3.sa/
   Endpoint access for users. Access to the WordPress application is configured via Ingress.

### Links:
  [Progect repository](https://github.com/2Qic1/wordpress-ci-cd.git)
