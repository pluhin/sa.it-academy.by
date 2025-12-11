```bash
794  cd 06.Ansible/
  795  ls
  796  sudo pip3 install ansible-lint
  797  ansible-lint mysql.yaml
  798  cd .../
  799  cd ../
  800  wget https://github.com/yannh/kubeconform/releases/download/v0.7.0/kubeconform-linux-amd64.tar.gz
  801  ls -l
  802  sudo tar -C /usr/local/bin/ -xzf kubeconform-linux-amd64.tar.gz
  803  kubeconform
  804  cd 15.K8s.FluxCD.ArgoCD/
  805  ls
  806  kubeconform --summary ci-cd/
  807  vim ci-cd/jenkins.yaml
  808  kubeconform --summary ci-cd/
  809  vim ci-cd/jenkins.yaml
  810  kubeconform --summary ci-cd/
  811  vim ci-cd/jenkins.yaml
  812  kubeconform --summary flux/
  813  kubeconform --summary flux/flux-system/gotk-sync.yaml
  814  kubeconform -summary -schema-location default -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' flux/flux-system/gotk-sync.yaml
  815  kubeconform -summary -schema-location default -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' flux/flux-system/gotk-sync.yaml
  816  history
  817  wget https://github.com/stackrox/kube-linter/releases/download/v0.7.6/kube-linter-linux
  818  sudo mv kube-linter-linux /usr/local/bin/
  819  sudo chmod +x /usr/local/bin/kube-linter-linux
  820  kube-linter-linux
  821  kube-linter-linux lint
  822  kube-linter-linux lint --help
  823  kube-linter-linux lint ci-cd/jenkins.yaml
  824  kube-linter-linux lint ci-cd/jenkins.yaml  --add-all-built-in
  825  cd ../
  826  vim k6.yaml
  827  kubectl apply -f k6.yaml
  828  history
```

