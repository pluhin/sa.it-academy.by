Project's reporter: 
Vasiliy, Zayats

Group number: 
md-sa2-31-25

Name of application : 
Simple Web-App

Which programming language is this application written in: 
Node.js, Vue.js

What kind of DB: 
MySQL

Link on git repository/site/package repository: 
https://github.com/zayatsvasiliy/projectdb.git

Orchestration: 
AgroCD

CI description: 
GitHub Actions

How does new/upgrade deployment work: 
When a commit that modifies either the api or frontend directories is pushed to GitHub, a GitHub Actions workflow is triggered. 
This workflow builds a Docker image and publishes it to the GitHub Container Registry, using the commit SHA as the image tag.
After a successful build, the deployment manifest can be updated with the new image tag. 
Once the tag is updated in Git, Argo CD detects the change and performs the deployment (or it can be triggered manually via the Argo CD UI or CLI).




How does rollback work, triggers...
In case a rollback is needed, the image tag in the deployment manifest is manually reverted to a previously known stable version. 
After committing and pushing this change to the Git repository, Argo CD detects the update and automatically synchronizes the cluster to match the desired state defined in Git, 
effectively rolling back the application to the specified version.
Alternatively, the rollback can be triggered manually via the Argo CD UI or CLI by selecting a previous application revision.
