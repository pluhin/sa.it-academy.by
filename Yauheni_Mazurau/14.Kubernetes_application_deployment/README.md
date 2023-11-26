# 14. Kubernetes application deployment

## It is based on jenkins.yaml from Demo 14.K8s.Deployment. List of yaml files:

[https://github.com/YMazurau/14.Homework.Jenkins_helm]
- Chart.yaml
- ConfigMap.yaml
- CRB.yaml
- deploument.yaml
- ingress.yaml
- namespase.yaml
- service.yaml
- values.yaml

* Build Helm packege

```bash
ssh xxx.19
cd /root/14.Homework.Jenkins
helm package Jenkins
mv Jenkins-0.1.0.tgz ./helm-releases/
```

## Install
```bash
helm install jekajenkins /root/14.Homework.Jenkins/helm-releases/Jenkins-0.1.0.tgz
```