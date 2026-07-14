# Installation and verification commands

## Install Argo CD

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update argo

helm upgrade --install argocd argo/argo-cd \
  --version 10.1.3 \
  --namespace argocd \
  --create-namespace \
  --kube-context k8s \
  --values gitops/infrastructure/argocd-values.yaml \
  --wait --timeout 15m
```

The server Service uses HTTP NodePort `30007`, which is forwarded by the
Academy bastion to `argocd.k8s-3.sa`.

## Create the repository SealedSecret

The private key is generated locally and added to GitHub only as a read-only
deploy key. It is never written to the repository.

```bash
ssh-keygen -t ed25519 -f /tmp/argocd-homework-deploy -N ''

kubectl create secret generic argocd-homework-repo \
  --namespace argocd \
  --from-literal=type=git \
  --from-literal=url=git@github.com:antonzhdanko/argocd-homework.git \
  --from-file=sshPrivateKey=/tmp/argocd-homework-deploy \
  --dry-run=client -o json | \
  jq '.metadata.labels={"argocd.argoproj.io/secret-type":"repository"}' | \
  kubeseal \
    --controller-name sealed-secrets-controller \
    --controller-namespace kube-system \
    --format yaml > manifests/05-repository-sealedsecret.yaml
```

## Bootstrap GitOps

```bash
kubectl apply --context k8s \
  -f gitops/manifests/05-repository-sealedsecret.yaml

kubectl apply --context k8s \
  -f gitops/bootstrap/root-application.yaml
```

After bootstrap, Argo CD reads the private repository and reconciles the
AppProject, Jenkins Application, namespace and remaining SealedSecret.

## Verify

```bash
kubectl get applications,appprojects \
  --namespace argocd --context k8s

kubectl get sealedsecret,secret,pods,pvc,service,deployment,gateway,virtualservice \
  --namespace jenkins-gitops --context k8s

curl --resolve argocd.k8s-3.sa:80:178.124.206.53 \
  --fail http://argocd.k8s-3.sa/

curl --resolve jenkins-gitops.k8s-3.sa:80:178.124.206.53 \
  --fail http://jenkins-gitops.k8s-3.sa/login
```
