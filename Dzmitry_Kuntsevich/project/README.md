# Project report
### Project's reporter: Dzmitry Kuntsevich
### Group number: md-sa2-32-25
## Description of application for deployment
* Name of application: wordpress.
* DataBase: MariaDB
* Infrastructure**: Kubernetes, ArgoCD, GitHub Actions
* Core Technology**: GitOps with YAML configuration
* Link on git repository:
  - [repo](https://github.com/2Qic1/wordpress-ci-cd.git)

## Pipeline. High Level Design
![project-scheme](https://github.com/2Qic1/04.Github-actions/blob/master/photo/project.jpg)

### CI description:

By pushing to the git repository, github actions are launched.
First job of the action launches a notification in discord that someone has push changes to the master branch.
Second job starts checking repository files for keys (private and public) 

### Deployment flows short description:

AgroCD syncs with repository, deploys application to kubernetes cluster.

### Links:
  [Progect repository](https://github.com/2Qic1/wordpress-ci-cd.git)
