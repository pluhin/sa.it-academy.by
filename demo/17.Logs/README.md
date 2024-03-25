## History

```bash
  977  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  978  cd 15.K8s.ArgoCD/
  979  ls
  980  vim monitoring/
  981  vim monitoring/loki.yaml
  982  git add  --all
  983  git commit -m "Add Loki"
  984  git push
  985  vim monitoring/loki.yaml
  986  git add  --all
  987  git commit -m "Add Loki fix"
  988  git push
  989  vim monitoring/loki.yaml
  990  git add  --all
  991  git commit -m "Add Loki fix 2"
  992  git push
  993  k9s
  994  vim monitoring/loki.yaml
  995  git add --all
  996  git commit -m "Change repourl"
  997  git push
  998  vim monitoring/loki.yaml
  999  git commit --amend -a
 1000  git push origin -f
 1001  k9s
 1002  vim monitoring/loki.yaml
 1003  git commit --amend -a
 1004  git push origin -f
 1005  kubectl apply -f monitoring/loki.yaml
 1006  vim monitoring/loki.yaml
 1007  git commit --amend -a
 1008  git push origin -f
 1009  kubectl apply -f monitoring/loki.yaml
 1010  history
```

---
# Deploy Grafana Loki

Use Argo CD

## Deploy loki

- Add "https://grafana.github.io/helm-charts" to list of helm repositories
- Create application loki with default parameters

You can add to the deployed Grafana one more data sources or on grafana webui

```
            {
               "access":"proxy",
                "editable": true,
                "name": "loki",
                "orgId": 1,
                "type": "loki",
                "url": "http://loki.monitoring.svc:3100",
                "version": 1
            }
```

## Log query examples

Show only error level messages:

```
{pod="ingress-nginx-controller-f9d6fc8d8-xbmjr"} |= "error"
```

Count all error messages for last 5 days

```
count_over_time({pod="ingress-nginx-controller-f9d6fc8d8-xbmjr"}[5d] |= "error")
```