```bash
913  cd 05.Ansible/
  914  ls
  915  sudo pip3 install ansible-lint
  916  ansible-lint
  917  ls
  918  ansible-lint pg.yaml
  919  ls -l /root/galaxy.yml
  920  sudo ls -l /root/galaxy.yml
  921  sudo pip3 uninstall ansible-lint
  922  pip3 uninstall ansible-lint
  923  ansible-lint
  924  sudo pip3 uninstall ansible-lint
  925  python3 -m pip show ansible-lint
  926  sudo python3 -m pip show ansible-lint
  927  readlink -f "$(which ansible-lint)"
  928  which ansible-lint
  929  python3 -m pip3 install --user ansible-lint
  930  python3 -m pip install --user ansible-lint
  931  vim ~/.bashrc
  932  vim ~/.profile
  933  source ~/.profile
  934  ls -l ~/.profile
  935  ls -l /home/user/.local/bin
  936  vim ~/.profile
  937  echo "$PATH"
  938  ls -l /home/user/.local/bin
  939  ansible-lint
  940  pwd
  941  ls -la
  942  ansible-lint user.yaml
  943  env | grep -E '^(HOME|PWD|OLDPWD|ANSIBLE|XDG)'
  944  echo $ANSIBLE_CONFIG
  945  echo $XDG_CACHE_HOME
  946  sudo ansible-lint user.yaml
  947  sudo /home/user/.local/bin/ansible-lint user.yaml
  948  sudo pip3 install ansible-lint
  949  sudoansible-lint user.yaml
  950  sudo ansible-lint user.yaml
  951  cd ../
  952  cd 15.K8s.FluxCD.ArgoCD/
  953  ls
  954  cd ci-cd/
  955  ls
  956  wget https://github.com/yannh/kubeconform/releases/download/v0.7.0/kubeconform-linux-amd64.tar.gz
  957  sudo tar -C /usr/local/bin/ -xzf kubeconform-linux-amd64.tar.gz
  958  kubeconform
  959  rm kubeconform-linux-amd64.tar.gz
  960  kubeconform --summary ./
  961  kubeconform --summary -schema-location default -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json'
  962  kubeconform --summary -schema-location default -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' jenkins.yaml
  963  vim jenkins.yaml
  964  kubeconform --summary -schema-location default -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' jenkins.yaml
  965  wget https://github.com/stackrox/kube-linter/releases/download/v0.8.3/kube-linter-linux
  966  sudo mv kube-linter-linux /usr/local/bin/
  967  sudo  chmod +x /usr/local/bin/kube-linter-linux
  968  kube-linter-linux
  969  kube-linter-linux lint --help
  970  kube-linter-linux lint jenkins.yaml
  971  kube-linter-linux lint jenkins.yaml --add-all-built-in
  972  ls
  973  vim k6s.yaml
  974  kubectl apply -f k6s.yaml
  975  history
```
---

```
sum by (pod) (
  rate(container_cpu_usage_seconds_total{
    namespace="ci-cd",
    pod=~"jenkins.*",
    container!="POD",
    image!=""
  }[5m])
)
```