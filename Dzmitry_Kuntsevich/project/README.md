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

All infrastructure code is stored in Git repositories, GitHub acts as a single source of truth,
all repositories are stored here.
GitHub action is implemented as follows: when changes are pushed to the results repository,
the presence of repository files on the keys (private and public) is checked, after which it comes.

The Heart system is ArgoCD, which implements the GitOps approach: it constantly monitors change
repositories, automatically synchronizes the state of the cluster configuration in Git,
provides a user interface for connected flows.

The cluster deploys:
1) MariaDB as a Stateful Service with persistent volumes (separate storage on the disk)
2) WordPress as a Stateless Application (in simple terms, this is: a website engine that does not store data itself, but only takes it from the database)
3) an Ingress controller is implemented for incoming traffic.

🌐 http://wp.k8s-3.sa/
 Endpoint access for users. Access to the WordPress application is configured through Ingress.
### Links:
  [Progect repository](https://github.com/2Qic1/wordpress-ci-cd.git)
