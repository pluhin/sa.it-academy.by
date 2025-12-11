# Helm Build & Jenkins Installation (Short)

## 1. Build Helm Chart
```bash
cd /home/vlad/jenkins-helm/jenkins
helm lint .
helm template test .
cd ..
helm package jenkins
```

## 2. Install Jenkins (default)
```bash
helm install my-jenkins /home/vlad/jenkins-helm/jenkins -n ci-cd \
  --wait --timeout 5m \
  --set-string secret.adminPasswordPlain="secret"
```

## 3. Install Jenkins (use existing resources)
```bash
helm install my-jenkins /home/vlad/jenkins-helm/jenkins -n ci-cd \
  --set secret.create=false \
  --set jenkinsConfig.create=false \
  --set basicSecurity.create=false \
  --set ingress.enabled=false
```
