#https://github.com/aionfiend/16.-Kubernetes.CICD/tree/main/argo-apps

```
kubectl create namespace argocd
kubectl apply -n argocd --server-side --force-conflicts -f argo-install.yaml
kubectl apply -f argo-core.yaml
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
kubectl rollout restart deployment drupal-helm-app -n drupal-prod
kubectl logs -n drupal-prod drupal-helm-app-6d895cbf8f-kts4g -c drupal-helm-app --tail=50
kubectl logs -n drupal-prod drupal-helm-app-mariadb-0 --tail=10
```