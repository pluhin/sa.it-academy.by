
## 📌 Overview
This project demonstrates ArgoCD deployment and application management using Helm and GitOps.  
Repositories used:
- [helm-jenkins](https://romangulyako.github.io/helm-jenkins) – Helm chart repository with Jenkins package  
- [argocd-apps](https://github.com/romangulyako/argocd-apps) – Git repository with ArgoCD manifests
- [sealed-secrets](https://bitnami-labs.github.io/sealed-secrets) – Helm chart repository for SealedSecrets Controller

## 🔹 Steps Completed
1. Deployed **ArgoCD** into Kubernetes cluster.
2. Added Helm repository with Jenkins chart (`jenkins-0.1.0.tgz`).
3. Created separate Git repository (`argocd-apps`) containing:
   - `apps/jenkins.yaml` → Application for Jenkins
   - `projects/jenkins.yaml` → AppProject for Jenkins
   - `secrets/demo-secrets.yaml` → Example SealedSecret
   - `apps/sealed-secrets.yaml` → Application for SealedSecrets Controller
   - `apps/secrets.yaml` → Application for demo SealedSecret
4. Verified Jenkins deployment in namespace `ci-cd`.
5. Installed SealedSecrets Controller in `kube-system` and applied demo SealedSecret.
6. Confirmed ArgoCD UI shows Healthy applications and secrets are unsealed correctly.

## ✅ Result
- ArgoCD is running and managing applications.
- Jenkins is deployed via Helm chart.
- SealedSecrets Controller is installed and demo secret successfully unsealed.