### 15. Kubernetes CI CD

* Installing ArgoCD
```bash
kubectl create namespace argocd
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd -n argocd
```
* Gaining access
```bash
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d > argocd-password.txt
```
* Port forwarding is also done
* Downloaded the [repository for homework 14](https://github.com/daschinskiy/14.Kubernetes.application.deployment "repository for homework 14") and applied the ArgoCD configuration
```bash
kubectl apply -f applications/jenkins-application.yaml -n argocd
```
* Connection via AgroCD CLI
```bash
argocd login 192.168.56.104
```
* Applied the command
```bash
argocd app sync jenkins
```
Result:
```bash
argocd app get jenkins

andrew@ubuntu24:~/14.Kubernetes.application.deployment$ argocd app get jenkins
Name:               argocd/jenkins
Project:            my-project
Server:             https://kubernetes.default.svc
Namespace:          default
URL:                https://192.168.56.104:8080/applications/jenkins
Source:
- Repo:             https://github.com/daschinskiy/14.Kubernetes.application.deployment.git
  Target:           HEAD
  Path:             helm
  Helm Values:      values.yaml
SyncWindow:         Sync Allowed
Sync Policy:        Automated (Prune)
Sync Status:        Synced to HEAD (70e4afd)
Health Status:      Healthy

GROUP        KIND          NAMESPACE  NAME             STATUS  HEALTH   HOOK  MESSAGE
             ConfigMap     default    jenkins-plugins  Synced                 configmap/jenkins-plugins unchanged
             Service       default    jenkins          Synced  Healthy        service/jenkins unchanged
apps         Deployment    default    jenkins          Synced  Healthy        deployment.apps/jenkins configured
bitnami.com  SealedSecret  default    github-secret    Synced  Healthy        sealedsecret.bitnami.com/github-secret unchanged
```
Result 2: [google drive image](https://drive.google.com/file/d/19-FYeMMiC5G-HA2Dl0UfXyAt2kspYjgP/view?usp=sharing "google drive image")

* Created a [repository for the 15th homework assignment](https://github.com/daschinskiy/15.Kubernetes.CI.CD "repository for the 15th homework assignment")
