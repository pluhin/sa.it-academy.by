## 14.K8s.Jenkins

```bash
  796  mkdir 14.K8s.Jenkins.Install
  797  cd 14.K8s.Jenkins.Install/
  798  vim Dockerfile
  799  docker build -t jfrog.it-academy.by/public/jenkins-ci:spishchyk_28 .
  800  docker images
  801  docker build -t jfrog.it-academy.by/public/jenkins-ci:spishchyk_28 .
  802  curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
  803  curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
  804  docker login jfrog.it-academy.by
  805  docker push jfrog.it-academy.by/public/jenkins-ci:spishchyk_28
  806  ls
  807  vim jenkins.yaml
  808  kubectl apply -f jenkins.yaml -n ci-cd
  809  vim jenkins.yaml
  810  history
```