# HA1: Transform Jenkins deployment to Helm

## Finish application deployment:

### Print-screen 1

![APP](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/14.K8s.Jenkins.Install/jenkins_app.png)

### Prin-screen 2

![DEPLOY](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/14.K8s.Jenkins.Install/jenkins_deploy.png)

### Prin-screen 3

![LOGS](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/14.K8s.Jenkins.Install/jenkins_pod_logs.png)

### Prin-screen 3

![JOB](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/14.K8s.Jenkins.Install/test_job_jenkins.png)

## Create helm package for your Jenkins application

Follow the link to check out [Helm Release](https://github.com/MakTruue/md-sa2-32-25/tree/helm).

### Command

```bash
helm package jenkins .
helm repo index . --url https://MakTruue.github.io/md-sa2-32-25/
helm repo add maktruue https://MakTruue.github.io/md-sa2-32-25
helm repo update
helm install jenkins maktruue/jenkins -n ci-cd --create-namespace
```


