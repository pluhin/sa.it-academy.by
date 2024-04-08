# Project report

### **Project's reporter:** Myslivets Natalia
### **Group number:** m-sa2-27-24

### Description of application for deployment:

1.  **Name of application:**  CMDtest
2.  **Programming language is this application written in:**  Python (Flask)
3.  **Data Base:**  PostgreSQL
4. **Git repository:**  [->Click here<-](https://github.com/NataliaBelogolovaya/progect/)


### Pipeline. High Level Design
![progect_shem](https://github.com/NataliaBelogolovaya/progect/blob/main/project_shem.drawio.png)

### Technologies which were used in project

**Orchestration:**  Kubernetes
**Automation tools:**  Ansible, Github Actions, ArgoCD.
**SCM:**  GitHub
**Notification:**  Slack
**Other tools:**  Docker, Helm.

### CI description: 

By pushing to the git repository(main branch),github actions are launched. 
First job of the action launches ansible playbook on remote host and checks for database, users, accesses(+slack notification).
Second job create a new image using the docker and pushed this image to dockerhub with a new tag (+slack notification). 
Third job create a helm chart(test chart) and push new Helm Page into a special repository(+slack notification).

### Deployment flows short description:

AgroCD syncs with Helm repository, deploys application to kubernetes cluster.CPU load and memory usage can be seen in Grafana.

### Rollback flow description and implementation:
Rollback from ArgoCD web interface.

### Links:
1. [Progect repository](https://github.com/NataliaBelogolovaya/progect/)
2. [Git repository with Helm pages](https://github.com/NataliaBelogolovaya/helm_pages)

