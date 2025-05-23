## Homework Assignment 1. Transform Jenkins deployment to Helm

1. Create helm app
```bash
helm create jenkins
```
2. Add changes in helm jenkins according to deploy
3. Deploy to k8s (`jenkins_pod.png`)
```bash
helm package jenkins
helm install jenkins jenkins-1.0.0.tgz --dry-run
helm install jenkins jenkins-1.0.0.tgz
```
4. Create helm repo(in existing git repo)
```bash
mkdir helm-releases
mv jenkins-1.0.0.tgz ./helm-releases
git add --all
git commit -m "add release jenkins 1.0.0"
git push
touch index.html
nano index.html
helm repo index --url "https://infinity-step.github.io/project_14/" .
git add --all
git commit -m "add ver 1.0"
git push
helm repo add helm_project_14 https://infinity-step.github.io/project_14/
```