# Project report
### Project's reporter: Dmitry Konokov
### Group number: md-sa2-27-24
## Description of application for deployment
* Name of application: wordpress.
* Programming languages: PHP, HTML, CSS.
* DataBase: MariaDB
* Link on git repositories:
  - [main-repo](https://github.com/ussnorma/DevOps-Project-1)
  - [argocd-repo](https://github.com/ussnorma/argocd)
  - [helm-repo](https://github.com/ussnorma/helm)
## Pipeline. High Level Design
![project-scheme](https://github.com/ussnorma/DevOps-Project-1/blob/main/Project-pipeline.png?raw=true)
## Technologies which were used in project
* Orchestration: git runners.
* Automation tools: Ansible, bash.
1. Three repositories were created to organize the pipeline CI/CD, namely:
    - main-repo: consists of three branches (main, production, pre-production):
       - main: contains only README file with instructions to project.
       - production: contains workflows (Pre-Deploy, Deploy), bash scripts and some files for organization pipelineю Branch is designed to deploy the main app.
       - pre-production: contains the same files as production branch. This branch is designed to deploy app in test namespace and also for testing app before main deploy.
    - argocd-repo: consists of one branch - main with apps directory which is designed to ArgoCD. This directory consists of application files.
    - helm-repo: consists of main branch which contains helm charts. Helm charts are designed to ArgoCD applications.
2. Project deploys on Kubernetes cluster in two namesapaces, namely:
     - prod: this namespace is designed for main app (for users)
     - pre-prod: this namespace is designed for developers (for testing app before deployment for users)
3. To access from out used Ingress controller which was deployed in Kubernetes cluster in ingress-nginx namespace.
4. For the pull deployment was created ArgoCD.
* CI and Deployment flows short description:
1. At firs you have to change some files in pre-production branch (such as docker image or something else)
     - pre-production branch: 
         - by push action starts Pre-Deploy workflow:
             1. SLack Notification - Starting Pre-Deploy
             2. Checkout repository (pre-production)
             3. Change ingress.hostname install req and helm dependency
             4. Testing helm (helm lint) and if helm lint failure -> starts 
                 - Upload report helm lint 
                 - SLack Notification about helm lint failure
             5. Create helm chart for application and helm repo
             6. Push helm package into helm-repo
             7. Sleep for 30 seconds (Waiting for action gh-pages)
             8. SLack Notification creating helm repo
             9. Create PVC and ns for wordpress-pre
             10. Create application for argocd
             11. Push application in argocd-repo
             12. SLack Notification about ending PRE_DEPLOY
2.  If everething is ok then create PR (merge pre-production branch into production branch):
     - production branch: 
         - by PR starts Deploy workflow:
             1. Tests job:
                 - Checkout repository (production)
                 - Curl test for pre-prod application
                 - Upload report curl test
                 - SLack Notification curl test
                 - Set output for continue or not
             - if the tests were passed then continue deployment
             2. Deploy job:
                 - Checkout repository (production)
                 - SLack Notification about starting MAIN DEPLOY
                 - Install requirements and helm dependency
                 - Testing helm (helm lint) and if helm lint failure -> starts 
                     - Upload report helm lint 
                     - SLack Notification about helm lint failure
                 - Create helm chart for main app
                 - Push helm package into helm-repo
                 - Sleep for 30 seconds (Waiting for action gh-pages)
                 - SLack Notification creating helm repo
                 - Create PVC and ns for wordpress-main
                 - Create application for argocd
                 - Push application in argocd-repo
                 - SLack Notification about ending MAIN DEPLOY
* Rollback flow description and implementation: by ArgoCD rollback.
* ArgoCD monitors the repository with Helm Charts. Auto synchronization
