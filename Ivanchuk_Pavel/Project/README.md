# Project report

### Project's reporter: 
Ivanchuk Pavel

### Group number: 
m-sa2-25-23

### Description of application for deployment:
1. **Name of application:** Nextcloud
2. **Programming language is this application written in:** PHP
3. **Data Base:** MariaDB
4. **Git repository:** [->Click here <-](https://github.com/IPaul32/my-nextcloud "GitHub Ivanchuk Nextcloud")

### Pipeline. High Level Design
![nextcloud_scheme](True_scheme.jpg)

### Technologies which were used in project
1. **Orchestration:** Kubernetes
2. **Automation tools:** Github actions, Argo CD
3. **SCM:** GitHub
4.  **Notification:** Slack
5. **Other tools:** Docker, Helm 

### CI description: 
GitHub actions workflow starting after pushing to the main branch.
1. **Bump version and push tag:**  Automatically bump and push tag.
2. **Docker Lint:**        Verifying Dockerfile. If it detects errors, it reports them and then the process ends.
3. **Build and push image:**       Build docker image in GitHub.
4. **Generate Chart:**     Build helm and update appVersion and version in the Chart.yaml and push changes to the master branch.
5. **Helm Lint:**  Verifying Helm Chart. This action will not start if the Generate Chart fails.If it detects errors, it reports them and then the process ends.
6. **Chart release:**      updates the Helm index of the repository, adds a new version of the chart, sets Git settings, commits the changes and sends them to the remote GitHub repository
7. **Slack Notification:** Send notification to the Slack.

### Deployment flows short description:
GitHub pages used as helm diagram artifactory
ArgoCD used for deploying aplication
We can check status in the ArgoCD web UI

### Rollback flow description and implementation:
Rollback from ArgoCD web interface.

### Links
**Docker official git** [->Click here <-](https://github.com/nextcloud/docker "GitHub Nextcloud docker")
