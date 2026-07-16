# Build, install and verification commands

## Build and publish the image

The image build is performed by `.github/workflows/build.yaml` in the separate
Jenkins repository. The registry password is configured in GitHub as the
`JFROG_PASS` Actions secret.

```bash
git push origin main
gh run watch --repo antonzhdanko/sa2-35-26-jenkins
```

## Package and publish the chart

```bash
helm lint chart/jenkins-homework
helm template jenkins chart/jenkins-homework --namespace ci-cd
helm package chart/jenkins-homework --destination docs
helm repo index docs \
  --url https://antonzhdanko.github.io/sa2-35-26-jenkins/
```

GitHub Pages serves the `docs` directory from the `main` branch.

## Install Jenkins

```bash
kubectl create namespace ci-cd --context k8s \
  --dry-run=client -o yaml | kubectl apply --context k8s -f -

kubectl label namespace ci-cd istio-injection=disabled \
  --context k8s --overwrite

JENKINS_PASS=$(openssl rand -hex 16)
kubectl create secret generic jenkins-admin \
  --namespace ci-cd \
  --context k8s \
  --from-literal=password="$JENKINS_PASS" \
  --dry-run=client -o yaml | kubectl apply --context k8s -f -
unset JENKINS_PASS

helm repo add anton-jenkins \
  https://antonzhdanko.github.io/sa2-35-26-jenkins/
helm repo update anton-jenkins

helm upgrade --install jenkins anton-jenkins/jenkins-homework \
  --version 0.1.0 \
  --namespace ci-cd \
  --create-namespace \
  --kube-context k8s \
  --wait --timeout 15m
```

## Verify

```bash
helm status jenkins --namespace ci-cd --kube-context k8s
kubectl get all,pvc,gateway,virtualservice \
  --namespace ci-cd --context k8s
kubectl logs deployment/jenkins \
  --namespace ci-cd --context k8s --tail=120

curl --resolve jenkins.k8s-3.sa:80:178.124.206.53 \
  --fail http://jenkins.k8s-3.sa/login
```

The administrator password can be read by an authorized cluster user when it
is needed. It is intentionally not written to this report:

```bash
kubectl get secret jenkins-admin --namespace ci-cd --context k8s \
  -o jsonpath='{.data.password}' | base64 --decode
echo
```
