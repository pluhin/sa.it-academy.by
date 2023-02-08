```
 1024  sudo pip3 install ansible-lint
 1025  ansible-lint mysql.yaml
 1026  cd ../14.K8s.Jenkins/
 1027  ls
 1028  wget https://github.com/instrumenta/kubeval/releases/download/v0.16.1/kubeval-linux-amd64.tar.gz
 1029  history | grep tar
 1030  sudo tar -C /usr/local/bin -xzf kubeval-linux-amd64.tar.gz
 1031  kubeval
 1032  kubectl jenkins.yaml
 1033  kubeval jenkins.yaml
 1034  kubeval --schema-location https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master  jenkins.yaml
 1035  vim jenkins.yaml
 1036  wget https://github.com/stackrox/kube-linter/releases/download/0.5.1/kube-linter-linux.tar.gz
 1037  ls -l
 1038  sudo tar -C /usr/local/bin -xzf kube-linter-linux.tar.gz
 1039  kube-linter
 1040  kube-linter lint jenkins.yaml
 1041  kube-linter lint jenkins.yaml --add-all-build-in
 1042  kube-linter lint jenkins.yaml --add-all-built-in
 1043  kube-linter lint jenkins.yaml --do-not-auto-add-defaults
 1044  kube-linter lint jenkins.yaml --do-not-auto-add-defaults --include no-readiness-probe
 1045  history
 ```