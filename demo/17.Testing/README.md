# Testing

## Log

```bash
  870  mkdir tests
  871  cp -r ansible/ tests/
  872  cd tests/
  873  ls
  874  cd ansible/
  875  ls
  876  sudo pip3 install ansible-lint
  877  ls
  878  ansible-lint local.yaml
  879  vim local.yaml
  880  ansible-lint local.yaml
  881  vim local.yaml
  882  ansible-lint local.yaml
  883  vim local.yaml
  884  ansible-lint local.yaml
  885  vim local.yaml
  886  ansible-lint local.yaml
  887  vim local.yaml
  888  ansible-lint local.yaml
  889  vim local.yaml
  890  ansible-lint local.yaml
  891  ansible-lint web.yaml
  892  clear
  893  ls
  894  ls roles/
  895  cd roles/webserver/
  896  ls
  897  sudo pip3 install molecule
  898  docker
  899  clear
  900  df -h
  901  pwd
  902  molecule init scenario -d docker
  903  ls -l
  904  sudo pip3 install molecule-docker
  905  molecule init scenario -d docker
  906  ls -l
  907  ls -la
  908  vim molecule/default/molecule.yml
  909  molecule test lint
  910  vim molecule/default/molecule.yml
  911  molecule test lint
  912  vim molecule/default/molecule.yml
  913  molecule test
  914  vim molecule/default/molecule.yml
  915  molecule test
  916  vim molecule/default/molecule.yml
  917  molecule test
  918  vim molecule/default/molecule.yml
  919  molecule test
  920  vim defaults/main.yaml
  921  vim templates/
  922  vim templates/hosts.j2
  923  vim tasks/main.yaml
  924  cd ../../
  925  cd ../
  926  cp ../jenkins/jenkins.yaml ./
  927  ls
  928  wget https://github.com/instrumenta/kubeval/releases/download/v0.16.1/kubeval-linux-amd64.tar.gz
  929  history | grep tar
  930  sudo tar -C /usr/local/bin -xzf kubeval-linux-amd64.tar.gz
  931  kubeval --version
  932  kubeval jenkins.yaml
  933  culr -I https://kubernetesjsonschema.dev/master-standalone/ingress-networking-v1.json
  934  curl -I https://kubernetesjsonschema.dev/master-standalone/ingress-networking-v1.json
  935  vim jenkins.yaml
  936* curl -I https://kubernetesjsonschema.dev/master-standalone/
  937  vim jenkins.yaml
  938  kubeval jenkins.yaml
  939  kubeval --schema-location https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master jenkins.yaml
  940  kubeval --schema-location https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master ../first_deploy/app.yaml
  941  kubeval  ../first_deploy/app.yaml
  942  kubeval jenkins.yaml
  943  vim jenkins.yaml
  944  kubeval jenkins.yaml
  945  history | ssh
  946  history | grep  ssh
  947  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.57 -f -N
  948  kubectl apply -f  jenkins.yaml  -n ci-cd
  949  kubeval jenkins.yaml
  950  vim jenkins.yaml
  951  kubeval --schema-location https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master jenkins.yaml
  952  wget https://github.com/stackrox/kube-linter/releases/download/0.3.0/kube-linter-linux.tar.gz
  953  ls
  954  history | grep tar
  955  sudo tar -C /usr/local/bin -xzf kube-linter-linux.tar.gz
  956  kube-linter lint jenkins.yaml
  957  kube-linter lint ../first_deploy/app.yaml
  958  kube-linter lint ../first_deploy/app.yaml  --add-all-build-in
  959  kube-linter lint --help
  960  kube-linter lint ../first_deploy/app.yaml  --add-all-built-in
  961  kube-linter lint ../first_deploy/app.yaml  --do-not-auto-add-defaults --include run-as-non-root
  962  history
```

