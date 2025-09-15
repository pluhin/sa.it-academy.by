# Project report

**Project reporter:** Surgel Andrey

**Grop number:** md-sa2-32-25

## Description of application for deployment

*   Name: Wiki-js
*   Lang: Vue/JavaScript
*   DB: Postgresql
*   Repo: https://github.com/requarks/wiki

## Pipeline scheme
[Scheme](flow_scheme.drawio)
![alt text](flow_scheme.png)

## Technologies which were used in project

**Orchestration:** K8s,Helm

**Automation tools:** Gitlab CI/CD,ArgoCD

**CI description:** on push,validation,notification,pull,argocd,notification,monitoring

**Deployment flows short description:** 

Push new helm configuration to repository,gitlab validation,ArgoCD pull this configuration on manuall run,K8s download new/changed resources to cluster(like new containers and other),notification on sucess/failure

**Rollback flow description and implementation:**

Manual trigger. Rollback works on ArgoCD logic,just return to one of history states which keeps in ArgoCD.

Links:

[Pipeline](https://gitlab.com/sa.it-academy.by-surgel/sa.it-academy.by-project)
