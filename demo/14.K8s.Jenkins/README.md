## 14.K8s.Jenkins

```history
 788  mkdir 14.K8s.Jenkins
  789  cd 14.K8s.Jenkins/
  790  ls
  791  history | ssh
  792  history | grep ssh
  793  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.18 -f -N
  794  ps aux | grep ssh
  795  kill 5470
  796  kill 8390
  797  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.18 -f -N
  798  vim Dockerfile
  799  docker build -t jfrog.it-academy.by/public/jenkins-ci:spishchyk .
  800  docker login jfrog.it-academy.by
  801  docker push jfrog.it-academy.by/public/jenkins-ci:spishchyk
  802  vim jenkins.yaml
  803  kubectl get ns
  804  kubectl apply -f jenkins.yaml
  805  vim jenkins.yaml
  806  kubectl logs -n ci-cd jenkins-c7d7c6bbf-hxvmr
  807  vim jenkins.yaml
  808  history
```