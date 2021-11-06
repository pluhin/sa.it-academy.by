# Flux

[flux](https://fluxcd.io/docs/installation/#install-the-flux-cli)

### flux
```bash
export GITHUB_TOKEN=ghp_XXXXX
export GITHUB_USER=EduardLinkevich
export GITHUB_REPO=flux_demo
flux bootstrap github   --owner=$GITHUB_USER   --repository=$GITHUB_REPO   --branch=master   --path=./clusters   --personal

#flux+slcak_notif
kubectl -n flux-system create secret generic slack-url \
--from-literal=address=https://hooks.slack.com/services/XXXXXXXXX
```

#### flux commads
```bash
flux create source git jenkins \
  --url=https://github.com/EduardLinkevich/sa.it-academy.by.git \
  --branch=main \
  --interval=1m \
  --export > ./clusters/jenkins-source.yaml


flux create kustomization jenkins \
  --source=jenkins \
  --path="./" \
  --prune=true \
  --validation=client \
  --interval=5m \
  --export > ./clusters/jenkins-kustomization.yaml
```