# command to helm for every app
```bash
helm create radarr
helm package radarr
helm install radarr radarr-0.1.0.tgz

helm uninstall radarr radarr-0.1.0.tgz
```