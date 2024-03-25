```bash
1014  mkdir 18.Test
 1015  cd 18.Test/
 1016  l
 1017  ls
 1018  cp ../05.Ansible/user.yaml ./
 1019  ls
 1020  ansible-lint
 1021  sudo pip3 install anisible-lint
 1022  sudo pip3 install ansible-lint
 1023  ansible-lint
 1024  ls
 1025  ansible-lint user.yaml
 1026  vim user.yaml
 1027  ansible-lint user.yaml
 1028  echo $?
 1029  ansible-lint user.yaml
 1030  echo $?
 1031  ansible-lint user.yaml --generate-ignore
 1032  ls
 1033  vim .ansible-lint-ignore
 1034  ansible-lint user.yaml
 1035  ls -la
 1036  ansible-lint user.yaml
 1037  echo $?
 1038  vim .ansible-lint-ignore
 1039  cp ../14.K8s.Jenkins/jenkins.yaml ./
 1040  wget https://github.com/instrumenta/kubeval/releases/download/v0.16.1/kubeval-linux-amd64.tar.gz
 1041  ls
 1042  ls -h
 1043  ls -lh
 1044  history | grep tar
 1045  sudo tar -C /usr/local/bin -xzf kubeval-linux-amd64.tar.gz
 1046  kubeval
 1047  rm kubeval-linux-amd64.tar.gz
 1048  kubeval jenkins.yaml
 1049  kubeval jenkins.yaml --schema-location https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/
 1050  vim jenkins.yaml
 1051  kubeval jenkins.yaml --schema-location https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/
 1052  vim jenkins.yaml
 1053  kubeval jenkins.yaml --schema-location https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/
 1054  wget https://github.com/stackrox/kube-linter/releases/download/v0.6.8/kube-linter-linux.tar.gz
 1055  ls -l
 1056  ls -lh
 1057  sudo tar -C /usr/local/bin -xzf kube-linter-linux.tar.gz
 1058  rm kube-linter-linux.tar.gz
 1059  kube-linter
 1060  kube-linter lint jenkins.yaml
 1061  echo $?
 1062  kube-linter lint jenkins.yaml --add-all-built-in
 1063  history
```