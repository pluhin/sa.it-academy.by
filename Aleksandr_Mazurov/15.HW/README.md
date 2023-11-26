## Get applications

```bash
kubectl get application first-app -n argocd -o yaml > first-app.yaml
kubectl get application jenkins -n argocd -o yaml > jenkins.yaml
kubectl get application nfs-subdir-external-provisioner -n argocd -o yaml > nfs-subdir-external-provisioner.yaml
```

## Repo with Helm

[https://mazurovsasha.github.io/helm-test/]

## Appl repository

[https://github.com/Mazurovsasha/hw15.git]

## Make yaml for sealed secret
```bash
kubectl get secret repo-1112116189 -n argocd -o yaml > secret.yaml
cat secret.yaml | kubeseal --format yaml > sealed_secret.yaml